Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7nMX-0005hy-EE
	for linux-mtd@lists.infradead.org; Sat, 23 May 2009 09:18:00 +0000
Subject: Re: [PATCH] MTD: Remove pmcmsp-ramroot.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Shane McDonald <mcdonald.shane@gmail.com>
In-Reply-To: <E1M0HJu-0007HN-7j@localhost>
References: <E1M0HJu-0007HN-7j@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 May 2009 12:17:26 +0300
Message-Id: <1243070246.21646.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Marc St-Jean <stjeanma@pmc-sierra.com>,
	linux-kernel@vger.kernel.org, ralf@linux-mips.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org, hch@lst.de
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-05-02 at 09:40 -0600, Shane McDonald wrote:
> The RAMROOT function was a successful but non-portable attempt to append
> the root filesystem to the end of the kernel image.  The preferred and
> portable solution is to use an initramfs instead.
> 
> The only user of this function was the msp71xx configuration
> in the MIPS architecture; as the use of the RAMROOT has been removed
> from that configuration, there are no more users, so this code
> can be removed.

I've taken this patch to l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
