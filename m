From: David Woodhouse <dwmw2@infradead.org>
To: James Ewing <james.ewing@sveasoft.com>
In-Reply-To: <00df01c3dba0$2b481360$0901a8c0@test>
References: <00df01c3dba0$2b481360$0901a8c0@test>
Content-Type: text/plain
Message-Id: <1074163908.5893.21.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 15 Jan 2004 10:51:48 +0000
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

On Thu, 2004-01-15 at 11:45 -0800, James Ewing wrote:
> After creating the partitions the system looks for the file system image by
> checking 64K boundaries of the 2nd flash partition looking for cramfs or
> squashfs magic numbers. The routine then returns a pointer to the fs system
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
