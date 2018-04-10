Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5pXE-0001HN-5G
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 09:26:00 +0000
Received: by mail-wm0-x244.google.com with SMTP id f125so21942989wme.4
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 02:25:41 -0700 (PDT)
Subject: Re: [PATCH v10 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 frieder.schrempf@exceet.de, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
References: <1523349348-20778-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1523349348-20778-2-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <27c7d206-e33b-746a-81e4-d01826eb8e67@gmail.com>
Date: Tue, 10 Apr 2018 11:23:18 +0200
MIME-Version: 1.0
In-Reply-To: <1523349348-20778-2-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2018 10:35 AM, Yogesh Gaur wrote:
> Add support to create dynamic LUT entry.
> 
> Current approach of creating LUT entries for various cmds like read, write,
> erase, readid, readsr, we, wd etc is that when QSPI controller gets
> initialized at that time static LUT entries for these cmds get created.
> 
> Patch add support to create the LUT at run time based on the operation
> being performed.
> 
> Added API fsl_qspi_prepare_lut(), this API would going to be called from
> fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write, fsl_qspi_read and
> fsl_qspi_erase APIs.
> Added new struct fsl_qspi_mem_op having fields required to fill in LUT
> register for requested command.
> Required values for every CMD like opcode, addrlen, dummy_cycles, data_size
> and pad bytes being filled in respective calling function and then API
> fsl_qspi_prepare_lut fill LUT register for requested command.
> Required values are fetched from instance of 'struct spi_nor'.
> 
> AHB Read, memory mapped, can be triggered using driver interface as well
> from 'devmem' interface.
> For AHB read, LUT seq programmed in QUADSPI_BFGENCR register used for
> Read operation. Thus, for Read initiated from 'devmem' requires to have
> dedicated LUT seq and programmed in probe routine for AHB read.
> 
> Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
[...]

> +/* Prepare LUT for AHB read - required for read from devmem interface */
> +static void fsl_qspi_prep_ahb_read(struct fsl_qspi *q)
> +{
> +	struct fsl_qspi_mem_op op;
> +	struct spi_nor *nor = q->nor;
> +	enum spi_nor_protocol protocol = nor->read_proto;
> +
> +	fsl_clr_qspi_mem_data(&op);
> +	op.cmd.opcode = nor->read_opcode;
> +	op.cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
> +
> +	op.addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
> +	op.addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
> +
> +	op.dummy.ncycles = nor->read_dummy;
> +	op.dummy.pad = spi_nor_get_protocol_data_nbits(protocol);
> +
> +	op.data.dir = QSPI_MEM_DATA_IN;
> +	op.data.pad = spi_nor_get_protocol_data_nbits(protocol);
> +	/* Data size ignored for AHB Read. */
> +	op.data.nbytes = 0;
> +
> +	op.mode = QSPI_CMD_MODE_AHB;

This or similar code seems present below about 5 more times, factor it out.

Also, this patch needs splitting into more smaller patches.

[...]
-- 
Best regards,
Marek Vasut
