Received: from [146.145.187.115] (helo=neoware.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ASM8G-0001H9-S6
	for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2003 20:00:57 +0000
Received: from [146.145.187.122] (HELO enghome)
	by neoware.com (CommuniGate Pro SMTP 4.1)
	with SMTP id 277304 for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2003 14:59:54 -0500
From: "Kevin Carruthers" <kevin.carruthers@neoware.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 5 Dec 2003 14:59:59 -0500
Message-ID: <LAEKLOOEGPDMNKGDADNBIENJDCAA.kevin.carruthers@neoware.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DOC2000 corruption problem when reverting to old driver
Reply-To: kevin.carruthers@neoware.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am in the process of migrating our distribution over to use the mtd
drivers from the M-systems drivers.  I have the driver built and working and
can migrate from the old world (2.2.20 + M-systems driver) to the new world
(2.4.21 + mtd).  Once upgraded the mtd drivers work fine.

However, if I downgrade the kernel (and revert to using the M-systems
driver) the flash is corrupted.  First off, should this work?  Everything I
have read in the archives suggests that it should, but since I am new to the
mtd drivers I could have easily over looked something.  I realize this isn't
a support site for the M-systems driver but I am wondering if the mtd driver
should be keeping a compatible flash filesystem.

I see this problem on DOC2000, MD2200-D24 running version 4.2 of M-systems
firmware (should this be replaced when using mtd?).

The only error message I do get when I am back under 2.2.20+M-sys is that
filesystems cannot be mounted due to "wrong fs type, bad option, bad
superblock or too many filesystems mounted".

Reading and writing files using mtd under 2.4.21 never has such issues (that
I have come across).  Attempting to write files to the DOC after the
downgrade usually fails or corrupts the DOC leading to a boot disk failure
or kernel panic (no rootfs).

I have tried 2.4.21, 2.4.23 as well as 2.4.21 patched with the latest mtd
"nightly" as of last week.

Any suggestions for a fix, or further debugging would be greatly
appreciated.  As I am new to the project I am not sure of the best way to
track down a bug of this type (if one even exists).

Thanks,
Kevin

Kevin Carruthers
NeoLinux Project Manager
Voice: 610-277-8300 x180
Email: kevin.carruthers@neoware.com
