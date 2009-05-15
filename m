Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4wJu-0006Pr-Ob
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 12:15:31 +0000
Subject: Re: [PATCH] MXC_NAND: Add correct dev_id parameter to free_irq()
	calls.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Magnus Lilja <lilja.magnus@gmail.com>
In-Reply-To: <17fbadcd7f353348afa4c56f92e0423c5b9708df.1241812369.git.lilja.magnus@gmail.com>
References: <17fbadcd7f353348afa4c56f92e0423c5b9708df.1241812369.git.lilja.magnus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 15:15:10 +0300
Message-Id: <1242389710.27996.235.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-08 at 21:57 +0200, Magnus Lilja wrote:
> Make sure to pass the same dev_id data to free_irq() that was
> used when calling request_irq(), otherwise we get a warning about
> freeing an already free IRQ.
> 
> Signed-off-by: Magnus Lilja <lilja.magnus@gmail.com>

Taken to l2-mtd-2.6.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
