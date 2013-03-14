Received: from mail-ve0-f169.google.com ([209.85.128.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG05s-0002S8-Lr
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 04:48:45 +0000
Received: by mail-ve0-f169.google.com with SMTP id 15so1387456vea.14
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 21:48:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363229965-13128-1-git-send-email-b32955@freescale.com>
References: <1363229965-13128-1-git-send-email-b32955@freescale.com>
Date: Wed, 13 Mar 2013 21:48:42 -0700
Message-ID: <CAN8TOE9XBphuTY6h_fgBaSfrFRVg0ZuG+9OxDYR+yvfJn1CcGQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] mtd: use the full-id as the keyword for some nand
 chips
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 13, 2013 at 7:59 PM, Huang Shijie <b32955@freescale.com> wrote:
> As time goes on, we begin to meet the situation that we can not
> get enough information from some nand chips's id data.
> Take some Toshiba's nand chips for example.
> I have 4 Toshiba's nand chips in my hand:
>         TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2
>
> When we read these chips' datasheets, we will get the geometry of these chips:
>         TC58NVG2S0F : 4096 + 224
>         TC58NVG3S0F : 4096 + 232
>         TC58NVG5D2  : 8192 + 640
>         TC58NVG6D2  : 8192 + 640
>
> But we can not parse out the correct oob size for these chips from the id data.
> So it is time to add some new fields to the nand_flash_dev{},
> and update the detection mechanisms.
>
> v4 --> v4:
>         [1] remove the id_len field.
>         [2] based on Artem "mtd: nand: use more reasonable integer types"
>         [3] add more comments.

Sorry for not posting this earlier, but why don't we want an id_len
field? NAND chips often only have a 5-byte or 6-byte ID "defined" in
their datasheet, and so the next few bytes aren't guaranteed to be any
particular value. Wouldn't we want to accommodate for any potential
variation in the "undefined" bytes? (These bytes do typically have a
pattern, and in fact, we currently rely on that fact.) Also, I can
easily foresee a situation in which someone might want to support NAND
based solely on the datasheet, not waiting till they get a sample of
that chip in their hands. In that case, they cannot specify a full 8
bytes in the table; they can (and should) only specify the few
substring found in their datasheet.

Really, the only argument I see for dropping id_len is to save space.
I think this is a bad choice.

... <snip> ...

Brian
