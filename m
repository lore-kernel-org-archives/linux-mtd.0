Received: from pinova.rz.uni-augsburg.de ([137.250.2.102])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDSnj-0003IL-A7
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 08:37:24 +0000
Received: from limette.rz.uni-augsburg.de ([137.250.1.100])
 by pinova.rz.uni-augsburg.de with esmtps
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <pfaehler@isse.de>) id 1bDSnK-00005R-Sy
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 10:36:58 +0200
Received: from pfaehler.informatik.uni-augsburg.de ([137.250.170.141]
 helo=pfaehler-pc.localnet)
 by limette.rz.uni-augsburg.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.72) (envelope-from <pfaehler@isse.de>) id 1bDSnJ-0006AQ-OB
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 10:36:57 +0200
From: =?ISO-8859-1?Q?J=F6rg_Pf=E4hler?= <pfaehler@isse.de>
To: linux-mtd@lists.infradead.org
Subject: UBI: recover_peb and power cut safety
Date: Thu, 16 Jun 2016 10:37:01 +0200
Message-ID: <1811946.TqycnYvpkR@pfaehler-pc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would greatly appreciate some clarification with respect to power cut saf=
ety=20
during writing of an erase block in UBI, specifically power cut safety of=20
recover_peb.

During a normal write operation (ubi_eba_write_leb in mtd/ubi/eba.c) UBI tr=
ies=20
to move the contents of the block (and the new contents) to a new location =
via=20
recover_peb, if the write fails. However, recover_peb does not seem to use =
the=20
capability to exchange the (logical) block atomically (as=20
ubi_eba_atomic_leb_change in mtd/ubi/eba.c does). Specifically, it does not=
=20
seem to write the amount of data and its checksum to the VID header. Thus, =
if=20
the system crashes in the middle of recover_peb before the old/broken block=
=20
could be erased, we are left with a newer version of the block (the sequenc=
e=20
number in the header is increased by recover_peb), but without having moved=
=20
all the contents of the old block. This would obviously lead to data loss.=
=20
Thus, It seems to me that recover_peb (and therefore ubi_eba_write_leb) is =
not=20
power cut safe or is there some other mechanism distinct from the one used =
by=20
ubi_eba_atomic_leb_change to achieve this? If not I would suggest using=20
ubi_eba_atomic_leb_change in ubi_eba_write_leb instead of recover_peb.

Thanks in advance for any clarifications!
Regards,
J=F6rg

=2D------------------------------------------------------------------------=
=2D------------
J=F6rg Pf=E4hler
Lehrstuhl f=FCr Softwaretechnik
Institut f=FCr Software and Systems Engineering
Universit=E4t Augsburg

Universit=E4tsstr. 6a, Raum 3014
tel:      (+49) 821/598-2229
e-mail:   joerg.pfaehler@informatik.uni-
augsburg.de<mailto:joerg.pfaehler@informatik.uni-augsburg.de>
=2D------------------------------------------------------------------------=
=2D------------
