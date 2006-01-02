Received: from dns.kernelconcepts.de ([212.60.202.194]
	helo=gateway.kernelconcepts.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EtSa7-00056S-1K
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2006 11:30:50 -0500
Received: from platon.kc.de ([192.168.2.100])
	by gateway.kernelconcepts.de with asmtp (Exim 3.35 #1 (Debian))
	id 1EtSLS-0002W2-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jan 2006 17:15:38 +0100
From: Ole Reinhardt <ole.reinhardt@kernelconcepts.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 02 Jan 2006 17:30:36 +0100
Message-Id: <1136219436.11699.55.camel@platon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: mtd with AMD AM29LV800DB nor flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a problem using 2.6.15-rc7'th mtd with an AMD AM29LV800DB nor
flash device.

The flash chip is connected to CS0 and is using 16bit bus width. It is
recognised as AM29LV800BB, which is fully software and pin compatible to
the AM29LV800DB device.

Everything works quite fine, except writing / erasing. I tracked down
the problem downto the following function:

finfo_uaddr() in drivers/mtd/chips/jedec_probe.c

I have a 16bit bus width, so I would expect it to return
MTD_UADDR_0x0555_0x02AA, but there are the following lines:


if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
	/* ASSERT("The unlock addresses for non-8-bit mode
	   are bollocks. We don't really need an array."); */
	uaddr = finfo->uaddr[0];
}

In other words: For my flash chip, always MTD_UADDR_0x0AAA_0x0555 is
returned.

This is definatly the wrong unlock address for 16bit mode and every
erase command will fail.

If I comment out the "if (uaddr != MTD_UADDR_NOT_SUPPORTED ) ..."
everything works fine.

Can anybody explain me what's going wrong or is this a bug in the mtd
code?

Best regards,

Ole Reinhardt

-- 
kernel concepts    Tel: +49-271-771091-14
Dreisbachstr. 24   Fax: +49-271-771091-19
D-57250 Netphen    E+ : +49-177-7420433
--
