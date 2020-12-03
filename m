Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0703BC4361A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:05:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E76521D1B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 19:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E76521D1B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4ZoVjVN8s1+1x6bQuIosrs9L9BQARFldCOEhtcLw6Y=; b=zTKSxY8OXLKJZY80FZu4rUH9Xw
	zgwxStP3UYSiDQnp0vw3Q1KphigfqtvOAFG+WVRULNVRFXcMnxG0NmmyGz2etsKY/9K6nWOUVwFh4
	eyI/daMpO8k8NfoR4svyehtBo6DFWVmFUGpC2s+WCkEFm4xTxBXGF8cXWqhE5Vk9K2VPT6iDKFkLV
	uiOYPsSRaKReY6UUk1XbXQKg9QBPB2XD9tN+uLaPDd8WmCRJnnoYgU/GDvGJUADM9+K6Bs6zWI/LG
	Vm+cUHkqWxgAXsOrXTBW3WecLww7lZ8fMniRXuGoi0TTmP+/731ZWdwSvcTlCP4/U+DlhPuAJlDim
	NujJ+HGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkttS-0006G4-Mx; Thu, 03 Dec 2020 19:03:54 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkttL-0006C0-B7
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 19:03:48 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 467EC24000E;
 Thu,  3 Dec 2020 19:03:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/9] mtd: rawnand: Do not overwrite user settings
Date: Thu,  3 Dec 2020 20:03:31 +0100
Message-Id: <20201203190340.15522-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_140347_515371_E764302A 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBcyBwYXJ0IG9mIGEgcHJldmlvdXMgc2VyaWVzIHN1cHBvc2VkIHRvIGZpeCBEVCBo
YW5kbGluZywgdGhlIG1vdmUgb2YKdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byBhIHByb3BlciBs
b2NhdGlvbiBpbnRyb2R1Y2VkIGEgYnVnOiB0aGUgRUNDCmFsZ29yaXRobSB2YWx1ZSBzZXQgaW4g
dGhlIHByb2JlIHdhcyBhY3R1YWxseSBqdXN0IGEgZGVmYXVsdCB3aGljaCBtYXkKYmUgb3Zlcndy
b3RlLiBIZXJlIGlzIGEgc2Vjb25kIHNlcmllcyB0byBlbnN1cmUgdGhpcyBpcyBzdGlsbCB0cnVl
LgoKVGhhbmtzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICg5KToKICBtdGQ6IHJhd25hbmQ6IGFt
cy1kZWx0YTogRG8gbm90IGZvcmNlIGEgcGFydGljdWxhciBzb2Z0d2FyZSBFQ0MgZW5naW5lCiAg
bXRkOiByYXduYW5kOiBhdTE1NTA6IERvIG5vdCBmb3JjZSBhIHBhcnRpY3VsYXIgc29mdHdhcmUg
RUNDIGVuZ2luZQogIG10ZDogcmF3bmFuZDogZ3BpbzogRG8gbm90IGZvcmNlIGEgcGFydGljdWxh
ciBzb2Z0d2FyZSBFQ0MgZW5naW5lCiAgbXRkOiByYXduYW5kOiBtcGM1MTIxOiBEbyBub3QgZm9y
Y2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUKICBtdGQ6IHJhd25hbmQ6IG9yaW9u
OiBEbyBub3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUKICBtdGQ6IHJh
d25hbmQ6IHBhc2VtaTogRG8gbm90IGZvcmNlIGEgcGFydGljdWxhciBzb2Z0d2FyZSBFQ0MgZW5n
aW5lCiAgbXRkOiByYXduYW5kOiBwbGF0X25hbmQ6IERvIG5vdCBmb3JjZSBhIHBhcnRpY3VsYXIg
c29mdHdhcmUgRUNDIGVuZ2luZQogIG10ZDogcmF3bmFuZDogc29jcmF0ZXM6IERvIG5vdCBmb3Jj
ZSBhIHBhcnRpY3VsYXIgc29mdHdhcmUgRUNDIGVuZ2luZQogIG10ZDogcmF3bmFuZDogeHdheTog
RG8gbm90IGZvcmNlIGEgcGFydGljdWxhciBzb2Z0d2FyZSBFQ0MgZW5naW5lCgogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYW1zLWRlbHRhLmMgICAgIHwgNCArKystCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9hdTE1NTBuZC5jICAgICAgfCA0ICsrKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYyAg
ICAgICAgICB8IDQgKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYyAgIHwg
NCArKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vcmlvbl9uYW5kLmMgICAgfCA0ICsrKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3Bhc2VtaV9uYW5kLmMgICB8IDQgKysrLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvcGxhdF9uYW5kLmMgICAgIHwgNCArKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9z
b2NyYXRlc19uYW5kLmMgfCA0ICsrKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5j
ICAgICB8IDQgKysrLQogOSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
