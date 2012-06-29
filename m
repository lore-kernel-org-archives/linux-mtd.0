Date: Fri, 29 Jun 2012 19:22:48 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
Message-ID: <20120629112246.GC29197@S2101-09.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
 <20120629093437.GK5844@shlinux2.ap.freescale.net>
 <20461.30991.63507.369439@ipc1.ka-ro>
 <4FED7D4A.5050603@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4FED7D4A.5050603@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: Dong Aisheng <aisheng.dong@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Dong Aisheng-B29396 <B29396@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 06:02:50PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 17:44, Lothar Wa=C3=9Fman=
n =E5=86=99=E9=81=93:
> >Even if it had fewer clocks you would have to change the driver!
> If we do not want to change the driver, we could add the extra
> clocks in the device tree node.
>=20
We need to think about how this would cope with the properties defined
by common clock DT bindings.

--=20
Regards,
Shawn
