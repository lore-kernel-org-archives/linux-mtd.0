Return-Path: <SRS0=BOQa=Z4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C468C43603
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 07:55:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B1324679
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 07:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HD7cVacH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFme/k2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B1324679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZSZuIaMoQaaU4iWwk+JZnN3guwMZSrE/qP3rPyLTNg=; b=HD7cVacHaXOroQ
	i0QW6lGi9cpNjJSjTVdoia0Cv+Nz/KN96h4jvo96mvWXciiOMZ93LWnyeHwR+w1NLdU/xWPb0YzKB
	clzek79t5k59oKvhjGpAMLLDs5DKZV2V3JvfknFpU8DbLlP9G3OIqN8Xzc9rMpOLqPeRA6eeKQxQ3
	oiCYPQe/UdCNkk2ebkBI5W5m514evZ46WKkTSZ4wgs2MyRUy72pVBPDOqkNxLvr6q2F+KJFzTs25G
	0tZCAhg5QKia9nikcrDTeTtIUAen/k+VzuTDziZtmDbMdbskO0LQfMANQdD3xDIM2EyYDE97AHb4l
	1FPvJAGcfYZdb8Wi4Hvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id8Rs-0008Np-8v; Fri, 06 Dec 2019 07:54:48 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id8Rn-0008NV-MS
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2019 07:54:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id b19so2939129pfo.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2019 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCW5VMW21UdkUKTUCSUYd61ML4nHTS7PPrpSiynrJjw=;
 b=HFme/k2EqX2k998O/GLO4fdZ5etH0xf7xIgs2TLsf+M9Z7XMhH9XY3yZRYKYdE4d+E
 g3axjO1b7DNonM8DtkoK4CHOj+4sX1lRI7MdrpGWm0fJmenVTV5wuiEz9WgznOV4PQ/7
 KfuR25YvdYTGOpc9Sk73EPFCRi5ONvPW4zZ5NUD9pr+KnfqyTcCI4rdkg8eVqlUZiv23
 pjyW4dk4CVkXmz+oW9kRawRESVIaAGzrIYj3rqEgJiyoWeWdH1L2wSFZ2enVUSoS75ac
 uvJxobHDhR7AU/UC5ubmbTreqVw+KofVWr/rRFf4pG9CPNHQBoGZY/rg2dywKxsoqoCT
 pI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCW5VMW21UdkUKTUCSUYd61ML4nHTS7PPrpSiynrJjw=;
 b=jwku0qhrBDDmqyAzWpz/9RRUHEj76WPCFEjdvjaRBuPlqeNz/MSImqqZK2bnJugEqt
 jGSF5EimC+OuRc2TsGAkaf0HDSA3kgypV/FYyFVUdgw+kxiRvHQS06eXHvy7/9U8M+9G
 9kPCo8znTcV1wi5LhSItdYZwLATbDAX4adlm74+b7ddfC2pBd2CFxVU3FmiLdEZg4t7y
 hTL0vZvMRzApGiXlLiZ7d4knVaSsyfNP4yLwFQ8BynEU0HtAceJgNRx2hXfKiDjbdUyb
 /jUl3gTshztDxmyGGuwMGTCrC4aCK/v3le4xgwMZVx1cZceNmb6gsUem2xBGhqhB0Hd8
 PaLQ==
X-Gm-Message-State: APjAAAVCebKgGBAvRxHnggP+K6C3L2ceka/qzXkS04vJ2zpqZZYrov9u
 q/L49s9y9XhmoM11s5w5EKo=
X-Google-Smtp-Source: APXvYqyW+WX0JATiKms6lA2rPwM44L3R+y211/aEe34G6rjCIIEv/qUtnFeVuj1dH+SXVHd2zKtNXA==
X-Received: by 2002:a63:cb:: with SMTP id 194mr2080799pga.163.1575618883018;
 Thu, 05 Dec 2019 23:54:43 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h5sm16159622pfk.30.2019.12.05.23.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:54:42 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] mtd: rawnand: denali: add missed pci_release_regions
Date: Fri,  6 Dec 2019 15:54:32 +0800
Message-Id: <20191206075432.18412-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_235443_732095_5068F7A0 
X-CRM114-Status: GOOD (  10.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver forgets to call pci_release_regions() in probe failure
and remove.
Add the missed calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/mtd/nand/raw/denali_pci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index d62aa5271753..ca170775b141 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -77,7 +77,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->reg = ioremap_nocache(csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_release_regions;
 	}
 
 	denali->host = ioremap_nocache(mem_base, mem_len);
@@ -121,6 +122,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	iounmap(denali->host);
 out_unmap_reg:
 	iounmap(denali->reg);
+out_release_regions:
+	pci_release_regions(dev);
 	return ret;
 }
 
@@ -131,6 +134,7 @@ static void denali_pci_remove(struct pci_dev *dev)
 	denali_remove(denali);
 	iounmap(denali->reg);
 	iounmap(denali->host);
+	pci_release_regions(dev);
 }
 
 static struct pci_driver denali_pci_driver = {
-- 
2.24.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
