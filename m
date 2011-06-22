Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZG45-0003Sl-Pq
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:33:26 +0000
Received: by pvg20 with SMTP id 20so287638pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:31:38 -0700 (PDT)
Subject: Re: [PATCH] powerpc/85xx: fix NAND_CMD_READID read bytes number
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shaohui Xie <Shaohui.Xie@freescale.com>
Date: Wed, 22 Jun 2011 08:32:20 +0300
In-Reply-To: <1307931792-30386-1-git-send-email-Shaohui.Xie@freescale.com>
References: <1307931792-30386-1-git-send-email-Shaohui.Xie@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308720745.18119.32.camel@sauron>
Mime-Version: 1.0
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-13 at 10:23 +0800, Shaohui Xie wrote:
> when nand_get_flash_type() is called, it will read 8 bytes of ID instead of 5,
> but the driver only read 5 bytes, so kernel will dump error messages like:
> 
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
> fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
> 

Thanks!

-- 
Best Regards,
Artem Bityutskiy
