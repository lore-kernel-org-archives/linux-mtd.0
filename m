From: David Woodhouse <dwmw2@infradead.org>
To: James Ewing <james.ewing@sveasoft.com>
In-Reply-To: <00e901c3dba2$52074960$0901a8c0@test>
References: <00df01c3dba0$2b481360$0901a8c0@test>
	 <1074163908.5893.21.camel@hades.cambridge.redhat.com>
	 <00e901c3dba2$52074960$0901a8c0@test>
Content-Type: text/plain
Message-Id: <1074165647.5893.36.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 15 Jan 2004 11:20:48 +0000
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

On Thu, 2004-01-15 at 12:01 -0800, James Ewing wrote:
> Hi David,

Please don't top-post. See http://www.infradead.org/~dwmw2/email.html

> It looks like JFFS2 uses a 2 byte magic number with a varying 2 byte block
> type. My guess is that I need to look for any of the permutations and return
> a pointer if found.

The magic will be 4-byte aligned, and you can also check the CRC to
avoid false positives.

> My next question is how to add the boot/startup code to do_mounts.c.
> Currently it finds the super_block and returns it to the routines for ext2,
> cramfs, etc.
> 
> What would the return to JFFS2 look like?

I'm not sure I understand -- what does the 'return to cramfs/ext3/etc.'
look like? 

You set up the partitions appropriately, and then the normal root mount
code mounts /dev/mtdblock1 as jffs2, surely?

-- 
dwmw2
