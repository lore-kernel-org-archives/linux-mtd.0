Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3410AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xO+usrP29/CJ8pHYWV6wxM7njZokiu91F54mdHHugm8=; b=ZogX1svYW+NcyK
	E7Z3FVeTPe/pFtyUbC2er+YqOCSCHoMCPW4O4bwZXiWY+aDtx82oLDiEjTp6uAvLaUt+VrAksQ89T
	CyW/Gi0NgmtEpXejIPjafxszgJ9o2anC83roC+ukSlHK6/1Ona4k35BUydYJ/zTudkEDa35rzq5HO
	ebcDIwbTiaQN9z/jtvlC4PNc1fDWd/DgsYz7XaiWf/d0JZ+hMQqVOMilbj11NLODRZE/QgvmnRnzx
	go6fwHg3aqg+U8KOp4G2/w7N7to+CZRxNltGLlPiq9so42Dw3v5dtQhb+xHsC4bM4tTdedfCyFBt5
	awpiGdjZscJvCV3K1Pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIPD-00DwCk-AF; Mon, 04 Apr 2022 08:49:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIN4-00Dut8-9q
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2C3E1BF209;
 Mon,  4 Apr 2022 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNAxKX1DSgvz6AgiA/E8PDeYrkr/tq8/0jpvO7zkYKA=;
 b=MWyMzEJux6rUSkSI4iNvYHWv4pptdpWTTAYtJtnj4JYhcFk2awEYuxWRvofXaFDY5GqpqL
 Reef/ZEeNPsMTmdf6OEp1/CI4ZnnCT3Xo3q2yyMks0DnOB/32eLObnJjQvkSk23aXOfmQW
 ycmRuTH3eR2LKXQ4xW09xx/nyP9krkRg/4XwZebyPwaW99ojZoquI4ENd5EeGF5axZF34x
 zTTvmOpzrSDFogMtxoFxCIV5uHrLPxpdgmggi1Jp6zxNk/tUF15cAmfaUdZqsToIOCrOr1
 WxgUAu52/YJpkI+bWj1Uh3XQjcqiN9pgYB5ppuVj3K1qxKntMg5X4c86gf0xhQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wang Weiyang <wangweiyang2@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, paul@crapouillou.net
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: rawnand: davinci: Remove redundant unsigned
 comparison to zero
Date: Mon,  4 Apr 2022 10:47:30 +0200
Message-Id: <20220404084730.1203812-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317113907.96006-1-wangweiyang2@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6425dd136ddc40fc434156d1957a3adb367dd874'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014734_559786_729A493A 
X-CRM114-Status: UNSURE (   5.23  )
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

On Thu, 2022-03-17 at 11:39:07 UTC, Wang Weiyang wrote:
> Since core_chipsel is uint32_t, comparison to zero is redundant
> 
> Signed-off-by: Wang Weiyang <wangweiyang2@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
