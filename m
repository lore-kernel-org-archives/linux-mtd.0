Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: avoid unintialized return
 code
To: Arnd Bergmann <arnd@arndb.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20170914110709.3591691-1-arnd@arndb.de>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <da56f3dc-bbf8-748e-fabd-1874cf596bfd@st.com>
Date: Thu, 14 Sep 2017 14:38:51 +0200
MIME-Version: 1.0
In-Reply-To: <20170914110709.3591691-1-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Arnd

thx Arnd for compilation warning (gcc <= 4.6)

Acked-by: Ludovic Barre <ludovic.barre@st.com>

PS: at runtime stm32_qspi_tx_poll can't be call,
because stm32_qspi_tx check if there is tx data available
	if (!cmd->tx_data)
		return 0;

BR
Ludo

On 09/14/2017 01:06 PM, Arnd Bergmann wrote:
> If we send zero-length data to stm32_qspi_tx_poll() on older
> compiler versions such as gcc-4.6, we get warned that the
> return code is uninitialized:
> 
> drivers/mtd/spi-nor/stm32-quadspi.c:248:2: error: ‘ret’ may be used uninitialized in this function [-Werror=uninitialized]
> 
> On newer compiler versions, the return code is always zero
> in this case, as the local variable gets optimized away and
> is assumed to be zero after the loop completes without error.
> 
> This changes the function to instead return -EINVAL if it
> ever gets called with a zero length buffer.
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82203
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/mtd/spi-nor/stm32-quadspi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 86c0931543c5..711cfe7aa4bf 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -227,7 +227,7 @@ static int stm32_qspi_tx_poll(struct stm32_qspi *qspi,
>   	void (*tx_fifo)(u8 *, void __iomem *);
>   	u32 len = cmd->len, sr;
>   	u8 *buf = cmd->buf;
> -	int ret;
> +	int ret = -EINVAL;
>   
>   	if (cmd->qspimode == CCR_FMODE_INDW)
>   		tx_fifo = stm32_qspi_write_fifo;
> 
