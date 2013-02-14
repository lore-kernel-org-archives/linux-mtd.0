Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5xbi-0001F4-B6
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 12:08:07 +0000
Message-ID: <1360843685.12703.165.camel@sauron.fi.intel.com>
Subject: Re: SELinux + ubifs: possible circular locking dependency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 14 Feb 2013 14:08:05 +0200
In-Reply-To: <511CD0EC.6070200@pengutronix.de>
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
 <511BA51E.9000606@pengutronix.de>
 <1360826119.12703.155.camel@sauron.fi.intel.com>
 <511CD0EC.6070200@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-14 at 12:56 +0100, Marc Kleine-Budde wrote:
> On 02/14/2013 08:15 AM, Artem Bityutskiy wrote:
> > Mark, how about this one? I compiled it and ran on my fedora 16 with
> > SElinux enabled, no obvious issues.
> > 
> > From a19350097200570571aa522afebb96b34db534f4 Mon Sep 17 00:00:00 2001
> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Date: Thu, 14 Feb 2013 09:07:36 +0200
> > Subject: [PATCH] selinux: do not confuse lockdep
> > 
> > Selinux has per-inode mutexes called 'isec->lock', and they are initialized in
> > the same place, which makes lockdep treat all of the them as if they were
> > identical. However, locking rules may be a little bit different depending on
> > the file-system, so we should put these locks to separate classes, just like we
> > do for 'i_mutex'. Namely, we should put them to per-FS type classes, which is
> > exactly what this patch does.
> > 
> > The problem this patch intends to fix is a strange lockdep warning, which I,
> > frankly speaking, do not really understand, but I believe the root-cause should
> > be fixed by this patch.
> 
> Thanks, this works with mainline, but not with my xattr patch series
> applied.

Hmm, probably I have to annotate the ui mutex. Let's drop security
mailing lists from the loop so far, I'll come up with a patch tomorrow.

-- 
Best Regards,
Artem Bityutskiy
