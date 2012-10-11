MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
Date: Thu, 11 Oct 2012 09:45:59 +0530
Message-ID: <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
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
> On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> The real problem is likely the DMA driver. The stuf that get
> fed into dma.device_prep_dma_memcpy() needs to be
> converted to a scatterlist and then set up in the LLI list
> for the controller.
>
> IIRC SPEAr is using drivers/dma/dw_dmac.c so
> check this driver's dwc_prep_dma_memcpy().
> It does seem like it is checking whether src or
> dest is scattered in this for() loop:
>
> for (offset = 0; offset < len; offset += xfer_count << src_width) {}
>
> dma_sync_single_for_device() is translating the virtual
> address to physical for every chunk BTW.

I pray that i am wrong here, otherwise i would be thrown out from
the maintainers list for this driver :)

dma_sync_single_for_device() is not doing anything on the buffer, but
on the LLI item. Actually it is flushing LLI struct so that DMA h/w can get
the correct values.

dwc_prep_dma_memcpy() doesn't expect a virtual address, look at type
of src & dest bufs: dma_addr_t. It is responsibility of user drivers to pass
physically contiguous address to it.

--
viresh
