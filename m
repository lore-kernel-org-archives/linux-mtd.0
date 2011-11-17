Subject: Re: [PATCH] MTD: nand: Making  MTD_NAND_OMAP2 depend on ARCH_OMAP2PLUS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shubhrajyoti D <shubhrajyoti@ti.com>
Date: Fri, 18 Nov 2011 00:15:36 +0200
In-Reply-To: <1321420680-4677-1-git-send-email-shubhrajyoti@ti.com>
References: <1321420680-4677-1-git-send-email-shubhrajyoti@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321568138.2272.30.camel@koala>
Mime-Version: 1.0
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-11-16 at 10:48 +0530, Shubhrajyoti D wrote:
> Making  MTD_NAND_OMAP2 depend on ARCH_OMAP2PLUS instead of
> oring with ARCH2/3/4.
> 
> Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Shubhrajyoti D <shubhrajyoti@ti.com>

Pushed to l2-mtd-2.6, thanks!

Artem.
