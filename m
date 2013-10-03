Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRbOm-0008Py-L3
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 05:24:29 +0000
Date: Wed, 2 Oct 2013 22:24:18 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20131003052418.GC1312@kroah.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
 <1380620038-25643-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380620038-25643-1-git-send-email-kamlakant.patel@broadcom.com>
Cc: devel@driverdev.osuosl.org, linux-mtd@lists.infradead.org,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 01, 2013 at 03:03:58PM +0530, Kamlakant Patel wrote:
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -136,6 +136,8 @@ source "drivers/staging/goldfish/Kconfig"
>  
>  source "drivers/staging/netlogic/Kconfig"
>  
> +source "drivers/staging/mt29f_spinand/Kconfig"
> +

Any reason you don't put it at the end of the file, and need it here in
the middle?

thanks,

greg k-h
