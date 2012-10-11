MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
Date: Thu, 11 Oct 2012 22:37:09 +0530
Message-ID: <CAOh2x=mr4jQ1WQTC50H6OsN_E+7gtVSy_UMwjrt6Rj-QbQRtOA@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: viresh kumar <viresh.kumar@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Oct 11, 2012 at 9:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Oct 11, 2012 at 6:15 AM, viresh kumar <viresh.kumar@linaro.org> wrote:
>> I pray that i am wrong here, otherwise i would be thrown out from

s/am/am not/ :(

>> the maintainers list for this driver :)
>>
>> dma_sync_single_for_device() is not doing anything on the buffer, but
>> on the LLI item. Actually it is flushing LLI struct so that DMA h/w can get
>> the correct values.
>
> Sorry no, I'm the one who's wrong...

Glad to hear that. :)
It happens very few times in one's lifetime, that a beginner like me is correct
and an expert like you is not. Just kidding :)

> And the block layer of the subsystem should take care
> of only handing the driver buffers that are contiguous

But why should that be a constraint on block layer? It is working in virtual
space and is concerned about that onlly.

--
viresh
