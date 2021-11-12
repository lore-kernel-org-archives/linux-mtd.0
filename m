Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5AEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9237B60F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9237B60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywtidSDS+nc6R8PrpzLlj3j5AiZPdwSpvsCvgdjsKzs=; b=Tpsv1Bt3QcA1M1
	a1kA0EZCklFCFeGPrchLmuw8CTNzgmPaNdCdcqcimLWO3iErSfDyHZm6k3PEG4MDUPi4Q+qqL23XA
	6K8z/RTwZJkYHY8xkgGxekWCvwMgCfpvrFcgGbl7/rcJmdNHAPSKpesEyMGQO9/5RmFgX2NBN1NtV
	NDZfourlJpunrTIOCs4RniUIr3+HLXtTdkgx55f4RUmLtbFcmovEqLhusxmzjdER5EFFW7iL6jga9
	/Tuyyl6K7dN5UxKp0bbWQYnqG/mFhaXG5ybPdgIc10Zcpzs5r+j9CdWTU39690j0QLTbCbNsUugFj
	jJM+N0Ygx44cYFFbRVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYRE-00B4J4-67; Fri, 12 Nov 2021 15:26:00 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYPa-00B3ug-D4
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:24:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id ECD0B240003;
 Fri, 12 Nov 2021 15:24:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 0/3] Dual stacked/parallel memories bindings
Date: Fri, 12 Nov 2021 16:24:08 +0100
Message-Id: <20211112152411.818321-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_072418_626537_B42C006E 
X-CRM114-Status: GOOD (  10.41  )
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKSGVyZSBpcyBhbiBSRkMgdG8gb3Bl
biB0aGUgZGlzY3Vzc2lvbiBhYm91dCB0aGUgc2Vuc2l0aXZlIHRhc2sgb2YKc3VwcG9ydGluZyBz
cGVjaWZpYyBTUEkgY29udHJvbGxlciBtb2RlcyBsaWtlIFhpbGlueCdzIHdoZXJlIHRoZQpjb250
cm9sbGVyIGNhbiBoaWdobHkgYWJzdHJhY3QgdGhlIGhhcmR3YXJlIGFuZCBwcm92aWRlIGFjY2Vz
cyB0byBhCnNpbmdsZSBiaWdnZXIgZGV2aWNlIGluc3RlYWQuIEknbGwgbGV0IHlvdSBnbyB0aHJv
dWdoIHRoZSBzZXJpZXMgYW5kCnRlbGwgbWUgd2hhdCB5b3UgdGhpbmsuCgpJIHRoaW5rIHRoZXJl
IGFyZSB0d28gcG9zc2libGUgYXBwcm9hY2hlczoKMS0gRGVzY3JpYmUgdGhlIHR3byBkZXZpY2Vz
IGFzIGJlaW5nIGEgc2luZ2xlIG9uZSB3aGljaCBpcyB3aGF0IHdlIHdpbGwKICAgZ2V0IGZyb20g
dGhlIGNvbnRyb2xsZXIgYW55d2F5IChpbXBsaWVzIHN1cHBvcnRpbmcgdHdvIENTIHBlciBTUEkK
ICAgZGV2aWNlKQpvcgoyLSBEZXNjcmliZSB0aGUgdHdvIGRldmljZXMgaW4gdGhlIGRldmljZSB0
cmVlIGFuZCB0aGVuIGJ5IHNvZnR3YXJlIGhhY2sKICAgaW50byB0aGUgTVREIGNvcmUgdG8gc2lt
dWxhdGUgYSBzaW5nbGUgZGV2aWNlIHRvIHRhbGsgdG8uCgpJIGhhdmUgbG9va2VkIGF0IHRoZSBj
b2RlLCB0aGVyZSBpcyBubyBnb29kIHNvbHV0aW9uLCBidXQgIzIgZGVmaW5pdGVseQpsb29rcyBo
b3JyaWJseSBjb21wbGljYXRlZCBhbmQgc3ViamVjdCB0byBhIGxvdCBvZiBjb3JuZXIgY2FzZXMg
dG8KaGFuZGxlLCBoZW5jZSB0aGlzIHByb3Bvc2FsIHRvIGdvIGZvciBzb2x1dGlvbiAjMS4KCkNo
ZWVycywKTWlxdcOobAoKTWlxdWVsIFJheW5hbCAoMyk6CiAgc3BpOiBkdC1iaW5kaW5nczogQWxs
b3cgZGVzY3JpYmluZyBmbGFzaGVzIHdpdGggdHdvIENTCiAgZHQtYmluZGluZzogbXRkOiBzcGkt
bm9yOiBBbGxvdyB0d28gQ1MgcGVyIGRldmljZQogIHNwaTogZHQtYmluZGluZ3M6IHp5bnFtcDog
RGVzY3JpYmUgZHVhbCBzdGFja2VkL3BhcmFsbGVsIG1lbW9yaWVzCiAgICBtb2RlcwoKIC4uLi9i
aW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sICAgICAgICAgICB8ICAyICstCiAuLi4vYmlu
ZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwgICAgICAgICAgfCAgNiArKy0tCiAuLi4vYmlu
ZGluZ3Mvc3BpL3NwaS16eW5xbXAtcXNwaS55YW1sICAgICAgICAgfCAzMSArKysrKysrKysrKysr
KysrKysrCiBzY3JpcHRzL2R0Yy9jaGVja3MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
NCArKysrKysrKy0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxMyBk
ZWxldGlvbnMoLSkKCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
