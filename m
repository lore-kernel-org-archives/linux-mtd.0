Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UyzzK-0003mw-5t
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2013 07:47:58 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: avinash philip <avinashphilipk@gmail.com>
Subject: RE: [PATCH v1 1/5] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Date: Tue, 16 Jul 2013 07:47:04 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E84B4@DBDE04.ent.ti.com>
References: <1373900152-26885-1-git-send-email-pekon@ti.com>
 <1373900152-26885-2-git-send-email-pekon@ti.com>
 <CAGBQFKSqcDmJcdgLWdtxZmgjmjMnLgJXUARSu0NgNVpUGSRa7g@mail.gmail.com>
In-Reply-To: <CAGBQFKSqcDmJcdgLWdtxZmgjmjMnLgJXUARSu0NgNVpUGSRa7g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Hi Pekon,
>=20
> On Mon, Jul 15, 2013 at 8:25 PM, Pekon Gupta <pekon@ti.com> wrote:
> > chip->ecc.correct() is used for detecting and correcting bit-flips duri=
ng read
> > operations. In omap2-nand driver this is done usingt following function=
s:
> >
> > - omap_correct_data(): for H/W based HAM1_ECC schemes
> >         (Un-Touched in current patch)
> >
> > - omap_elm_correct_data(): for H/W based BCHx_ECC scheme
> >         Current implementation of this function is not scalable for new=
er ECC
> >         schemes because:
> >         - It depends on a specific byte-position in OOB area (reserved =
as 0x00)
> >           to differentiates between programmed-pages and erased-pages.
> >           This reserved byte-position cannot be accomodated in all ECC
> schemes.
> >         - Current code is not scalable for future ECC schemes due to tw=
eaks for
> >           BCH4_ECC and BCH8_ECC at multiple places.
> >         - It checks for bit-flips in Erased-pages using check_erased_pa=
ge().
> >           This is over-work, as sanity of Erased-page can be verified b=
y just
> >           comparing them to a pre-defined ECC-syndrome for all_0xFF dat=
a.
>=20
> This is correct if the erased page read back didn't have any bit flips.
> If erased page result in bit flips, then this method will end up in
> un-correctable
> error. Can you please confirm you taken care erased page bit flips in thi=
s
> modification?
>=20
> I think below discussion would help.
>=20
> https://lkml.org/lkml/2012/11/22/590
>=20

Yes, that is correct.. Please refer to latest discussion on this topic.
http://permalink.gmane.org/gmane.linux.drivers.mtd/46821

So, if a erased-page has any bit-flips, nand_read() would return it as
 EBADMSG (uncorrectable errors). I understand this is an over-cautious
 approach, but there are reasons for this:
(1) I din't wanted to burden the Read data-path with extra checks for=20
finding and correcting bit-flips on erased-pages.

(2) Most File-Systems, if find un-correctable errors in erased-page=20
would first torture_peb() by iteratively erasing and  checking for all(0xFF=
).
 So if the bit-flips were temporary they would go-away. And block would
 not be marked bad.

(3) Using erased-page with 'correctable bit-flips' for storing data makes
data on flash more vulnerable to early failures. Suppose using BCH8=20
ECC scheme which has capability of correcting 8-bits per ecc.size.=20
if my File-System uses an erased-page which already had 3-bit-flips=20
before even it was written. So this leaves me with only 8-3 =3D 5 bit-flips
possibility before my data is rendered un-correctable and corrupt.
So, why not to use a erased-page which is not having any bit-flips at all ?
(And frequency of having bit-flips in erased-page would increase as
device ages)

I think from a user's point-of-view it would be better to get..
(a) more tolerance of bit-flips  + better read performance
v/s
(b) saving some blocks from getting re-erased.

Comments ?

with regards, pekon

> Thanks
> Avinash
