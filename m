Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlAz4-0005Zg-Kk
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 14:29:31 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Brad Goodman <bgoodman@acopia.com>
In-Reply-To: <77A9CE908F115440B48104747E2534220D0930@email1.acopianet.com>
References: <77A9CE908F115440B48104747E2534220D0930@email1.acopianet.com>
Content-Type: text/plain
Date: Thu, 15 Jul 2004 12:15:11 -0600
Message-Id: <1089915311.8696.181.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.4.26 MTD Patch
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-15 at 12:45 -0400, Brad Goodman wrote:
> The following patch prevents a kernel OOPS when a faulty MTD device
> times-out,
> due to a the cleanup in the error path being done twice.

Thanks for the patch - maintenance is always appreciated.

> =========== PATCH IS AS FOLLOWS ==========
> 
> --- orig/cfi_cmdset_0002.c      Thu Jul 15 12:31:42 2004
> +++ cfi_cmdset_0002.c   Thu Jul 15 12:30:48 2004
> @@ -6,6 +6,8 @@
>   *
>   * 2_by_8 routines added by Simon Munton
>   *
> + * 7/15/2004 - Brad Goodman <bgoodman@acopia.com> Removed duplicate
> cleanup from error path

looks like your email client line-wrapped the patch - oops!

> + *
>   * This code is GPL
>   *
>   * $Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $
> @@ -549,11 +551,7 @@

Notice that your patch is against version 1.62.  The current CVS version
is 1.102.

>                         }
>                 } else {
>                         printk(KERN_WARNING "Waiting for write to
> complete timed out in do_write_oneword.");        
> -
> -                       chip->state = FL_READY;
> -                       wake_up(&chip->wq);
> -                       cfi_spin_unlock(chip->mutex);
> -                       DISABLE_VPP(map);
> +
>                         ret = -EIO;
>                 }
>         } 

The code has changed considerably and I don't think this chuck applies.
Please check out a recent version of MTD and check for the double
cleanup (although I have done a simple scan for it).

Once again, thanks for your attention.
 
> --------------------------------------------------------
>  
> DISCLAIMER:   The information contained in this e-mail is confidential
> and is intended solely for the review of the named addressee, and in
> conjunction with specific Acopia Networks business.  Any review,
> retransmission, dissemination or other use of, or taking of any action
> in reliance upon, this information by persons or entities other than
> the intended recipient is prohibited. If you are unable to treat this
> information accordingly, or are not the intended recipient, please
> notify us immediately by returning the e-mail to the originator.  

That disclaimer is just sad.  I imagine you are a victim of your
employer's mail system.
