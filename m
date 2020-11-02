Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A764AC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B604223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXnEtxPB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="moD0ijFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B604223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YSJnXZcGj0dt4nII4W4UG8Dl5PjleOfF6c6Vmo4BcE=; b=gXnEtxPBAYlBXDT5SaoorGI0z
	ipNpN/Z5S+LUyywKdNKiLgiYmbwSlyUwJi/d2i4bXkUNcApV2qkSoEdj4tGkf/23JcUfZqvZzQPPi
	JFaGLazK/pgZJ2nhkHu0c85bPD0fFidnF1QA9XMFJetbhkWouriX8AXPfbo6YTV95pPd0vT9xOU3a
	XBZavpjiJH0kX7WXYaiaRQ+h2QMRMuWMVtGW8t9HGSzI8y+so5k2uXEgrM8+1Dvltwvir6blkR65m
	E6ca3+rVpGQplymRZlXbrm15HPYJQTi6YJwckWdLJToE0i16XbdlFaIxwic5gWTbC0n76c43n2XTW
	0W5WzV24A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYQy-0002Mq-EH; Mon, 02 Nov 2020 11:55:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPn-0001uo-Ft
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id k10so12906055wrw.13
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgCfvBJWtLw81z7RjPwr6bormd4FsaQ3wcZ4l8FFWRs=;
 b=moD0ijFtxs3YDF9szj7mvVpXUGbBcJvo25U/w2SGBdKEu2CJe2/R9I45WDZ0zBMghV
 33Ou3U3Z8oI1pYoV1NDil2EEJmk2Jk26h50Eo1qoCzP5PKJ05JjvVMb8Hg2emu5oXtdO
 G/G5/2QBDvcV+xwQHea1IkLwNPNqIpDoKKtCJZjyk+mYoSrpc43UQ53YC9Mfb/ICtOEH
 1KKjRHcQwq3w9Rud0CHnJYkCGpLRFKJe3xaOCRePtSzfvCimRfWnJ3r9d6/PGbghlgae
 SXipOAv3fpd6hLpmhNQhXlntG8L3Ky/YcpO7LvVTqTa91x+Pd4Hbd477hn6dmOeA5sMh
 mvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgCfvBJWtLw81z7RjPwr6bormd4FsaQ3wcZ4l8FFWRs=;
 b=r23cG4j1IFbJDHPioR7mXxNG81308vus0dnN95l0TSpd4NHV7kpCWgNshvajLMZL9o
 zZwRCqeYDOhU2GPYZaPBYqmiOnRcRWOGJtkQXSR7kgEeYvv3+AJv/tWga7nBUwWo5VyS
 J2tdagG3hyDnn9u4GBmDw0tvCFdJAzAK+kYwEU3CEbn1za9NulHHTYhQE8yLHmOR18ec
 GgTcCBQbYD+niKKQOpnMia72PcNCEmrwGtXNWETLMgSfB0iSFy4qrjRkBxxQ+4aUw/jD
 02aIH9+zNlUWj1aTyauh/KWlKR+FTAbNpVK0fSYIPW65t0UzX36jD5e7z1EKfja4F+EM
 TiJA==
X-Gm-Message-State: AOAM532Ryv1qz6Zk6MxhHleQMspVz6xRJy47Sq2X9Gzt/5KAM5W3NNWn
 1DpWieWK85up1f2MiFEB6PFxUg==
X-Google-Smtp-Source: ABdhPJy4Qc6S807GOZhDFOw1vxX6caxNriQqJXpn9auBPJu7Ej+kcF0sDBj8+ECN81+2ejh4BB/VTA==
X-Received: by 2002:adf:804b:: with SMTP id 69mr19675757wrk.274.1604318062508; 
 Mon, 02 Nov 2020 03:54:22 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote
 non-conformant kernel-doc
Date: Mon,  2 Nov 2020 11:53:50 +0000
Message-Id: <20201102115406.1074327-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065423_800310_7F8063D3 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jOjMyODogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbnAnIG5vdCBkZXNjcmliZWQgaW4gJ2hpc2lfc3BpX25v
cl9yZWdpc3RlcicKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYzoz
Mjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNj
cmliZWQgaW4gJ2hpc2lfc3BpX25vcl9yZWdpc3RlcicKCkNjOiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+CkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29udHJvbGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29u
dHJvbGxlcnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlz
aS1zZmMuYwppbmRleCA5NWM1MDIxNzNjYmRhLi43YzI2ZjhmNTY1Y2JhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMKKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jCkBAIC0zMjAsNyArMzIwLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzIGhpc2lfY29udHJvbGxlcl9v
cHMgPSB7CiAJLndyaXRlID0gaGlzaV9zcGlfbm9yX3dyaXRlLAogfTsKIAotLyoqCisvKgogICog
R2V0IHNwaSBmbGFzaCBkZXZpY2UgaW5mb3JtYXRpb24gYW5kIHJlZ2lzdGVyIGl0IGFzIGEgbXRk
IGRldmljZS4KICAqLwogc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRl
dmljZV9ub2RlICpucCwKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
