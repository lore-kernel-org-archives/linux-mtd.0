Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2hO2-0006rE-71
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 13:17:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 Calvin Johnson <linux.cj@gmail.com>
Subject: RE: UBIFS seeing corrupt blank pages when image flashed via u-boot
Date: Mon, 13 Jan 2014 13:16:20 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA61199@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
 <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
 <1389617894.2259.270.camel@sauron.fi.intel.com>
In-Reply-To: <1389617894.2259.270.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "Stefan
 Roese <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Calvin,

>From: Artem Bityutskiy [mailto:artem.bityutskiy@linux.intel.com]
>>On Mon, 2014-01-13 at 17:49 +0530, Calvin Johnson wrote:
>> If the 4th to last-page are left blank and not covered with ECC, what
>> will happen in case of bit flips on the blank pages? There was an
>> issue reported some time back.
>> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039256.html
>>
>> Does UBI/UBIFS take care of this now?
>
>No. UBIFS still assumes that blank pages are ECC-protected by the
>driver. No one stepped in and took care of changing this yet.
>
Yes, it's true that in newer technologies (specially < 28nm flash), we are =
seeing
lot of erased-pages having bit-flips. And due to which UBIFS is cribbing.
But as there is no ECC stored in an erased-page, bit-flips in erased-page
cannot be corrected, unless you compare each byte of read_data.
However, there are other way of handling bit-flips in erased-page.
Following are few ways in which OMAP NAND driver handles bit-flips
in erased-page:

*Case-1*: If bit-flips are found in data-region of an erased-page.
(1) An erased-page implicitly means that its data-region should *only* cont=
ain 0xff,
   so its safe to fill read_buf() with 0xff.
  But the controller driver should report the correctable/un-correctable bi=
t-flips
  to upper-layer, so that upper-layers like UBI take corrective action by r=
e-erase
  this block before using it.
(Refer) http://lists.infradead.org/pipermail/linux-mtd/2014-January/051368.=
html


*Case-2*: If bit-flips are found in oob-region of an erased-page.
This is bit trivial, because if there are bit-flips in ecc-layout (OOB regi=
on) of
erased-page, it would be difficult to differentiate between an
erased-page v/s programmed-page.
Though you can keep a 'marker' in ecc-layout reserved for detecting
Programmed-pages, but that marker byte itself can be subjected to
bit-flips (assuming on MLC and newer technology NAND bit-flips are common).
So, OMAP NAND driver takes probabilistic approach.
(Refer) http://lists.infradead.org/pipermail/linux-mtd/2014-January/051367.=
html
-----------------------
This patch 'assumes' any page to be 'erased':
		(a) if        all(read_ecc)  =3D=3D 0xff
		(b) else if   all(read_data) =3D=3D 0xff
-----------------------


Currently both UBI and UBIFS layer checks for erased-page to be all(0xff),
But I think its over-kill to put this burden on UBI or UBIFS layer, because
low-level controller drivers can handle this easily.
So, if Artem and Brian agree to above approaches, then I can a submit patch
for removal of:
 - "ubi_self_check_all_ff()" from UBI layer.
 - checking of 'buf =3D=3D 0xff' from ubifs_scan_leb() in UBIFS layer.


with regards, pekon
