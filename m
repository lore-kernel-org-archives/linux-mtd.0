Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D53C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Nov 2023 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qs8fkJfi5yDQS46Imw8F5hiUbKqar5Kjzhu1RelgdsI=; b=sdcaNqzzyPLr/k
	kHccN25ZehsnhMqEpHIeR/k9v+9O/ryLxXuENrG/LApxuFTEYzSU6czfZfwpSmVZoGMlcOxxYW7UB
	L4NMvLc7W5mDuO3Cto9EVaOfqU+jrfCfDOElpKCa6kJmv2WyPJHDOURlu9QLv8orhg6oT0Q/x4jS2
	nUugaawtsRZb5jf44VzF2CmZCXynTSxEN46Ah+yu8R/UOzWqYxUtRA5zi+79U/BC/12iYLiRHzOlQ
	tBFI7xtIzm63L6tzniiWIT+CEDouaACeNKMrqhMSQzrMgTc52c+JPNqVIsL2MFyACdU0EYrKmkNQN
	wo8Zb+Oskzpiqzj7e4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2sYt-00Ftpr-0A;
	Tue, 14 Nov 2023 12:30:35 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2sYo-00Ftoj-2Y
	for linux-mtd@lists.infradead.org;
	Tue, 14 Nov 2023 12:30:33 +0000
Received: from Vostro-3710.lan (unknown [58.61.140.31])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 2EB4A80010C;
	Tue, 14 Nov 2023 20:30:18 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: miquel.raynal@bootlin.com
Cc: amadeus@jmu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND flash
Date: Tue, 14 Nov 2023 20:30:08 +0800
Message-Id: <20231114123008.185071-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231029144840.484facee@xps-13>
References: <20231029144840.484facee@xps-13>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh9IVkhMQkJPS09MTR5MTFUTARMWGhIXJBQOD1
	lXWRgSC1lBWU5DVU1KVUpPS1VISllXWRYaDxIVHRRZQVlPS0hVSkxKT05PVUpLS1VKQktLWQY+
X-HM-Tid: 0a8bcdcfa0fbb03akuuu2eb4a80010c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MS46Pww6GDwrLU9DPjlLMRVL
	MzNPCRJVSlVKTUJCQk1OS0pDQk9CVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPS1VISllXWQgBWUFKT0hCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_043031_018130_B86AE42F 
X-CRM114-Status: UNSURE (   6.27  )
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

Hi Miquel,

> It's more like a request than a question. Please fix the parameter page
> at run time by registering a ->.fixup_onfi_param_page() hook in
> Toshiba's nand_manufacturer_ops structure.

Sorry for the late reply. This flash is not ONFI compliant NAND,
so onfi fixup can't work. Datasheet available at:
https://europe.kioxia.com/content/dam/kioxia/newidr/productinfo/datasheet/201910/DST_TH58NYG3S0HBAI4-TDE_EN_31565.pdf

Thanks,
Chukun

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
