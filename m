Received: from james.zidango.com ([213.242.178.190] helo=www.sveasoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ah5Eb-0004sO-FE
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2004 11:00:21 +0000
Message-ID: <00e901c3dba2$52074960$0901a8c0@test>
From: "James Ewing" <james.ewing@sveasoft.com>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <00df01c3dba0$2b481360$0901a8c0@test>
	<1074163908.5893.21.camel@hades.cambridge.redhat.com>
Date: Thu, 15 Jan 2004 12:01:09 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Booting directly to JFFS2 question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

The partitions are setup dynalically, yes.

It looks like JFFS2 uses a 2 byte magic number with a varying 2 byte block
type. My guess is that I need to look for any of the permutations and return
a pointer if found.

My next question is how to add the boot/startup code to do_mounts.c.
Currently it finds the super_block and returns it to the routines for ext2,
cramfs, etc.

What would the return to JFFS2 look like?

Thanks for the help.

James


----- Original Message ----- 
From: David Woodhouse
To: James Ewing
Cc: linux-mtd@lists.infradead.org
Sent: Thursday, January 15, 2004 2:51 AM
Subject: Re: Booting directly to JFFS2 question


On Thu, 2004-01-15 at 11:45 -0800, James Ewing wrote:
> After creating the partitions the system looks for the file system image
by
> checking 64K boundaries of the 2nd flash partition looking for cramfs or
> squashfs magic numbers. The routine then returns a pointer to the fs
system
> start byte and the init/do_mount.c code takes over.

This works by setting up the partitions dynamically according to what's
found in the image, right?

> This pointer was to the super_block for the filesystem. Apparently jffs2
> doesn't have a super_block in the traditional sense so I am a bit stumped.

It should still be possible -- look for a JFFS2 node (0x1985 etc..)
starting at the beginning of an eraseblock.

See struct jffs2_unknown_node in include/linux/jffs2.h

-- 
dwmw2
