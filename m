Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D139C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:49:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D246108F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D246108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9zdxv9cCoqEzB2m29miQjiI7vjhxG5ONkVPWpKj2Nlc=; b=baoBHcfobx7cWkLM70TVlVilpO
	JDON9ufkigkKw440SJlOPGOJESwmzLva0/laHJoVSaQJf8vT9jtuCiACMT97Zf+IeIbpdGjXHXMML
	yn8HNx/pHnX2Wgz6TToeB7soD/UTBMWxI54aX7SzlbF7wCo4YGpdMk9IaaY/1vNqEwkHply2A830k
	sVJUQv0vV18xkk+f0qvALQYWUgOPEgk1BQFSaDUzpYiDqsPA+p4JayQPOAvRxI/jRMoDOjMu8mpJx
	LIaKAvgU6/r3XLAmzs5hE7ARsAuJuCzk91cc6B6ceeRWQ0rjfBlwhVGAqQE6eyO6uYqblyPPW8gPC
	ZhRYvHaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDcU-00C94r-N6; Fri, 02 Apr 2021 06:49:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDcP-00C92o-IA
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:49:23 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A2BCFC0008;
 Fri,  2 Apr 2021 06:49:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] Bring GPIO CS support to the Arasan controller driver
Date: Fri,  2 Apr 2021 08:49:10 +0200
Message-Id: <20210402064915.220781-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074921_801219_CB4A0414 
X-CRM114-Status: UNSURE (   9.82  )
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

SGVsbG8sCgpUaGlzIGlzIGEgc2hvcnQgc2VyaWVzIGJyaW5naW5nIGEgdXNlZnVsIGZlYXR1cmUg
Zm9yIGRyaXZlcnMgd2hpY2ggYXJlIGEKbGl0dGxlIGJpdCBjb25zdHJhaW5lZCByZWdhcmRpbmcg
dGhlaXIgbnVtYmVyIG9mIG5hdGl2ZSBDUy4gQXMKbWFudWZhY3R1cmVyIHRlbmQgdG8gZ3JvdXAg
Y2hpcHMgaW4gYXJyYXlzIHRvIGVubGFyZ2UgdGhlIG92ZXJhbGwKYXZhaWxhYmxlIHNwYWNlLCBp
dCBtaWdodCBiZSB1c2VmdWwgdG8gb3RoZXIgY29udHJvbGxlciBkcml2ZXJzIHRvIG1ha2UKdXNl
IG9mIHRoZSBhZGRlZCBEVCBwcm9wZXJ0eSAoY3MtZ3Bpb3MpIGFzIHdlbGwgYXMgdGhlIGNvcmUg
aGVscGVyIHdoaWNoCmlzIGJlaW5nIGludHJvZHVjZWQgdG8gcGFyc2UgdGhpcyBEVCBwcm9wZXJ0
eSBhbmQgcmV0dXJuZWQgYSBDUyBhcnJheQp3aXRoIGVpdGhlciBlbXB0eSBjZWxscyAobmF0aXZl
IENTIGFyZSBiZWluZyB1c2VkKSBvciBhIEdQSU8gZGVzY3JpcHRvcgpzdHJ1Y3R1cmUgcG9pbnRl
ciAoR1BJTyBDUykuCgpUaGlzIGlzIGFwcGxpZWQgdG8gdGhlIEFyYXNhbiBOQU5EIGNvbnRyb2xs
ZXIgZHJpdmVyIHdoaWNoIGludm9sdmVkIGEKbGl0dGxlIGJpdCBtb3JlIGJvaWxlcnBsYXRlIHRo
YW4gZXN0aW1hdGVkIEkgdGhvdWdodCBkdWUgdG8gaXRzIGludGVybmFsCmNvbnN0cmFpbnRzIHJl
Z2FyZGluZyB0aGUgYm9uZCBiZXR3ZWVuIENTIGFuZCBSQi4KCkNoZWVycywKTWlxdcOobAoKTWlx
dWVsIFJheW5hbCAoNSk6CiAgZHQtYmluZGluZzogbXRkOiBuYW5kOiBEb2N1bWVudCBncGlvLWNz
IHByb3BlcnR5CiAgbXRkOiByYXduYW5kOiBNb3ZlIHN0cnVjdCBncGlvX2Rlc2MgZGVjbGFyYXRp
b24gdG8gdGhlIHRvcAogIG10ZDogcmF3bmFuZDogQWRkIGEgaGVscGVyIHRvIHBhcnNlIHRoZSBn
cGlvLWNzIERUIHByb3BlcnR5CiAgbXRkOiByYXduYW5kOiBhcmFzYW46IEVuc3VyZSBwcm9wZXIg
Y29uZmlndXJhdGlvbiBmb3IgdGhlIGFzc2VydGVkCiAgICB0YXJnZXQKICBtdGQ6IHJhd25hbmQ6
IGFyYXNhbjogTGV2ZXJhZ2UgYWRkaXRpb25hbCBHUElPIENTCgogLi4uL2JpbmRpbmdzL210ZC9u
YW5kLWNvbnRyb2xsZXIueWFtbCAgICAgICAgIHwgIDE2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCAyMzggKysrKysrKysrKysrKy0tLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgICAgICAgfCAgMzggKysrCiBpbmNs
dWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIDQgZmls
ZXMgY2hhbmdlZCwgMjQwIGluc2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjcu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
