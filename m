Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2331C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60F860F43
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A60F860F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQdY0DBrAxCzjYhPzq81XHMomcDVTVwki5ARNbZdw9E=; b=ARswRmARMqjGzY
	zky2lfm5wg8gWDMRH2sMNtrYgdVm7xevlGZx3Icm4LRC0ri6iXdA9j17wAKUXi8lFU6RmIxhw8eat
	BvWXMFC1fOBmioe23LEOMOH8hEpXGFcmfG2hNy2TLpVjNf3sZ5ePOs8IH+FxDD26JSXr0+06NCS5c
	a9QZzj7gcbOnse3OhPDMwkkYcMoK9U8bNUhbrrJ3gvtpDMoJXDMZzadRp313dqt1vVfFx2J3g/iLK
	77Tv1Q/S7FAUekIzp7+DoWsrL7MpyByAlAiY6w0WqlVK1sBNAQx3AqSa6I/30XH6bFOrVLOj0NZ7o
	nRc0RePoEnCNsENaP9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIcn-001cGz-BY; Mon, 20 Sep 2021 12:42:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcY-001cBe-Sq
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 12:42:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id m3so65008109lfu.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Jyaaz7vsLz5usd/SRKYitd1GGLRRfy3n82omug9pAA=;
 b=L/kr3gQxhCNlhY6qH1CLUHlheQzY/Uh+X/1bxbkbfOsRhN5fgPZdylx7AksknyVZx0
 ZavNwA4iIjTf8EcdStQfTAE/CRJna1NdH2D1H7fxIYHEiQ+0MHOPC7853nFtRKP48Vb1
 GJzyA8LSMUDfFgdLyXv74OeaA8br/7jymBKqKQKfeYRtMB2s0FkIFGGt5rTgnSKxV8mU
 X4NlHShLxa3rlaPq+R/xlNlW86R+vVxLpXI2xSERkAr/iLu0cn1PCrZkVQlCaSVrLeQt
 SndtPNzU3Ga5dMxXpv6OGJSxycuUZb6UBdv2g/0rC2zCOClhczAXcpdZBuLYOnmaI5kz
 GHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Jyaaz7vsLz5usd/SRKYitd1GGLRRfy3n82omug9pAA=;
 b=LFr+8ibVyJNw54R/xM7NK86ePFqzrCVP1+Xes2Wzeg2j9rfc48WUbII6x9xtrpd6eo
 ibeOUmC0GiCHUONvtVKdrC09wTpvr5Uzq1EYBbNPMTSa+y+YJkaBkjaUfkR+j8VXCubF
 HOdv/QmyNq6CiyGv//sh30ImjiyKzcPmr3b805eBv7YMDQfnbhTUvq6HwOpTs1hJK5DK
 dTfJMVPM0VGH0GVnIUXAKMYi1qZq+xRbZ35//OgVLHLi4jvD75CLWdMVjdqsCYYy4Gjl
 tA6a3kr3YZIeSAYfptD29dxP1y8pooTakotejBHDPyrcrO/3O2kmQuelvMTnI1Cgpl7X
 6CYQ==
X-Gm-Message-State: AOAM530YpKLJ3GUe2Vms84J3ZWgLyVPdlVM7eZphFSxDcaGRzi7Iw5ff
 vk4zHQTD5Yu/KzrQ8SMMJf/fKw==
X-Google-Smtp-Source: ABdhPJwptMV9N4Ai1/dhNdrr/uDN6aHZsMXxgGcaXehA6fzWLlCPes1ne4JSuGwqmkcUqu3FgLPPGw==
X-Received: by 2002:a2e:501a:: with SMTP id e26mr20763529ljb.57.1632141723926; 
 Mon, 20 Sep 2021 05:42:03 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:03 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 0/3] Add support for the Mercury+ AA1 module
Date: Mon, 20 Sep 2021 14:41:38 +0200
Message-Id: <20210920124141.1166544-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054207_027433_B6B50BBE 
X-CRM114-Status: GOOD (  11.05  )
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

VGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIHdp
dGggYW4KQXJyaWEgMTAgU29DRlBHQSwgbmFtZWx5IGEgZGV2aWNlIHRyZWUsIGFuZCBhIGZpeCBy
ZWdhcmRpbmcgdGhlCkFycmlhIDEwIHJlc2V0IG1hbmFnZXIgZHJpdmVyLgoKUGF3ZcWCIEFuaWtp
ZWwgKDMpOgogIGR0LWJpbmRpbmdzOiBtdGQ6IHNwaS1ub3I6IGFkZCBuMjVxMDAgc2NoZW1hCiAg
ZHRzOiBzb2NmcGdhOiBBZGQgTWVyY3VyeSsgQUExIGRldmljZXRyZWUKICByZXNldDogc29jZnBn
YTogYWRkIGVtcHR5IGRyaXZlciBhbGxvd2luZyBjb25zdW1lcnMgdG8gcHJvYmUKCiAuLi4vYmlu
ZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvYXJt
L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vYm9vdC9k
dHMvc29jZnBnYV9hcnJpYTEwX21lcmN1cnlfYWExLmR0cyAgfCAxMjcgKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyAgICAgICAgICAgICAgICAgfCAgMjYg
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJj
dXJ5X2FhMS5kdHMKCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
