Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5cX8-0001aX-1z
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 13:05:42 +0000
Received: by vcbfl15 with SMTP id fl15so2253638vcb.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 06:05:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9S-S70hbOdKQHgHbH4JfxwgvHXGF=Cv5O3Eh6-nG-udg@mail.gmail.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
 <1345790488.2848.252.camel@sauron.fi.intel.com>
 <503758E0.7000408@freescale.com>
 <CAN8TOE9S-S70hbOdKQHgHbH4JfxwgvHXGF=Cv5O3Eh6-nG-udg@mail.gmail.com>
Date: Sun, 26 Aug 2012 09:05:40 -0400
Message-ID: <CAMiH66FT2j43_2dvrLskUmNGGnPr5Utfx17sQ1Jd7LMDjeZefQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 6:57 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

>>> The default function seem to do the same as your function does. You
>>> select where you keep your OOB using chip options, and the default
>>> function does the right thing, no?
>>
>> I don't think the default function do the same thing. You see:
>>   nand_default_block_markbad() --> nand_do_write_oob() -->
>> chip->ecc.write_oob() -->gpmi_ecc_write_oob()
>>
>> The gpmi_ecc_write_oob() does nothing,but return -EPERM.
>
> Yeah, that's kind of strange. So you never have room in OOB even fo

yes. The different ROMs of mx23/mx28/mx50/mx6q make it strange.

In mx28/mx50/mx6q, the first byte of OOB is used to store the bad
block marker. These chips's ROMs support the so-called `swap` feature which can
swaps the bad block marker to a safe place.

But the mx23's ROM does not support the swap feature, so it really has
no room in OOB to
store the bad block marker. When the mx23 first scan a nand chip, the
factory-marked
 bad block marker is copied to the first byte of the NAND page. When
the chip boots from
the nand, the ROM of mx23 will  read the first byte of the NAND page
to check whether this block is a bad block. Why copy to the first
byte? the mx23 use the first 10 byte of the nand page as a so-called
"metadata".

> bad block markers? How do you identify factory-marked bad blocks?
> Wouldn't they be indistinguishable from your ECC area? Or do you have
> free OOB space in which you could actually implement write_oob()
> properly?

The original old gpmi-nand driver does implement the write_oob() which
only allow the
block_markbad() run through. In another word, if the write_oob() is
called by the block_markbad, it will
grant the operation. All the other operations are denied. In order to
achieve this target, the old
code used an ugly hack code, it hooked the mtd->block_markbad(), such as:
         .....................................................
               mtd->hooked_block_markbad = mtd->block_markbad();
               mtd->block_markbad =              gpmi_block_markbad();

               nand->ecc.write_oob = mil_ecc_write_oob;
         .....................................................

             gpmi_block_markbad()
          {
               this->marking_a_block_bad = true;
              mtd->hooked_block_markbad();
              this->marking_a_block_bad = false;
           }

        mil_ecc_write_oob()
        {
            if (!this->marking_a_block_bad)
                    return;
            ..............................................
        }

     As i described above, the mil_ecc_write_oob() will write 0 to the
first byte of the OOB in mx28/mx50/mx6q;
the mil_ecc_write_oob() will write 0 to the first byte of the nand page in mx23.

For you see, the implementation of the write_oob() is too ugly. I
fininally found if i implement the nand->block_markbad(), the code
will very tidy and clean. The current code realizes the same feature
as
the old code, but the current code is very simple.

what's more is that the nand->block_markbad is `REPLACEABLE`. so i do
not break any rule. :)


I hope my poor english describes this issue clearly.

thanks
Huang Shijie
