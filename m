Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC8FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A0MjaiwnhtstR/X3NfKHnKSFJO1T2ZRqABtbgnpCMkM=; b=DDcJvf6qoVW1SA
	V7kX3jnbQY5eKW9K2NpDvu2Kb18XajwbqOY65L3vrgL1atGL55X4cwQ2FN6misqhORjxBpUNzO4Vg
	QIvfYmGT+CaTXdF2dvX90xJ8axuDnGsOlukJ809wVxXrxOSWKwp5lA49NAsGF4D74otgcBpT1fZNe
	UirNUYti6h1a0WzcjB6sSIZ2RAlQ8t5TeaI4oeSivkUY6jTKAv+PZH4p9Wq2BcYtkDgEhxLGPFpOf
	yD9timSV3I/RSeXLBWzxCRGq2j7Irf7OJ9qx2H8LwWlZEgWGvXQ2T/LqjrcVCXbnK3vSefEw2FPiL
	nZKMqzK1zEKgNI8XEgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqeBj-00B9E0-ER; Fri, 26 Nov 2021 16:35:03 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqeBg-00B9DC-Nz
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 16:35:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 13D80E000B;
 Fri, 26 Nov 2021 16:34:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/5] Stacked/parallel memories bindings
Date: Fri, 26 Nov 2021 17:34:45 +0100
Message-Id: <20211126163450.394861-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_083500_934562_207FC48A 
X-CRM114-Status: UNSURE (   8.08  )
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKTm93IHRoYXQgdGhlIGRpc2N1c3Np
b24gaGFzIG1vdmUgZm9yd2FyZCwgbGV0IG1ldCBwcm9wb3NlIGEgc2Vjb25kCnZlcnNpb24gZm9y
IHRoZXNlIGJpbmRpbmdzLgoKQ2hlZXJzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHYyOgoqIERyb3Bw
ZWQgdGhlIGR0YyBjaGFuZ2VzIGZvciBub3cuCiogTW92ZWQgdGhlIHByb3BlcnRpZXMgaW4gdGhl
IGRldmljZSdzIG5vZGVzLCBub3QgdGhlIGNvbnRyb2xsZXIncy4KKiBEcm9wcGVkIHRoZSB1c2Vs
ZXNzICNhZGRyZXNzLWNlbGxzIGNoYW5nZS4KKiBBZGRlZCBhIG1pc3NpbmcgIm1pbkl0ZW1zIi4K
KiBNb3ZlZCB0aGUgbmV3IHByb3BlcnRpZXMgaW4gdGhlIHNwaS1jb250cm9sbGVyLnlhbWwgZmls
ZS4KKiBBZGRlZCBhbiBleGFtcGxlIHVzaW5nIHR3byBzdGFja2VkIG1lbW9yaWVzIGluIHRoZQog
IHNwaS1jb250cm9sbGVyLnlhbWwgZmlsZS4KKiBSZW5hbWVkIHRoZSBwcm9wZXJ0aWVzIHRvIGRy
b3AgdGhlIFhpbGlueCBwcmVmaXguCiogQWRkZWQgYSBwYXRjaCB0byBmaXggdGhlIHNwaS1ub3Ig
amVkZWMgeWFtbCBmaWxlLgoKTWlxdWVsIFJheW5hbCAoNSk6CiAgc3BpOiBkdC1iaW5kaW5nczog
QWxsb3cgZGVzY3JpYmluZyBmbGFzaGVzIHdpdGggdHdvIENTCiAgZHQtYmluZGluZ3M6IG10ZDog
c3BpLW5vcjogQWxsb3cgZXh0ZXJuYWwgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IHNw
aS1ub3I6IEFsbG93IHR3byBDUyBwZXIgZGV2aWNlCiAgc3BpOiBkdC1iaW5kaW5nczogRGVzY3Jp
YmUgc3RhY2tlZC9wYXJhbGxlbCBtZW1vcmllcyBtb2RlcwogIHNwaTogZHQtYmluZGluZ3M6IEFk
ZCBhbiBleGFtcGxlIHdpdGggdHdvIHN0YWNrZWQgZmxhc2hlcwoKIC4uLi9iaW5kaW5ncy9tdGQv
amVkZWMsc3BpLW5vci55YW1sICAgICAgICAgICB8ICA1ICsrLS0KIC4uLi9iaW5kaW5ncy9zcGkv
c3BpLWNvbnRyb2xsZXIueWFtbCAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI3
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
