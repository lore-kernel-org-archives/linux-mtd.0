Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T52on-0007vI-V3
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 22:57:35 +0000
Received: by lbbgf7 with SMTP id gf7so1375090lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 15:57:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <503758E0.7000408@freescale.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
 <1345790488.2848.252.camel@sauron.fi.intel.com>
 <503758E0.7000408@freescale.com>
Date: Fri, 24 Aug 2012 15:57:31 -0700
Message-ID: <CAN8TOE9S-S70hbOdKQHgHbH4JfxwgvHXGF=Cv5O3Eh6-nG-udg@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dedekind1@gmail.com,
 Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
 marex.vasut@denx.de, kernel@pengutronix.de, shawn.guo@linaro.org,
 Huang Shijie <shijie8@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From Artem: "Why this driver redefined ->block_markbad() at all, it is
not supposed
to do this. We should fix the driver instead."

Why is ->block_markbad() a function pointer, then, if the driver is
not allowed to redefine it? Admittedly, it often doesn't make sense to
override it; plus, if you override ->block_markbad(), you probably
want to also override ->block_bad(). But nand_base.c doesn't really
have good infrastructure for that.

So, by the current, somewhat messy and incomplete state of the
nand_base + nand_bbt code, it seems to be "supported" to override
->block_markbad() if you really need to. But some more work could be
done to improve this.

On Fri, Aug 24, 2012 at 3:35 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2012=C4=EA08=D4=C224=C8=D5 14:41, Artem Bityutskiy =D0=B4=B5=C0:
>
>> The default function seem to do the same as your function does. You
>> select where you keep your OOB using chip options, and the default
>> function does the right thing, no?
>
> I don't think the default function do the same thing. You see:
>   nand_default_block_markbad() --> nand_do_write_oob() -->
> chip->ecc.write_oob() -->gpmi_ecc_write_oob()
>
> The gpmi_ecc_write_oob() does nothing,but return -EPERM.

Yeah, that's kind of strange. So you never have room in OOB even for
bad block markers? How do you identify factory-marked bad blocks?
Wouldn't they be indistinguishable from your ECC area? Or do you have
free OOB space in which you could actually implement write_oob()
properly?

None of my comments are really a disagreement with your patch. Your
driver has a strange way of dealing with ECC + bad block markers, and
assuming you figured out your swap_block_mark code safely (I didn't
really study this) then I think it's OK ("supported") to provide your
own ->block_markbad() function.

Brian
