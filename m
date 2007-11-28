Received: from rekin26.go2.pl ([193.17.41.76])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxJoh-0001K4-VH
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 10:06:58 +0000
Received: from o2.pl (unknown [10.0.0.137])
	by rekin26.go2.pl (Postfix) with SMTP id 37B165BE26
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 11:06:21 +0100 (CET)
Subject: =?UTF-8?Q?Usage_of_reserved_bytes_in_OOB_area?=
From: =?UTF-8?Q?Jakub_Mielczarek?= <jimbond@tlen.pl>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Message-ID: <7ae546a3.275e0f72.474d3d9c.7e064@o2.pl>
Date: Wed, 28 Nov 2007 11:06:20 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I=20am=20working=20on=20an=20embedded=20project,=20which=20requires=20sto=
ring=20some=20extra=20information=20in=20the=20out-of-band=20area=20of=20=
NAND=20flash.=20I=20am=20particularly=20interested=20in=20using=20the=20r=
eserved=20bytes=20of=20OOB.=20The=20ones=20reserved=20for=20FS=20autoplac=
ement=20should=20stay=20intact,=20but=20there=20is=20the=204th=20byte=20o=
f=20OOB=20(512=20bytes=20page=20size)=20which=20is=20reserved.=20Does=20a=
nyone=20know=20if=20it=20is=20or=20is=20planned=20to=20be=20used=20by=20m=
td?
