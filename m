Message-ID: <50C693EC.7050702@freescale.com>
Date: Tue, 11 Dec 2012 10:01:16 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
 <50BFFFE8.8040002@freescale.com> <20121206095213.GA2589@pengutronix.de>
In-Reply-To: <20121206095213.GA2589@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA12=D4=C206=C8=D5 17:52, Wolfram Sang =D0=B4=B5=C0:
> The setup needs to be done properly to ensure a consistent state at the
> beginning, especially when somebody used the NAND before (ROM code,
> bootloader). Fixing the bootloader alone is not enough.
I tried to make some time to test it.
But i am too busy this week.
Anyway, let this patch get merged.

Acked-by: Huang Shijie <b32955@freescale.com>


thanks
Huang Shijie
