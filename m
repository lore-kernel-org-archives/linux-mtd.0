Received: from mail171.messagelabs.com ([216.82.253.243])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T9AyY-0006zU-3A
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 08:28:43 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Akinobu Mita
 <akinobu.mita@gmail.com>
Date: Wed, 5 Sep 2012 18:28:36 +1000
Subject: RE: [PATCH] Test for multi-bit error correction
Message-ID: <6871BC8982B258468985EE735D2C57524E269AFB88@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 ,<1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>,
 <1346685918.3061.66.camel@sauron.fi.intel.com>
In-Reply-To: <1346685918.3061.66.camel@sauron.fi.intel.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 Sep 2012 01:25:18 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> So basically you test that ECC works, and you are trying to be
> independent on the NAND HW and the ECC type. Right?
>=20
> How about mtd_nandecc test? How is it different? Do we need 2 tests?
> Why?
>=20

Akinobu already said it - mtd_nandecc tests the implementation for
software ECC, while mtd_nandbiterrs pokes holes into real NAND
FLASH pages until the ECC (software or hardware) falls over.

It's a test for the NAND driver, rather than the ECC implementation.
The pattern I'm using is not sufficient to guarantee that all possible
error constellations are caught. There is not enough endurance
in the FLASH or indeed time in the universe to do that. :-)

But it will tell you how many '1'->'0' bit errors it could introduce into
every subpage full of random data, before the whole page comes
back as uncorrectable.

In a nutshell, I got fed up by having to fix yet another vendor-supplied
NAND driver which claimed to support BCH8 hardware ECC but in
reality considered a single bit error as 'uncorrectable'.

So I submitted my test code in the hope that NAND driver authors
can use it to validate the ECC handling.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
