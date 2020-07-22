Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A11C433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 09:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBC02077D
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 09:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzMMKAi7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+3rLH0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBC02077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEP6Y+C1V9YpxbABOzOu2gdRJ/+pznRU7viZ1xQ4UfE=; b=tzMMKAi78UjEIOqn2VvYFD63gh
	Rv3wqvoX/yqmqndHxujM08NWuPjM4bzQFJxk0jQwWuZPh6YI0KcxeAkiLfEgR1NU7WtB5g6bH59es
	MDWnEA9AmjYhYOvl8HwgVivJnOvCnotyi/gLXpN1e0Tekmj8krJQERfGgmsLlhmDGiX7hwVAbPzXy
	XK2MC2/nkWmni4pmWOHZ7eZn8sNEHxF739aHOdcdmBCNcOZKLNcw3AxdMstLxusbJ/KCUqFcWzLdW
	7g6Djfpej+UAKqOGXeGseWZGby6FHdrBiYmx1uQ0k9ybm1RZkwDO2lo58/zkqmdGlKqJIs/F50aVu
	PPjXE+VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyAcS-0006pL-N6; Wed, 22 Jul 2020 09:00:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAcQ-0006oD-F5
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 09:00:55 +0000
Received: by mail-pl1-x644.google.com with SMTP id x9so636265plr.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2020 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HeJFPP0igl7ucLvw13yGaRspBn89FalzpCYxP/ySa+U=;
 b=o+3rLH0vwsDC9Oi3Q50ZpevG3jnNOBflXdtW+rK6eqk/fPTzaYXZrUx4WjIVxSt7fI
 4wf138LnoK//Jx/+mfCgrJWMYatTOR8dghdLI0Q1gINrl/BU3+hqOZ/tadbirmP/if0J
 fQtQ6YgsXuxKEvM8tvfdpeCzpEBgw/vNotbzHkkWaufNiu4LtIn8QQD+NcY+uOajEoVa
 m/kHJotYlKk8FvhoK+ZXVlDzXl1HqaNnOtcy50ZYkM3yjygqnwqGpL7n/lNF7MEzVzvA
 /CxxviS89MshTSmT8c+o9zLCg9xveoLsbuIiBiQcXpU+F7ZVUuDWjJEEuaf+x6dO5tQb
 fNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HeJFPP0igl7ucLvw13yGaRspBn89FalzpCYxP/ySa+U=;
 b=pkAvjMuy4vFMjv0WtcLP5j3zCa9HdQS0opAO42JPa1+qSTrfrAzHp2wOc+KuEjr6EP
 rh3cTaRUaIKTXHKyIuOjddLv1toR/cVDveNosDqyKITxYz5w2Nlm0iv9+KN1DDSfMeoH
 fqoNR5887aUR/nI/Ou5i9DmAmP54YZPUmniKUUOz54Oiu12n+/VFqfb/VEsBTeYoL6V6
 ffMqCHp3MJB8SXFIDTKg/XhRIspeI4LtSjmvrJXGeXKVmTX26aFZb9B8CxfXu4NXA69p
 jksdZHIsL2e60B8O/sPom4ECupCjKn4El2swPRa8W0C/WKU1JuHk9zjSEw5dBEdPgNs+
 qVrQ==
X-Gm-Message-State: AOAM531HKS4+Lvz0+0VdPwCzPmCOQBDSQ2VaVeOg7UIJfwfY0iIgkXxv
 ov/LTj+HOTe3mIHY/i4ScLY=
X-Google-Smtp-Source: ABdhPJyRAVWCtdDAaK9Vn98PaP4I9Lj/ivxP2G6XCiOitEIGND6TVYdH88Kut01lmMqc/5phmaICTw==
X-Received: by 2002:a17:902:8490:: with SMTP id
 c16mr25199141plo.153.1595408452207; 
 Wed, 22 Jul 2020 02:00:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 4sm19645167pgk.68.2020.07.22.02.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:00:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] spi-nor: Remove unused spi-nor.o rule
Date: Wed, 22 Jul 2020 18:12:41 +0930
Message-Id: <20200722084241.193470-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_050054_567643_56B1F921 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gIm10ZDogc3BpLW5vcjogUHJlcGFyZSBjb3JlIC8gbWFudWZhY3R1cmVyIGNvZGUgc3BsaXQi
IHRoZSBmaWxlIHdhcwpyZWZhY3RvcmVkIGludG8gc2VwZXJhdGUgZmlsZXMsIHNvIHRoZSBydWxl
IGlzIG5vIGxvbmdlciByZXF1aXJlZC4KCkZpeGVzOiBhMDkwMGQwMTk1ZDIgKCJtdGQ6IHNwaS1u
b3I6IFByZXBhcmUgY29yZSAvIG1hbnVmYWN0dXJlciBjb2RlIHNwbGl0IikKUmVwb3J0ZWQtYnk6
IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZSB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQppbmRl
eCA2NTM5MjM4OTYyMDUuLjJlZGU1ZWY3OWIwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9NYWtlZmlsZQorKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlCkBAIC0xNyw2
ICsxNyw1IEBAIHNwaS1ub3Itb2JqcwkJCSs9IHNzdC5vCiBzcGktbm9yLW9ianMJCQkrPSB3aW5i
b25kLm8KIHNwaS1ub3Itb2JqcwkJCSs9IHhpbGlueC5vCiBzcGktbm9yLW9ianMJCQkrPSB4bWMu
bwotb2JqLSQoQ09ORklHX01URF9TUElfTk9SKQkrPSBzcGktbm9yLm8KIAogb2JqLSQoQ09ORklH
X01URF9TUElfTk9SKQkrPSBjb250cm9sbGVycy8KLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
