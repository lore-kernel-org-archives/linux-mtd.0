Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2037C48BF9
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Nov 2023 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLLr95cmGsu+kqMjGPMqgovesD0alX1cQlIUwYoVfy0=; b=NTndKznxZdwYw+
	3/CYx9pzVM0Rz7z4yicLUx1QQ3D4XnBXh4bv3DZN/2/qFGRj29TiHEJyABSCHXD2+MivXe1MXib6K
	B+iVD7WHH4dOztXP2/AkaawyHbH8cyvO5+VirlWeJ9HLb0F9qRmC5OADeMp+sgwUnMofdlTAj/psh
	BTfBIs/zjlM87U5qe5CpA1lCmzWO1II8ukO1jtPHcFdKPQ/1yQLqR9zupGVbENnpEh46rqwqzz+MU
	5kK2Zby/fia9HCKY1Vh8Lvt8YSeiWzosmyaJd8L3VUb86iEa+F8G5JrbQsGJhChAWAry90UXVGjg2
	ATQZ548VLgPcEyKmhRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3GRR-000vbf-30;
	Wed, 15 Nov 2023 14:00:29 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3GRO-000vaA-0p
	for linux-mtd@lists.infradead.org;
	Wed, 15 Nov 2023 14:00:29 +0000
Received: from Vostro-3710.lan (unknown [58.61.140.31])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 63E288000B5;
	Wed, 15 Nov 2023 22:00:13 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: miquel.raynal@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	vigneshr@ti.com,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND flash
Date: Wed, 15 Nov 2023 22:00:09 +0800
Message-Id: <20231115140009.1729640-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114123008.185071-1-amadeus@jmu.edu.cn>
References: <20231114123008.185071-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEtPVkIdT0hKHR0YSB9DTVUTARMWGhIXJBQOD1
	lXWRgSC1lBWU5DVU1KVUpPS1VISllXWRYaDxIVHRRZQVlPS0hVSkxKT05PVUpLS1VKQktLWQY+
X-HM-Tid: 0a8bd3485011b03akuuu63e288000b5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzI6Fgw5FzwwA0wKMzECCE9M
	FRMaC0xVSlVKTEtLS05NQ0pPSkNNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPS1VISllXWQgBWUFKSUlONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_060026_483737_3C85F107 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

However, the NAND ID of this flash is {0x98, 0xa3, 0x91, 0x26},
the last ID bytes is missing. Maybe this patch should be put in
OpenWrt as a hack.

Thanks,
Chukun

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
