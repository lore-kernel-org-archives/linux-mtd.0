Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLzkk-0007fX-SY
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:07:27 +0000
Received: by mail-wi0-f171.google.com with SMTP id hj13so5483912wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:07:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
Date: Wed, 10 Oct 2012 19:07:23 +0200
Message-ID: <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>, Vinod Koul <vinod.koul@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: plagnioj@jcrosoft.com, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> read_buf/write_buf callbacks should be able to accept a user space memory
> address (virtually contiguous memory) as buffer pointer.
>
> This patch allocates a logically contiguous memory area which is use for dma

You mean PHYSICALLY contigous, don't you?

> xfers during read and write accesses.
>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

If you really want a physically contigous buffer you need to use
CMA, but I don't think that is the real problem here...

We're already using userspace buffers in e.g. the MMCI driver
(drivers/mmc/host/mmci.c).

The real problem is likely the DMA driver. The stuf that get
fed into dma.device_prep_dma_memcpy() needs to be
converted to a scatterlist and then set up in the LLI list
for the controller.

IIRC SPEAr is using drivers/dma/dw_dmac.c so
check this driver's dwc_prep_dma_memcpy().
It does seem like it is checking whether src or
dest is scattered in this for() loop:

for (offset = 0; offset < len; offset += xfer_count << src_width) {}

dma_sync_single_for_device() is translating the virtual
address to physical for every chunk BTW.

So instead of doing this copying, debug the problem, and
see if there is a bug in that for()-loop or similar, if it needs
to be rewritten or so.

Yours,
Linus Walleij
