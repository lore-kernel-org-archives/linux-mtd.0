Received: from pop.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4H1D-0005oO-R7
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 06:18:56 -0500
From: Thomas Brinker <thomas.brinker@gmx.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 24 Feb 2005 12:15:58 +0100
References: <200502221219.41518.thomas.brinker@gmx.de>
In-Reply-To: <200502221219.41518.thomas.brinker@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200502241215.58195.thomas.brinker@gmx.de>
Subject: Re: mounting jffs2 rw
Reply-To: thomas.brinker@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 22. Februar 2005 12:19 schrieb Thomas Brinker:
> Hi!
>
> I have problems in remounting a jffs2 as read/writeable.
>
> Currently it mounts successfully as root-fs but in ro, which is no wonder.
> But how can I change it to rw?
>
>
> Here is what I have tried so far:
> ---===---
> # cat /proc/version
> Linux version 2.6.9-uc0 (thomas@mobile) (gcc version 3.4.3) #141 Mon Feb 21
> 16:01:36 CET 2005 # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00400000 00010000 "phys_mapped_flash"
> # ls -l /dev/mtd*
> crw-r--r--    1 root     root      90,   0 Feb  7  2005 /dev/mtd0
> brw-r--r--    1 root     root      31,   0 Feb  7  2005 /dev/mtdblock0
> crw-r--r--    1 root     root      90,   1 Feb  7  2005 /dev/mtdr0
> # mount
> /dev/rom0 on / type jffs2 (ro,noatime)                [<--- rom0 is strange]
# ls -l rom0
brw-r--r--    1 root     root      31,   0 Feb 22  2005 rom0
# ls -l mtdblock0
brw-r--r--    1 root     root      31,   0 Feb 22  2005 mtdblock0

> /proc on /proc type proc (rw,nodiratime) 
> none on /dev/pts type devpts (rw)
> none on /sys type sysfs (rw)
> ram on /var type ramfs (rw)
> # mount -o remount,rw /dev/mtdblock0 /
> mount: Mounting /dev/mtdblock0 on / failed: No such file or directory
> # mount -o remount,rw /dev/rom0 /
> mount: Mounting /dev/rom0 on / failed: No such file or directory
> # mount -o remount,rw /

Adding 'rw' to the kernel command line solves the problem.

Regards
Thomas
