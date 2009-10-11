Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mx2Lw-0001Wh-Qj
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 17:37:09 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Date: Sun, 11 Oct 2009 10:36:45 -0700
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
Message-ID: <B125D8217ABC4B43826503DE00A2D44910D7FCB264@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
	<1255250357.16942.0.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7FCB251@SJEXCHCCR01.corp.ad.broadcom.com>
	<1255273462.21218.13.camel@localhost>
In-Reply-To: <1255273462.21218.13.camel@localhost>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> UBIFS does not assume *anything* about ECC. UBI/UBIFS does not assume
> anything about flash type even. E.g., it works on NOR.
>=20
> All UBIFS assumes is that it may write more data to the end of
> eraseblocks, nothing else. IMHO, this is a reasonable assumption.

Okay, I understand it is a lower level driver issue now and will look at
putting the checks there. Thanks.

Darwin=
