Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KsDY1-00046p-4y
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 09:29:05 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id m9L9Sv8a009087
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2008 04:29:03 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id m9L9Sukq029805
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Oct 2008 14:58:57 +0530 (IST)
From: "Singh, Vimal" <vimalsingh@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 21 Oct 2008 14:58:54 +0530
Subject: RE: Mark bad eraseblock back to good
Message-ID: <19F8576C6E063C45BE387C64729E739403DC101320@dbde02.ent.ti.com>
References: <mailman.15.1224259204.15271.linux-mtd@lists.infradead.org>,
	<48FC22C3.7040006@avrupayazilim.com>
In-Reply-To: <48FC22C3.7040006@avrupayazilim.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >Does anybody have a modified flash_eraseall that marks bad eraseblock
>  >back to good. Or any scripts that does that?
>=20
>=20
> Hi
>=20
> If you are using u-boot, there is a u-boot command (I can not remember
> its name) to mark bad eraseblocks as good.
>=20
Use 'nand scrub' (from u-boot), it really cleans NAND erasing bad blocks.

NOTE: scrub option will erase all factory set bad blocks! There is no relia=
ble way to recover them.=20

vimal=
