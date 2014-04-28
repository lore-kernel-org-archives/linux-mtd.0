Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WemSo-0008BS-47
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 14:23:22 +0000
Received: by mail-la0-f43.google.com with SMTP id c6so5018059lan.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 07:22:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140428070602.GA29525@localhost>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <201404260012.24311.marex@denx.de>
 <20140426031011.GA4811@localhost.localdomain>
 <201404280706.18068.marex@denx.de>
 <20140428070602.GA29525@localhost>
Date: Mon, 28 Apr 2014 09:22:58 -0500
Message-ID: <CA+iBjpS9gstvippLHzm_Tpgxx19VxnRzWEwi_tJV5d7+snnfWg@mail.gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
From: Graham Moore <ggrahammoore@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Insop Song <insop.song@gainspeed.com>, Graham Moore <grmoore@altera.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 2:06 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Mon, Apr 28, 2014 at 07:06:17AM +0200, Marek Vasut wrote:
>>
>> Two things competing over the same pointer looks misdesigned to me. I will need
>> to dig into this one more time ...
> Please refer to the code for NAND chip, the nand_get_flash_type() :
>
> -----------------------------------------------------------
>         /* Do not replace user supplied command function! */
>         if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>                 chip->cmdfunc = nand_command_lp;
> -----------------------------------------------------------
>
> It uses the same logic:
>         " Do not replace user supplied command function!"
>
> thanks
> Huang Shijie

I would like to set the @wait_till_ready in m25p80.c, because the
USE_FSR flag is only for Micron chips.  But the m25p80 driver doesn't
have access to the flags, they are contained in spi-nor.c.  It seems
to me that the driver_data should be accessible by the driver.  So
maybe there is room for improvement there.

Thanks,
Graham Moore
