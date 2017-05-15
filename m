Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dALFZ-0005jR-8u
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 19:01:47 +0000
Date: Mon, 15 May 2017 21:01:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Scott Wood <oss@buserror.net>
Cc: Prabhakar Kushwaha  <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
Subject: Re: [PATCH] driver: mtd: update struct map_info's swap as per map
 requirement.
Message-ID: <20170515210123.0a9aaeb1@bbrezillon>
In-Reply-To: <1494869313.29095.5.camel@buserror.net>
References: <1493882437-4541-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <20170515104824.2ffb5186@bbrezillon>
 <1494869313.29095.5.camel@buserror.net>
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

On Mon, 15 May 2017 12:28:33 -0500
Scott Wood <oss@buserror.net> wrote:

> On Mon, 2017-05-15 at 10:48 +0200, Boris Brezillon wrote:
> >=20
> > You can even make this property a string property:
> >=20
> > 		if (!of_property_read_string(dp->parent,
> > 					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"cfi-endianness",
> > 					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&endianness)) {
> > 			if (!strcmp("big", endianness))
> > 				info->list[i].map.swap =3D CFI_BIG_ENDIAN;
> > 			else if (!strcmp("little", endianness))
> > 				info->list[i].map.swap =3D CFI_LITTLE_ENDIAN;
> > 			else if (!strcmp("host", endianness))
> > 				info->list[i].map.swap =3D CFI_HOST_ENDIAN;
> > 		} =20
>=20
> Boolean endianness properties are the standard elsewhere -- why should CF=
I be
> different?
>=20
> See Documentation/devicetree/bindings/common-properties.txt

Forget this suggestion, I didn't know xxx-endian were standard props. My
first comment still applies though.
