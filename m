Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOi3r-0004VZ-9J
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 05:54:55 +0000
Message-ID: <52427B07.3030500@freescale.com>
Date: Wed, 25 Sep 2013 13:56:23 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
 <52427938.4070602@freescale.com> <524279F2.5020801@ti.com>
In-Reply-To: <524279F2.5020801@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8825=E6=97=A5 13:51, Sourav Poddar =E5=86=
=99=E9=81=93:
> be set to SPI_RX_QUAD in spi.c. which can be used by mtd layer to=20
> device whether
> flash supports quad read or not.=20
yes. it's ok.

thanks
Huang Shijie
