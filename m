Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMLHg-00069q-Ma
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 16:06:53 +0000
Received: by mail-wi0-f169.google.com with SMTP id hq4so6978153wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 09:06:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
Date: Thu, 11 Oct 2012 18:06:49 +0200
Message-ID: <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Linus Walleij <linus.walleij@linaro.org>
To: viresh kumar <viresh.kumar@linaro.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vinod Koul <vinod.koul@intel.com>, spear-devel@list.st.com,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 11, 2012 at 6:15 AM, viresh kumar <viresh.kumar@linaro.org> wrote:
> On Wed, Oct 10, 2012 at 10:37 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:

>> dma_sync_single_for_device() is translating the virtual
>> address to physical for every chunk BTW.
>
> I pray that i am wrong here, otherwise i would be thrown out from
> the maintainers list for this driver :)
>
> dma_sync_single_for_device() is not doing anything on the buffer, but
> on the LLI item. Actually it is flushing LLI struct so that DMA h/w can get
> the correct values.

Sorry no, I'm the one who's wrong...

So the DMA engine memcpy() is not mapping virt->phys
but expects physical addresses to be provided.

So dma_map_single() needs to be called on the stuff
passed in to dev->device_prep_dma_memcpy().

And currently there is indeed a dma_map_single() in
dma_xfer() in fsmc_nand.c which should work just fine.

dma_map_single() will only work if the buffer is
physically contiguous.

And the block layer of the subsystem should take care
of only handing the driver buffers that are contiguous
I think? Not that I'm an expert here ... more some
guesswork :-/

Artem will know I hope!

Yours,
Linus Walleij
