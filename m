Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4rCr-0007FZ-8e
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 10:33:38 +0000
Message-ID: <503758E0.7000408@freescale.com>
Date: Fri, 24 Aug 2012 18:35:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>	
 <1343514565-8983-2-git-send-email-festevam@gmail.com>	
 <1345734503.2848.247.camel@sauron.fi.intel.com>	
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
 <1345790488.2848.252.camel@sauron.fi.intel.com>
In-Reply-To: <1345790488.2848.252.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 marex.vasut@denx.de, kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8824=E6=97=A5 14:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> The default function seem to do the same as your function does. You
> select where you keep your OOB using chip options, and the default
> function does the right thing, no?
The key issue is that the mx23 should copies the bad block mark into the=20
"first byte of the nand page",
while the other chips does do this.

I don't think the default function do the same thing. You see:
   nand_default_block_markbad() --> nand_do_write_oob() -->=20
chip->ecc.write_oob() -->gpmi_ecc_write_oob()

The gpmi_ecc_write_oob() does nothing,but return -EPERM.

Huang Shijie
