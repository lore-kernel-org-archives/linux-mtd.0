Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbPDV-0000kR-4H
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 06:25:21 +0000
Message-ID: <5270A6EF.2020208@freescale.com>
Date: Wed, 30 Oct 2013 14:27:59 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310291627.34003.marex@denx.de> <526FE7B9.3000602@ti.com>
 <201310291808.58939.marex@denx.de> <526FEC7D.6060403@ti.com>
 <526FFFA0.8040800@ti.com>
In-Reply-To: <526FFFA0.8040800@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8830=E6=97=A5 02:34, Sourav Poddar =E5=86=
=99=E9=81=93:
> I think it will be better to take the above recommended cleanup as a=20
> seperate patch
> on top of $subject patch? Since, read_sr is not only used by the=20
> pieces added in this patch.
> There are other already available apis in the driver which make use of=20
> this function.=20
yes, I also think use a seperate patch to fix the read_sr() (If you want=20
to change it.)

Btw, please add the version info, such "PATCH V3", in the title of your=20
new patch.

thanks
Huang Shijie
