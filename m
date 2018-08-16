Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqBqT-0006s3-LP
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2018 06:33:23 +0000
Date: Thu, 16 Aug 2018 08:33:07 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, broonie@kernel.org,
 pp@emlix.com, Zhiqiang.Hou@nxp.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: m25p80: consider max message size in m25p80_read
 when use the spi_mem_xx() API
Message-ID: <20180816083307.684bdb72@bbrezillon>
In-Reply-To: <1534314823-14048-1-git-send-email-chuanhua.han@nxp.com>
References: <1534314823-14048-1-git-send-email-chuanhua.han@nxp.com>
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

Hi Chuanhua,

On Wed, 15 Aug 2018 14:33:43 +0800
Chuanhua Han <chuanhua.han@nxp.com> wrote:

> Consider a message size limit when calculating the maximum amount
> of data that can be read.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  drivers/mtd/devices/m25p80.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index e84563d..87efa56 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -128,7 +128,12 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>  
>  	while (remaining) {
> -		op.data.nbytes = remaining < UINT_MAX ? remaining : UINT_MAX;
> +		op.data.nbytes = min3(remaining,
> +				spi_max_transfer_size(flash->spimem->spi),
> +				spi_max_message_size(flash->spimem->spi) -
> +				sizeof(op.cmd.opcode) -
> +				op.addr.nbytes -
> +				op.dummy.nbytes);

Nope, this sort of things should go in the SPI controller driver
->adjust_op_size() hook or directly in spi_mem_adjust_op_size() if it's
generic enough (which doesn't seem to be the case since your not
counting the opcode, addr and dummy bytes in the message length).

Regards,

Boris
