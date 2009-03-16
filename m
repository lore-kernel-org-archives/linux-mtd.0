Subject: Re: [PATCH] Add armflash support for multiple blocks of flash
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20090209180504.27367.52854.stgit@pc1117.cambridge.arm.com>
References: <20090209180504.27367.52854.stgit@pc1117.cambridge.arm.com>
Content-Type: text/plain
Date: Mon, 16 Mar 2009 17:31:14 +0000
Message-Id: <1237224674.19000.26.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2009-02-09 at 18:05 +0000, Catalin Marinas wrote:
> This patch adds MTD concatenation support to integrator-flash.c for
> platforms with more than one block of flash memory (e.g. RealView
> PB11MPCore). The implementation is based on the sa1100-flash.c one.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>  drivers/mtd/maps/integrator-flash.c |  226 +++++++++++++++++++++++++----------
>  1 files changed, 164 insertions(+), 62 deletions(-)

Is there a chance to get this patch merged during the upcoming merging
window? I don't follow the linux-mtd list so I don't know the
gatekeeping process here. Should I (cross-)post the patch to LKML as
well?

Thanks.

-- 
Catalin
