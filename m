Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQMwH-00035X-7D
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 22:27:17 +0000
Message-ID: <1454365611.2486.18.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Raghav Dogra <raghav@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Cc: prabhakar.kushwaha@nxp.com, Jaiprakash Singh <b44839@freescale.com>
Date: Mon, 01 Feb 2016 16:26:51 -0600
In-Reply-To: <1454323598-5149-3-git-send-email-raghav@freescale.com>
References: <1454323598-5149-1-git-send-email-raghav@freescale.com>
 <1454323598-5149-3-git-send-email-raghav@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] mtd/ifc: Segregate IFC fcm and runtime registers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-02-01 at 16:16 +0530, Raghav Dogra wrote:
>  /*
>   * IFC Controller Registers
>   */
> -struct fsl_ifc_regs {
> +struct fsl_ifc_fcm {
>  	__be32 ifc_rev;
>  	u32 res1[0x2];
>  	struct {

This struct is not specific to fcm (i.e. nand).  Please choose a better name,
such as fsl_ifc_global (which would match "gregs").

-Scott
