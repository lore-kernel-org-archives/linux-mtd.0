Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlZc-0007ao-9B
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:01:58 +0000
Date: Fri, 18 May 2018 22:01:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Weinberger <richard@nod.at>, Anthony Wong
 <anthony.wong@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/2] spi-nor: intel-spi: Fix atomic sequence handling
Message-ID: <20180518220133.602c9fda@bbrezillon>
In-Reply-To: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  5 Feb 2018 14:32:59 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On many older systems using SW sequencer the PREOP_OPTYPE register
> contains two preopcodes as following:
> 
>   PREOP_OPTYPE=0xf2785006
> 
> The last two bytes are the opcodes decoded to:
> 
>   0x50 - Write enable for volatile status register
>   0x06 - Write enable
> 
> The former is used to modify volatile bits in the status register. For
> non-volatile bits the latter is needed. Preopcodes are used in SW
> sequencer to send one command "atomically" without anything else
> interfering the transfer. The sequence that gets executed is:
> 
>   - Send preopcode (write enable) from PREOP_OPTYPE register
>   - Send the actual SPI command
>   - Poll busy bit in the status register (0x05, RDSR)
> 
> Commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
> programmed by BIOS") enabled atomic sequence handling but because both
> preopcodes are programmed, the following happens:
> 
>   if (preop >> 8)
>   	val |= SSFSTS_CTL_SPOP;
> 
> Since on these systems preop >> 8 == 0x50 we end up picking volatile
> write enable instead. Because of this the actual write command is pretty
> much NOP unless there is a WREN latched in the chip already.
> 
> Furthermore we should not really just assume that WREN was issued in
> previous call to intel_spi_write_reg() because that might not be the
> case.
> 
> This updates driver to first check that the opcode is actually available
> in PREOP_OPTYPE register and if not return error back to the spi-nor
> core (if the controller is not locked we program it now). In addition we
> save the opcode to ispi->atomic_preopcode field which is checked in next
> call to intel_spi_sw_cycle() to actually enable atomic sequence using
> the requested preopcode.
> 
> Fixes: 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org

Queued to spi-nor/next.

Thanks,

Boris

> ---
> Changes from v1:
> 
>   - Added atomic_preopcode field and only when it is set, enable atomic
>     sequence.
>   - Return -EINVAL if the requested WREN operation cannot be found from
>     PREOP register instead of silently pretending it is supported.
>   - Updated patch subject to match more closely what is being fixed.
> 
>  drivers/mtd/spi-nor/intel-spi.c | 76 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 699951523179..8e98f4ab87c1 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -136,6 +136,7 @@
>   * @swseq_reg: Use SW sequencer in register reads/writes
>   * @swseq_erase: Use SW sequencer in erase operation
>   * @erase_64k: 64k erase supported
> + * @atomic_preopcode: Holds preopcode when atomic sequence is requested
>   * @opcodes: Opcodes which are supported. This are programmed by BIOS
>   *           before it locks down the controller.
>   */
> @@ -153,6 +154,7 @@ struct intel_spi {
>  	bool swseq_reg;
>  	bool swseq_erase;
>  	bool erase_64k;
> +	u8 atomic_preopcode;
>  	u8 opcodes[8];
>  };
>  
> @@ -474,7 +476,7 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len,
>  			      int optype)
>  {
>  	u32 val = 0, status;
> -	u16 preop;
> +	u8 atomic_preopcode;
>  	int ret;
>  
>  	ret = intel_spi_opcode_index(ispi, opcode, optype);
> @@ -484,17 +486,42 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len,
>  	if (len > INTEL_SPI_FIFO_SZ)
>  		return -EINVAL;
>  
> +	/*
> +	 * Always clear it after each SW sequencer operation regardless
> +	 * of whether it is successful or not.
> +	 */
> +	atomic_preopcode = ispi->atomic_preopcode;
> +	ispi->atomic_preopcode = 0;
> +
>  	/* Only mark 'Data Cycle' bit when there is data to be transferred */
>  	if (len > 0)
>  		val = ((len - 1) << SSFSTS_CTL_DBC_SHIFT) | SSFSTS_CTL_DS;
>  	val |= ret << SSFSTS_CTL_COP_SHIFT;
>  	val |= SSFSTS_CTL_FCERR | SSFSTS_CTL_FDONE;
>  	val |= SSFSTS_CTL_SCGO;
> -	preop = readw(ispi->sregs + PREOP_OPTYPE);
> -	if (preop) {
> -		val |= SSFSTS_CTL_ACS;
> -		if (preop >> 8)
> -			val |= SSFSTS_CTL_SPOP;
> +	if (atomic_preopcode) {
> +		u16 preop;
> +
> +		switch (optype) {
> +		case OPTYPE_WRITE_NO_ADDR:
> +		case OPTYPE_WRITE_WITH_ADDR:
> +			/* Pick matching preopcode for the atomic sequence */
> +			preop = readw(ispi->sregs + PREOP_OPTYPE);
> +			if ((preop & 0xff) == atomic_preopcode)
> +				; /* Do nothing */
> +			else if ((preop >> 8) == atomic_preopcode)
> +				val |= SSFSTS_CTL_SPOP;
> +			else
> +				return -EINVAL;
> +
> +			/* Enable atomic sequence */
> +			val |= SSFSTS_CTL_ACS;
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
>  	}
>  	writel(val, ispi->sregs + SSFSTS_CTL);
>  
> @@ -538,13 +565,31 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  
>  	/*
>  	 * This is handled with atomic operation and preop code in Intel
> -	 * controller so skip it here now. If the controller is not locked,
> -	 * program the opcode to the PREOP register for later use.
> +	 * controller so we only verify that it is available. If the
> +	 * controller is not locked, program the opcode to the PREOP
> +	 * register for later use.
> +	 *
> +	 * When hardware sequencer is used there is no need to program
> +	 * any opcodes (it handles them automatically as part of a command).
>  	 */
>  	if (opcode == SPINOR_OP_WREN) {
> -		if (!ispi->locked)
> +		u16 preop;
> +
> +		if (!ispi->swseq_reg)
> +			return 0;
> +
> +		preop = readw(ispi->sregs + PREOP_OPTYPE);
> +		if ((preop & 0xff) != opcode && (preop >> 8) != opcode) {
> +			if (ispi->locked)
> +				return -EINVAL;
>  			writel(opcode, ispi->sregs + PREOP_OPTYPE);
> +		}
>  
> +		/*
> +		 * This enables atomic sequence on next SW sycle. Will
> +		 * be cleared after next operation.
> +		 */
> +		ispi->atomic_preopcode = opcode;
>  		return 0;
>  	}
>  
> @@ -569,6 +614,13 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>  	u32 val, status;
>  	ssize_t ret;
>  
> +	/*
> +	 * Atomic sequence is not expected with HW sequencer reads. Make
> +	 * sure it is cleared regardless.
> +	 */
> +	if (WARN_ON_ONCE(ispi->atomic_preopcode))
> +		ispi->atomic_preopcode = 0;
> +
>  	switch (nor->read_opcode) {
>  	case SPINOR_OP_READ:
>  	case SPINOR_OP_READ_FAST:
> @@ -627,6 +679,9 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
>  	u32 val, status;
>  	ssize_t ret;
>  
> +	/* Not needed with HW sequencer write, make sure it is cleared */
> +	ispi->atomic_preopcode = 0;
> +
>  	while (len > 0) {
>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>  
> @@ -707,6 +762,9 @@ static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
>  		return 0;
>  	}
>  
> +	/* Not needed with HW sequencer erase, make sure it is cleared */
> +	ispi->atomic_preopcode = 0;
> +
>  	while (len > 0) {
>  		writel(offs, ispi->base + FADDR);
>  
