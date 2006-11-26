Subject: Re: [RFC: 2.6 patch] remove the broken MTD_PCMCIA driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20061125191521.GD3702@stusta.de>
References: <20061125191521.GD3702@stusta.de>
Content-Type: text/plain; charset=utf-8
Date: Sun, 26 Nov 2006 11:40:13 +0200
Message-Id: <1164534013.576.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Andrew Morton <akpm@osdl.org>, Simon Evans <spse@secret.org.uk>,
	linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-25 at 20:15 +0100, Adrian Bunk wrote:
> The MTD_PCMCIA driver has:
> - already been marked as BROKEN in 2.6.0 three years ago and
> - is still marked as BROKEN.
>=20
> Drivers that had been marked as BROKEN for such a long time seem to be
> unlikely to be revived in the forseeable future.
>=20
> But if anyone wants to ever revive this driver, the code is still
> present in the older kernel releases.
>=20
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

I've committed both patches to my git trees so David won't miss them.

http://git.infradead.org/?p=3Dusers/dedekind/dedekind-mtd-2.6.git;a=3Dsumma=
ry


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
