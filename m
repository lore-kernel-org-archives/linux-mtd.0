Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbQdA-0004PV-Ex
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 07:55:57 +0000
Message-ID: <5270BC27.40000@freescale.com>
Date: Wed, 30 Oct 2013 15:58:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383117765-31732-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1383117765-31732-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8830=E6=97=A5 15:22, Sourav Poddar =E5=86=
=99=E9=81=93:
> 	struct device_node __maybe_unused *np =3D spi->dev.of_node;
you'd better rebase this patch on the latest l2-mtd.

this line has been removed in the latest code.


thanks
Huang Shijie
