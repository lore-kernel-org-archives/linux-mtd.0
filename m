Message-ID: <4FED7D4A.5050603@freescale.com>
Date: Fri, 29 Jun 2012 18:02:50 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>	<1340941925-14591-3-git-send-email-shijie8@gmail.com>	<20120629020650.GB28932@S2101-09.ap.freescale.net>	<20120629063329.GE5844@shlinux2.ap.freescale.net>	<20461.30070.771087.830745@ipc1.ka-ro>	<20120629093437.GK5844@shlinux2.ap.freescale.net>
 <20461.30991.63507.369439@ipc1.ka-ro>
In-Reply-To: <20461.30991.63507.369439@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Dong Aisheng <aisheng.dong@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Dong Aisheng-B29396 <B29396@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shawn Guo <shawn.guo@linaro.org>, Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 17:44, Lothar Wa=C3=9Fmann =
=E5=86=99=E9=81=93:
> Even if it had fewer clocks you would have to change the driver!
If we do not want to change the driver, we could add the extra clocks in=20
the device tree node.

The driver will parse out the extra clocks.

In this way, the driver will not be changed in any platform, no matter=20
mx28 or mx6q.


Huang Shijie
