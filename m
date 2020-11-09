Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB03AC388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3542E206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ZPckYRI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5ipTHd3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3542E206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U2qQDQ1GZNoYh5+3bCaHAfsFV+3oZIgi7dGkGWvNuZc=; b=3ZPckYRIHXH3XV5YzEfuprriI
	u/r58OHxDY2Yi1SVJwhrJkF/4LMJ+Eabh+514Hu0gTIiYRe7H8lEA01aLv/SHKQDYYPBtYQn6GJ6U
	vH1bwzs7vO5CkoaEedgK7If/XD3LJvwlhXEFFmOAJI7Zqm9WLVfJb7L4iqEbaOiC2sifwrz2oU0W5
	5WHfSOJ/DLKCP+PWKUrfCtX1Y713ajCYKjNorc84+qXl/05Rq2vTD+xp1esiBHcZBIHjawqGVbUIb
	5kJdDMdvBGzl5+Mqikc0BKE6xU4sR8BSdzY0igJclbtyTbRiY6l1a4OVjaDKSQlAsN5mIp/iw5sHQ
	YVGqd1T5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBpD-0001Kr-Oh; Mon, 09 Nov 2020 18:23:31 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoF-0000rT-Ff
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id v5so404155wmh.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=E5ipTHd3WeDI78ksj0wsN8ta6sheG/AQB8BQ8iXDHY5Vcd5UP94Rmeb7qV39CI/m/s
 b/TNUumxNIHspIcHhdFCsiyjqRYTDi6pnvzjl7SpwuZ+Oxt03xpdAj/3MRJXnqIcQqWJ
 2CWq8IcW42vMXfoIzw9qhqEQzXFH2P7lqowbg2tr3Hh8NbC7AA/znooc5voi/95YHJWY
 oayfshr76vF8oeDXsIWE4y755y3n4vV4To8KDCOWY1QgtknHx0PM6y01BzoWa4VjGVS3
 lm90zOwPqown5kRN4b1GJ0vNIkHGg1TCABjsQk3PkyG7Wq5ZPMW7LC2B3OmnIXnbkm9I
 pOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=kZn9zul1FU3WC4uSfM+CTSNVMlpOXXYbVHpd7MqljKajaoVsGwqQV5FWsFj1VcOoZi
 87e7ZEdhxTPkgJfkxWCxy0bA2eDxf2Gwn5hmpWnKEqbHqhjwyAf5zsG2eVz85DGL/ZNA
 x/2OJ7eAsVnSeclsKp7gCclmSjbu2KX5l0OWK8cGKQc9uNQcOxlLobzd5RvootZi4qVk
 Hci+vs32N6fFL052bSe0lWenZdcEyCpT5LyCxDBmVZMjQU8wovBfJo1xKj47Wc/AekCx
 biOzJpw6oA9gQIYKhQf1ZcRCa5QBx3+zuAAz5QYEbxv+plKH5QeNis0AhnH9bt6BIdos
 /J9g==
X-Gm-Message-State: AOAM532mmIdFvjXPrU2qTee9iVGtT8dfpbG9dURsu8i1pA67HICpAsEl
 Rhkw/nc/Ol1h8jI/fji3aM/2iw==
X-Google-Smtp-Source: ABdhPJyaVPP3HEd2IjowyvIOVawlg8jsDXag6dU6Ag6aKnnQvcujBiDSl7HF2Rx1NPFQXIBYU4qlLg==
X-Received: by 2002:a1c:a98c:: with SMTP id s134mr443690wme.159.1604946150581; 
 Mon, 09 Nov 2020 10:22:30 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 07/23] mtd: spi-nor: hisi-sfc: Demote non-conformant
 kernel-doc
Date: Mon,  9 Nov 2020 18:21:50 +0000
Message-Id: <20201109182206.3037326-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132231_570996_A62490B3 
X-CRM114-Status: GOOD (  15.37  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
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
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVmlnbmVzaCBSYWdo
YXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJv
bGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMu
YwppbmRleCA5NWM1MDIxNzNjYmRhLi43YzI2ZjhmNTY1Y2JhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMKKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jCkBAIC0zMjAsNyArMzIwLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzIGhpc2lfY29udHJvbGxlcl9vcHMgPSB7
CiAJLndyaXRlID0gaGlzaV9zcGlfbm9yX3dyaXRlLAogfTsKIAotLyoqCisvKgogICogR2V0IHNw
aSBmbGFzaCBkZXZpY2UgaW5mb3JtYXRpb24gYW5kIHJlZ2lzdGVyIGl0IGFzIGEgbXRkIGRldmlj
ZS4KICAqLwogc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRldmljZV9u
b2RlICpucCwKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
