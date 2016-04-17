Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arrjU-0003XH-V2
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 18:47:45 +0000
Received: by mail-pf0-x229.google.com with SMTP id e128so72853511pfe.3
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 11:47:23 -0700 (PDT)
Date: Sun, 17 Apr 2016 11:47:19 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V1 6/7] MIPS: Loongson1B: Some updates/fixes for LS1B
Message-ID: <20160417184719.GD391@tuxbot>
References: <1459946095-7637-1-git-send-email-keguang.zhang@gmail.com>
 <1459946095-7637-7-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459946095-7637-7-git-send-email-keguang.zhang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 06 Apr 05:34 PDT 2016, Keguang Zhang wrote:

> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> - Add DMA device
> - Add NAND device
> - Add GPIO device
> - Add LED device
> - Update the defconfig and rename it to loongson1b_defconfig
> - Fix ioremap size
> - Other minor fixes

You should split this into a series of patches, at least to get all the
non-functional (renames and BIT usage) into a separate patch. That
way it's much easier to review your functional changes and to later
debug any issues introduced.

Regards,
Bjorn
