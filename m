Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXCG0-00011X-AJ
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 10:23:54 +0000
Subject: Re: [PATCH v3] ubiformat: make it work on mtd parts > 2GiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20090211090429.GA32207@www.tglx.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<20090210103354.GA8405@www.tglx.de>
	<1234337417.17790.123.camel@localhost.localdomain>
	<20090211090429.GA32207@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2009 12:23:40 +0200
Message-Id: <1234347820.17790.133.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-02-11 at 10:04 +0100, Sebastian Andrzej Siewior wrote:
> I have here a mtd part which is 3 GiB with a flash page size of 256KiB.
> The 2GiB limit is at erase block 8192. In mtd_is_bad() the computation
> for the MEMGETBADBLOCK ioctl() looks like the following:
...snip...
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Pushed both patches, thank you.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
