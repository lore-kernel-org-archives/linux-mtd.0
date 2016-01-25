Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNYX3-0002w4-Tq
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 04:13:39 +0000
Received: by mail-pf0-x22a.google.com with SMTP id q63so77205201pfb.1
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2016 20:13:16 -0800 (PST)
Date: Sun, 24 Jan 2016 20:13:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [mtd-utils PATCH] mkfs.ubifs: <sys/xattr.h>, not <attr/xattr.h>
Message-ID: <20160125041313.GA9817@localhost>
References: <1453584710-27273-1-git-send-email-computersforpeace@gmail.com>
 <56A3F437.5080507@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56A3F437.5080507@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 23, 2016 at 10:44:23PM +0100, Richard Weinberger wrote:
> Am 23.01.2016 um 22:31 schrieb Brian Norris:
> > To be consistent with mkfs.jffs2, and to get this to build on my
> > machine, it looks like we should use <sys/xattr.h>, not <attr/xattr.h>.
> > 
> > Fixes this error, seen on an Ubuntu 14.04 build system:
> > 
> >   ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:30:24: fatal error: attr/xattr.h: No such file or directory
> >    #include <attr/xattr.h>
> 
> The build fails because you don't have libattr-devel (or however your distro names that package).
> Switching to sys/xattr.h from glibc-devel seems fine to me as mkfs.ubifs.c is using only basic xattr stuff.

Ah, thanks for the clarification.

> Reviewed-by: Richard Weinberger <richard@nod.at>

Pushed to mtd-utils.git.

Brian
