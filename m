Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LgnBb-00089X-SU
	for linux-mtd@lists.infradead.org; Mon, 09 Mar 2009 21:39:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by buzzloop.caiaq.de (Postfix) with ESMTP id F07AA7F4029
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Mar 2009 22:38:57 +0100 (CET)
Received: from buzzloop.caiaq.de ([127.0.0.1])
	by localhost (buzzloop.caiaq.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xt9LZJTT22Eb for <linux-mtd@lists.infradead.org>;
	Mon,  9 Mar 2009 22:38:55 +0100 (CET)
Date: Mon, 9 Mar 2009 22:38:55 +0100
From: Daniel Mack <daniel@caiaq.de>
To: linux-mtd@lists.infradead.org
Subject: PXA3xx NAND driver
Message-ID: <20090309213855.GA1366@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was glancing over the PXA3xx NAND driver recently and wondered why it
differs much from other driver implementations (it has its own list of
devices, does not let the core do the ident work, ...). Is there any
reason for that or would patches that change this be welcome?

In particular, due to this exceptional approach, the driver does not
benefit from the initial NAND reset command added in ef89a88013.

Thanks,
Daniel
