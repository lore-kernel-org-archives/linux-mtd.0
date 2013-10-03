Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRbQE-0008TE-8k
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 05:25:58 +0000
Date: Wed, 2 Oct 2013 22:25:51 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20131003052551.GD1312@kroah.com>
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
> 
>  drivers/staging/Kconfig                       |   2 +
>  drivers/staging/Makefile                      |   1 +
>  drivers/staging/mt29f_spinand/Kconfig         |  16 +
>  drivers/staging/mt29f_spinand/Makefile        |   1 +
>  drivers/staging/mt29f_spinand/TODO            |  13 +
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 962 ++++++++++++++++++++++++++
>  drivers/staging/mt29f_spinand/mt29f_spinand.h | 107 +++

Why do you need a separate .h file for a single driver?

It's not a reason to reject this, just curious if it's that way for a
reason.  I'll look at this closer tomorrow and apply it if it passes my
minor amount of build testing.

thanks,

greg k-h
