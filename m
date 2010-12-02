Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNzjf-0005zw-SJ
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:21:33 +0000
Received: by bwz5 with SMTP id 5so7093061bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:21:28 -0800 (PST)
Subject: Re: [PATCH v2] mtd: Fix section mismatch on sst25l
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
In-Reply-To: <1290789104-1097-1-git-send-email-fabio.estevam@freescale.com>
References: <1290789104-1097-1-git-send-email-fabio.estevam@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:21:22 +0200
Message-ID: <1291260082.14534.1.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-26 at 14:31 -0200, Fabio Estevam wrote:
> Building the kernel with 'make CONFIG_DEBUG_SECTION_MISMATCH=y´
> 
> resulted in:
> 
> WARNING: vmlinux.o(.data+0x15938): Section mismatch in reference from
> the variable sst25l_driver to the function .init.text:sst25l_probe()
> The variable sst25l_driver references
> the function __init sst25l_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
