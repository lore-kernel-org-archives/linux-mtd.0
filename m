Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DACNk-0000N9-Ec
	for linux-mtd@lists.infradead.org; Sat, 12 Mar 2005 14:34:41 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Sukanta K. Hazra" <sukanta@i2r.a-star.edu.sg>
In-Reply-To: <20050312184728.GA16267@i2r.a-star.edu.sg>
References: <20050312184728.GA16267@i2r.a-star.edu.sg>
Content-Type: text/plain
Date: Sat, 12 Mar 2005 20:34:03 +0100
Message-Id: <1110656044.4814.0.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 64 MB DiskOnChip 2000 causes kernel to hang
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-03-13 at 02:47 +0800, Sukanta K. Hazra wrote:
> ====
> DiskOnChip found at 0xd8000
> DiskOnChip 2000 responds to DWORD access
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MiB
> 3,3V 8-bit)
> ====
> 
> I have tried using kernel 2.6.11; the same problem persists. It's
> unlikely that the DOC is faulty, I replaced it with another unit (64
> MB), no improvement.

Please try current MTD CVS code. It should be solved there.

tglx
