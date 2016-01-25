Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNgkd-0005in-Ni
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 13:00:12 +0000
Received: by mail-io0-x22f.google.com with SMTP id 77so150129863ioc.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 04:59:50 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 25 Jan 2016 13:59:49 +0100
Message-ID: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
Subject: brcmnand (iproc): bitflips and ECC errors due to ignored ECC config
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've a D-Link DIR-885L router with following NAND:
nand: device found, Manufacturer ID: 0x01, Chip ID: 0xf1
nand: AMD/Spansion NAND 128MiB 3,3V 8-bit
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

It uses ECC strength 1 with step size 512 so I created DT with:
nand-ecc-strength =3D <1>;
nand-ecc-step-size =3D <512>;

Unfortunately all I get from mtd_read are -EUCLEAN (6%) and -EBADMSG
(94%) errors. It's becase of the following code in brcmnand_setup_dev:
if (chip->ecc.strength =3D=3D 1) /* Hamming */
cfg->ecc_level =3D 15;

After removing this special handling of strength 1 I can use my NAND
as expected.

Is there a good reason for this hamming condition? Can we add some way
of using strength 1?

--=20
Rafa=C5=82
