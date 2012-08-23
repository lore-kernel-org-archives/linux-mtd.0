Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4ZSu-0000XV-Rs
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 15:37:01 +0000
Received: by vcbfl13 with SMTP id fl13so1011410vcb.36
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 08:36:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345734503.2848.247.camel@sauron.fi.intel.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
Date: Thu, 23 Aug 2012 11:36:58 -0400
Message-ID: <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
 b32955@freescale.com, linux-mtd@lists.infradead.org, marex.vasut@denx.de,
 kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 23, 2012 at 11:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-07-28 at 19:29 -0300, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> When building MTD_NAND_GPMI_NAND as module, the following error shows up:
>>
>> ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] undefined!
>>
>> Export nand_update_bbt to fix it
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>
> Why this driver redefined ->block_markbad() at all, it is not supposed
For hardware reason, in mx23, the bad block mark is stored in the
first byte of the nand page;
in mx28/mx50/mx6q, the bad block mark is stored in the first byte of the OOB.

That's why the driver redefined the ->block_markbad().

Is there any need to build the gpmi nand as a module?

Best Regards
Huang Shijie

> to do this. We should fix the driver instead.
>
> --
> Best Regards,
> Artem Bityutskiy
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
