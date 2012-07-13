Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpgQs-0005lD-GM
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 14:01:24 +0000
Received: by qabj40 with SMTP id j40so314950qab.15
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 07:00:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201207131235.43633.marex@denx.de>
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-59M6UCW91QS0_ZKzBO-HUyXrUXcmW3avOd8=4CmE4Fg@mail.gmail.com>
 <4FFD27A1.9000008@freescale.com> <201207131235.43633.marex@denx.de>
Date: Fri, 13 Jul 2012 10:00:39 -0400
Message-ID: <CAMiH66GzmAJV+GfeuaigakiAFPB2gvzQaLd47yLcrz9dht3pLA@mail.gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2012 at 6:35 AM, Marek Vasut <marex@denx.de> wrote:
> Dear Huang Shijie,
>
>> Hi Brian:
>> > Wood [1]; I don't see a good reason not to just kill the
>> > NAND_CHIPOPTIONS_MSK instead of adding more flags. As long as we
>> > perform a few sanity tests, I think it'd be safe.
>>
>> I think it's more clear in logic to add this new macro:
>>     The NAND_NO_SUBPAGE_WRITE can be used only by the MLC nands which do
>> no support the subpage write;
>>     The NAND_CONTROLLER_NO_SUBPAGE_WRITE only used by the nand
>> controller such as gpmi nand.
>
> It's not clearer at all. It's just more error-prone.
ok, thanks. But I do not how to fix it now. I hope some one could give a patch.

Best Regards
Huang Shijie

>
>> But I will be happy if you submit a patch to fix this issue by removing
>> the NAND_CHIPOPTIONS_MSK.
>
> I'd be happy if the GPMI NAND driver was properly fixed, 6 months after
> reporting this bug, which is quite critical as UBI doesn't work because of that
> and it's being silently ignored.
>
>> thanks
>> Huang Shijie
>
> Best regards,
> Marek Vasut
