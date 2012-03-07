Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5JRA-0007r7-Ah
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:10:00 +0000
Received: by iaky10 with SMTP id y10so10527381iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 08:09:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b35532ebcf4ae0c89dd4c8e9834829104b5cdb37.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <b35532ebcf4ae0c89dd4c8e9834829104b5cdb37.1331119143.git.vipin.kumar@st.com>
Date: Wed, 7 Mar 2012 17:09:59 +0100
Message-ID: <CACRpkdbiZe3NzA2ekmf7q8=A3r9KU2hFHcToLW3CWdu=i9iXUg@mail.gmail.com>
Subject: Re: [PATCH 18/18] fsmc/nand: Add DMA support
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>, Dan Williams <dan.j.williams@intel.com>,
 Vinod Koul <vinod.koul@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 7, 2012 at 12:31 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> The fsmc_nand driver uses cpu to read/write onto the device. This is inefficient
> because of two reasons
> - the cpu gets locked on AHB bus while reading from NAND
> - the cpu is unnecessarily used when dma can do the job
>
> This patch adds the support for accessing the device through DMA

Please elaborate a bit on how this is done, because I think it's new
stuff.

It appears that the FSMC is not like a slave device, i.e. not taking a
stream of bytes. Instead you use the memcpy() portions of the
dmaengine API to move data in/out of the flash pages to the
page currently handled by the controller.

Is this correct? I think it's pretty interesting since it's a new usecase
for in-kernel memcpy() which (AFAIK) has so far only been used
to accelerate network packet copying (correct me if wrong!).

Please add Dan Williams and Vinod Koul to CC on this patch so
the dmaengine people get to look at it.

Yours,
Linus Walleij
