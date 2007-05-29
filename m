Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ht8IW-000584-91
	for linux-mtd@lists.infradead.org; Tue, 29 May 2007 16:28:06 -0400
Date: Tue, 29 May 2007 22:27:44 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: dedekind@infradead.org
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
In-Reply-To: <1180467763.3642.125.camel@sauron>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron> <20070528212513.5086bfac@newbox>
	<1180467763.3642.125.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Ivan Kuten <ivan.kuten@promwad.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 May 2007 22:42:43 +0300
Artem Bityutskiy <dedekind@infradead.org> wrote:

> Sorry for long delay. I is not quite what I asked, but anyway, may you
> pleas apply the below patch, reproduce the problem and send me the
> result.
> 
> Please, do this faster if you can because I will need to disappear for
> about 2 weeks in a day. I will try to figure out what is going wrong,
> thanks.

Here you go. I cut out a few bits that looked uninteresting as the
whole log ended up at almost 150K. I can send you the whole log in
private if you want it.

This is on an ATNGW100 board (AT32AP7000 AVR32 CPU) with AT45DB642D
dataflash using the mtd_dataflash and atmel_spi drivers. I believe Ivan
is using an AT91RM9200 ARM CPU with AT45DB642 dataflash using the
at91_dataflash and at91_spi drivers.

The symptoms aren't always the same, but the "can not read -928 bytes"
message always seems to appear before things start to go bad.

I have to go offline now, but I'll be back in about 11 hours.

Haavard

[root@uclibc ~]# mount -tjffs2 mtd3 /mnt
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
read 480 bytes at 0x000240(2), wbuf sz 1056
read 592 bytes at 0x0001d0(2), wbuf sz 1056
read 708 bytes at 0x00015c(2), wbuf sz 1056
read 820 bytes at 0x0000ec(2), wbuf sz 1056
read 932 bytes at 0x00007c(2), wbuf sz 1056
read 1056 bytes at 0x000000(2), wbuf sz 1056
read 1004 bytes at 0x000034(0), wbuf sz 1056
read more -928 bytes, needed_len 68
JFFS2 error: (132) read_more: can not read -928 bytes from 0x00000420,
error code: -22. JFFS2 error: (132) jffs2_do_read_inode_internal:
cannot read nodes for ino 2, returned error is -22 Returned error for
crccheck of ino #2. Expect badness... read 172 bytes at 0x38bb74(2),
wbuf sz 1056 read 308 bytes at 0x38baec(2), wbuf sz 1056
read 444 bytes at 0x38ba64(2), wbuf sz 1056
read 576 bytes at 0x38b9e0(2), wbuf sz 1056
read 712 bytes at 0x38b958(2), wbuf sz 1056

(...)

Calculates CRC (0x799298d3) for 56 bytes, csize 56
read 960 bytes at 0x019080(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x53b0cfec) for 56 bytes, csize 56
read 468 bytes at 0x018e4c(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x5a9364f2) for 495 bytes, csize 495
read 1056 bytes at 0x018c00(0), wbuf sz 1056
read more -928 bytes, needed_len 68
JFFS2 error: (132) read_more: can not read -928 bytes from 0x00019020,
error code: -22. JFFS2 error: (132) jffs2_do_read_inode_internal:
cannot read nodes for ino 22, returned error is -22 Returned error for
crccheck of ino #22. Expect badness... read 900 bytes at 0x0194dc(0),
wbuf sz 1056 read more 128 bytes, needed_len 68
Calculates CRC (0x28639b3d) for 17 bytes, csize 17
read 768 bytes at 0x019560(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x28639b3d) for 17 bytes, csize 17
read 632 bytes at 0x0195e8(0), wbuf sz 1056
read more 128 bytes, needed_len 68

(...)

Calculates CRC (0x2d452039) for 444 bytes, csize 609
read 1056 bytes at 0x021000(0), wbuf sz 1056
read more -928 bytes, needed_len 68
JFFS2 error: (132) read_more: can not read -928 bytes from 0x00021420,
error code: -22. JFFS2 error: (132) jffs2_do_read_inode_internal:
cannot read nodes for ino 27, returned error is -22 Returned error for
crccheck of ino #27. Expect badness... read 408 bytes at 0x02a708(0),
wbuf sz 1056 read more 128 bytes, needed_len 68
Calculates CRC (0x9ba4c9bd) for 418 bytes, csize 418
read 616 bytes at 0x02a638(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x9bc4f1c7) for 140 bytes, csize 140
read 740 bytes at 0x02a5bc(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x2e3599f9) for 56 bytes, csize 56

(...)

read 384 bytes at 0x7bae00(0),
wbuf sz 1056 read more 128 bytes, needed_len 68
Calculates CRC (0xc9aba857) for 444 bytes, csize 474
JFFS2 notice: (132) check_node_data: wrong data CRC in data node at 0x007baf80: read 0x948a5877, calculated 0xdfc9dfd2.
JFFS2 warning: (132) jffs2_do_read_inode_internal: no data nodes found for ino #292 Returned error for crccheck of ino #292. Expect badness...
read 844 bytes at 0x7bb054(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x3f1fdc46) for 431 bytes, csize 431
read 288 bytes at 0x7bb280(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0x780a4799) for 348 bytes, csize 455
JFFS2 notice: (132) check_node_data: wrong data CRC in data node at 0x007bb3a0: read 0x2d0e3614, calculated 0x714e0613.
JFFS2 warning: (132) jffs2_do_read_inode_internal: no data nodes found for ino #294
Returned error for crccheck of ino #294. Expect badness...
read 764 bytes at 0x7bb4c4(0), wbuf sz 1056
read more 128 bytes, needed_len 68
Calculates CRC (0xd80c376) for 262 bytes, csize 262
Checked all inodes but still 0x792a58 bytes of unchecked space?
No space for garbage collection. Aborting GC thread
