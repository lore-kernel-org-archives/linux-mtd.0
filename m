Date: Wed, 20 May 2015 15:38:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3 0/4] mtd: mxc_nand: fix 8 bit ECC and large oob
Message-ID: <20150520223808.GR11598@ld-irv-0074>
References: <cover.1431504091.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1431504091.git.baruch@tkos.co.il>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 13, 2015 at 11:17:35AM +0300, Baruch Siach wrote:
> This patch series fixes mxc_nand bugs that I encountered while trying to use 8
> bit ECC mode on i.MX25 with the Micron MT29F8G08ABABA flash chip.
> 
> Many thanks to Uwe Kleine-König for guiding me through the process of
> debugging and fixing, for contributing a clean-up patch to this series, and
> for reviewing the rest.
> 
> This series applies on v4.1-rc1.
> 
> This is version 3 of the patch series, adding Reviewed-by and Acked-by tags
> from Sascha Hauer and Uwe Kleine-König. Patch 4/4 renamed a function as
> suggested by Uwe Kleine-König.
> 
> Version 2 of the patch series
> (http://thread.gmane.org/gmane.linux.drivers.mtd/58687), addressed the
> comments and suggestion of Uwe Kleine-König on the first series
> (http://thread.gmane.org/gmane.linux.ports.arm.kernel/408635). See each patch
> for detailed per-patch changelog.

Pushed the first 3 to l2-mtd.git. Thanks all!

I have one comment on the 4th.

Brian
