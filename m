Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47] helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wqnY-0003If-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 22:12:48 +0100
Subject: Re: MTD copy on JFFS2
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: sriramneelakandan@yahoo.com
Cc: Mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20021001131221.26804.qmail@web14906.mail.yahoo.com>
References: <20021001131221.26804.qmail@web14906.mail.yahoo.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 02 Oct 2002 14:37:01 +0200
Message-Id: <1033562222.1600.66.camel@spawn>
Mime-Version: 1.0
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

On Tue, 2002-10-01 at 15:12, Sriram Neelakandan Iyer wrote:
> hi list,
> i have 2 jffs2 partitions(over mtd) used for storing
> config files.
> I need to copy all the files from one partition to
> another, and the destination mtd partition is larger
> than the source mtd partition.(i cannot mount the
> second partition as jffs2 before the data is copied)

So what you want is to change the partition layout on a live system and
that is not possible as the same flash block would for a period end up
in two partitions.

> But mkfs.jffs2 needs libz and both of them occupy
> about 87K of space.
> 
> So i plan to do a plain mtd-copy ,i.e 
> 1. first unmount source jffs2,
> 2. read over the source mtd-char-device and 
> 3. dump it back to the second mtd-partition. 
> 
> Will jffs2 be able to mount the second partition
> without trouble?  (or) must i do a mkfs.jffs2 always
> to have a jffs2 mountable partition.
> 
> regards
> sriram.

Could work. but why not.

1. copy from old partition to ramdisk
2. change to new partition layout 
3. erase and mount new partition
4. copy files from ramdisk to new partition.


-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
