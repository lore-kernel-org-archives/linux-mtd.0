Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKof3-0005lB-Ax
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 06:46:33 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Bergeron <mho.linux-mtd@b2n.ca>
In-Reply-To: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jan 2009 08:46:45 +0200
Message-Id: <1231397205.6608.119.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
> Hello all,
> 
> I'm getting some sort of volume corruption problem with UBIFS after  
> doing
> rootfs updates using rsync.
> 
> I've cooked up a minimalist test trying to eliminate possible  
> interference.
> The following steps will trigger the corruption almost every time. No  
> errors
> or warnings are produced during this procedure, every step behaves as  
> expected:
> 
> boot kernel ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs ro init=/bin/ 
> bash
> 
> # mount -t proc none /proc
> # ifconfig ...
> # mount -o remount,rw,sync /
> # rsync -aHxvi --delete ... /
> # mount -o remount,ro /
> # reboot -d -f
> 
> When rebooting, the kernel fails to mount the rootfs with the  
> following error:
> 
> [   61.033142] UBIFS error (pid 1): ubifs_read_node: bad node type (11  
> but expected 6)
> [   61.040965] UBIFS error (pid 1): ubifs_read_node: bad node at LEB 0:0

Hmm, 11 is an orphan node, 6 is the superblock node. Indeed LEB 0 has to
contain superblock node and cannot contain orphans.

We do not think we tested UBIFS re-mounting well enough, so I would not
be surprised to see bugs there.

> I'm running a fresh 2.6.28.0. mtd-utils were built from git on  
> 2008-11-19.
> About 3 weeks ago I also tried with an mtd-2.6.git master branch  
> patched kernel
> to no avail.
> 
> Note that in my few attempts, when I do NOT remount read-only before  
> rebooting,
> the filesystem has so far remained functional (albeit being left  
> unclean) and it
> boots as expected. The error msg is always the same. A certain amount of
> filesystem changes is necessary to trigger the problem, simply  
> touching a file
> is not enough. I have not determined exactly what operations rsync  
> needs to
> perform to reach breaking point, but sometimes everything goes well.

Hmm, OK. I'll try to look at this and figure out what is going wrong.
What would help a lot is if I was able to reproduce this at my setup. So
you may help by sending a shell script which reproduces this issue, if
you can. And it is better to work with nandsim, because this is the tool
I use here
(http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
