Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1kni-0005XZ-TG
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 18:57:47 +0000
Received: by fxm15 with SMTP id 15so2840686fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Oct 2010 11:56:56 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: add support for BBT without OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20100930192800.GA17730@Chamillionaire.breakpoint.cc>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
	<1285791064.1776.35.camel@brekeke>
	<20100930085111.GA12354@Chamillionaire.breakpoint.cc>
	<1285838065.11684.57.camel@localhost>
	<20100930192800.GA17730@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 21:56:50 +0300
Message-ID: <1285959410.32172.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-30 at 21:28 +0200, Sebastian Andrzej Siewior wrote:
> The first (sixt) byte in the OOB area contains vendor's bad block
> information. During identification of the NAND chip this information is
> collected by scanning the complete chip.
> The option NAND_USE_FLASH_BBT is used to store this information in a sector so
> we don't have to scan the complete flash. Unfortunately the code stores
> a marker in order to recognize the BBT in the OOB area. This will fail
> if the OOB area is completely used for ECC.
> This patch introduces the option NAND_USE_FLASH_BBT_NO_OOB which has to be
> used with NAND_USE_FLASH_BBT. It will then store BBT on flash without
> touching the OOB area. The BBT format on flash remains same except the
> first page starts with the recognition pattern followed by the version byte.
> This change was tested in nandsim and it looks good so far :)
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
