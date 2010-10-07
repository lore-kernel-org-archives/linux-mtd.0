Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3vxo-0005yx-Na
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 19:17:13 +0000
Received: by bwz2 with SMTP id 2so192193bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 12:17:10 -0700 (PDT)
Subject: Re: [PATCH] mtd/nand.h: cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20101005104101.GA18714@www.tglx.de>
References: <20101005104101.GA18714@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Oct 2010 22:17:06 +0300
Message-ID: <1286479026.1797.3.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-05 at 12:41 +0200, Sebastian Andrzej Siewior wrote:
> - *var instead of * var
> - proper multiline comment
> - func(args) instead of func (args)
> - 80 lines
> 
> So from
> |total: 2 errors, 37 warnings, 654 lines checked
> we got to one warning.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Pushed both patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
