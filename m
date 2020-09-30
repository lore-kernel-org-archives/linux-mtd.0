Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CE8C4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 15:42:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE78820738
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 15:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RMBOL+ZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE78820738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zn/u7RgrzUwVtS/6Ni8kvopni7u1i+jRomRrVaR7C9k=; b=RMBOL+ZDCO3Ldjig+7SkKm6HET
	NtEDluWvciUHNY88J/sCF7ONNkoeo3TWvDHQf3emwtDOTuKzLIiW8c0U/QVDcZwvkUvuMyJz4JL/y
	xOYK5k9J7nOoSRKgrHF7Q9H4JNU3n/p4+LJI0bD/N5H1pnwB6JRP0Av1HqtrPteR7JpDJN2i5FUO4
	bATDI3vF7L/bRQG1mHYAUlWCksyhSgxW5Cbk6VjblIeQNeQCmDYm01r+rrX9/GFno+/ouaWgYd4pZ
	u+KfgatsAbiVq1AK7hbYssiS9cdZHnykWOfpX8N+ykpn3UHHkDhXjTvxX/pBcscV32FhPm9AvZktD
	YzQhpkoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNeEJ-0007fR-J1; Wed, 30 Sep 2020 15:41:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNeEG-0007e8-D3
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 15:41:17 +0000
X-Originating-IP: 77.205.53.71
Received: from localhost.localdomain (71.53.205.77.rev.sfr.net [77.205.53.71])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 26EA71C000F;
 Wed, 30 Sep 2020 15:41:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5] Creation of a SPI-NAND ECC engine
Date: Wed, 30 Sep 2020 17:41:04 +0200
Message-Id: <20200930154109.3922-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_114116_648948_C1D513E5 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBcyBwYXJ0IG9mIGEgYnJvYWRlciB3b3JrIHRvIGJyaW5nIGdlbmVyaWMgRUNDIHN1
cHBvcnQgdG8gU1BJLU5BTkQKZGV2aWNlcywgYSBzZXJpZXMgd2FzIHNlbnQgcmVjZW50bHkgdG8g
Y3JlYXRlIHJlYWwgc29mdHdhcmUgRUNDCmVuZ2luZXMgKGluZGVwZW5kZW50IGZyb20gdGhlIE5B
TkQgdGVjaG5vbG9neSB1c2VkKS4gTm90IGl0IGlzIHRpbWUgdG8KZG8gaXQgZm9yIHRoZSB3aWRl
bHkgc3ByZWFkIG9uLWRpZSBFQ0MgZW5naW5lOiBpdCBtdXN0IGJlIHJlcHJlc2VudGVkCmFzIGEg
cmVndWxhciBlbmdpbmUgc28gdGhhdCB0aGUgdXNlciBjYW4gY2hvb3NlLiBOZXh0IHN0ZXAgd2ls
bCBiZSB0bwpicmluZyBoYXJkd2FyZSBFQ0MgZW5naW5lcyBzdXBwb3J0IGZvciBTUEktTkFORCBk
ZXZpY2VzLgoKVGhhbmtzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICg1KToKICBtdGQ6IHNwaW5h
bmQ6IEZpeCB0eXBvIGluIGNvbW1lbnQKICBtdGQ6IHNwaW5hbmQ6IE1vdmUgRUNDIHJlbGF0ZWQg
ZGVmaW5pdGlvbnMgZWFybGllciBpbiB0aGUgZHJpdmVyCiAgbXRkOiBzcGluYW5kOiBJbnN0YW50
aWF0ZSBhIFNQSS1OQU5EIG9uLWRpZSBFQ0MgZW5naW5lCiAgbXRkOiBuYW5kOiBMZXQgb24tZGll
IEVDQyBlbmdpbmVzIGJlIHJldHJpZXZlZCBmcm9tIHRoZSBOQU5EIGNvcmUKICBtdGQ6IHNwaW5h
bmQ6IEZpbGwgYSBkZWZhdWx0IEVDQyBwcm92aWRlci9hbGdvcml0aG0KCiBkcml2ZXJzL210ZC9u
YW5kL2VjYy5jICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYyAgICAgICAgICAgICAgfCAxNzkgKysrKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZl
cnMvbXRkL25hbmQvc3BpL29uLWRpZS1lY2MtZW5naW5lLmMgfCAgIDAKIGluY2x1ZGUvbGludXgv
bXRkL25hbmQuaCAgICAgICAgICAgICAgICAgfCAgIDEgKwogaW5jbHVkZS9saW51eC9tdGQvc3Bp
bmFuZC5oICAgICAgICAgICAgICB8ICAgOSArKwogNSBmaWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0
aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQv
bmFuZC9zcGkvb24tZGllLWVjYy1lbmdpbmUuYwoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
