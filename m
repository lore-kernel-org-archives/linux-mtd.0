Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHhl-0003J8-0i
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 20:06:21 +0000
Received: by mail-lb0-f179.google.com with SMTP id l4so8158457lbv.24
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 12:05:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54626AF4.4090306@nod.at>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
 <54626AF4.4090306@nod.at>
Date: Tue, 11 Nov 2014 18:05:58 -0200
Message-ID: <CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 6:00 PM, Richard Weinberger <richard@nod.at> wrote:

> By fixing your devicetree/boardfile I meant fixing *your* devicetree/boardfile
> for *your* board and not for all others. :-)

It's not my board. It is a development board.

The board is arch/arm/boot/dts/imx28-evk.dts. This is a development
board that comes with a NAND socket.

It comes with no NAND flash populated. In this case on every boot we get the:

gpmi-nand 8000c000.gpmi-nand: driver registration failed: -19

,which isn't very helpful an this is what this patch tries to avoid.

I don't think we should change the dts.
