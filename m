Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NnIs4-00041N-TN
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2010 21:46:21 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: massimo cirillo <maxcir@gmail.com>
Date: Thu, 4 Mar 2010 15:46:11 -0600
Subject: RE: MLC nand driver for linux
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9C10D43E@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
	<62cbdcd91003041227i5af7e246u381e1bf7802a8cb@mail.gmail.com>
In-Reply-To: <62cbdcd91003041227i5af7e246u381e1bf7802a8cb@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> Hi,
> Sorry my earlier message was rejected because of suspicious header.
>=20
> Hi Paulraj,
> I'm interested in testing Numonyx MLC Nand devices.
> So, what kind of tests have you done with MLC NAND ?
The ones we get in mtd-utils
> File system level ?=20
We load jffs and yaffs2
> Driver level ?
We check if ECC correction actually takes place
> Have you modified in any part the nand_base.c file ?
No.
> And what kernel version ?
The latest 2.6.33.. I have been working on it since 2.6.28.
> thanks
>=20
