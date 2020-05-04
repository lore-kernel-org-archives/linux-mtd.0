Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8246DC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:32:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E3C206D9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SngNwQWI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7Ub+fll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E3C206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdjos+nAbI4CTDvsuU9SHiP6rsp1mgTC4zHDMTa/Dww=; b=SngNwQWIy3X61i
	8cXUT205aOWxC9TKuCHgU3REnjcbB039n4B0uFDVFNTOXkJEpCgZ2kJrIekgbZ8MUuOcRMazrKcyv
	conm7Ajhgdu1CwKyBaKBJoxaYCb79WeLP9eoySYLUsfSa6UQLVBdzgQU9poiyov7PbAQP5hnx/XWh
	S4xKV5m6m0TLmkR0TQCn46yjgnbnz+bTeE4AfRAMGzRb4/Z+4WP2O7E02JSw5XM+IXuL7oTmZSkLB
	kZmcVZn8rO8xIP1Oz5Pwi+vDxYpTc3ZD5lslgbrQi6B1xE0bDUNX1GA69Sodu5ME6QY9GVZVoLhtl
	ph/h4lMS+kT0qakuLoNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVXSF-0006hW-B8; Mon, 04 May 2020 09:32:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXR2-0005VI-1Q
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 09:30:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id u16so8204999wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
 b=j7Ub+flln3YNhwj9yYp6wBol+TBlw1w6FXrudNdmpadgvX2kmnT6doDre9rBrwnxRx
 oaR8uKfqIgUoJ1VMOeGOw9Y+KYStlDgM6IiLAKmgstsij9t5UPXO0wv4pHvWvKNrlpX/
 AaZmZgCZlsUZskeawsKgB2KObhO/28CDfx9Qb5s+KzIryPocpNZo5H/EKg2JSVKugOqY
 uuy1l5PU75/at575nM/4WqvZxxL4xDuF8W25MnA3vlJJRCq9dVDgFrBO2oawAqwJCGfX
 UJ2SiWhC/YNvSBSSHxymASU+DtV7DjhFuoQ7fPH8iqnxd/8kj/sVOzja9jbEcxc7XLQ5
 Dmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=phBt/DyXxj2WCUjN/7VIPZs2iVaLf/hvf4aH3FE3pS4=;
 b=FIFN2z1zCUFCKbZ/QSDbKzqB4XdOi4tpGJlg2OK+9MWS445BFJDuMPF6rgja39na3W
 S3pzGs+mf6+alAdoKiBdKYAsiLh1d7aI/xAtxE7keofMxC5HudP7DVwWXXdp+N9EvXJO
 OIO9fBF9WOMf9dp0bBQPIl6Vem7bqKXHlCtiaIck0+R76Lstm29mVjiE4+cDKVeNy5ZG
 djaDyLL3MvdmvNRxIckNj8ixD5B0+bhGeBPE49ihCG+gfPCLlG3C+qo8PYywTTQj4QWW
 HJ4/xWYhOYyjK1VQMG6XdMNctbDr4msimPAmWo3dcQQoVliycYapx9Y03Qg4HTJMN/WN
 gx2g==
X-Gm-Message-State: AGi0PubxjwB38CqZXbMj9T21BEdlV6Thv2nDP5IvxQ4DAx7l4fsR5pei
 w7K6wxH87Glau4lg7pazBnw=
X-Google-Smtp-Source: APiQypJS5Hd4YKWO6K+er1KaH05rOKwDvb8orjhGW/13qMHgW2kYeb5kLUuph8xfEkdVy+4SLf6EJA==
X-Received: by 2002:a1c:c345:: with SMTP id t66mr14567380wmf.189.1588584645850; 
 Mon, 04 May 2020 02:30:45 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:30:45 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] nand: brcmnand: fix BBI in hamming oob layout
Date: Mon,  4 May 2020 11:30:34 +0200
Message-Id: <20200504093034.2739968-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_023048_102930_2C1D0D73 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U21hbGwgUGFnZSBOQU5EIHVzZXMgYnl0ZSA2IGZvciBCQkkgYW5kIExhcmdlIFBhZ2UgTkFORCB1
c2VzIGZpcnN0IDIgYnl0ZXMuCgpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKaW5kZXggMWJiYTMwOWM3Njg0Li41OWMzMjQxZjRlYTUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMTEwOSwxMCArMTEwOSwxOCBAQCBzdGF0
aWMgaW50IGJyY21uYW5kX2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICpt
dGQsIGludCBzZWN0aW9uLAogCWlmIChzZWN0aW9uIDwgc2VjdG9ycykKIAkJbmV4dCArPSA2Owog
Ci0JaWYgKHNlY3Rpb24pCisJaWYgKHNlY3Rpb24pIHsKIAkJb29icmVnaW9uLT5vZmZzZXQgPSAo
KHNlY3Rpb24gLSAxKSAqIHNhcykgKyA5OwotCWVsc2UKLQkJb29icmVnaW9uLT5vZmZzZXQgPSAx
OyAvKiBCQkkgKi8KKwl9IGVsc2UgeworCQlpZiAoY2ZnLT5wYWdlX3NpemUgPT0gNTEyKSB7CisJ
CQkvKiBzbWFsbCBwYWdlIHVzZXMgYnl0ZSA2IGZvciBCQkkgKi8KKwkJCW9vYnJlZ2lvbi0+b2Zm
c2V0ID0gMDsKKwkJCW5leHQtLTsKKwkJfSBlbHNlIHsKKwkJCS8qIGxhcmdlIHBhZ2UgdXNlcyBm
aXJzdCAyIGJ5dGVzIGZvciBCQkkgKi8KKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMjsKKwkJfQor
CX0KIAogCW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0OwogCi0t
IAoyLjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
