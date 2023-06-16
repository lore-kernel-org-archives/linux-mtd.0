Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ACBEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pOSDPQIS10Gp+QlZwute87reUF0memcHwcAnVwwGLEU=; b=DphwIyPJTmKo0Z
	dXNxl7TCeO0VBKUv1nB+R5817E7mGfph1Z66wI87fzbSB/D1G0r//hxWNuJzebIYRuyIjnh+sqX9g
	v8GxynkUQim1OlEcggkGAd+rXJOQr0zb5UWeH6OEoHloNrFSDtFYxzIUs9vuwdwts5FKntDIscQLz
	YnVTfNOMtUbyBtG6ORtjy4jFBIk6/7glpW6fXaMqMY3YO/32SkenDYARZp56yg7PEWSxUC4filKF1
	Dwaewt9Ry5pXCS39zE4IcRlJ4JlTsFet47Ca5Kf390XJ8MtvWEqrKEuwKlCnKQjVWP2InZpa2mZZp
	wS0M76AlmKWBz2FbZMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7w-000lNp-2h;
	Fri, 16 Jun 2023 14:08:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7t-000lKL-01
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 14:08:35 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686924504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XqPdy0Yu+nuT4jg2E91rGvDEqXZ1edFysWeuQ4/RV6M=;
	b=iWqXjfUct4DlU2YsM1pS3AtO6hxR1GYLm6rfiMy2e/24UfYl7pr/sBM0eRrvQ2ll9MTyBi
	nY8FoPABqq/uMJ9KINPNtE5FncI5e+YC8YHRjxDIgz9Qs3m0Ozq9cSrek6JCMtEJkeKWS9
	PQMcOV1WD952KbHf58GrvUGxVEA0ZNzSi1agkbPTKGVpF3HN/4xK8kjvCg4Z46Nja5ITOw
	RSFriEeOuGektYL8csAccb+RIaZ7iaEoxUUc+WYOeT2h2KVMeFHmGRgtsmHjbLhy0VAbDB
	+pSRBygFSiwnjjJy6S9ZnTgr9TI8PHAoMHMDoVochWN2XgqNYViBs8x0EYsFxQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7934E1BF204;
	Fri, 16 Jun 2023 14:08:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: Support for another sst flash
Date: Fri, 16 Jun 2023 16:08:20 +0200
Message-Id: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_070833_183306_B7FCE5B0 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpIZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXRjaGVzIGFkZGluZyBzdXBwb3J0IGZvciB0
aGUgc3N0MjZ2ZjAzMmIgc3BpLW5vciwKSSBjb3VsZCBzdWNjZXNzZnVsbHkgdXNlIHRoZSBQQVJT
RV9TRkRQIGZsYWcgYWN0dWFsbHksIHNvIGhlcmUgaXMgYQpzZWNvbmQgcGF0Y2ggYWN0dWFsbHkg
c3dpdGNoaW5nIHRvIFNGRFAgcGFyc2luZyBmb3IgaXRzIGNvdXNpbnMgYXMKd2VsbC4KCkNoZWVy
cywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MjoKKiBEcm9wIHRoZSB1c2VsZXNzIGJpbmRpbmcgY2hh
bmdlLgoqIEFkZCBMaW5rIHRhZyBpbiBjb21taXQgbWVzc2FnZS4KKiBVc2UgdGhlIFBBUlNFX1NG
RFAgZmxhZy4KKiBEcm9wIHJlZHVuZGFudCBpbmZvcm1hdGlvbiBmcm9tIHRoZSBrbm93biBwYXJ0
cyBhbmQgaXRzIGNvdXNpbi4KCk1pcXVlbCBSYXluYWwgKDIpOgogIG10ZDogc3BpLW5vcjogQWRk
IHN1cHBvcnQgZm9yIHNzdDI2dmYwMzJiIGZsYXNoCiAgbXRkOiBzcGktbm9yOiBEcm9wIHJlZHVu
ZGFudCBpbmZvcm1hdGlvbiBvbiB0aGUgc3N0MjZ2ZiBmbGFzaCBzZXJpZXMKCiBkcml2ZXJzL210
ZC9zcGktbm9yL3NzdC5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
