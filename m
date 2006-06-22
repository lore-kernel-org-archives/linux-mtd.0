Received: from radford.actrix.co.nz ([202.154.159.254] helo=radfordnz.net)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtRL1-0001AJ-Bi
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 11:43:37 -0400
Received: from [172.16.2.3] (eccles.radfordnz.net [172.16.2.3])
	by radfordnz.net (Postfix) with ESMTP id D321D2CDD9
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jun 2006 03:14:56 +1200 (NZST)
Message-ID: <449AB3EE.5000306@radfordnz.net>
Date: Fri, 23 Jun 2006 00:14:54 +0900
From: Paul Radford <paul@radfordnz.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: block2mtd booting impossible?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

(Sorry to bother the devs but I can't find *any* info about this yet)

I have an x86 machine that up until 2.6.16.x was booting from JFFS2 
filesystems via blkmtd (CF card in an IDE adapter). The kernel 
parameters were:
ro root=/dev/mtdblock0 blkmtd_device=/dev/hda2,/dev/hda5,/dev/hda6 
rootfstype=jffs2

That worked well. Is it possible to get the same functionality from 
block2mtd (compiled in, not a module) now that blkmtd has been removed 
in 2.6.17?

My attempt at doing so failed miserably:
ro root=/dev/mtdblock0 block2mtd=/dev/hda2 block2mtd=/dev/hda5 
block2mtd=/dev/hda6 rootfstype=jffs2

I gave multiple block2mtd arguments because I don't see a 
multiple-device capability in the code. Even with just one block2mtd 
argument for the root FS, I just get the no-root panic. Am I missing 
something here? Is JFFS2 block-device translation going to make the 
whole block2mtd, mtdblock arrangement obsolete?

Thanks,
Paul
(please copy me in on replies - I'm not subscribed)
