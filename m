Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgAvk-00009D-Ti
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 13:56:39 +0000
Date: Tue, 21 Feb 2017 13:55:41 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Haavard Skinnemoen <hskinnemoen@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170221135541.GV21222@n2100.armlinux.org.uk>
References: <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
 <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
 <20170220213803.7ba5591e@bbrezillon>
 <20170220215009.0ecbf5a1@bbrezillon>
 <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
 <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
 <20170221090610.6d531b94@bbrezillon>
 <CAHp75VfZfj-8ih3vg63w_dAq8xXE2Whu1bANXRcXS1_EGNq43A@mail.gmail.com>
 <20170221112641.6276c001@bbrezillon>
 <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 21, 2017 at 01:02:21PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 21, 2017 at 12:26 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Tue, 21 Feb 2017 12:03:45 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> >> 1. For example,
> >>
> >> #define ATMEL_NFC_CMD(pos, cmd)                        ((cmd) <<
> >> (((pos) * 8) + 2))
> >
> > Well, I like to explicitly put parenthesis even when operator
> > precedence guarantees the order of the calculation ('*' is preceding
> > '+').
> 
> That's my point. I'm not a LISP programmer.
> Personally I think it makes readability worse.

+1.  I find unnecessary parenthesis is an effective obfuscation technique.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
