Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdVIw-0000El-LY
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 05:05:34 +0000
Received: by mail-wr0-x242.google.com with SMTP id i10so26248608wrb.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2017 21:05:09 -0800 (PST)
Subject: Re: [PATCH V2] mtd: spi-nor: intel: use true/false for boolean
To: Nicholas Mc Guire <der.herr@hofr.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1486973636-1117-1-git-send-email-der.herr@hofr.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e6f01423-4ec7-33b3-b7a4-6af275525d2c@gmail.com>
Date: Tue, 14 Feb 2017 05:52:48 +0100
MIME-Version: 1.0
In-Reply-To: <1486973636-1117-1-git-send-email-der.herr@hofr.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/13/2017 09:13 AM, Nicholas Mc Guire wrote:
> writeable in struct intel_spi is a boolean and assignment should be to
> true/false not 1/0 as recommended by boolinit.cocci.
> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> ---
> 
> make coccicheck complained with:
>  ./drivers/mtd/spi-nor/intel-spi.c:707:3-18: WARNING: Assignment of bool to 0/1
> 
> Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
> 
> Patch is against 4.10-rc7 (localversion-next is next-20170213)
> 
>  drivers/mtd/spi-nor/intel-spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 4630716..2956f2c 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -704,7 +704,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
>  		 * whole partition read-only to be on the safe side.
>  		 */
>  		if (intel_spi_is_protected(ispi, base, limit))
> -			ispi->writeable = 0;
> +			ispi->writeable = false;
>  
>  		end = (limit << 12) + 4096;
>  		if (end > part->size)
> 

Looks OK, also this is the only place in the driver where writeable is
assigned to an explicit true/false value.

Acked-by: Marek Vasut <marek.vasut@gmail.com>

btw the variable should be renamed from writeable to writable ;-)

-- 
Best regards,
Marek Vasut
