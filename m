Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7sNz-0007SY-OT
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 15:12:04 +0000
Subject: Re: UBI help
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Renaud barbier <renaud.barbier@ge.com>
In-Reply-To: <4AF9817E.2020008@ge.com>
References: <4AF9817E.2020008@ge.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 17:11:44 +0200
Message-Id: <1257865904.21596.775.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-10 at 15:06 +0000, Renaud barbier wrote:
> I am booting busybox on a NOR flash.
> 30MB of the flash is used for 3 ubi volumes.
> One contain Linux, another a redundant image of Linux and the third busybox.
> I suspect the way the FS has been built is the problem as when we boot on
> the NAND we see no such messages.
> I will appreciate any inputs.
> 
> During boot I see the following error being printed:
> r... [  110.009900] [dfaede60] [c0006ac8] show_stack+0x58/0x164 (unreliable)
> [  110.094308] [dfaedea0] [c01104d8] ubifs_dirty_inode+0x58/0xb8
> [  110.163091] [dfaedeb0] [c00a2f00] __mark_inode_dirty+0x3c/0x13c
> [  110.233969] [dfaedec0] [c0188be0] random_write+0x78/0x90
> [  110.297548] [dfaedef0] [c0086f48] vfs_write+0xb8/0x17c
> [  110.359035] [dfaedf10] [c0087478] sys_write+0x4c/0x8c
> [  110.419485] [dfaedf40] [c000ea18] ret_from_syscall+0x0/0x3c
> done.

Please, provide all messages. Use dmesg.

What is your kernel, how fresh are UBI/UBIFS?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
