Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvPW-0002yi-0H
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:00:34 +0000
Received: by wwb29 with SMTP id 29so1340485wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 03:00:32 -0800 (PST)
Subject: Re: [PATCH 1/1] omap3: nand: report corrected ecc errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <87oc64qr5b.fsf@vostro.fn.ogness.net>
References: <87oc64qr5b.fsf@vostro.fn.ogness.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:59:09 +0200
Message-ID: <1298631549.2798.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-22 at 11:50 +0100, John Ogness wrote:
> From: John Ogness <john.ogness@linutronix.de>
> 
> The number of corrected ECC errors should be reported since other MTD
> systems make use of this information (such as UBI data scrubbing).
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Hi, could you please CC the OMAP mailing List
(linux-omap@vger.kernel.org) and probably TI people who seem to take
care about the NAND driver nowadays, like "Sukumar Ghorai
<s-ghorai@ti.com>"


> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 4e33972..a58465c 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -773,7 +773,7 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
>  
>  		page_data[find_byte] ^= (1 << find_bit);
>  
> -		return 0;
> +		return 1;

Could you please also improve the comment of this function and document
the error codes - it was obvious when the codes were 0 and -1, and
becomes less obvious when they are -1, 0, and 1.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
