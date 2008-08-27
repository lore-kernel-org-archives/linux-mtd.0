Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tim Anderson <tanderson@mvista.com>
In-Reply-To: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
References: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 27 Aug 2008 09:38:29 +0300
Message-Id: <1219819109.18027.154.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>,
	'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-08-26 at 23:20 -0700, Tim Anderson wrote:
> Artem,
>=20
> I see your point. Ioctls are going away after all.
>=20
> So we should have something like:
> /sys/class/mtd/mtd0/
>=20
> Or just under device or platform?=20

I am not very good in LDM, but it does not look like MTD stuff should go
to /sys/class/. I'd say it should be in /sys/devices/.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
