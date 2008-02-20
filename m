Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRrmD-00059A-LH
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 16:26:35 +0000
Date: Wed, 20 Feb 2008 17:25:27 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ken Chan <ken8804@gmail.com>
Subject: Re: MTD - NAND (Micron MT29F16G08)
In-Reply-To: <4ffb81490802200607n3d5f6ad5h12f4a53399a32466@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0802201723410.3508@lnxricardw.se.axis.com>
References: <4ffb81490802200607n3d5f6ad5h12f4a53399a32466@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 20 Feb 2008, Ken Chan wrote:

> Hi,
> I am trying to get my NAND Flash (Micron MT29F16G08 -- 2 GBytes NAND) goi=
ng.
> Based on the data sheet, the page size is 4KB, the Spare area size (i.e.
> OOB) is 218 Bytes, the Block size is 512KB.
> I am using Linux Kernel 2.6.16 and it does not support this NAND Flash
> because of the OOB is 218 Bytes.
> I checked the Linux Kernel (2.6.24) and same thing applied.
>
> Here are my questions:
> 1) How can I build a data structure "struct nand_oobinfo nand_oob_218"?
> What shall I put for those eccpos[]?
> 2) If I don't want to create that new data structure, what is the
> alternative method to bring up that NAND Flash?
> 3) Do anyone have similar problem using that kind of NAND Flash?

Just a guess here, does it matter that the exact oob size is not=20
supported? As long as there are enough bytes for what is needed (bad block=
=20
indicator, ECC data, and jffs2 cleanmarkers if using jffs2 filesystem) it=
=20
might not matter what the exact size is. Most flashes support reading and=
=20
writing less than a full page or oob.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
