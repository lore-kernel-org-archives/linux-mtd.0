Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CbRG3-0003rr-0n
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 17:23:04 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay03.plus.net with esmtp (Exim) id 1CbRFu-000JDE-K4
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 22:22:54 +0000
Received: from squizzey.bult.co.uk (squizzey.bult.co.uk [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id BCFE4375ED1
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Dec 2004 23:32:02 +0000 (GMT)
From: Oddjobz <oddjob@linux.co.uk>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 06 Dec 2004 22:23:03 +0000
Message-Id: <1102371783.8618.72.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: repost of "Problems using JFFS2 on block devices"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Further to the email below I've managed to get further , turns out that
the erase size being returned wasn't a multiple of the flash size, hence
the flash_eraseall loop was overrunning the device.

Secondly the (int)'s used for tracking the percentage complete were
overrunning .. inserting a couple of doubles as temporary variables
cures this.

Now, after finally mounting my 256Mb key I successfully did
"touch /mnt/usbkey" and "df" and was in the process of moving to another
directory to write something larger, when my machine reset.

The last thing is the logs was;
"flashsize not aligned to erase size, reducing to 255488k"

.. worth noting here that to solve the initial problem I did;
insmod blkmtd.ko device=/dev/sda1 erasesz=8

(which made erasesize a multiple of the device size .. as far as
eraseall was concerned)

Can anyone tell me whether what I'm doing "should" work .. and whether
it's worth me trawling through the driver to see if I can see what's
causing the reboot ???

tia
Gareth.
PS - updated kernel to 2.6.9


Hi,

I'm trying to get JFFS2 working on a USB key. (kernel 2.6.7, cvs tools)
(under the belief that JFFS2 will optimise writes and make my keys last
longer)

Anyway, I seem to be mostly there, I have a /dev/mtd/0 that works and
the tools seem to see it.
However;
./flash_eraseall /dev/mtd/0

Seems to work, but at the end gives me a non-descript IO error .. 
If I then try to mount the device, it seems to mount, then after a short
period, the system freezes.
(it looks like GC is running and crashing the system)

I've tried on 8Mb, 64Mb and 256Mb keys, same all round. (I'm guessing
the invalid JFFS2 is causing the freeze)

Should what I'm doing work, or am I being overly optimistic ?
Anyone any ideas?

(is there anything specific in terms of tool output that would help
diagnosis?)

tia
Gareth.
(I notice that on larger devices, eraseall seems to have a problem with
it's % complete counter, repeatedly starting again from 0 ... ??)
--
Linux.co.uk - promoting open source software in the UK
