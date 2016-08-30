Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bef5R-0007bd-Eo
 for linux-mtd@lists.infradead.org; Tue, 30 Aug 2016 09:12:07 +0000
Received: by mail-wm0-x233.google.com with SMTP id i5so24462002wmg.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2016 02:11:44 -0700 (PDT)
Date: Tue, 30 Aug 2016 10:13:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20160830091330.GH1661@dell>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <20160829071125.GX1812@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160829071125.GX1812@lahna.fi.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 Aug 2016, Mika Westerberg wrote:

> On Mon, Aug 15, 2016 at 10:10:41AM +0300, Mika Westerberg wrote:
> > Hi,
> > 
> > This is third version of the series. Previous versions can be found:
> > 
> >   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
> >   v1: https://lkml.org/lkml/2016/6/14/269
> > 
> > This series adds support for the Intel SPI serial flash controller found on
> > many recent Intel CPUs including Baytrail and Braswell. This driver makes
> > it possible to access the BIOS and other platform data which is stored on
> > the SPI serial flash. It is also possible to upgrade the BIOS using this
> > driver if it has not been protected by special hardware bits.
> > 
> > The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> > MAX.
> > 
> > Since poking the SPI serial flash can brick the machine, this driver can
> > only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> > unless instructed othwerwise by module parameter.
> > 
> > Lee can you ACK/NACK the MFD parts so that we can merge the whole series
> > through the MTD tree?

Why does it need to go into the MTD tree?  What are the *build*
dependencies?

> Hi,
> 
> Any comments on this series? It missed v4.8 already so it would be nice
> to get it merged for v4.9.
> 
> Thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
