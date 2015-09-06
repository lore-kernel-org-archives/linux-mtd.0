Date: Sun, 6 Sep 2015 19:36:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx: add "jedec,spi-nor" flash compatible
 binding
Message-ID: <20150906113615.GO30746@tiger>
References: <1439707157-15091-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1439707157-15091-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 16, 2015 at 08:39:17AM +0200, Rafał Miłecki wrote:
> Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
> binding indicating support for JEDEC identification.
> 
> Use it for all flashes that are supposed to support READ ID op according
> to the datasheets.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied, thanks.
