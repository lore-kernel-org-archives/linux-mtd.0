Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FCDyb-0000um-T9
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2006 05:45:40 -0500
Received: from portal.sanpeople.com ([192.168.1.40])
	by za-gw.sanpeople.com with esmtp (Exim 4.51) id 1FCE3L-0001HG-Bg
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2006 12:50:31 +0200
Received: from fuzzie.sanpeople.com ([192.168.4.5])
	by portal.sanpeople.com with esmtp (Exim 3.33 #1) id 1FCEJI-0000dO-00
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2006 13:07:00 +0200
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1140691375.1880.49.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 23 Feb 2006 12:42:56 +0200
Content-Transfer-Encoding: 7bit
Subject: AT49BV1614 not detected
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

I'm trying to get the AT49BV1614 flash working on the Atmel
AT91RM9200-DK board.  (2.6.16-rc4)

The kernel log shows the following:
  Search for id:(1f c0) interleave(1) type(2)
  MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
  MTD jedec_match(): check unlock addrs 0x5555 0x2aaa
  MTD jedec_match(): 0x0555 0x0aaa did not match

In jedec_probe.c I see:
    .name           = "Atmel AT49BV16X",
    .uaddr          = {
           [0] = MTD_UADDR_0x0555_0x0AAA,  /* x8 */
           [1] = MTD_UADDR_0x0555_0x0AAA   /* x16 */
    },

If I change the both 'uaddr' to MTD_UADDR_0x5555_0x2AAA:

   Search for id:(1f c0) interleave(1) type(2)
   MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
   MTD jedec_match(): check unlock addrs 0x5555 0x2aaa
   MTD jedec_match(): check ID's disappear when not in ID mode reset unlock called 5555 2aaa 
   MTD jedec_match(): return to ID mode
   MTD jedec_probe_chip(): matched device 0x1f,0xc0 unlock_addrs: 0x5555 0x2aaa
   Found: Atmel AT49BV16X
   reset unlock called 5555 2aaa 
   flash:: Found 1 x16 devices at 0x0 in 16-bit bank
   number of JEDEC chips: 1


It previously "just worked" in 2.4:
  Search for id:(1f c0) interleave(1) type(2)
  Found: Atmel AT49BV16X
  Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode


What could be the cause / correct fix for this problem?


Regards,
  Andrew Victor
