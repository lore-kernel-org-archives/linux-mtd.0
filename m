Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NkD7h-0005aE-Og
	for linux-mtd@lists.infradead.org; Wed, 24 Feb 2010 09:01:44 +0000
Date: Wed, 24 Feb 2010 10:01:31 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: RE: MLC nand driver for linux
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9BC47920@dlee01.ent.ti.com>
Message-ID: <Pine.LNX.4.64.1002241000170.29303@lnxricardw.se.axis.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
	<aecf5e531002222042g2eb3ee79g53d05261054e07ee@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BC47920@dlee01.ent.ti.com>
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

>>
>> I am also using micron mlc nand device.(4k page size)
>>
>> Just for ref, could I refer your driver from mainline linux kernel if
>> available, i think it would be same for SLC and MLC.
>
> Drivers/mtd/nand/davinci_nand.c

Note that this driver is dependent on hardware ECC generation of TI=20
DaVinci microcontrollers. The equivalent hardware may exist on other=20
systems, but as far as I can tell there is no built in software ECC=20
algorithm apart from the standard 1 bit / 256 bytes algorithm in mtd.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
