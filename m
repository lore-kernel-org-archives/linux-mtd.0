Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaglJ-0000xy-VE
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 16:12:01 -0400
Message-ID: <083701c453df$c65db960$0100a8c0@superfortress>
From: "Dan Brown" <brown@osdsun1.nrl.navy.mil>
To: "Slim" <slimaffi@yahoo.com>,
	<linux-mtd@lists.infradead.org>
References: <20040616161345.33330.qmail@web50802.mail.yahoo.com>
Date: Wed, 16 Jun 2004 16:23:24 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few answers:

> Is the doc2000 dip NFTL or INFTL?  With read only support, would I be
> able to create a filesystem to read?

Some are NFTL, some are INFTL.  The INFTL variant is sometimes also known as
DiskOnChip 2000 TSOP.  From the pdf file that comes with the DOS-based DOC
utilities (hint hint):

[Inverse NAND Flash Translation Layer] M-Systems' latest flash management
algorithm, used by the TrueFFS driver for the following devices:
- DiskOnChip Millennium Plus

- Mobile DiskOnChip Plus

- DiskOnChip 2000 DIP (high), 384Mbytes and higher.

- DiskOnChip 2000 DIP (low), 192Mbytes and higher.

As for read-only support, its only the bad-block table itself that's
read-only, not the device itself.  Sorry, I should have been clearer in my
message.  If more blocks go bad at runtime, the information won't be
recorded to flash, and you'll forget about these additional bad blocks at
poweroff (which is bad).  Unless you're using INFTL filesystem, which has
its own markers for post-sale bad blocks.  Except INFTL doesn't work with
this driver yet. :(

The ability to update the BBT is something I plan to add soon, since I need
it. :)

You should be able to create a filesystem, but as I mentioned I haven't
gotten JFFS2 to work for me, yet.

> ECC - hardware error correction by the device?  Is this an optional
> enable in the driver?

Yes, the DOC has an ASIC that does ECC computation (for actual error
correction, software assitance is required).  It's not optional, though it
could be made so....  Why would you want to turn it off?

> Does it support other filesystems (ext2/3)?

Once the (I)NFTL code works with this driver, you can put filesystems like
ext2/3 over (I)NFTL.  For reasons why you might not want to, read up on
JFFS2.

> Thanks to everyone working on this.  I've needed a driver for doc2000
> dip devices for a couple years now.

Yeah, me too, but until now I kept hoping David would do it in his copious
spare time :)

    -Dan
