Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wueb-0003dX-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2002 02:19:49 +0100
Date: Thu, 3 Oct 2002 03:19:46 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sriram Neelakandan Iyer <sriramneelakandan@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD copy on JFFS2
Message-ID: <20021003011946.GB27324@wohnheim.fh-wedel.de>
References: <20021001131221.26804.qmail@web14906.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021001131221.26804.qmail@web14906.mail.yahoo.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 1 October 2002 06:12:21 -0700, Sriram Neelakandan Iyer wrote:
> i have 2 jffs2 partitions(over mtd) used for storing
> config files.
> I need to copy all the files from one partition to
> another, and the destination mtd partition is larger
> than the source mtd partition.(i cannot mount the
> second partition as jffs2 before the data is copied)
> 
> As of now i run mkfs.jffs2 over the source jffs2
> directory and copy to ramfs and then erase the
> destination partition and i do a mtd-write over the
> destination partition.
> 
> But mkfs.jffs2 needs libz and both of them occupy
> about 87K of space.
> 
> So i plan to do a plain mtd-copy ,i.e 
> 1. first unmount source jffs2,
> 2. read over the source mtd-char-device and 
> 3. dump it back to the second mtd-partition. 

Should work, as long as both partitions have the same erase block
size, the target partition is not smaller and was erased before 3.

> Will jffs2 be able to mount the second partition
> without trouble?

On first mount you will get some messages about missing erase markers,
jffs2 will erase all new blocks. About as dangerous as a collision in
ethernet. :)

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
