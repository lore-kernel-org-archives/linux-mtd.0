Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5He7-0006ik-Qp
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:52:04 +0000
Message-ID: <1375459014.14869.351.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v1 0/4] mtd: nand: omap: add support for BCH16_ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Date: Fri, 02 Aug 2013 18:56:54 +0300
In-Reply-To: <1374090726-9393-1-git-send-email-pekon@ti.com>
References: <1374090726-9393-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tony@atomide.com, devicetree-discuss@lists.ozlabs.org,
 avinashphilipk@gmail.com, balbi@ti.com, linux-mtd@lists.infradead.org,
 benoit.cousson@linaro.org, linux-omap@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-07-18 at 01:22 +0530, Pekon Gupta wrote:
> This patch series add support of BCH16_ECC scheme.
> As BCH16_ECC scheme generates 26bytes of ECC syndrome per 512B data,
> hence this scheme is usable only for NAND devices having 4K or above
> page-size, as their OOB/spare area has enough space to accomodate ECC.
> 
> This patch series is applicable over an above following series:
> [1] [Patch] mtd:nand:omap2: clean-up of supported ECC schemes 
>  http://lists.infradead.org/pipermail/linux-mtd/2013-July/047530.html
> [2] [Patch] optimize and clean-up of OMAP NAND and ELM driver
>  http://lists.infradead.org/pipermail/linux-mtd/2013-July/047538.html
> 
> Also this BCH16_ECC patch series is sparsely tested, due to limited
> availability of boards with 4K/224NAND, so request the users to test
> the mentioned series, and provide Tested-by.

I wonder if anyone in the list could help reviewing this?

-- 
Best Regards,
Artem Bityutskiy
