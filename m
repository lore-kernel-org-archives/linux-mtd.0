Subject: Re: [PATCH v2] Add support for Samsung SoC OneNAND controllers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1272469609-21876-1-git-send-email-m.szyprowski@samsung.com>
References: <1272469609-21876-1-git-send-email-m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 04 May 2010 16:21:41 +0300
Message-ID: <1272979301.3702.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-28 at 17:46 +0200, Marek Szyprowski wrote:
> This patch series add support for Samsung SoC OneNAND controllers found
> on S3C64xx, S5PC100 and S5PC110 chips. A few extensions to OneNAND core
> were required to make the driver working properly on all supported SoCs.
> 
> The required platform setup code has been posted to relevant mailing
> list (ARM Kernel: "[PATCH] ARM: Samsung: Add platform support code for
> OneNAND controller" thread).
> 
> Changes since v1:
> * addressed all coding style issues reported by Ben Dooks
> * moved all resource definitions to platform device resources
> * moved all resource definitions for different SoCs from regs-onenand.h to
>   arch/arm/mach-{s3c64xx,s5pc100,s5pv210}/include/mach/map.h
> * moved all #ifdef conditional code to separate functions
> 
> This patch series includes:
> 
> [PATCH 1/5] drivers: mtd: onenand: add support for chips with 4KB page size
> [PATCH 2/5] drivers: mtd: onenand: allocate verify buffer in the core
> [PATCH 3/5] drivers: mtd: onenand: add new callback for bufferram read
> [PATCH 4/5] drivers: mtd: onenand: add workaround for SYNC_WRITE mode
> [PATCH 5/5] drivers: mtd: add Samsung SoC OneNAND driver

Pushed this series to my l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
