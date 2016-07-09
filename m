Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLgh6-0002G7-4v
 for linux-mtd@lists.infradead.org; Sat, 09 Jul 2016 01:04:32 +0000
Message-ID: <1468026245.32358.75.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Raghav Dogra <raghav.dogra@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 leoyang.li@nxp.com, prabhakar.kushwaha@nxp.com
Date: Fri, 08 Jul 2016 20:04:05 -0500
In-Reply-To: <1467388950-4895-1-git-send-email-raghav.dogra@nxp.com>
References: <1467388950-4895-1-git-send-email-raghav.dogra@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][v2] driver/memory: Update dependency of IFC for Layerscape
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-07-01 at 21:32 +0530, Raghav Dogra wrote:
> This patch enables IFC NAND support on ARM layerscape platform.
> It fixes the dependency to enable NAND. The include files are being modified
> to ensure complilation for both PowerPC and ARM architectures.
> 
> Signed-off-by: Raghav Dogra <raghav.dogra@nxp.com>
> ---
> Applicable to git://git.infradead.org/l2-mtd.git
> 
> Changes for v2: updated commit description
> 
>  drivers/memory/Kconfig   | 2 +-
>  drivers/memory/fsl_ifc.c | 4 +++-
>  drivers/mtd/nand/Kconfig | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)

Acked-by: Scott Wood <oss@buserror.net>

-Scott
