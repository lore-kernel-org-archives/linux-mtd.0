Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sp04q-0002uC-Kq
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 16:47:49 +0000
Message-ID: <4FFDADFC.5020503@newsguy.com>
Date: Wed, 11 Jul 2012 09:46:52 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
In-Reply-To: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 Joel Reardon <reardonj@inf.ethz.ch>, ivan.djelic@parrot.com,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> * My NAND controller's HW ECC flags these erased-page bitflips as
> uncorrectable errors, as there was no ECC written to the page and the
> read data does not match the 0xff special "erased" case. I assume most


Ditto for the newer diskonchips...


> other ECC mechanisms would treat this similarly [2]. In such cases, I
> suspect that the best the driver can do is to return the raw data
> (0xff with flips) and an ECC error message.
> 
> * UBI and other FS layers need to distinguish between: (a) 0xff
> cleanly-erased, (b) 0xff with bitflips, and (c) true ECC errors. In
> the end, we may treat (a) and (b) the same (as erased pages), but the
> problem is distinguishing between (b) and (c).


To distinguish between (b) and (c), the docg4 driver dedicates an unused oob
byte as a "page written" flag.  This byte is cleared whenever the page is
written.  When uncorrectible bitflip errors occur, if more than half of the bits
in this flag are set, the page is assumed to be blank, but with bitflips.  In
this case the driver quietly ignores the ecc error, but returns the blank page
data with the bitflips.  Not a complete solution, and also specific to one
particular driver, but food for thought.  This scheme was actually suggested by
Ivan Djelic.

Mike
