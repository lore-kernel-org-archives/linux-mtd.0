Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BupB4-00026e-3i
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2004 05:13:48 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Yann Rapaport <yann.rapaport@6wind.com>
In-Reply-To: <4119D7B0.8080105@6wind.com>
References: <4119D7B0.8080105@6wind.com>
Content-Type: text/plain
Message-Id: <1092215686.3508.4.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 11 Aug 2004 11:14:46 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 and NAND smartmedia card
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-08-11 at 10:24, Yann Rapaport wrote:
> Hi!
> 
> I am currently working on installing a JFFS2 filesystem on an ARM 
> system, using a Samsung NAND Smartmedia device and 2.4.20 kernel from 
> montavista 3.1.
> My aim is now to create my filesystem using mkfs.jffs2. When mounting 
> the partition, I get ECC, CRC and magic bitmask errors.
> root:/# mkfs.jffs2 -r /usr/admin -s 512 -e 16384 -b -o /dev/mtd1

Direct output of mkfs.jffs2 to NAND is not working yet. Output to a file
and use nandwrite to store it on the FLASH

tglx
