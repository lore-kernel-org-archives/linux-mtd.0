Date: Thu, 17 Dec 2015 10:45:58 -0800
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh@kernel.org>
Cc: Vignesh R <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Russell King <linux@arm.linux.org.uk>, hramrach@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v5 4/5] ARM: dts: DRA7: add entry for qspi mmap region
Message-ID: <20151217184557.GC23396@atomide.com>
References: <1449807000-6457-1-git-send-email-vigneshr@ti.com>
 <1449807000-6457-5-git-send-email-vigneshr@ti.com>
 <20151211150935.GA15654@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151211150935.GA15654@rob-hp-laptop>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Rob Herring <robh@kernel.org> [151211 07:10]:
> On Fri, Dec 11, 2015 at 09:39:59AM +0530, Vignesh R wrote:
> > Add qspi memory mapped region entries for DRA7xx based SoCs. Also,
> > update the binding documents for the controller to document this change.
> > 
> > Signed-off-by: Vignesh R <vigneshr@ti.com>
> 
> Acked-by: Rob Herring <robh@kernel.org>

Vignes, are patches 4 and 5 safe to apply separately already or
do things break if we do that?

Regards,

Tony
