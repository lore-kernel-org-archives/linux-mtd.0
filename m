Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D9EC3524A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 07:11:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61342087E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 07:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIKOSUrb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ngvU0SDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61342087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mWUU1H3Cccyhr4V2qqxdUFxEn/nrnLG4xopkEyH3bqY=; b=RIKOSUrb8Dm+7y
	qHkInrbk8Hxi2jTc/oXcWM5OJbLMV7WDXdQxHxL0R1v3A8jlnweTi42icQNN4jmjAal+pUJ0bUKzg
	9YuApwR3L28xRcxg9U2yps0XdlQ9lA0cz194s9aVD0VWpzWzJFIZ6N8dpbCPN8Z8aOpFMu05H0exC
	+taqbcBBA3rywdEJ2AbS6PVcQHfMXngkl5BBhKx2cSNhnUQ74SNjQLIAEM+e8MGQHDS/sE08uCgxc
	igRVDBBA/UZZMpscOjOOPJ1oYE8j+PNVNZD4MjYmpw3rVaKIAYea1xfKHscWxWZV5u2fEOeymJmpK
	nNAhHazIGl/kO2gieHHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iysMR-0003n9-SR; Tue, 04 Feb 2020 07:11:03 +0000
Received: from de-out1.bosch-org.com ([139.15.230.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iysMN-0003mZ-T6
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 07:11:02 +0000
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 48BbSn3zh6z4f3lx0;
 Tue,  4 Feb 2020 08:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key3-intmail; t=1580800249;
 bh=dR0OCFMQPsXNo97crEg1yUxuzoykpIY59HiIsBMOCy4=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=ngvU0SDfIwPsI6uJFmP7Cb71BzkxFdztGDFGtXuJDjQci7pmJPDb5HRV9U2rDTQ8e
 gT5hrYgcFWDFPYX5WONHwLkcbCJ54CQRjrHdIp8bb6beDmXSl6qUQrYVBuY7wuf/5c
 PTEJ2+LR0XOiGTHwRJ/Rm6aPoOL3xN5QxPiw1OSY=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 48BbSn3KLZz38w;
 Tue,  4 Feb 2020 08:10:49 +0100 (CET)
X-AuditID: 0a3aad0c-747ff70000004730-dd-5e3918f9aa1d
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id F4.08.18224.9F8193E5;
 Tue,  4 Feb 2020 08:10:49 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 48BbSn1rRdzB11;
 Tue,  4 Feb 2020 08:10:49 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1847.3; Tue, 4 Feb 2020 08:10:49 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <sergei.shtylyov@cogentembedded.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: hyperbus: Add proper error message for missing
 compatible
Date: Tue, 4 Feb 2020 08:10:43 +0100
Message-ID: <20200204071043.3602-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SXUxTZxzGec+p9Nhw2OkBy9+6xnhccEHFgkOKLosku8BsClnijdFiK8e2
 owU8p8WPxFFwSyhTQRlE6iA1Ohj4wSzyrSJ1G34M06EhwmbbCy46IoIQjAxM1y9sL3b3vM9z
 fu+T8+QlcPqyUEroiowsV6TSM7EigWj7ddnmBchSym+3JCr6K5qFij/axoUK3/CMcCee46nz
 YTkdV8pyhp53Y3n4PtGnBaxeV8pyWz47KNIOjD+ILflWeKzfvYiZ0dKKKrSSAOoTOFt1PrYK
 iQiauoDBq8n7wtChH8ENZ3X40I7AfWlIGEBiqRTorakM6kRKCU/HW4Map2TQPPEyqBOor+DN
 uQ5BQAuoj2DodmWwjqR2wIjThoeq10L91Sos5IvhYcOEIHTPWjjVeREPaYBBrzf8/Tq4Zu1d
 UYM+sEYh1ijEGoXYEN6GJIdZealBnp4ll6dyapY/IU9LPVRssKPQlnE96LcrGgfCCORAGQTG
 rCIvORVKOl5dXHBcq+K1+ZxJz/KMlCx7aTlAJ7y3eZPaoON5XXGRAwGBM4nkN9szlDRZoDp+
 guWKQ5gDrSEETBKpIXL305RGZWQLWbaE5ZbTHQTBAPlakqWkxRyrYY8d1umNyzEjI1FMTAwt
 iU6iazFipQNtJeL83e1J/itIvkRl4HWaML46hNPLbgR9hDKlSWSy/xHRVCDVmoret0o/JN37
 tynpVVFBhJxELxCBmARyT6Awzv8wI31AmgMTicNmBEpv9TOUHYfaH/TQ1DOPYKTPKoSBwVEJ
 zDtvAjyYtcvAV9G6Dp7/M78eFno9KdDU5dsEbyu9qdBgXsqE02ceZ0PT6Hg2zFnLd0PdgjMX
 eiZG8sDSN30ALHabElzmmnxwdw0Xgnex0QA/ztRx0DFr4aH23T0T2AfuHAX32O8n4ZfuW+UI
 XM9c3yOYbv7uDIIL9/89h6DBZj6PJv2DYv5B13yhCAxqVBn/Z9CwG/lDqRlt2nc1sb795rtT
 3TvVw9k/7y37+JBs7utG5+NOWeX6KbPCsNs2mPyTpAd4V24nU/3rlPiG6dHn0801Wbq3Hl9B
 TIZOe+RifeGSPe3o/IzYgv39RLlY+xe0leQ1mnadHFN7NtqelI9u8ElL9bv+JFumK1K98Zu/
 FEDHVO/d1U89LkbAa1VpKTjHq/4DKHs/9jYEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_231100_608357_EE756DFB 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: dirk.behme@de.bosch.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case the compatible "cypress,hyperflash" is not given
output a proper error message.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2: Use dev_err and '"'

 drivers/mtd/hyperbus/hyperbus-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
index 6af9ea34117d..c1916cca1701 100644
--- a/drivers/mtd/hyperbus/hyperbus-core.c
+++ b/drivers/mtd/hyperbus/hyperbus-core.c
@@ -73,8 +73,10 @@ int hyperbus_register_device(struct hyperbus_device *hbdev)
 
 	np = hbdev->np;
 	ctlr = hbdev->ctlr;
-	if (!of_device_is_compatible(np, "cypress,hyperflash"))
+	if (!of_device_is_compatible(np, "cypress,hyperflash")) {
+		dev_err(ctlr->dev, "\"cypress,hyperflash\" compatible missing\n");
 		return -ENODEV;
+	}
 
 	hbdev->memtype = HYPERFLASH;
 
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
