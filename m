Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMQfA-0002L6-O3
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 21:51:29 +0000
Received: by mail-wg0-f49.google.com with SMTP id gg4so1262002wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 14:51:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOh2x=mr4jQ1WQTC50H6OsN_E+7gtVSy_UMwjrt6Rj-QbQRtOA@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <CAOh2x=mr4jQ1WQTC50H6OsN_E+7gtVSy_UMwjrt6Rj-QbQRtOA@mail.gmail.com>
Date: Thu, 11 Oct 2012 23:51:25 +0200
Message-ID: <CACRpkdZvO3Df58UxFDc_T10JDhE=O5KKHZTzd9g0BOn60NWZcA@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Linus Walleij <linus.walleij@linaro.org>
To: viresh kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Vinod Koul <vinod.koul@intel.com>,
 spear-devel@list.st.com, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 11, 2012 at 7:07 PM, viresh kumar <viresh.kumar@linaro.org> wrote:
> On Thu, Oct 11, 2012 at 9:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> And the block layer of the subsystem should take care
>> of only handing the driver buffers that are contiguous
>
> But why should that be a constraint on block layer? It is working in virtual
> space and is concerned about that onlly.

Not the block layer, the block layer of the subsystem.

It has to pick out the chunks that get transferred down to the drivers.

For example drivers/mmc/card/block.c will convert transfers into
sglists and pass down to the MMC drivers. mmc_queue_map_sg()
calls blk_rq_map_sg() to do the job. It's even documented in
Documentation/block/biodoc.txt

I don't know how that works in MTD...

Yours,
Linus Walleij
