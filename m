From: Arnd Bergmann <arnd@arndb.de>
To: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
Date: Thu, 16 Aug 2012 13:59:21 +0000
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
In-Reply-To: <1345122935-22115-1-git-send-email-stigge@antcom.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201208161359.21276.arnd@arndb.de>
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 August 2012, Roland Stigge wrote:
> The SLC and MLC NAND drivers now need their dma_filter callbacks via platform
> data to make them independent of single DMA engine drivers.
> 
> (This also helps fixing build errors of the SLC and MLC drivers when building
> as modules because direct access to AMBA dma filter functions isn't available
> via export.)
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Yes, this looks right.

Acked-by: Arnd Bergmann <arnd@arndb.de>

Once we have proper DT bindings for the DMA channels, we can hopefully
get rid of the auxdata again.

	Arnd
