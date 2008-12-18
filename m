Date: Thu, 18 Dec 2008 13:29:52 +0100
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Richard Genoud" <richard.genoud@gmail.com>
Subject: Re: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
Message-ID: <20081218132952.70418c4d@hskinnemoen-d830>
In-Reply-To: <80b317760811210150w3886fe28jf1f2961360e081f5@mail.gmail.com>
References: <1223793748.7110.13.camel@ubuntu>
	<1223906461.6770.604.camel@macbook.infradead.org>
	<20081013161353.38b8ff51@hskinnemo-gx745.norway.atmel.com>
	<80b317760810130844l53709cf8j284d81d432d2696e@mail.gmail.com>
	<80b317760811210150w3886fe28jf1f2961360e081f5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Justin Waters <justin.waters@timesys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Genoud wrote:
> Have you some feed-back on this patch ?
> Justin tested it successfully with a Samsung K9F2G08U0M-PCB0 256 MiB
> with 2048 Byte page size
> and 128 KiB Erase Block size on an at91sam9260-ek.

Sorry about not responding earlier, but FWIW, I have successfully
booted a avr32 board after this patch was merged, and I can't see any
obvious problems. So I think it works fine.

The NAND chip I have is also a Samsung one:

NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB 3,3V 8-bit)

with 2K page size.

Haavard
