Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0055C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4570B23330
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4570B23330
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lTzqUJOzfSYxzdzCJAkg267gt3MhzK27Aqu1Kg5kvOo=; b=cbenW8s0tG7U0TOFiPQjLOc/28
	udyP/liFqwjKLX3GzfDFHU9fz+8V1hyuG+qSIa3fo0Do3NDI9owYRczp/dthZJt3vNrXAiQ3CYQhA
	MUp2UR07PEiZJpUXSmxX9I2IfHJ4AV5pJRe0WvfF9h/t2RGSD3ds6ZL57dXmxSqK7j7wlDzQS1FOU
	ZFdQqPGNppQqwGiOlzDQnUR8EFwfQAWx/EUCTCMTzVyvN2Rzv1HMgd4hy2NXZNtXjFJsNr082aWee
	hMjM56oNluJWjI4GQKkujbsuyRtdxsM+jAqDgE8qAkxMQ0DBTIqS5KYjm5EDhD+aIzHvQ8YPdYiBl
	zEyItFPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2AYn-0008E3-Ak; Wed, 20 Jan 2021 10:17:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2AYk-0008Cr-NR
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:17:56 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0FAC41C0004;
 Wed, 20 Jan 2021 10:17:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/2] Fix OMAP2 ECC/OOB layout logic
Date: Wed, 20 Jan 2021 11:17:48 +0100
Message-Id: <20210120101750.1163-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_051754_871665_5D5354F0 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpJIGFscmVhZHkgc2VudCBhIHYxIGZvciB0aGlzIGZpeCBidXQgdGhlIHByb2JsZW0g
SSBoYWQgd2FzIHRoYXQgaXQgd2FzCnVzaW5nIHRoZSBzb2Z0d2FyZSBCQ0ggRUNDIGVuZ2luZSBp
bnRlcm5hbCBzdHJ1Y3R1cmUgYW5kIHRoaXMgd2FzIGtpbmQKb2YgYnJlYWtpbmcgdGhlIGxheWVy
aW5nLgoKSSBhdHRlbXB0ZWQgdG8gZXhwb3J0IG1vcmUgdmFyaWFibGVzIHdoaWNoIGNvdWxkIGJl
IHVzZWZ1bCB0byB0aGUKdXNlcnMsIGF2b2lkaW5nIHRoZSBuZWVkIHRvIGRlcmVmZXJlbmNlIHBy
aXZhdGUgc3RydWN0dXJlcywgYnV0IHRoZW4gSQpyZWFsaXplZCB3ZSBhbHJlYWR5IGhhZCBldmVy
eXRoaW5nIGluIGhhbmQuCgpQYXRjaCAxIGlzIG5ldyBhbmQgc2ltcGx5IGFkZHMgYSBoZWxwZXIg
dGhhdCB3aWxsIGJlIHVzZWQgYnkgcGF0Y2ggMgpmb3IgcmVhZGFiaWxpdHkuIEkgcGxhbiB0byBz
ZW5kIGJvdGggcGF0Y2hlcyB0aHJvdWdoIHRoZSBuZXh0IGZpeGVzClBSLgoKQ2hlZXJzLApNaXF1
w6hsCgpNaXF1ZWwgUmF5bmFsICgyKToKICBtdGQ6IG5hbmQ6IEFkZCBhIGhlbHBlciB0byByZXRy
aWV2ZSB0aGUgbnVtYmVyIG9mIEVDQyBzdGVwcwogIG10ZDogcmF3bmFuZDogb21hcDogVXNlIEVD
QyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBnZW5lcmljIHN0cnVjdHVyZXMKCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9vbWFwMi5jIHwgMTYgKysrKysrKysrKy0tLS0tLQogaW5jbHVkZS9saW51eC9tdGQv
bmFuZC5oICAgICB8IDEyICsrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
