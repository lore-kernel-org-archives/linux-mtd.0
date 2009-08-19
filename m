Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MdefN-0001E5-4r
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 06:29:08 +0000
Subject: Re: about ubifs question
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1250658794.3885.1.camel@localhost>
References: <1250656786.11476.2.camel@tommy-desktop>
	<1250658794.3885.1.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2009 14:28:50 +0800
Message-Id: <1250663330.13486.1.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,sir !

Can you explain why my ubifs switch to read-only filesystem when it resume from suspend !

Unmounting local filesystems...
mount: can't find /mnt/ram in /proc/mounts
UBIFS error (pid 1201): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 1201): ubifs_write_inode: can't write inode 135, error -30
UBIFS error (pid 1201): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 1201): ubifs_write_inode: can't write inode 442, error -30
UBIFS error (pid 1201): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 1201): ubifs_write_inode: can't write inode 136, error -30
UBIFS: cannot re-mount due to prior errors
mount: mounting ubi0:rootfs on / failed: Read-only file system


On 三, 2009-08-19 at 08:13 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-08-19 at 12:39 +0800, tommy wrote:
> > about ubifs work under Kernel suspend and resume
> > 
> > When Kernel resume from suspend by apm -s ,
> > 
> > i touch file in nand flash and sync,but when Kernel restart ,my touched
> > file didn't occur!
> 
> How do you restart your kernel? Do you unmount cleanly?
> 
> > After Kernel resume ,i guess my touched file isn't in nand flash but
> > memory !
> 
> Try typing sync before restarting.
> 
