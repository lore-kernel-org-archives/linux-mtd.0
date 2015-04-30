Date: Thu, 30 Apr 2015 09:14:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 0/5] ARM: shmobile: dts: Add "nor-jedec" compatible value
Message-ID: <20150430001450.GD17758@verge.net.au>
References: <1430215978-31087-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430215978-31087-1-git-send-email-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 12:12:53PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the "nor-jedec" compatible value to all device
> nodes for JEDEC-compliant SPI FLASHes on Renesas shmobile boards,
> It allows the driver to bind against the generic name, cfr. commit
> 8ff16cf77ce314c2 ("Documentation: devicetree: m25p80: add "nor-jedec"
> binding").
> 	        
> This was tested on r8a7791/koelsch. I verified that it also works with
> "nor-jedec" only, without the specific compatible value.
> 
> Thanks for applying!

Thanks, I have queued these up for v4.2.
