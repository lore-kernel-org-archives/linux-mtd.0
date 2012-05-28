Received: from 6.mo3.mail-out.ovh.net ([188.165.43.173]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SYtcO-0001hD-HG
 for linux-mtd@lists.infradead.org; Mon, 28 May 2012 06:39:54 +0000
Received: from mail91.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 1C804FF85FF
 for <linux-mtd@lists.infradead.org>; Mon, 28 May 2012 08:42:57 +0200 (CEST)
Date: Mon, 28 May 2012 08:39:58 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v9 0/3] MTD: at91: Add PMECC support for at91 nand
 flash driver
Message-ID: <20120528063958.GK3377@game.jcrosoft.org>
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, dedekind1@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21:24 Sat 26 May     , Josh Wu wrote:
> Code is based on 3.4-rc2
> 
> Changes since v8,
> 	use _relaxed read/write in most place. use writel in operations of Control Register since it needs memory barrier.
> 	allocate the data for PMECC computation.
> 	add pmecc prefix for related variable/functions.
> 	modify code according to J.C's suggestion. except:
> 		>> +	for (i = 2; i <= 2 * host->cap; i += 2) {
> 		> manage the j in the for loop
> 		since that will change to: 
> 		+	for (i = 2, j = 1; i <= 2 * host->cap; i += 2, j = i / 2) {
		why you insist on doing j = i / 2

		you can simplify it by j++

		or loop on j and do i = j << 1;

		it's more simple and faster

Best Regards,
J.
