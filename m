Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4maq-0003IB-8Y
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:19:56 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 00/20] [MTD] Namespace cleanup for MTD drivers
Date: Tue, 25 Nov 2008 02:54:51 +0200
Message-Id: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

It has come to my attention that many MTD drivers needlessly define
their module entry points as global symbols. The patch series that
follows fixes all such places that I was able to identify. Please
consider.

Note that I'm not subscribed to linux-mtd, so please Cc: me when
replying.

Thanks,
Dmitri Vorobiev
