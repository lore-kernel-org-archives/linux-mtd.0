Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KHDPS-0001Hv-EB
	for linux-mtd@lists.infradead.org; Fri, 11 Jul 2008 07:51:19 +0000
Subject: Re: [ubi][wl] the W/R performance of my wear-leveling unit
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215762163.2784.60.camel@localhost.localdomain>
References: <1215762163.2784.60.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 Jul 2008 10:50:44 +0300
Message-Id: <1215762644.11282.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-07-11 at 15:42 +0800, xiaochuan-xu wrote:
> Hi,
>=20
> I've compared the current WL unit algorithm with=20
> my new WL unit one on the W/R time.
>=20
>=20
> modprobe nandsim + ubi + ubifs.
> And then copy a file (9338201 Bytes) to=20
>=20
> ##time for i in `seq 1 20`; do sudo dd if=3D~/tmp/file of=3D/mnt/ubifs/fi=
le
> count=3D1024&> /dev/null; sync; done
>=20
> in the first time. the time of currenty algorithm and mine is as
> following:
>=20
> current UBI gives:
>=20
> real	0m3.145s
> user	0m0.124s
> sys	0m0.700s
>=20
> mine:
> real	0m2.539s
> user	0m0.140s
> sys	0m0.772s

Looks promising. I'll look at this again but a bit later.

Could you please think how your patch may be split on several separate
independent patches?=20

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
