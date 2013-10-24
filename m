Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ8ht-0002NB-MG
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 00:23:22 +0000
Received: by mail-ie0-f171.google.com with SMTP id tp5so2726718ieb.30
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 17:23:00 -0700 (PDT)
Date: Wed, 23 Oct 2013 17:22:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH 0/3]Add quad/memory mapped support for SPI flash.
Message-ID: <20131024002253.GZ23337@ld-irv-0074.broadcom.com>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
Cc: spi-devel-general@lists.sourceforge.net, broonie@kernel.org,
 dwmw2@infradead.org, balbi@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sourav,

I must admit, I missed some of this series due to a combination of
strange Gmail filtering (I just learned that a filter for "PATCH"
doesn't match "PATCHv3" in Gmail...) and the inconsistent naming in your
patch series. (I see PATCH, PATCHv3, and RFC/PATCH.) I'll try to prevent
that in the future.

On Wed, Oct 09, 2013 at 08:54:41PM +0530, Sourav Poddar wrote:
> This patch add quad/memory mapped support in flash driver(m25p80).

Does "memory mapped" supoprt need to be in the same series as quad read
support? Those are very different topics, it seems.

> Added support for quad memory mapped for TI qspi controller also.
> 
> This patch has been tested with some internal dts data.

Your patches use new DT bindings which are not documented. If you are
adding bindings, please document them in
Documentation/devicetree/bindings/ and CC devicetree@vger.kernel.org.
(You only need to CC them for the binding documenation, not necessarily
all your code changes.)

That being said, I'm not sure you need some of the bindings that you're
using. I'll comment on the affected patch(es).

Brian
