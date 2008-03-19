Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jc2Ht-0004Lz-LY
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 17:41:18 +0000
Date: Wed, 19 Mar 2008 12:41:04 -0500
From: Scott Wood <scottwood@freescale.com>
To: Mike Hench <mhench@engagenet.com>
Subject: Re: [PATCH] corrected MPC8313 NAND fixes
Message-ID: <20080319174104.GG7962@ld0162-tx32.am.freescale.net>
References: <6629C06B144F5C4098DFF95C4FF9DAF702BA1D11@mailsrv.engagenet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6629C06B144F5C4098DFF95C4FF9DAF702BA1D11@mailsrv.engagenet.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 19, 2008 at 12:40:15PM -0500, Mike Hench wrote:
> Fix a race condition in fsl_elbc_run_command
> Fix incorrect usage of clearbits32 that bashed option register
> Remove work around for bashed register
> 
> Signed-off-by: Mike Hench <mhench@elutions.com>

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
