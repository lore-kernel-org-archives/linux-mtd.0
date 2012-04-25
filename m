Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN25w-0005cd-7B
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 13:17:21 +0000
Received: by lagy4 with SMTP id y4so66809lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 06:17:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120424090242.5023df12@pixies.home.jungo.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
 <4F904238.4070600@newsguy.com>
 <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
 <20120422105844.7f131f90@pixies.home.jungo.com>
 <CABYn4sy6fOEMwF_Gj24HdnaR55Sf1cFftT=JA-2PPSU1+zFjYA@mail.gmail.com>
 <20120424090242.5023df12@pixies.home.jungo.com>
Date: Wed, 25 Apr 2012 15:17:17 +0200
Message-ID: <CABYn4sx1iXcO2u=Dq4jYXarG9ZZgtAJ4j7Uk9ShN3VJH8r5+dQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Bastian Hecht <hechtb@googlemail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/4/24 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Hi Bastian,
>
> On Mon, 23 Apr 2012 11:14:39 +0200 Bastian Hecht <hechtb@googlemail.com> wrote:
>> Following this thread, I wondered how mtd_write_oob is meant to work.
>> The sh_flctl code simply writes the OOB data 1 to 1 into the oob area
>> of the nand chip when using hardware ECC. So when reading this, it
>> should result in a corrupted page. Is the driver meant to OR the ECC
>> code to the buffer? Then the driver would need a page read and write
>> it back applying the oob data, no?

Hello Schmulik,

> The beahvior is dependent on mtd_oob_ops->mode.
>
> If mode is MTD_OPS_AUTO_OOB, 'nand_fill_oob' places the user provided
> 'oobbuf' into the "free" locations within the OOB layout (as defined by
> 'chip->ecc.layout->oobfree').
> Implementor of 'chip->ecc.write_page' is expected to take care of ECC
> caclulation and fill the ECC bytes (driver's or HW responsibility).
>
> If the mode is MTD_OPS_RAW, user provided 'oobbuf' should be transferred
> as-is, without error correction ('chip->ecc.write_page_raw' will be
> invoked).

Ahaa. Thanks for elaborating this, now I understand how things are
supposed to work. You helped me to catch a flaw in the code, thanks! I
have to introduce a flag or similar to turn off the on-the-fly ECC
generation when the _raw functions are used.

Best regards,

 Bastian Hecht

> If the mode is MTD_OPS_PLACE_OOB, then 'nand_fill_oob' copies user's
> 'oobbuf' onto 'oob_poi'.
> As with MTD_OPS_AUTO_OOB, implementor of 'chip->ecc.write_page' is
> expected to take care of ECC calculation; the ECC locations are assumed
> to be overwritten (ignoring user's bytes at the ECC locations).
>
> This is according to the nand_base.c default methods.
> For example, you can follow nand_do_write_ops, nand_write_page,
> nand_write_page_swecc.
>
> Regards,
> Shmulik
