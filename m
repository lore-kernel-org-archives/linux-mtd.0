Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8198C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SDIX3idQXXZZz0tzGMOyM2sZS/+KTkNWypjb+UsY3Jw=; b=IpxTieLmtyKOQd
	3zLnVDcy5wN0ukwWd4dYwNQWcB0IJj5pDLsypHMHk+pSymlh1vibuTL3I3ZyveN4MoEYw9OIlmhuC
	MbelPfMt4tUKN3gFNAgbPP1MHLPQ1m+6xGzalW6e8fnOpF0g92hm6VU0jXoxSvZKNKkq9Zbxx7omS
	rSPq0u7rLmhMB5Vx96Nj3FwcXB7d9Jbuy3OOOfI4PLeWbSRYEkjraF7R0VSvAY5QkAjj0Bq0bjGhK
	8V1kKTvlp9fN05BBE8tGSngzxHgpvHc9DKbYzKTB7yqtjb8YQiEvtgyF+0K+S6tDCayzLgLgM5BzE
	u3MRkBaIlRSPikEGktYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXicX-001xX2-SE; Fri, 25 Mar 2022 12:00:45 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXicT-001xUx-Oa
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:00:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p10so7119952lfa.12
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WrDsrRGiIY0uVMcbpwBnoLj/TxiPgA8IFWvZnnYMgWo=;
 b=FjZI3/OoXoRLPNajJuALSfBjhMAzZjJ3gWxAT1bv6fNIzKAVyRQo0ZZ+G1vN70nmyn
 pIQmgbMYVT0sZev812SlZUePbIzKuhYnzxtYwKDk39KQMTWHXT+l8umXnp2eyyjnSn65
 9hggXcBdhX1QeaRuBDAlVC5dKeytoiOelA0Uz+aCs7PfNPva9Jn80BGfjMCryaeSG/YL
 q56AwS0ndf8KzEYDhfSk9ZSPLYDBY2YhOW4DsUyBSh+rC1pLzFzF/XGqt8MA04mgR4Ak
 6LneggpLO7jxd/pQm2UXQ66xJxHNUDvKZaX/3FYZS5cEo4iRjKL2IsbvWbnoDYMYhNoW
 e3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WrDsrRGiIY0uVMcbpwBnoLj/TxiPgA8IFWvZnnYMgWo=;
 b=Vg69Tx91ve1BfXVuwVHorB6O/Vp0lhASnztYnOaoDZuLA7OFEnOJ6zxSZVviJ6+y2v
 XUMOFscJeIt4cbBLSNPvkhQiCzVTOvVpWIC4q5kGcr6hf+1U4en65W2c50H0PYAjxhQs
 G0OUHSrTxnbyNTvIGS337LvBVZJwIsTI152TPYqdBShsZJlj8dGOIDwqt1lZkUr/34dk
 jushcPcrA/QaD9VV1ZLyGiy1ryw2U/hdadRtpVugFt188FLnZosUvaIkd296bCldIDCo
 9ii2Z34u/PbYD3L+WOLFOkVjvu+6+i9BgNE9lnYgp+KhBXP6rSvEMVRZDOq4Z+xtWw3U
 vZVQ==
X-Gm-Message-State: AOAM531DcsEAtzunh1HcnQmdd0feooVVJoNLVeoYGFfq3uT6JlKbmxVm
 JFHnGcK4w9p+gNlRGRRXcsfGOIx6AZA=
X-Google-Smtp-Source: ABdhPJylTgAYLFSMmSN/Y8NNZvTeFHGKqjmd+DgF6pp3IU/XN4fy+GhPJq+1xX028pRFPi0uO7fTqg==
X-Received: by 2002:a05:6512:3d9f:b0:44a:4960:5b79 with SMTP id
 k31-20020a0565123d9f00b0044a49605b79mr7561467lfv.413.1648209636238; 
 Fri, 25 Mar 2022 05:00:36 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 u2-20020a197902000000b00448a4a7cfc3sm681115lfc.136.2022.03.25.05.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 05:00:35 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
Date: Fri, 25 Mar 2022 13:00:25 +0100
Message-Id: <20220325120025.17931-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_050041_825262_430B2804 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU3VjaCBibG9ja3MgbWF5
IGJlIGluY29ycmVjdGx5IHRyZWF0ZWQgYXMgZW1wdHkgKGV2ZW4gdGhvdWdoIHRoZXkgbWF5Cmhh
dmUgbm9uLWVyYXNlIE9PQikuIFdhcm4gYWJvdXQgaXQgc28gcGVvcGxlIG1heSBzdGFydCBzdWlu
ZwotLXNraXAtYWxsLWZmcyAuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Ci0tLQogbmFuZC11dGlscy9uYW5kd3JpdGUuYyB8IDEzICsrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvbmFuZC11dGlscy9uYW5kd3JpdGUuYyBiL25hbmQtdXRpbHMvbmFuZHdyaXRlLmMK
aW5kZXggZThhMjEwYy4uY2Q1M2ExNyAxMDA2NDQKLS0tIGEvbmFuZC11dGlscy9uYW5kd3JpdGUu
YworKysgYi9uYW5kLXV0aWxzL25hbmR3cml0ZS5jCkBAIC0yODAsNiArMjgwLDcgQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJbGlibXRkX3QgbXRkX2Rlc2M7CiAJ
aW50IGVic2l6ZV9hbGlnbmVkOwogCXVpbnQ4X3Qgd3JpdGVfbW9kZTsKKwlzaXplX3QgYWxsX2Zm
c19jbnQgPSAwOwogCiAJcHJvY2Vzc19vcHRpb25zKGFyZ2MsIGFyZ3YpOwogCkBAIC00MTcsNiAr
NDE4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJICovCiAJ
d2hpbGUgKChpbWdsZW4gPiAwIHx8IHdyaXRlYnVmIDwgZmlsZWJ1ZiArIGZpbGVidWZfbGVuKQog
CQkmJiBtdGRvZmZzZXQgPCBtdGQuc2l6ZSkgeworCQlib29sIGFsbGZmczsKKwogCQkvKgogCQkg
KiBOZXcgZXJhc2VibG9jaywgY2hlY2sgZm9yIGJhZCBibG9jayhzKQogCQkgKiBTdGF5IGluIHRo
ZSBsb29wIHRvIGJlIHN1cmUgdGhhdCwgaWYgbXRkb2Zmc2V0IGNoYW5nZXMgYmVjYXVzZQpAQCAt
NTU1LDcgKzU1OCw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICogY29uc3QgYXJndltdKQog
CQl9CiAKIAkJcmV0ID0gMDsKLQkJaWYgKCFza2lwYWxsZmZzIHx8ICFidWZmZXJfY2hlY2tfcGF0
dGVybih3cml0ZWJ1ZiwgbXRkLm1pbl9pb19zaXplLCAweGZmKSkgeworCQlhbGxmZnMgPSBidWZm
ZXJfY2hlY2tfcGF0dGVybih3cml0ZWJ1ZiwgbXRkLm1pbl9pb19zaXplLCAweGZmKTsKKwkJaWYg
KCFhbGxmZnMgfHwgIXNraXBhbGxmZnMpIHsKIAkJCS8qIFdyaXRlIG91dCBkYXRhICovCiAJCQly
ZXQgPSBtdGRfd3JpdGUobXRkX2Rlc2MsICZtdGQsIGZkLCBtdGRvZmZzZXQgLyBtdGQuZWJfc2l6
ZSwKIAkJCQkJbXRkb2Zmc2V0ICUgbXRkLmViX3NpemUsCkBAIC01NjQsNiArNTY4LDggQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJCQkJCXdyaXRlb29iID8gb29i
YnVmIDogTlVMTCwKIAkJCQkJd3JpdGVvb2IgPyBtdGQub29iX3NpemUgOiAwLAogCQkJCQl3cml0
ZV9tb2RlKTsKKwkJCWlmICghcmV0ICYmIGFsbGZmcykKKwkJCQlhbGxfZmZzX2NudCsrOwogCQl9
CiAKIAkJaWYgKHJldCkgewpAQCAtNjE1LDYgKzYyMSwxMSBAQCBjbG9zZWFsbDoKIAkJICAgfHwg
KHdyaXRlYnVmIDwgZmlsZWJ1ZiArIGZpbGVidWZfbGVuKSkKIAkJc3lzX2Vycm1zZ19kaWUoIkRh
dGEgd2FzIG9ubHkgcGFydGlhbGx5IHdyaXR0ZW4gZHVlIHRvIGVycm9yIik7CiAKKwlpZiAoYWxs
X2Zmc19jbnQpIHsKKwkJZnByaW50ZihzdGRlcnIsICJXcml0dGVuICV6dSBibG9ja3MgY29udGFp
bmluZyBvbmx5IDB4ZmYgYnl0ZXNcbiIsIGFsbF9mZnNfY250KTsKKwkJZnByaW50ZihzdGRlcnIs
ICJUaG9zZSBibG9jayBtYXkgYmUgaW5jb3JyZWN0bHkgdHJlYXRlZCBhcyBlbXB0eSFcbiIpOwor
CX0KKwogCS8qIFJldHVybiBoYXBweSAqLwogCXJldHVybiBFWElUX1NVQ0NFU1M7CiB9Ci0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
