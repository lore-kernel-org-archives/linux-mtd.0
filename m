Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QOxVZ-0002vH-KF
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 19:43:14 +0000
Message-ID: <4DDC08EC.6040002@wi.rr.com>
Date: Tue, 24 May 2011 14:37:16 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
References: <4DADF9E6.9010709@wi.rr.com>	 <1303392001.2757.16.camel@localhost>
	<4DC31183.8060807@wi.rr.com>	 <1304706750.7222.95.camel@localhost>
	<4DD6DA14.9050402@wi.rr.com> <1306226504.2785.68.camel@localhost>
In-Reply-To: <1306226504.2785.68.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> 
> 1. Your kernel version is 2.6.36, do you use up-to-date UBI/UBIFS from
>    the ubifs-v2.6.36 back-port tree? See here:
>    http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

We are not up to date.  I'll look into getting us there.  Thanks!

In the meantime, I have the debug info you were looking for.

> 2. Could you please make sure you have UBIFS debugging enabled - just
>    debugging support, no additional messages or checks. Then post UBIFS
>    messages which it prints when you mount it. It prints things like
>    LPT model (c->big_lpt) which I want to know.

UBIFS DBG (pid 1): mount_ubifs: compiled on:         May 13 2011 at 14:22:48
UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 1): mount_ubifs: LEB size:            129024 bytes (126 KiB)
UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1): mount_ubifs: UUID: 
2A1E7A10-8791-42F1-9BA3-F13692BF16E2
UBIFS DBG (pid 1): mount_ubifs: big_lpt              1
UBIFS DBG (pid 1): mount_ubifs: log LEBs:            5 (3 - 7)
UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       13 (8 - 20)
UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (21 - 21)
UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      8041 (22 - 8062)
UBIFS DBG (pid 1): mount_ubifs: index LEBs:          2
UBIFS DBG (pid 1): mount_ubifs: total index bytes:   165544 (161 KiB, 0 MiB)
UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     7709
UBIFS DBG (pid 1): mount_ubifs: first main LEB:      22
UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48, inode 160, 
dentry 56
UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb 4096, 
master 512
UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt. start 
32, orph 32
UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144, inode 
4256 dentry 312
UBIFS DBG (pid 1): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 1): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        560
UBIFS DBG (pid 1): mount_ubifs: max. dark space:     49403904 (48246 
KiB, 47 MiB)
UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   8388608 (8192 KiB, 
8 MiB)
UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 6815744 (6656 KiB, 
6 MiB)
UBIFS DBG (pid 1): mount_ubifs: current bud bytes    139264 (136 KiB, 0 MiB)
UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    7823
UBIFS DBG (pid 1): mount_ubifs: commit number:       11


> 3. Please, enable LPT extra checks and run your tests and try to
>    reproduce this issue. To enable LPT extra checks you need to do:
> 
>    $ sudo sh -c 'echo 32 > /sys/module/ubifs/parameters/debug_chks'
> 
>    This will make UBIFS to check lprops at each commit and we have a
>    better chance to catch issues.
> 

We were able to make it fail before limiting the checks to just the LPT 
area.  I'll try it again with your above change.

UBIFS error (pid 29): dbg_chk_pnode: pnode num -952997232 expected 1803 
parent num 6196 iip 3
UBIFS error (pid 29): do_commit: commit failed, error -22
UBIFS warning (pid 29): ubifs_ro_mode: switched to read-only mode, error -22
Call Trace:
[c7a19ec0] [c00085b8] show_stack+0x7c/0x194 (unreliable)
[c7a19f00] [c00f2608] ubifs_ro_mode+0x6c/0x7c
[c7a19f10] [c01000bc] do_commit+0x5fc/0x620
[c7a19f90] [c0100468] ubifs_bg_thread+0xf4/0x154
[c7a19fb0] [c0037cec] kthread+0x80/0x84
[c7a19ff0] [c000ef84] kernel_thread+0x4c/0x68

> Thanks!
> 
Thank you!
