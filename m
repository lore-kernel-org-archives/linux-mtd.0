Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5zG-0005nN-V9
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:44:52 +0000
Subject: Re: [mtd-utils PATCH] mkfs.ubifs: <sys/xattr.h>, not <attr/xattr.h>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1453584710-27273-1-git-send-email-computersforpeace@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56A3F437.5080507@nod.at>
Date: Sat, 23 Jan 2016 22:44:23 +0100
MIME-Version: 1.0
In-Reply-To: <1453584710-27273-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.01.2016 um 22:31 schrieb Brian Norris:
> To be consistent with mkfs.jffs2, and to get this to build on my
> machine, it looks like we should use <sys/xattr.h>, not <attr/xattr.h>.
> 
> Fixes this error, seen on an Ubuntu 14.04 build system:
> 
>   ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:30:24: fatal error: attr/xattr.h: No such file or directory
>    #include <attr/xattr.h>

The build fails because you don't have libattr-devel (or however your distro names that package).
Switching to sys/xattr.h from glibc-devel seems fine to me as mkfs.ubifs.c is using only basic xattr stuff.

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
