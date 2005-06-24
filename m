Received: from kvant-efir.client.kv.chereda.net ([195.43.43.142]
	helo=kvant-efir.com.ua)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dlk8a-0001vR-Im
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 05:06:14 -0400
Received: from kokachev.kvant-efir.com.ua [192.168.1.19] by kvant-efir.com.ua
	[127.0.0.1] with SMTP (MDaemon.v3.5.7.R)
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2005 11:54:56 +0300
Date: Fri, 24 Jun 2005 12:00:04 +0300
From: Kokachev <kokachev@kvant-efir.com.ua>
Message-ID: <438892871.20050624120004@kvant-efir.com.ua>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: PXA255 with Samsung K9K1G08UOM flash problem
Reply-To: Kokachev <kokachev@kvant-efir.com.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have Xscale PXA255 SBC with Samsung K9K1G08UOM flash on-board. I
wrote NAND driver for this flash. I use kernel 2.6.7 and MTD snapshot
from 20 of June 2005. And when I make insmod of my driver I see a lot
of messages: "Bad eraseblock 0 from 00000000","Bad eraseblock 1 from
00004000",etc. I began to read the source and I see that from OOB
blocks of my flash I read non-FF values. When I inserted some printk
functions to see what I read from OOB blocks the count of bad
eraseblocks decreased. My flash is connected at address 0x04000000 of
Xscale memory map. ALE and CLE are connected to GPIOs. I think, that
this could be cache problem. I wrote my own nand_write_byte function
with Drain (&Fill) cache command after writing the byte. Situation
changed. function nand_read_oob function reads right values, but
bbt_scan takes about 30 minutes!!! Even without "bad eraseblock" messages when
I try to make nandwrite I receive the message "File cannot fit in to
media due to bad blocks". What should I do? Is it possible to saw to
Xscale, that memory at address 0x04000000 should not be cacheable?
