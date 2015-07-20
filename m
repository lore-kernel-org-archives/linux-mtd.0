Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHH7o-0006Ui-4R
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 19:53:21 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain> <55A912F0.7080605@vanguardiasur.com.ar>
 <87h9p2is8e.fsf@belgarion.home>
 <CAAEAJfCcdioVQKZs9U3DP6H94BiuQ2qU21DsMKevS5+j+-XEKA@mail.gmail.com>
Date: Mon, 20 Jul 2015 21:49:44 +0200
In-Reply-To: <CAAEAJfCcdioVQKZs9U3DP6H94BiuQ2qU21DsMKevS5+j+-XEKA@mail.gmail.com>
 (Ezequiel Garcia's message of "Sat, 18 Jul 2015 14:18:02 -0300")
Message-ID: <87wpxufw2v.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Here you go:
>
> http://git.infradead.org/users/ezequielg/linux/shortlog/refs/heads/pxa3xx-nand-timing-rework-v2

Okay, I've tested this on cm-x300. The result is not bright :
	nand: device found, Manufacturer ID: 0xec, Chip ID: 0xdc
	nand: Samsung NAND 512MiB 3,3V 8-bit
	nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
	pxa3xx-nand pxa3xx-nand: ECC strength 1, ECC step size 512
	Scanning device for bad blocks
	random: nonblocking pool is initialized
	Bad eraseblock 1037 at 0x0000081a0000
	Creating 6 MTD partitions on "pxa3xx_nand-0":
	0x000000000000-0x000000040000 : "OBM"
	0x000000040000-0x000000080000 : "U-Boot"
	0x000000080000-0x0000000c0000 : "Environment"
	0x0000000c0000-0x000000200000 : "reserved"
	0x000000200000-0x000000600000 : "kernel"
	0x000000600000-0x000020000000 : "fs"

The bad black is not bad normally.
And then :
	# dd if=/dev/mtd0 of=toto count=1
	pxa3xx-nand pxa3xx-nand: Wait time out!!!
	1+0 records in
	1+0 records out
	# ls -l toto
	-rw-r--r--    1 root     root           512 Jan  1 00:02 toto
	# hexdump-C toto
	00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
	*
	00000200

That's not possible, as it should have dumped the OBMI.

And yet, I hesitate to incriminate this patchset, I will try without it. It wont
be very fast, as my USB to serial converter just broke, and my order will take a
couple of days to complete.

And of course without this converter I cannot test anymore, especially the
zylonite board which will be more interesting.

So I'll report back as soon as the UK mail has completed the shipment.

Cheers.

-- 
Robert
