Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P12zc-0006uQ-D2
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 20:11:08 +0000
Received: by bwz19 with SMTP id 19so1176164bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 13:11:07 -0700 (PDT)
Subject: Re: Add support for BBT without touching OOB area
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 23:11:00 +0300
Message-ID: <1285791060.1776.34.camel@brekeke>
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

On Wed, 2010-09-29 at 19:43 +0200, Sebastian Andrzej Siewior wrote:
> Without this patch (number three) NAND controllers which use complete OOB
> area for ECC information can not use a BBT at all. The vendor bit is
> gone after the first write and the flash BBT stores a marker in the OOB
> area. The patch simply moves the marker into the data area.
> 
> The series contains:
> - [PATCH 1/5] mtd/nand: use ALIGN where possible
> - [PATCH 2/5] mtd/nand: pull in td into read_bbt()
> clean up.

Pushed these to l2-mtd-2.6.git.

> - [PATCH 3/5] mtd/nand: add support for BBT without OOB
> adds the functionality.

Sent some minor requests.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
