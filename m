Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6fmq-0004YO-Iw
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 07:00:31 +0000
Date: Wed, 20 May 2009 09:00:15 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: John Tobias <jtobias@viaas.com>
Subject: Re: Nand driver acts different in two different settings
In-Reply-To: <66b2b2310905191355h1b99caaasd4636e4e9efc9aec@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0905200859090.26634@lnxricardw.se.axis.com>
References: <66b2b2310905191355h1b99caaasd4636e4e9efc9aec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 19 May 2009, John Tobias wrote:

> I have tested two scenarios for writing/reading a data on my nand flash=
=20
> and it act's differently the nand driver on DM6446. ...

> I erased the said partition using flash_eraseall -j /dev/mtdblock11,=20
> write the .jffs2 image on flash using nandwrite. Then, I reboot my board=
=20
> to boot on nand. The first boot, I didn't get any errors/warnings. But,=
=20
> after the 2nd reboot, I got the following errors:

Odd that you don't get errors the first time you boot.

I really don't know, but I would try omitting -j to flash_eraseall and see=
=20
if it makes a difference.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
