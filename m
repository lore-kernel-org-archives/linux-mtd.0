Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZEWi-000828-53
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 19:46:20 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h66IkXD68167	for <linux-mtd@lists.infradead.org>;
	Sun, 6 Jul 2003 11:46:33 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: Gregg C Levine <hansolofalcon@worldnet.att.net>
In-Reply-To: <000001c343e5$e6bb1d20$239efea9@who5>
References: <000001c343e5$e6bb1d20$239efea9@who5>
Message-Id: <1057517262.2658.292.camel@localhost>
Mime-Version: 1.0
Date: 06 Jul 2003 11:47:42 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: File systems and Disk on Chips
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Okay that makes more sense. But now how do I go about creating the "
> block filesystem on top of NFTL", that I need to use? 

basically use nftl_format with the proper offset, then modprobe nftl,
fdisk /dev/nftla (Optional), mkfs.ext2 /dev/nftla (or nftla1, 2, etc if
fdisked)

> For example, I've gotten with my test image, as far as creating a
> floppy disk image, and booting that, inside the Bochs emulator. It
> worked, the test kernel launched, and told me that the kernel did what
> it was supposed to do. 
> 
> My other problem, is that I still can not get the utilities inside
> that directory to properly compile, they always break when trying to
> create the ones that manage the JFFS2 stuff. I am hoping that the
> snapshot from yesterday has been fixed, but I don't know.

don't know what to say, worked for me, but at this point, I just use
prepackaged binaries from my distro anyway.

-- 
Russ Dill <Russ.Dill@asu.edu>
