Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Njloh-0005WX-Rz
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 03:52:16 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Sasa Sasa <sasak.1983@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 22 Feb 2010 21:52:08 -0600
Subject: RE: MLC nand driver for linux
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
In-Reply-To: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> Hi,
>=20
> Regarding MLC nand devices, Is there any change or support required in
> exiting kernel drivers basically nand_base and mtd drivers etc or they
> simply support this device. Like for onenand there are different read
> and write calls for mlc as we see in onenand_base.c file.
>=20
> Regards
> Sasa
>=20

I've used MICRON and SAMSUNG MLC NAND's without any problems.

The MICRON NAND's were ONFI devices and even they worked well.
