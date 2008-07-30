Subject: Re: [PATCH] Bugfix subpage read for small page NAND.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0807291325580.23930@casper.infradead.org>
References: <alpine.LFD.1.10.0807291325580.23930@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 30 Jul 2008 12:00:06 +0300
Message-Id: <1217408406.9048.14.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-07-29 at 13:54 +0100, Alexey Korolev wrote:
> Current implementation of subpage read feature for NAND has issues with
> small page devices. Small page NAND do not support RNDOUT command.
> So subpage feature is not applicable for them.=20
>=20
> This patch disables support of subpage for small page NAND.=20
> The code is verified on nandsim(SP NAND simulation) and on LP NAND
> devices.=20

I've put this and my nandsim fix to

git://git.infradead.org/~dedekind/mtd-fixes.git master

With those 2 patches nandsim is happy for both LP and SP NANDs.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
