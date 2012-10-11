MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
Date: Thu, 11 Oct 2012 08:46:04 +0530
Message-ID: <CAOh2x==Up=mOc+YA6-yKD7xpoxFyzfb-XtoQ6DENTXayTa=vtA@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: viresh kumar <viresh.kumar@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, Vinod Koul <vinod.koul@intel.com>,
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

On Wed, Oct 10, 2012 at 10:37 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> The real problem is likely the DMA driver. The stuf that get
> fed into dma.device_prep_dma_memcpy() needs to be
> converted to a scatterlist and then set up in the LLI list
> for the controller.
>
> IIRC SPEAr is using drivers/dma/dw_dmac.c so

Both dw_dmac and pl080 for different SPEAr SoC's.

> check this driver's dwc_prep_dma_memcpy().
> It does seem like it is checking whether src or
> dest is scattered in this for() loop:
>
> for (offset = 0; offset < len; offset += xfer_count << src_width) {}
>
> dma_sync_single_for_device() is translating the virtual
> address to physical for every chunk BTW.
>
> So instead of doing this copying, debug the problem, and
> see if there is a bug in that for()-loop or similar, if it needs
> to be rewritten or so.

But what's the problem you saw vipin, for which you generated this patch?
