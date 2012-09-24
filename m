Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TG6cI-0002Ax-Fi
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 11:14:22 +0000
Received: by wgbdt14 with SMTP id dt14so3293359wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 04:14:19 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 24 Sep 2012 13:14:19 +0200
Message-ID: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
Subject: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu: patch
 does not apply)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
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

I wanted to verify my patch before sending it.

TRY[0]:
> ./verify ../wireless-testing/ mips-bcm47xx_defconfig < ../nand4/0001-mtd-=
prepare-place-for-BCMA-NAND-flash-driver-s.patch
error: patch failed: arch/m68k/Kconfig.cpu:28
error: arch/m68k/Kconfig.cpu: patch does not apply

Weird. My patch doesn't touch m68k and applies cleanly to the
../wireless-testing tree:

> cd ../wireless-testing/
> git am ../nand4/0001-mtd-prepare-place-for-BCMA-NAND-flash-driver-s.patch
Applying: mtd: prepare place for BCMA NAND flash driver(s)

Help? :|

--=20
Rafa=C5=82
