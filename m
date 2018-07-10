Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcraM-0001GH-5o
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 12:17:40 +0000
Date: Tue, 10 Jul 2018 14:17:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180710141715.375ac6df@bbrezillon>
In-Reply-To: <60a09008ea18424eb4005839554da858@SIWEX5A.sing.micron.com>
References: <60a09008ea18424eb4005839554da858@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
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

On Tue, 10 Jul 2018 11:40:08 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi,  Boris
> >>
> >> Okay, I think we already had this discussion, but I'm asking it again.
> >> What are the possible values for that field and what do they mean? =20
> >
> >Still, it's not clear to me what "Internal ECC level" means. It seems th=
at NAND
> >chips having on-die ECC have this field set to 10b (0x2), 00b seems to be
> >reserved for "no on-die ECC", but what are 01b and 11b reserved for?
> > =20
>=20
> That position identifies the part as having Internal ECC capability. =20
> The 01b and 11b are reserved for future definition.  Bit 7 of READ ID Byt=
e 4 identifies the
> device as an ECC OFF 0x0 or ECC ON 0x1.
>=20
> >> Also, is it even used to encode the fact that the NAND has on-die ECC
> >> on all your NANDs? We already had the problem of incompatible ID
> >> schemes, so I wouldn't be surprised if that was the case here, hence
> >> my initial suggestion to base the detection on the model name. =20
> >
> >I'd really need to have an answer on that one to take a decision. Also, I
> >couldn't find a datasheet for an IT (without E) version of the
> >MT29F1G08ABAFAWP part. Does it exist, or can we assume
> >MT29F1G08ABAFAWP chips always come with forcibly enabled on-die ECC? =20
>=20
> MT29F1G08ABAFAWP comes in ECC ON only.  We didn=E2=80=99t develop a
> MT29F1G08ABAFAWP ECC OFF version.  Bit 7 of READ ID Byte 4 identifies the
> device as an ECC OFF 0x0 or ECC ON 0x1.
>=20

Okay. Can you have a look at the patches I sent an let me know if I do
the right thing?
