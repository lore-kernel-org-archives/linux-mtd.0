Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Njqa2-00051k-Go
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 08:57:27 +0000
Date: Tue, 23 Feb 2010 09:57:17 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: RE: MLC nand driver for linux
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
Message-ID: <Pine.LNX.4.64.1002230947110.29303@lnxricardw.se.axis.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Sasa Sasa <sasak.1983@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 23 Feb 2010, Paulraj, Sandeep wrote:

> I've used MICRON and SAMSUNG MLC NAND's without any problems.
>
> The MICRON NAND's were ONFI devices and even they worked well.

What do you do about ECC for these devices? As I understand MLC flash=20
requires stronger ECC algorithms than the 1 bit / 256 byte algorithm which=
=20
is by default implemented in software by mtd. Do the flash chips or the=20
system you are using have hardware ECC?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
