Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvS6F-0003bE-P9
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 10:51:24 +0000
Received: by yxk8 with SMTP id 8so4182177yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 03:51:20 -0700 (PDT)
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Mon, 22 Aug 2011 13:53:08 +0300
In-Reply-To: <1313634783-8855-1-git-send-email-b35362@freescale.com>
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314010393.2644.110.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, Li Yang <leoli@freescale.com>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-18 at 10:33 +0800, b35362@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> to support the Nand flash chip whose page size is larger than 2K bytes,
> we divide a page into multi-2K pages for MTD layer driver. In that case,
> we force to set the page size to 2K bytes. We convert the page address of
> MTD layer driver to a real page address in flash chips and a column index
> in fsl_elbc driver. We can issue any column address by UA instruction of
> elbc controller.
> 
> NOTE: Due to there is a limitation of 'Number of Partial Program Cycles in
> the Same Page (NOP)', the flash chip which is supported by this workaround 
> have to meet below conditions.
> 	1. page size is not greater than 4KB 
> 	2.	1) if main area and spare area have independent NOPs:
> 			  main  area NOP    :    >=3
> 			  spare area NOP    :    >=2
> 		2) if main area and spare area have a common NOP: 
> 			  NOP               :    >=4

Could you please also add this kind of info to the driver code comments?

Does it also make sense to print a message if you do the emulation,
like:

	pr_info("attention! emulating 2KiB NAND pages!");

-- 
Best Regards,
Artem Bityutskiy
