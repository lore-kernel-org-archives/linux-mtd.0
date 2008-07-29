Subject: Re: Problems in nand_read_subpage()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0807290851200.12605@casper.infradead.org>
References: <1217313233.3124.4.camel@sauron>
	<alpine.LFD.1.10.0807290851200.12605@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2008 10:59:30 +0300
Message-Id: <1217318370.3124.13.camel@sauron>
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


On Tue, 2008-07-29 at 08:52 +0100, Alexey Korolev wrote:
> Hi Artem,
>=20
> Thank you very much for pointing to the issue. Sure. I'll fix it today.=20

BTW, if you do not have small page hardware, you may test it on nandsim.

http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_nandsim

I also found out that nandsim does not support this RNDOUT stuff. I am
trying to figure out what exactly it is and will try to implement it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
