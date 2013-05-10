Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaoaJ-00086A-Od
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:46:12 +0000
Message-ID: <1368197317.7916.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: set NAND_NO_SUBPAGE_WRITE
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Fri, 10 May 2013 17:48:37 +0300
In-Reply-To: <20130410223437.GA26900@home.buserror.net>
References: <20130410223437.GA26900@home.buserror.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 prabhakar@freescale.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-04-10 at 17:34 -0500, Scott Wood wrote:
> This controller only does ECC on full-page accesses, even though the
> ECC consists of multiple steps.  fsl_elbc_nand can get away with this
> because the ECC of an all-0xff region will be all-0xff, but this is not
> true with the ECC algorithms used by IFC.
> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
