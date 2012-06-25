From: Marek Vasut <marex@denx.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Mon, 25 Jun 2012 18:01:22 +0200
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206230415.18833.marex@denx.de>
 <20120625154006.GB2342@S2101-09.ap.freescale.net>
In-Reply-To: <20120625154006.GB2342@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201206251801.22385.marex@denx.de>
Cc: manu <manuel.pezzin@free.fr>, patches@linaro.org,
 devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <artem.bityutskiy@intel.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Shawn Guo,

> On Sat, Jun 23, 2012 at 04:15:18AM +0200, Marek Vasut wrote:
> > So is there any particular reason why this wasn't applied?
> 
> Let me remind Artem by resending the patch tomorrow.

Actually ... the SPI does have the heuristics to probe this chip without the 
patch. But there was this discussion about them eventually being removed. That 
was a point raised by you I think. Is that still valid?

Best regards,
Marek Vasut
