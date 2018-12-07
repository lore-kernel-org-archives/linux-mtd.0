Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVFXo-0003cl-6s
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 12:47:49 +0000
Received: by mail-lj1-x244.google.com with SMTP id 83-v6so3430219ljf.10
 for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2018 04:47:37 -0800 (PST)
MIME-Version: 1.0
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
 <dafcda21-fceb-1577-7f1c-41f1009b99a7@st.com>
In-Reply-To: <dafcda21-fceb-1577-7f1c-41f1009b99a7@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Dec 2018 13:47:24 +0100
Message-ID: <CACRpkdbim9o+3n-hvtVT-ybfHfYF38xQ_V3utf9adbTNMYOhRg@mail.gmail.com>
Subject: Re: [Linux-stm32] [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2
 NAND flash controller driver
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: christophe.kerello@st.com, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 7, 2018 at 11:22 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
> On 12/7/18 10:06 AM, Linus Walleij wrote:
> > Hi Christophe,
> >
> > On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
> > <christophe.kerello@st.com> wrote:
> >
> >> +/* FMC2 Controller Registers */
> >> +#define FMC2_BCR1                      0x0
> >> +#define FMC2_PCR                       0x80
> > (...)
> >> +/* Register: FMC2_BCR1 */
> >> +#define FMC2_BCR1_FMC2EN               BIT(31)
> > Well this looks like an especially clever register map and a specific choice
> > of bit 31 in the fist register to activate FMC2. Registers 0x04 thru
> > 0x7c are completely unused save for one bit.
> >
> > It's almost like this is the good old FSMC integrated in parallel with FMC2,
> > so that if you don't set bit 31, this becomes something that can be used
> > with drivers/mtd/nand/raw/fsmc_nand.c, and FMC2 mode is activated
> > by setting this bit, activating all the new registers.
> >
> > It wouldn't surprise me given how HW designers like to work.
> >
> > Is this the case?
>
> No, it is the same story than for stmfx driver, it looks to be the same
> from registers
>
> point of view but internal hardware block design is completely different.

I'm not saying FMC2 is the same, just that it seems they have
duct-taped both IP-blocks (FSMC and FMC2) together at some point.

It just looks so extremely odd to leave all registers below 0x80 unused
except for 0x0 where a single bit is used.

Maybe there is no FSMC there, but it sure looks like the hardware
engineers planned for old+new FSM[C] block coexistence in the
same address space.

Yours,
Linus Walleij
