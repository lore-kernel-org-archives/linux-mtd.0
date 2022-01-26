Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5246C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPS3txIny2+zLstVEr6mPF8Cni5rglV30hIooddR8Q4=; b=0zwDL9cCo6kpg7
	mQZb1HhrX1T1f+sIgYMIAI8kkwMezwC7/4SildrVSz9cqFtvQg/vQ7Rh5LYIcN0dPqHTEC+8h9QLh
	aqbO34A0R0j+tn1tFDbxe+AYwdrpDrTD4Q2afgXUlTByk44bSLGme6hVs5RdoH/9cFybPlREv0iB/
	pXW7mhN79vGXp1pSQvak2uHEZthb5yGaPDiLLcAAEKqlsO6t1VTSx/Cuhv9bwjbK6jzvuzHxkpiWT
	QN1d2SWI4kx+PH6BY7FPKsyPobhlWIt4GSbPXAnrnr2JDquJQhq2sthDIb7ajZHl8sYibcbxatI/f
	BoWRUdVnwxkamv2OewJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfvr-00BL7N-Hn; Wed, 26 Jan 2022 10:53:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfup-00BKkj-PY
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:52:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB83DFF810;
 Wed, 26 Jan 2022 10:52:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 11/13] spi: mxic: Create a helper to ease the start of
 an operation
Date: Wed, 26 Jan 2022 11:52:36 +0100
Message-Id: <20220126105236.882612-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-12-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'260dbbafec49e720323ff6f706bc75bf2c073d91'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025239_990066_6563EACD 
X-CRM114-Status: UNSURE (   6.81  )
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

On Tue, 2022-01-04 at 08:36:29 UTC, Miquel Raynal wrote:
> Create the mxic_spi_mem_prep_op_cfg() helper to provide the content to
> write to the register controlling the next IO command. This helper will
> soon be used by the dirmap implementation and having this code
> factorized out earlier will clarify this addition.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
