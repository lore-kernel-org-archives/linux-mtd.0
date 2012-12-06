Message-ID: <50BFFFE8.8040002@freescale.com>
Date: Thu, 6 Dec 2012 10:16:08 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
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

=D3=DA 2012=C4=EA12=D4=C206=C8=D5 04:46, Wolfram Sang =D0=B4=B5=C0:
> correctly after warm rebooting, so the kernel could not find the UBI or
which Soc do you meet this issue? the mx23 or mx28?

It's bad news to me. I ever thought the BCH-reset-issue is gone.
I ever tested many times in mx28(> 10000 times) with freescale's uboot.

I guest you are not use the freescale's uboot. The uboot also will reset
the BCH/GPMI.


thanks
Huang Shijie
