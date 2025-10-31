Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A13CCFA03
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX/px59Pr4fr9LQcQkntvRXP9FCJf6G49M4iikpMJxY=; b=4g8bCXq+AqyS4i
	QljR5s/L24CUWf/ion692IAhIm4Pk+U/+dUJ93jeI5b0Zj/qZWuiuwzygMchaBQDe+7i610yy499p
	XwgMhk0tPtwu2Uj5NERaBqEAhTsGV4f3gMvezFMsYusSPQJxoYHbpg9FFHWVh1E+8BYXR1RaFtPz1
	XTv7gLdM4zzfWVlrMxJjh0kHASu/YLfbYGCoaKlP4rsUvOTEdLIVfnySOxcyNcXn8Y9xIlX9WrW98
	97C0EyHPu5s9IOT/qlJRhibyR6leUKdiC0bQtOQDu8PPOx3NpkE9DzyU7RqEzTcoy5QyAm4Akhlrx
	H415t1gyNVHiiI05Wf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswU-00000006Vfw-3G4f;
	Fri, 31 Oct 2025 17:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvg-00000006Ufv-0sy1
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Oct 2025 17:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5pi4CcvcO27jDmf/e7y4SHnPB/Y88k3Vae3Xm2yNuow=; b=rZEdFH7IDEzKjOfGd0Eai/eIVS
	qFMSkknaq1LJSwPBadmmgA7MPSrzaM2nPV47704UNY80rOB3QvBkrHJcde6NSWRHn+K677bnn+w36
	emH6nnp7xXFFYsPHFYZnrrKxHEZgwbVNHGQyhuf3N3fwGnBPbPULiNGo7KLH4/0twAd9ohyLotPve
	UJd6tf6pEP+59/muCh2nCFqq719TgZQ0GANlcp2MaFUL4ECTsBlbArIY7ohIhKJEvk3EQfGkm/1mL
	n7w2iB9zSGCdFiiEAcdMFMhEPuJ2WHCuMilm9TfIAjs0AUrufP5XwkzTr1RKcPNykQqxqqWGrYbpZ
	YYySc7lg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3u-0000000BkeL-0bBr
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8D0A14E4143F;
	Fri, 31 Oct 2025 17:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BCE60704;
	Fri, 31 Oct 2025 17:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 040A911818007;
	Fri, 31 Oct 2025 18:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5pi4CcvcO27jDmf/e7y4SHnPB/Y88k3Vae3Xm2yNuow=;
	b=Gk/w51kCU/8d4KkH+9PASySJzs9qCVlS7IgkATDswIySEf3g5XXTHBoIm3aAPcd+KhFtSU
	n3mJNRowcOMb58j+hXlbBDah4ACTL7v80ILDeN8NZkTHbjMHnlep3h3m1HQRRAIGDRNBxT
	cbzYcNgqTXu0kGbQ7cSiGv5xCZdittHtcOwnSyBEz6QnbaGJQijElzAIy/QwEGqx7kKtBy
	B454EXMpQabzAiSQMe9ZJHK4XP6KGXGjOT4saGINarKf/oNYFwunUhA3KEbHk5G6SV5IoH
	Ea8U76zlUZR/CYl4UrLL3PpgFA2+93IfiJAw13nYvBxwN843pT7cTj0qDF8fZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:03 +0100
Subject: [PATCH 19/28] mtd: spinand: winbond: Fix style
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-19-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_163314_334773_0486AFD8 
X-CRM114-Status: UNSURE (   8.24  )
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

Add a missing new line in the middle of the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1c13dba08369c48ca26381c634abcea4e7360f30..7eade2251f7b5b2a96c0a7528ca6d64ba6d8233e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -408,6 +408,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	default:
 		return -EINVAL;
 	}
+
 	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_DUMMY_CLOCK_REG, dummy_cycles);
 	if (ret)
 		return ret;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
