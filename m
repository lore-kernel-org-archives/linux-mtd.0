Return-Path: <SRS0=bEc/=4X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9302AC10DCE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 08:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63AE0208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 08:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h1YgnvcB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msCi53q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63AE0208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I11oGIzfWZYYpWBlhUB7+DghI4cCWPdr6YpdYpUx/0w=; b=h1YgnvcBLcViJ+
	u+ZRrgjEm38Qgv+UpO6kwTqKXMv2MD1SDVGUI/gpJkIr+ItwpprhE6zPHnbu85h/9R4tWUP3FYf9R
	ylZYU8UDKYOTZXcmZulza1t6Z9J+vtaDdhzV0Kr5XQR7rqqNJGA4l61nSE/W2YZ5/Gc8D39Jrtea1
	D9MSop8DF3uCWKQsfIU5MSMIC2OFdM6JixYZwwIOFr6Sqwi23OFZn+lN642oUxq650ME/zPbMgdAH
	ObRoASMhy72oz9iDalH6xAbMtCX1NjpCVTqa/xvKbFuMXFUvkOFncY+YFA3zApEfRUHrf+f7kQgV0
	HXwdZS135dGZk1/OtV/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA8iF-0003OQ-Ux; Fri, 06 Mar 2020 08:52:07 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA8hy-00035y-3Z; Fri, 06 Mar 2020 08:51:51 +0000
Received: by mail-pf1-x444.google.com with SMTP id c144so777680pfb.10;
 Fri, 06 Mar 2020 00:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1MJfeELIuC6LsKgfyfQqa0z3Waht5G7PSNrYy3Wi+08=;
 b=msCi53q/ygvF5LxsC0mewd4cbGjJiaaBtvneNNCWDGd/w0WAoNfXuxHc6Lk5GHdaFS
 a1Ns/9mJlE5THiwNGi2R39qyvu2zYxQM7zinWhETTsZT+/7NceUy7RmhQ21ViWyf0yzu
 Y94sPYIzEdkQxDie5d9dBtaRnQHxmU2QoZmxBfht/O+w1Q0v2Xqneeb768RMigZvKnrG
 CcBWckHero/W8loNJJDYI/sf1SpsjucE2WeHJiNartnlcrUuoQZ0LPU8Cp1FY73JvXsL
 xBKGh3fHhtsRchNreq5rPydEcRRojCIuoEkgATinxKkygPaIokRVHb/p99SWM0dTVeux
 F9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1MJfeELIuC6LsKgfyfQqa0z3Waht5G7PSNrYy3Wi+08=;
 b=W6jdD3CCvEVQ0M6kfkDINBwhK98VQb+htHGy/PYBhGAcL4DPt1WaQ3QQC7JjygNQo3
 NkzlgSwXRmPPkBXGoKLcqOaOJ4wNxlbzJSmfjxVdfIYx3ScVPFsX7xc3xfinQgwnwr0R
 MBfZ1E3BlbcV0KLs0y4ej0epYxMFQBotgrTpu1WMia13IQHS0Yliq3e1GotpzA3mw/x3
 eKowyNE8dzw3A5dZ85wkoWdjDsVWEqxbwk0/9FPs5ThGX3hxbO/zr8P4Q5q1C23jyMbK
 mZKFr8XJW2p9h63u+qlbwcWeZU9r+2Jd0iUMKsFrmQGvXUFuFPMg2NR73IdmXpo8gTLw
 9CKg==
X-Gm-Message-State: ANhLgQ33rD7+Th6vbRCobQyS9sor57u5MTFdWEz6o5MhwkiKNcG8LpVH
 MIkObUFB5raRY3IHHMcAvhOOR2lBIHQ4Rw==
X-Google-Smtp-Source: ADFU+vvZtzx9vJU2zlECVhWq1gy1fL6yFa1ebwPi96Uawcx+c3SfXqdhvrpCHJ8ubSGB0rbU3cqkfg==
X-Received: by 2002:a63:1245:: with SMTP id 5mr2267008pgs.55.1583484709301;
 Fri, 06 Mar 2020 00:51:49 -0800 (PST)
Received: from guoguo-omen.lan ([240e:379:94a:b53:8200:7767:6b7e:4da3])
 by smtp.gmail.com with ESMTPSA id s23sm8527334pjp.28.2020.03.06.00.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 00:51:48 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] spi: make spi-max-frequency optional
Date: Fri,  6 Mar 2020 16:50:49 +0800
Message-Id: <20200306085052.28258-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306085052.28258-1-gch981213@gmail.com>
References: <20200306085052.28258-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_005150_188484_A85D77C6 
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We only need a spi-max-frequency when we specifically request a
spi frequency lower than the max speed of spi host.
This property is already documented as optional property and current
host drivers are implemented to operate at highest speed possible
when spi->max_speed_hz is 0.
This patch makes spi-max-frequency an optional property so that
we could just omit it to use max controller speed.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v2:
 none

Change since v1:
 new patch

 drivers/spi/spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 22baf204a09d..e317fb30329f 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1951,13 +1951,8 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 		spi->mode |= SPI_CS_HIGH;
 
 	/* Device speed */
-	rc = of_property_read_u32(nc, "spi-max-frequency", &value);
-	if (rc) {
-		dev_err(&ctlr->dev,
-			"%pOF has no valid 'spi-max-frequency' property (%d)\n", nc, rc);
-		return rc;
-	}
-	spi->max_speed_hz = value;
+	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
+		spi->max_speed_hz = value;
 
 	return 0;
 }
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
