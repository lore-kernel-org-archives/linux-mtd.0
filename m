Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnpwA-0008Hz-4u
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 14:59:38 +0000
Received: by wgso17 with SMTP id o17so65556472wgs.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 07:59:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3b0c112672f364452e80c333048161eaffb655db.1430403750.git.hramrach@gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com>
 <3b0c112672f364452e80c333048161eaffb655db.1430403750.git.hramrach@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 1 May 2015 00:58:52 +1000
Message-ID: <CAGRGNgXKrpJ8rc4h4BykgHsn3kfT5fuAssMK1bQJtxhVL=s2BA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 3/3] MTD: m25p80: Add option to limit SPI
 transfer size.
To: Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

On Thu, Apr 30, 2015 at 11:46 PM, Michal Suchanek <hramrach@gmail.com> wrote:
> My SPI driver does not support DMA so sizes larger than 64 bytes return
> an error. Add an option to limit transfer size so m25p80 can be used
> with reduced speed with such controller.

I suspect that this will be rejected as the maximum transfer size is a
property of the SPI controller, not the device and should be exported
to the device driver from the controller, not specified in the
device's binding.

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
