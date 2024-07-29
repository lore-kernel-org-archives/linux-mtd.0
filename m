Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD9C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NHKha6Nb/RQbNuhTCmwcZXSlB6iNdp2IjT489IcS9bA=; b=mt8X0oPYGL0D/T
	Km6aJKv3sL+BkH5uH9vrF46Cb7S6N52DSTWDM8H+zKoov6cq1jr4pkymMEghk2jndfIACn1srN7YO
	2wSoz4x1ErPAWaDcAWOIf7WpzBZDU6s9N4GIg6aE6k/PeXy7Fcc9EKbCPu31gC299D9hqkxhz980S
	L/VNfgLWFpjIFK8cvZZf3cQgyglaKwWsL0Ct5eN4zQ/+t2tDSD54xU27gGvHMBZwxtenUMh5u+ekX
	BdzSx+DMXgPFZbbGW8N0Ov/LXrVfu2DTmIB63hXYuhZ83LvEjjIIGMwWT3HWgVUC+4FCCaq9Cnaza
	VkTqGKm5hjF3RYfIzPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLQL-0000000ATsD-2MWl;
	Mon, 29 Jul 2024 08:08:05 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLQH-0000000ATpg-2Alw;
	Mon, 29 Jul 2024 08:08:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so1795038a12.3;
        Mon, 29 Jul 2024 01:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722240479; x=1722845279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHGbGSlCPxUn+ZqN5G7b/1110cnb669ZP9PtOzndk3A=;
        b=m7EHM+UanVN80alOBTp5K63N1JfpBFVBMKdiFBy6AXgExw3XQMj8X0Z6Wxvl00Cqw2
         ClL4RloPSQ3j2q3qejeqbViEh27bVE4ENpXF8m8ybcuPt/GHsCHGc1klPa1BczmuTFO+
         rUdL1f/iHDosrQVBCArDE8S13R5PCwPK69ZHNv7QKIgMOYlNvzyKK5BbNGW8jv6hVnUU
         TLXs2TWjTvWcBuTtGkmy0nVZO4Yn8/ZMZ16Hjgc78aITFSYBoPJBFF+eweaa69tgx5fB
         6OsgR4R4hgAx0NHn7EZj1PIDCWn3iajDw12FsokrX8yadGb18BPwc346nu1jLz4M0qg2
         /ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240479; x=1722845279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHGbGSlCPxUn+ZqN5G7b/1110cnb669ZP9PtOzndk3A=;
        b=byt8pmpjlA5j/AdLoXmvZdxouTLLcgEAgep4JC9fkf0IL+n1QNs+cGWCG3cg16Y6Os
         Dzib8UYBgihuo/ajt6+8I5j8OU6Va9wOLkT/LYoWm1NUlCIVXlwMauHiZcOHIlGyBZgf
         rTO49h3CQSggPQHWDuboaSUruDrG7HRQ2Nz2/XgWxTVJen/Rsp5ClEIS27b0cJ4rmnLZ
         JGFWTG8Q/KhIKO2YpzE2qGaDTId1V2NJYxUA42xLhwqkMyY8EsUkA0qbTKaXrwSlYdxA
         knHcGXIlOiWmMXKwWwXKcPFf63agh4f7FYa6umcG+sK89w7YPRHhJwS/B2ehcAWsZXHo
         oOcw==
X-Forwarded-Encrypted: i=1; AJvYcCWLlmXQE/TUqGlNzGgce9mQnut5QV2zMQSCZEDnBThLMtUB1HpeMbmZpChlaFpz8ue9qlzdyJh9qYUYA/RiKdAP/vlL0zLZDF7Mcne/Yifql2m1z8B0aLdqB4L3WA1Ul1214Qipx8z8OjyCc46Wdb3V+20W
X-Gm-Message-State: AOJu0Yyr7TlaEfa1krTSk3yHnt5mWGcIBK56iiIyZYh34ftfOZOIZ0iK
	WwvlftSzizWT35CVCoh3p0Z6tsk2BmL4SyDZeuwHtuOWWzhhnVc6
X-Google-Smtp-Source: AGHT+IHs9KgAcOa/+4tdLzWcVj5u0ONMW3rbCctkdL6TLbFc9+DUAUi+r78D/O91WFvdo0PaUJ2YXQ==
X-Received: by 2002:a05:6402:13d3:b0:5af:758a:6934 with SMTP id 4fb4d7f45d1cf-5b01d37bd25mr6190904a12.0.1722240478838;
        Mon, 29 Jul 2024 01:07:58 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590cedsm5352868a12.29.2024.07.29.01.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 01:07:58 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	linux-kernel@vger.kernel.org,
	John Thomson <git@johnthomson.fastmail.com.au>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/3] nvmem: u-boot-env: error if NVMEM device is too small
Date: Mon, 29 Jul 2024 10:07:31 +0200
Message-Id: <20240729080733.16839-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_010801_586686_DA2EE0AE 
X-CRM114-Status: GOOD (  11.46  )
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

RnJvbTogSm9obiBUaG9tc29uIDxnaXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1PgoKVmVy
aWZ5IGRhdGEgc2l6ZSBiZWZvcmUgdHJ5aW5nIHRvIHBhcnNlIGl0IHRvIGF2b2lkIHJlYWRpbmcg
b3V0IG9mCmJ1ZmZlci4gVGhpcyBjb3VsZCBoYXBwZW4gaW4gY2FzZSBvZiBwcm9ibGVtcyBhdCBN
VEQgbGV2ZWwgb3IgaW52YWxpZCBEVApiaW5kaW5ncy4KClNpZ25lZC1vZmYtYnk6IEpvaG4gVGhv
bXNvbiA8Z2l0QGpvaG50aG9tc29uLmZhc3RtYWlsLmNvbS5hdT4KRml4ZXM6IGQ1NTQyOTIzZjIw
MCAoIm52bWVtOiBhZGQgZHJpdmVyIGhhbmRsaW5nIFUtQm9vdCBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMiKQpbcm1pbGVja2k6IHNpbXBsaWZ5IGNvbW1pdCBkZXNjcmlwdGlvbiAmIHJlYmFzZV0KU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KVjI6IE5l
dyBwYXRjaCBpbiB0aGUgc2VyaWVzCgogZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL252bWVtL3UtYm9vdC1lbnYuYyBiL2RyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jCmluZGV4
IDkzNmUzOWIyMGIzOC4uNTkzZjBiZjRhMzk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL3Ut
Ym9vdC1lbnYuYworKysgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYwpAQCAtMTc2LDYgKzE3
NiwxMyBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcGFyc2Uoc3RydWN0IHVfYm9vdF9lbnYgKnBy
aXYpCiAJCWRhdGFfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2VfYnJv
YWRjb20sIGRhdGEpOwogCQlicmVhazsKIAl9CisKKwlpZiAoZGV2X3NpemUgPCBkYXRhX29mZnNl
dCkgeworCQlkZXZfZXJyKGRldiwgIkRldmljZSB0b28gc21hbGwgZm9yIHUtYm9vdC1lbnZcbiIp
OworCQllcnIgPSAtRUlPOworCQlnb3RvIGVycl9rZnJlZTsKKwl9CisKIAljcmMzMl9hZGRyID0g
KF9fbGUzMiAqKShidWYgKyBjcmMzMl9vZmZzZXQpOwogCWNyYzMyID0gbGUzMl90b19jcHUoKmNy
YzMyX2FkZHIpOwogCWNyYzMyX2RhdGFfbGVuID0gZGV2X3NpemUgLSBjcmMzMl9kYXRhX29mZnNl
dDsKLS0gCjIuMzUuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
