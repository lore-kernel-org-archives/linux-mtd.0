Date: Mon, 22 Feb 2016 10:04:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: add "jedec,spi-nor" flash compatible binding
Message-ID: <20160222180401.GA115735@google.com>
References: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 16, 2015 at 08:13:25AM +0200, Rafał Miłecki wrote:
> Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
> binding indicating support for JEDEC identification.
> 
> Use it for all flashes that are supposed to support READ ID op according
> to the datasheets.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 2 +-
>  arch/arm/boot/dts/tegra124-venice2.dts    | 2 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts   | 2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

FWIW:

Acked-by: Brian Norris <computersforpeace@gmail.com>
