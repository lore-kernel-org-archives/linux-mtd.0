Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dItzR-0006cS-HI
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 09:44:32 +0000
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
 [209.85.213.175]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v589hnTb023786
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 18:43:49 +0900
Received: by mail-yb0-f175.google.com with SMTP id f192so8345295yba.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 02:43:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170608090503.11969545@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
 <20170607153318.7e341dff@bbrezillon>
 <CAK7LNAR55jsT4Ch-vwhvEMvSmEGJPBQQc6Tw2gkiTianer2zjQ@mail.gmail.com>
 <20170608090503.11969545@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 18:43:47 +0900
Message-ID: <CAK7LNAT3JkSccFO=fJm737wLGCOLZBu+0z8zxeB=VmhoggF-Cg@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Enrico Jorns <ejo@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-06-08 16:05 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Le Thu, 8 Jun 2017 15:11:03 +0900,
> Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
>
>> Hi Boris,
>>
>>
>> 2017-06-07 22:33 GMT+09:00 Boris Brezillon <boris.brezillon@free-electro=
ns.com>:
>> > On Wed,  7 Jun 2017 20:52:16 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Currently, the error handling of denali_write_page(_raw) is a bit
>> >> complicated.  If the program command fails, NAND_STATUS_FAIL is set
>> >> to the driver internal denali->status, then read out later by
>> >> denali_waitfunc().
>> >>
>> >> We can avoid it by exploiting the nand_write_page() implementation.
>> >> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
>> >> errors out immediately.  This gives the same result as returning
>> >> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
>> >> returned to the upper MTD layer.
>> >
>> > Actually, this is how it's supposed to work now (when they set
>> > the NAND_ECC_CUSTOM_PAGE_ACCESS flag, drivers are expected to wait for
>> > the program operation to finish and return -EIO if it failed), so you'=
re
>> > all good ;-).
>> >
>> >>
>> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >> ---
>> >>
>> >> Changes in v5: None
>> >> Changes in v4: None
>> >> Changes in v3: None
>> >> Changes in v2:
>> >>   - Newly added
>> >>
>> >>  drivers/mtd/nand/denali.c | 12 ++++--------
>> >>  drivers/mtd/nand/denali.h |  1 -
>> >>  2 files changed, 4 insertions(+), 9 deletions(-)
>> >>
>> >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> >> index 1897fe238290..22acfc34b546 100644
>> >> --- a/drivers/mtd/nand/denali.c
>> >> +++ b/drivers/mtd/nand/denali.c
>> >> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
>> >>       size_t size =3D mtd->writesize + mtd->oobsize;
>> >>       uint32_t irq_status;
>> >>       uint32_t irq_mask =3D INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
>> >
>> > As mentioned in my previous patch, I think you should wait for
>> > INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL here.
>>
>> No.
>> It is intentional to use INTR__DMA_CMD_COMP
>> instead of INTR__PROGRAM_COMP here.
>>
>>
>> This is very strange of this IP,
>> INTR__PROGRAM_COMP is never set when DMA mode is being used.
>> (INTR__DMA_CMD_COMP is set instead.)
>
> Indeed, this is really strange. Are you sure the page is actually
> programmed when you receive the INTR__DMA_CMD_COMP interrupt?

Yes.
After my test, I concluded INTR__DMA_CMD_COMP is asserted
when page program is completed.



Rationale:

Denali User's Guide describes the IRQ bits as follows:


Bit 2 (dma_cmd_comp)    A data DMA command has completed on this bank
  ...
Bit 7 (program_comp)    Device finished the last issued program command
  ...
Bit 12 (INT_act)        R/B pin of device transitioned from low to high
  ...
Bit 15 (page_xfer_inc)  For every page of data transfer to or from the devi=
ce,
                        this bit will be set.



In my test,  ->write_page() hook triggers IRQ bits as follows:

 - Write access with DMA
      bit 15 is asserted first,
      then some timer later  bit 12 and bit 2 are asserted at the same time

 - Write access with PIO
      bit 15 is asserted first,
      then some time later   bit 12 and bit 7 are asserted at the same time



NAND devices toggle R/B# pin when page program is completed.
So, bit 2 (dma_cmd_comp) means the completion of page program.


I assume your next question here.
"So, why don't you wait for INTR__INT_ACT
instead of INTR__DMA_CMD_COMP / INTR__PROGRAM_COMP?
It should work regardless of transfer mode."
This has a point.
We can always check R/B# transition for read, write, erase, or whatever.
This is just a matter of taste, but I am just keeping code that uses
dedicated IRQ bits for each mode.





> Because INTR__DMA_CMD_COMP is likely to happen before the PAGEPROG
> command has finished, which is not good (the core might start a new
> operation while the NAND is still busy).

As explained above, INTR__PAGE_XFER_INC happens before the PAGEPROG.
Then, INTR__DMA_CMD_COMP happens when the PAGEPROG has finished.



> Anyway, if INTR__DMA_CMD_COMP is what should be set, it clearly
> deserves a comment.


Will add a comment.


>>
>>
>> As far as I tested this IP,
>> INTR__PROGRAM_COMP is set only when data are written by PIO mode.
>
> It doesn't make much sense (not saying you're wrong, just that the IP
> is weird). PROG completed should be independent of the data transfer
> step. Sure it happens after transferring data to the NAND, but then you
> still have to execute the PAGEPROG command and wait until the NAND
> becomes ready again. That's when I'd expect PROGRAM_COMP (or
> PROGRAM_FAIL) to be triggered.

You can do like that (execute 0x10 command separately)
by using the raw command mode.  (MODE_11)

When using high level interface of this IP,
the controller will take care of 0x80 command, address cycle,
data cycle, then 0x10 command.

Anyway, we agree this IP is strange.


>>
>>
>> I introduced PIO transfer in
>> http://patchwork.ozlabs.org/patch/772398/
>>
>> I used INTR__PROGRAM_COMP in denali_pio_write().
>>
>
> Yep, I see that.
>
>>
>>
>> >> +     int ret =3D 0;
>> >>
>> >>       denali->page =3D page;
>> >>
>> >> @@ -1038,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
>> >>       if (irq_status =3D=3D 0) {
>> >>               dev_err(denali->dev, "timeout on write_page (type =3D %=
d)\n",
>> >>                       raw_xfer);
>> >> -             denali->status =3D NAND_STATUS_FAIL;
>> >> +             ret =3D -EIO;
>> >>       }
>> >
>> >         if (irq_status & INTR__PROGRAM_FAIL) {
>> >                 dev_err(denali->dev, "page program failed (type =3D %d=
)\n",
>> >                         raw_xfer);
>> >                 ret =3D -EIO;
>> >         }
>>
>> This will be fixed anyway by
>> http://patchwork.ozlabs.org/patch/772414/
>
> Note that PROG_FAILED is quite different from a timeout (usually
> happens when a block becomes bad), so it probably deserve a specific
> error message.
>

OK.  Will consider it.




--=20
Best Regards
Masahiro Yamada
