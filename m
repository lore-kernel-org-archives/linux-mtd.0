Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BusLi-0002Y1-37
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2004 08:37:01 -0400
Message-ID: <032f01c47fa1$ae533f50$0100a8c0@superfortress>
From: "Dan Brown" <dan_brown@ieee.org>
To: "Brendan Simon" <BrendanSimon@fastmail.fm>, <linux-mtd@lists.infradead.org>
References: <4111AEA6.2080605@fastmail.fm><003f01c47aeb$706113d0$0100a8c0@superfortress>
	<4119723E.8050205@fastmail.fm>
Date: Wed, 11 Aug 2004 08:49:46 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: 128MB DOC2000 with 2.4.X kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "Brendan Simon" <BrendanSimon@fastmail.fm>
Sent: Tuesday, August 10, 2004 9:11 PM


> Summary regarding the 128MB DOC2000:
>     1) Cannot use NTFL.  I *must* use INFTL

Or a filesystem that runs directly on flash, such as jffs2 or yaffs.

>     2) 128MB DOC2000 is more like a MilleniumPlus device than a DOC2000
> device.

I think you mean Millennium.  Millennium Plus is another beast entirely :)

>     3) Recommend using 2.6 kernel and latest MTD tree.

This would still be my recommendation, however, there has been some effort
in the last few days to allow the latest MTD code to compile under the 2.4
series.  If you're dead-set against switching to 2.6, it might be worth your
time to grab the latest MTD snapshot, patch your 2.4 kernel using the
included script, and see what happens.  No promises.

> Is the 96MB DOC2000 more like the 64MB model or the 128MB model?
> i.e. can I use a 96MB DOC2000 with my existing 2.4.18 kernel or will I
> have the same problems as the 128MB DOC.

Take a look at the file "DiskOnChip Software Utilities.pdf", distributed by
M-Systems as part of their free DOS driver download.  Table 1 (on page 4)
discusses which parts use NFTL and which use INFTL.  Quoted below:

NFTL [NAND Flash Translation Layer] M-Systems' patented algorithm, used by
the TrueFFS driver for the following devices:

- Most models of DiskOnChip 2000 (see excluded models below).

- DiskOnChip Millennium 8Mbytes.

INFTL [Inverse NAND Flash Translation Layer] M-Systems' latest flash
management algorithm, used by the TrueFFS driver for the following devices:

- DiskOnChip Millennium Plus

- Mobile DiskOnChip Plus

- DiskOnChip 2000 DIP (high), 384Mbytes and higher.

- DiskOnChip 2000 DIP (low), 192Mbytes and higher.


If I had reviewed this table before I responded to your email, I would have
noticed that the 128M DOC ought to use NFTL.  Are you sure you have a part
that "looks like a Millennium"?  (All DOC2000 parts that use the Millennium
hardware interface also use INFTL, and vice versa.)  I'm willing to believe
the MSYS docs I have might be out of date (I'm pretty sure the
low-profile/high-profile boundary has changed), but it would be good to
confirm this.


    -Dan
