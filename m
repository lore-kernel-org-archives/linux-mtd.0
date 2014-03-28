Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTVv7-00017Q-Vb
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 12:30:04 +0000
Date: Fri, 28 Mar 2014 09:28:53 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Message-ID: <20140328122853.GA1636@arch.cereza>
References: <1394626349-16024-1-git-send-email-abrodkin@synopsys.com>
 <1395934023.3511.1.camel@abrodkin-8560l.internal.synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395934023.3511.1.camel@abrodkin-8560l.internal.synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Francois Bedard <Francois.Bedard@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 27, Alexey Brodkin wrote:
> On Wed, 2014-03-12 at 16:12 +0400, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > 
> > Cc: Vineet Gupta <vgupta@synopsys.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/axs-nand.txt |  17 +
> >  drivers/mtd/nand/Kconfig                           |   6 +
> >  drivers/mtd/nand/Makefile                          |   1 +
> >  drivers/mtd/nand/axs_nand.c                        | 412 +++++++++++++++++++++
> >  4 files changed, 436 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/axs-nand.txt
> >  create mode 100644 drivers/mtd/nand/axs_nand.c
> 
> Any chance to this patch reviewed, commented, accepted?
> 

FWIW, I plan to review this any time soon...
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
