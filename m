Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDPa-0004we-50
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 23:28:30 +0000
Received: by pabts4 with SMTP id ts4so83760550pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 16:28:07 -0700 (PDT)
Date: Wed, 20 May 2015 16:27:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Julian Calaby <julian.calaby@gmail.com>
Subject: Re: [linux-sunxi] [PATCH 3/3] MTD: m25p80: Add option to limit SPI
 transfer size.
Message-ID: <20150520232759.GW11598@ld-irv-0074>
References: <cover.1430403750.git.hramrach@gmail.com>
 <3b0c112672f364452e80c333048161eaffb655db.1430403750.git.hramrach@gmail.com>
 <CAGRGNgXKrpJ8rc4h4BykgHsn3kfT5fuAssMK1bQJtxhVL=s2BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRGNgXKrpJ8rc4h4BykgHsn3kfT5fuAssMK1bQJtxhVL=s2BA@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Michal Suchanek <hramrach@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "grmoore@altera.com" <grmoore@altera.com>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 devicetree <devicetree@vger.kernel.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 01, 2015 at 12:58:52AM +1000, Julian Calaby wrote:
> On Thu, Apr 30, 2015 at 11:46 PM, Michal Suchanek <hramrach@gmail.com> wrote:
> > My SPI driver does not support DMA so sizes larger than 64 bytes return
> > an error. Add an option to limit transfer size so m25p80 can be used
> > with reduced speed with such controller.
> 
> I suspect that this will be rejected as the maximum transfer size is a
> property of the SPI controller, not the device and should be exported
> to the device driver from the controller, not specified in the
> device's binding.

Absolutely correct. This does not belong in the device tree.

Brian
