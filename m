Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxfap-0005SM-0v
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:07:51 +0000
Received: by eyh6 with SMTP id 6so537895eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:07:49 -0800 (PST)
Subject: Re: NAND device: all blocks bad after restart, how to recover?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lars.michael@yahoo.com>
In-Reply-To: <227729.21879.qm@web30201.mail.mud.yahoo.com>
References: <227729.21879.qm@web30201.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:06:18 +0200
Message-ID: <1299762378.6676.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-09 at 08:39 -0800, Lars Michael wrote:
> Hello,
> 
> I repost this issue, with correct subject and hope to have some
> feedback. After working with getting UBI images mounted in Linux (it did
> work for a sec!) the NAND device suddenly went totally bad after a system
> restart! So all blocks are reported bad and the mtd is no longer visible
> in Linux.

So do mtd tests work fine with your flash?

>  Before it had just a few bad blocks.

Do you have any old logs where you could find the bad block numbers?

> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron
> NAND 256MiB 3,3V 16-bit)
> Bad block table not found for chip 0
> Bad block table not found for chip 0
> Scanning device for bad blocks
> Bad eraseblock 0 at 0x000000000000
> Bad eraseblock 1 at 0x000000020000
> Bad eraseblock 2 at 0x000000040000
> Bad eraseblock 3 at 0x000000060000
> Bad eraseblock 4 at 0x000000080000
> Bad eraseblock 5 at 0x0000000a0000
> Bad eraseblock 6 at 0x0000000c0000
> <cut>
> Bad eraseblock 2046 at 0x00000ffc0000
> Bad eraseblock 2047 at 0x00000ffe0000
> No space left to write bad block table
> fsl_nfc: NAND Flash not found !
> m25p80 spi1.1: at26df081a (1024 Kbytes)
> Creating 1 MTD partitions on "Atmel at26df081a SPI Flash
> chip":
> 0x000000000000-0x000000100000 : "at26df081a"

Do you have any logs when this thing happened?

> Assuming this is a software issue, can the bbt somehow be corrupt,
> reporting all blocks bad even if they are not?

I do not know.

> Is the problem likely to be in the UBI layer or in the NAND driver
> (I suspect the first) and how can I troubleshoot this?

I might be broken driver which reports write errors, and then UBI marks
all blocks bad. We might probably need some limit in UBI to prevent
situations like this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
