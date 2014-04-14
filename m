Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZjbo-0002kh-0Q
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 16:19:48 +0000
Received: by mail-lb0-f174.google.com with SMTP id u14so5837014lbd.19
 for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2014 09:19:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201404131918.45753.marex@denx.de>
References: <1397228593-17996-1-git-send-email-grmoore@altera.com>
 <201404131918.45753.marex@denx.de>
Date: Mon, 14 Apr 2014 11:19:24 -0500
Message-ID: <CA+iBjpSHL0+A=wzhhVvT_y+mhZoFNLUkNe18OtxPn1hZVCdUDw@mail.gmail.com>
Subject: Re: [PATCH V2] Add support for flag status register on Micron chips.
From: Graham Moore <ggrahammoore@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Insop Song <insop.song@gainspeed.com>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 13, 2014 at 12:18 PM, Marek Vasut <marex@denx.de> wrote:
[...]
>> +#define      OPCODE_RDFSR            0x70  /* read flag status register */
>
> I know this is not your fault, but can you please indent this properly with
> tabs?
>
>>  #define      OPCODE_NORM_READ        0x03    /* Read data bytes (low
> frequency) */
>>  #define      OPCODE_FAST_READ        0x0b    /* Read data bytes (high
> frequency) */
>>  #define      OPCODE_QUAD_READ        0x6b    /* Read data bytes */
>
> And fix this one in a separate patch to use tabs as well please ?

I'm rebasing on l2-mtd spinor, and the tabs are jacked up there too.
I'll fix the
one I added, and fix other tabs in a new patch on that branch.

[...]
> I wonder, can't wait_till_ready() be made a wrapper that will check the USE_FSR
> flag and call correct wait-function ? This would avoid adding a new member to
> *flash and also would avoid so many changes throughout the code. What do you
> think?

Yeah, that's kind of ugly, but the flags exist only in the static
m25p_ids[] and are only
used in the scan/init.  I'd have to add a new member to save them for
later use.
And then other uses would crop up.  So, seemed kinda iffy either way.

It's going to change anyway, because l2-mtd spinor branch has refactored
wait_till_ready() such that it uses a function pointer from the new
spi_nor struct.
I'm still mulling it over :)

Thanks,
-Graham
