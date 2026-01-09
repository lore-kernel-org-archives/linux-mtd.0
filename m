Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B660D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeShcS6+X+aDXk3hgiXsEKVa7CXkRdVKRtFrW+lJsSE=; b=4Plx4AC3hv/0wF
	KXnUIKjaNbh13pk9d0MK5nsG8AYXh6sa3r8m/R8uwYIjPjroznk/t+Y2mr2/yWA9G0SA+nwlm+t0j
	pIpSfUIWm+7qYhjAGJYC4sn0ekWOfDi33E4cqIWwnL6mk1FO6OQ742dMJBCU1E3SK+DSNevxWbbTd
	PkfuBSG76C3VUEqPYjJ4NrKGiUapYVLspt2NnM/YHbRV8IMp3oPXNs7hDIsYaDDybQyjt6KSP3+nE
	9XJ6IeEjbojOeyTdzN780CAu898eHUZcoqRhO+XWV2j3JEyDjrRYhN0X6uO97feC2x3WRNQOYbEmU
	E6SOf8aXi7wnWYBAE5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8Q-00000002mN1-1OYs;
	Fri, 09 Jan 2026 17:18:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8I-00000002m9Q-1QTn
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5CA24E42027;
	Fri,  9 Jan 2026 17:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7DBB606C6;
	Fri,  9 Jan 2026 17:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30F84103C89BA;
	Fri,  9 Jan 2026 18:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W6+rvBQGeoJcUuTU/Yf2GkJyCdo7KGLjvhpSVmkvjVc=;
	b=zMOUPjUAOqspSfsNt505s/8CA2O3cgcgg8yJCBsN+gMIijYLK6nlXFTeUmqT3tq1D9Wh6A
	BhfsXxv6b8HY5BBvdrUTKIIZ+auAQ0KLBLns82N4viG+TPr3cfVgIlS66v6U6b/SQoETgv
	E91jKZnLJZSxx06pWa+IspmvDc6U8GzKa6PJIdG21vI6K4LtR0hf1X3DcLqnQxxV6ogv6Y
	NfNj91UfwCAayJnH+iASo0wasO8/XiI+DG6BRHmLuRm35hvdea5CpuKxdF+a6wGA0YTE9I
	A2MaLXI2gbxl17zh+xOMJdJMQqYWypR+alewZYZhV6sbdv4V/5+svwg9Tm4GSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:16 +0100
Subject: [PATCH v2 18/27] mtd: spinand: winbond: Fix style
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-18-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091843_347303_7EC66682 
X-CRM114-Status: UNSURE (   8.82  )
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
index 1c13dba08369..7eade2251f7b 100644
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
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
