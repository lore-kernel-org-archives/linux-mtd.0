Received: from mu-out-0910.google.com ([209.85.134.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iumfd-0001Na-Nk
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 05:19:08 -0500
Received: by mu-out-0910.google.com with SMTP id i2so3633809mue
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 02:18:56 -0800 (PST)
To: rpurdie@openedhand.com
Subject: Re: [PATCH] [PATCH] mtdoops: Document usage in Kconfig
References: <871wb3wsmz.fsf@nanv.dk>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2007 11:18:36 +0100
In-Reply-To: <871wb3wsmz.fsf@nanv.dk> (Peter Korsgaard's message of "Tue\,
	06 Nov 2007 11\:55\:00 +0100")
Message-ID: <87pry3gav7.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Peter" == Peter Korsgaard <jacmet@sunsite.dk> writes:

Comments?

 Peter> Add usage instructions to Kconfig for mtdoops driver.
 Peter> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Peter> ---
 Peter>  drivers/mtd/Kconfig |    3 +++
 Peter>  1 files changed, 3 insertions(+), 0 deletions(-)

 Peter> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
 Peter> index 8848e8a..661eac0 100644
 Peter> --- a/drivers/mtd/Kconfig
 Peter> +++ b/drivers/mtd/Kconfig
 Peter> @@ -286,6 +286,9 @@ config MTD_OOPS
 Peter>  	  buffer in a flash partition where it can be read back at some
 Peter>  	  later point.
 
 Peter> +	  To use, add console=ttyMTDx to the kernel command line,
 Peter> +	  where x is the MTD device number to use.
 Peter> +
 Peter>  source "drivers/mtd/chips/Kconfig"
 
 Peter>  source "drivers/mtd/maps/Kconfig"
 Peter> -- 
 Peter> 1.5.3.4


 Peter> -- 
 Peter> Bye, Peter Korsgaard

 Peter> ______________________________________________________
 Peter> Linux MTD discussion mailing list
 Peter> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Bye, Peter Korsgaard
