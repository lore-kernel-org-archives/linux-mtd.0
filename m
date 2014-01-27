Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W7qHY-0005Ek-Dv
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2014 17:47:37 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v1 0/2] mtd: nand: omap: booting from NAND using u-boot
Date: Mon, 27 Jan 2014 17:46:39 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6B2CC@DBDE04.ent.ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
 <20140125085537.GA3162@norris-Latitude-E6410>
In-Reply-To: <20140125085537.GA3162@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, "Woodruff,
 Richard" <r-woodruff2@ti.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "r.meier@siemens.com" <r.meier@siemens.com>, "Rini, Tom" <trini@ti.com>,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>,
 Javier Martinez Canillas <javier@dowhile0.org>, Stefan Roese <sr@denx.de>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris
>
>1. This patch series talks extensively about U-Boot. U-Boot is not my
>   interest, nor should it be the focus of kernel (driver) development.
>   Any work done here should be framed in the kernel driver context. [1]
>
Apologies for cross-posting, I understand that you are already flooded by e=
mails
from linux-mtd list. But my intention was to keep all users of OMAP3 inform=
ed,
as this regression was Reported-by: Enric Balletbo Serra <eballetbo@iseebcn=
.com>
while testing mainline u-boot & kernel on OMAP3 platform.

Thanks for you feedbacks.
I'll fix the commit messages with proper description of the regression,
And incorporate other comments when I re-send it. Also, I'll cut-down the
CC list, as u-boot mailman blocks emails with long CC list.

with regards, pekon
