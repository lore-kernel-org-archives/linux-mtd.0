Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240809252230s6373acf8v4dd2b942eba360a7@mail.gmail.com>
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<9c9fda240809252230s6373acf8v4dd2b942eba360a7@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Sep 2008 09:26:09 +0300
Message-Id: <1222410369.5012.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: apgmoorthy <moorthy.apg@samsung.com>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-09-26 at 14:30 +0900, Kyungmin Park wrote:
> Thank you for your kind comments.
>=20
> Yes that's I concerned it breaks the other NAND ABI. Actually In
> OneNAND it doesn't use eccpos since OneNAND controller handle all ECC
> functions. we don't need to concern it.

Right.

> As pages are bigger, it requires more eccpos and other fields are
> similar. we need more flexible filed definitions.

Right.

> Well how do you think that at this time it only describes the 64 bytes
> only for temporarily and next time it adds remaining parts if it is
> really needed.

Well, it is not very nice, but I guess it should be OK for this case,
because people are not supposed to look at OOB of MLC OneNAND anyway. So
I would go this way, although I'm not sure dwmw2 would agree on this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
