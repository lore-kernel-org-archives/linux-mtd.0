Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcWXu-0002Qd-6K
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2011 05:45:43 +0000
Received: by iyn15 with SMTP id 15so3131842iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 22:45:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd/nand : don't free the global data
	fsl_lbc_ctrl_dev->nand in fsl_elbc_chip_remove()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Fri, 01 Jul 2011 08:40:21 +0300
In-Reply-To: <20110630112656.3257116a@schlenkerla.am.freescale.net>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309328435.23597.104.camel@sauron>
	<20110629114558.13975519@schlenkerla.am.freescale.net>
	<1309434797.23597.178.camel@sauron>
	<20110630112656.3257116a@schlenkerla.am.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309498826.23597.200.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
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

On Thu, 2011-06-30 at 11:26 -0500, Scott Wood wrote:
> If the NULL assignment is dropped, consider what happens if the
> fsl_elbc_nand module is removed then reinserted.  On reinsertion, it
> will
> see a non-NULL fsl_lbc_ctrl_dev->nand, and will skip allocating a new
> one.
> Then you're referencing freed memory.

Oh, then this sounds like a separate bug. Removing the module should
kill everything, and re-inserging the module should have zero
dependencies on the previous states...

Anyway, if you think the original patch is OK, I can put it to my tree.

-- 
Best Regards,
Artem Bityutskiy
