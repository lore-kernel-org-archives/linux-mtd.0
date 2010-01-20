Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXXZb-0006R8-Qu
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 10:14:08 +0000
Date: Wed, 20 Jan 2010 11:13:55 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Liu Hui <onlyflyer@gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
In-Reply-To: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 20 Jan 2010, Liu Hui wrote:

> Hi guys,
>
> This is a question confused me for a long time. As I know, writing a
> sector for a hard disk is atomic. That is to say, when we are writing
> a sector to hard disk and power failure happen, the sector will be
> written completely or not at all.
>
> For NAND flash, I didn't see the atomic guarantee in any material.
> Could you please tell me if writing a page for NAND flash is atomic?
> This is very important for a transaction based file system.

It is my understanding that if you get a power failure while the nand=20
flash chip is writing the page the page could get partly written.

The only way around something like this would be to monitor the power line=
=20
prior to the supply regulator, and not start a write if it can be detected=
=20
that a power failure has occurred and there is not enough power to=20
complete the write.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
