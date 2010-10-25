Subject: Re: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
	read/write
From: David Woodhouse <dwmw2@infradead.org>
To: Nishanth Menon <nm@ti.com>
In-Reply-To: <4CAE2475.4090607@ti.com>
References: <1285063280-4057-1-git-send-email-manjugk@ti.com>
	<1285063280-4057-10-git-send-email-manjugk@ti.com>
	<7A436F7769CA33409C6B44B358BFFF0C014F74831E@dlee02.ent.ti.com>
	<20101007185630.GA26435@n2100.arm.linux.org.uk>
	<4CAE2475.4090607@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 01:01:49 +0100
Message-ID: <1287964909.5674.22.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "G, Manjunath Kondaiah" <manjugk@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 14:50 -0500, Nishanth Menon wrote:
> my comment being that by moving {read,write}[wlb] to __raw versions dont 
> solve the real issue of namespace here. fix should be in 
> arch/arm/include/asm/io.h IMHO. so that there are no overlaps as this. 

Indeed. This patch is complete nonsense.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
