Received: from softlayer.compulab.co.il ([50.23.254.55] helo=compulab.co.il)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vo6dI-000465-O2
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 07:12:29 +0000
Message-ID: <529ED59E.10605@compulab.co.il>
Date: Wed, 04 Dec 2013 09:11:26 +0200
From: Igor Grinberg <grinberg@compulab.co.il>
MIME-Version: 1.0
To: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH] mtd: m25p80: add support for m25px16
References: <1384203329-24998-1-git-send-email-grinberg@compulab.co.il>
In-Reply-To: <1384203329-24998-1-git-send-email-grinberg@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping...

On 11/11/13 22:55, Igor Grinberg wrote:
> Add support for Micron m25px16 spi flash chip.
> 
> Signed-off-by: Igor Grinberg <grinberg@compulab.co.il>
> ---
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 6bc9618..1da91c8 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -855,6 +855,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
>  	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
>  
> +	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
>  	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
>  	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
>  	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
> 

-- 
Regards,
Igor.
