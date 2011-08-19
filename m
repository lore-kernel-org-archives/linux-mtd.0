Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuNts-0005Q0-BV
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 12:10:13 +0000
Received: by iyf13 with SMTP id 13so5648155iyf.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 05:10:09 -0700 (PDT)
Subject: Re: ubi volume unmountable after power cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>
Date: Fri, 19 Aug 2011 15:11:54 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313755918.6607.56.camel@sauron>
Mime-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-10 at 15:46 -0400, Eric Millbrandt wrote:
> All,
> 
> One of our systems came back "unbootable" from our QA department.
> When I took a look at the system I found that the rootfs, which is a
> ubi/ubifs filesystem, had become corrupt.  My QA department swears
> that they powered off the system correctly, but even so, shouldn't ubi
> be tolerant of power cuts?  I've attached all the relevant information
> below.
> 
> # uname -r
> 2.6.33.7-rt29-deka-debug

I strongly recommend you to pull in changes from the UBIFS back-port
trees.

> [  140.482974] UBI error: ubi_io_read: error -74 while reading 516096
> bytes from PEB 3889:8192, read 516096 bytes
> [  140.494658] Call Trace:
> [  140.497406] [cf86fac0] [c00097bc] show_stack+0x4c/0x16c
> (unreliable)
> [  140.504881] [cf86fb00] [c031f298] ubi_io_read+0x170/0x28c
> [  140.511141] [cf86fb40] [c031e4a8] ubi_eba_read_leb+0x13c/0x36c
> [  140.517961] [cf86fb80] [c031c7bc] ubi_leb_read+0x120/0x170
> [  140.524329] [cf86fbb0] [c01edd64] ubifs_start_scan+0xb8/0x1e8
> [  140.531053] [cf86fbe0] [c0205820] ubifs_recover_leb+0x68/0xa78
> [  140.537876] [cf86fc50] [c01eead0] replay_buds+0xa8/0xcf4
> [  140.544052] [cf86fcf0] [c01f0018] ubifs_replay_journal+0x8fc/0x1284
> [  140.551315] [cf86fd80] [c01e1268] ubifs_fill_super+0xf20/0x1928
> [  140.558225] [cf86fde0] [c01e2638] ubifs_get_sb+0x104/0x384
> [  140.564702] [cf86fe60] [c00c8d18] vfs_kern_mount+0x70/0x190
> [  140.571142] [cf86fe90] [c00c8e88] do_kern_mount+0x40/0x100
> [  140.577501] [cf86feb0] [c00e3030] do_mount+0x4d8/0x828
> [  140.583497] [cf86ff10] [c00e3410] sys_mount+0x90/0xd0
> [  140.589399] [cf86ff40] [c0012f2c] ret_from_syscall+0x0/0x38
> [  140.595950] --- Exception: c01 at 0xfdd64c8
> [  140.595964]     LR = 0x10063dd8
> [  140.606215] UBIFS error (pid 361): ubifs_recover_leb: garbage
> [  140.612939] UBIFS error (pid 361): ubifs_scanned_corruption:
> corruption at LEB 3211:335872
> [  140.622385] UBIFS error (pid 361): ubifs_scanned_corruption: first
> 8192 bytes from LEB 3211:335872
> [  140.646492] UBIFS error (pid 361): ubifs_recover_leb: LEB 3211
> scanning failed

Please, produce the issue and send all messages, not only error messages
which you see on your console. E.g, send dmesg output. It is difficult
to say anything without the full log which should contain flash dump.

-- 
Best Regards,
Artem Bityutskiy
