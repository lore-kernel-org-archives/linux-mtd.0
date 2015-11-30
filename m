Date: Mon, 30 Nov 2015 14:34:50 -0800
From: Tony Lindgren <tony@atomide.com>
To: Vignesh R <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, hramrach@gmail.com,
 Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 linux-omap@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/5] ARM: dts: DRA7: add entry for qspi mmap region
Message-ID: <20151130223449.GK23396@atomide.com>
References: <1448860515-28336-1-git-send-email-vigneshr@ti.com>
 <1448860515-28336-5-git-send-email-vigneshr@ti.com>
 <20151130220102.GG23396@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151130220102.GG23396@atomide.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Tony Lindgren <tony@atomide.com> [151130 14:03]:
> * Vignesh R <vigneshr@ti.com> [151129 21:16]:
> > Add qspi memory mapped region entries for DRA7xx based SoCs. Also,
> > update the binding documents for the controller to document this change.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Vignesh R <vigneshr@ti.com>
> > ---
> > 
> > v4: No changes.
> 
> OK I'll apply patches 4 and 5 of this series into omap-for-v4.5/dt thanks.
> The rest should get merged via the MTD tree.

Actually ddropping them after looking at the IO ranges like I commented.

Regards,

Tony
