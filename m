Date: Fri, 29 Jun 2012 11:03:18 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/3] ARM: imx6q: add clocks for gpmi-nand
Message-ID: <20120629030315.GA29197@S2101-09.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <20120629022903.GB5844@shlinux2.ap.freescale.net>
 <4FED1996.9080908@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4FED1996.9080908@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: Dong Aisheng <aisheng.dong@freescale.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 10:57:26AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 10:29, Dong Aisheng =E5=86=
=99=E9=81=93:
> >We had several gpmi clocks here, so i guess it would be good if we hav=
e
> >the con_id set here too to distinguish what's this clock for.
> >
> thanks.
> But this will cause the mx28 can not find the clock.
>=20
Hmm, it should not, as long as the con_id in imx28 gpmi-nand lookup
is NULL, which is a wildcard for matching.

--=20
Regards,
Shawn
