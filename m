Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df6Dd-00066B-Ak
 for linux-mtd@lists.infradead.org; Tue, 08 Aug 2017 15:15:00 +0000
MIME-Version: 1.0
Message-ID: <trinity-0c4f2d97-c691-4876-8810-8dd1eb933043-1502205267920@3capp-gmx-bs12>
From: "Andreas Eipeldauer" <andi.eipeldauer@gmx.at>
To: linux-mtd@lists.infradead.org
Subject: error -5 occurred during torturing
Content-Type: text/plain; charset=UTF-8
Date: Tue, 8 Aug 2017 17:14:27 +0200
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,
=C2=A0
I try to verify the proper functionality of a nand chip Cypress S34ML01G1 =
which should substitute the obsolete
Samsung K9F1G08U0E-SIB0000=2E Therefore I also use the mtd test tools=2E W=
ithin the mtdtests especially when running the mtd_torturetest an error -5 =
occurred during torturing=2E

insmod mtd_torturetest=2Eko dev=3D1 check=3D1 cycles_count=3D100 gran=3D10=
 ebcnt=3D761 eb=3D0

mtd_torturetest: Warning: this program is trying to wear out your flash, s=
top it if this is not wanted=2E
mtd_torturetest: MTD device: 1
mtd_torturetest: torture 761 eraseblocks (0-760) of mtd1
mtd_torturetest: write verify enabled
mtd_torturetest: error -5 while writing EB 731, written 102400 bytes
mtd_torturetest: finished after 0 erase cycles
mtd_torturetest: error -5 occurred during torturing
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: error inserting 'mtd_torturetest=2Eko': -1 Input/output error

The mtd1 partition is not mounted and Linux is running with a initram fs=
=2E So there should not be any other access to this partition=2E

I ran these tests also with the old Samsung chip and the -5 errors also ap=
pear but not in that high rate=2E

Any clue what causes this error? =20

Best regards, Andy
