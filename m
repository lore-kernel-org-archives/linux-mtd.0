Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zukvb-0006r1-Ic
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 17:35:56 +0000
Received: by pabfh17 with SMTP id fh17so128838773pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 09:35:34 -0800 (PST)
Date: Fri, 6 Nov 2015 09:35:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-cris-kernel@axis.com, Jesper Nilsson <jespern@axis.com>
Subject: Re: [PATCH] mtd: don't WARN about overloaded users of
 mtd->reboot_notifier.notifier_call
Message-ID: <20151106173532.GD12143@google.com>
References: <1446598913-133086-1-git-send-email-computersforpeace@gmail.com>
 <20151106141537.GA25969@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151106141537.GA25969@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 06, 2015 at 06:15:37AM -0800, Guenter Roeck wrote:
> On Tue, Nov 03, 2015 at 05:01:53PM -0800, Brian Norris wrote:
> > There are multiple types of users of mtd->reboot_notifier.notifier_call:
> > 
> > (1) A while back, the cfi_cmdset_000{1,2} chip drivers implemented a
> > reboot notifier to (on a best effort basis) attempt to reset their flash
> > chips before rebooting.
> > 
> > (2) More recently, we implemented a common _reboot() hook so that MTD
> > drivers (particularly, NAND flash) could better halt I/O operations
> > without having to reimplement the same notifier boilerplate.
> > 
> > Currently, the WARN_ONCE() condition here was written to handle (2), but
> > at the same time it mis-diagnosed case (1) as an already-registered MTD.
> > Let's fix this by having the WARN_ONCE() condition better imitate the
> > condition that immediately follows it. (Wow, I don't know how I missed
> > that one.)
> > 
> > (Side note: Unfortunately, we can't yet combine the reboot notifier code
> > for (1) and (2) with a patch like [1], because some users of (1) also
> > use mtdconcat, and so the mtd_info struct from cfi_cmdset_000{1,2} won't
> > actually get registered with mtdcore, and therefore their reboot
> > notifier won't get registered.)
> > 
> > [1] http://patchwork.ozlabs.org/patch/417981/
> > 
> > Suggested-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Jesper Nilsson <jespern@axis.com>
> > Cc: linux-cris-kernel@axis.com
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks! Pushed to l2-mtd.git.

I'll be queueing up the 4.4-rc1 pull request soon.

Brian
