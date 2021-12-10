Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41301C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nY7c6fYcfG8K8hX2NLtBgqr14xTFado6+Iqh8E7YfPU=; b=BhSqt3zHhVaYye
	xtAAzUUMmCJm54Eewo/yoGLeuyH2ChhKzj4voWsRjB/R0XOP5PPnEGNbAUrSzT5cbrEar5GV3jkBa
	+5l3CI1Y+iS8ldoCxN1rjvQmGnv8VHQzzLWXnTmCOCGpwyEVOVfzPI3a/9376YWBPKwWDlujqwzDp
	tumpEum7b+c+rHnE8+xNMZj81cs70q/sOEeJW4s64VDdFr2No/GrzpFQtWXo16OJIYxW5ZqDLUTr4
	SIR9vcuO3+B66yaHpq6QQJAzH/R2zW7pYo8QSFIC7b4uAqWVaXvnS/5NvoTnq3PnAjKTRzKXnqdTn
	2rwgMCOcR/0TKeK4UURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvmEz-003hbm-Vv; Fri, 10 Dec 2021 20:11:38 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvmE7-003hF6-Ir
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 20:10:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D297B240002;
 Fri, 10 Dec 2021 20:10:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/3] Stacked/parallel memories bindings
Date: Fri, 10 Dec 2021 21:10:36 +0100
Message-Id: <20211210201039.729961-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_121044_204406_18326415 
X-CRM114-Status: UNSURE (   9.80  )
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKSGVyZSBpcyBhIGZvdXJ0aCB2ZXJz
aW9ucyBmb3IgdGhlc2UgYmluZGluZ3MsIHdoaWNoIGFwcGxpZXMgb24gdG9wIG9mClByYXR5dXNo
J3Mgd29yazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMTA5MTgxOTExLjIyNTEt
MS1wLnlhZGF2QHRpLmNvbS8KCkNoZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2NDoKKiBDaGFu
Z2VkIHRoZSB0eXBlIG9mIHByb3BlcnRpZXMgdG8gdWludDY0LWFycmF5cyBpbiBvcmRlciB0byBi
ZSBhYmxlIHRvCiAgZGVzY3JpYmUgdGhlIHNpemUgb2YgZWFjaCBlbGVtZW50IGluIHRoZSBhcnJh
eS4KKiBVcGRhdGVkIHRoZSBleGFtcGxlIGFjY29yZGluZ2x5LgoKQ2hhbmdlcyBpbiB2MzoKKiBS
ZWJhc2VkIG9uIHRvcCBvZiBQcmF0eXVzaCdzIHJlY2VudCBjaGFuZ2VzLgoqIERyb3BwZWQgdGhl
IGNvbW1pdCBhbGxvd2luZyB0byBwcm92aWRlIHR3byByZWcgZW50cmllcyBvbiB0aGUgbm9kZQog
IG5hbWUuCiogRHJvcHBlZCB0aGUgY29tbWl0IHJlZmVyZW5jaW5nIHNwaS1jb250cm9sbGVyLnlh
bWwgZnJvbQogIGplZGVjLHNwaS1ub3IueWFtbCwgbm93IHJlcGxhY2VkIGJ5IHNwaS1wZXJpcGhl
cmFsLXByb3BzLnlhbWwgYW5kCiAgYWxyZWFkeSBkb25lIGluIFByYXR5dXNoJ3Mgc2VyaWVzLgoq
IEFkZGVkIFJvYidzIEFjay4KKiBFbmhhbmNlZCBhIGNvbW1pdCBtZXNzYWdlLgoqIE1vdmVkIHRo
ZSBuZXcgcHJvcGVydGllcyB0byB0aGUgbmV3IFNQSSBwZXJpcGhlcmFsIGJpbmRpbmcgZmlsZS4K
CkNoYW5nZXMgaW4gdjI6CiogRHJvcHBlZCB0aGUgZHRjIGNoYW5nZXMgZm9yIG5vdy4KKiBNb3Zl
ZCB0aGUgcHJvcGVydGllcyBpbiB0aGUgZGV2aWNlJ3Mgbm9kZXMsIG5vdCB0aGUgY29udHJvbGxl
cidzLgoqIERyb3BwZWQgdGhlIHVzZWxlc3MgI2FkZHJlc3MtY2VsbHMgY2hhbmdlLgoqIEFkZGVk
IGEgbWlzc2luZyAibWluSXRlbXMiLgoqIE1vdmVkIHRoZSBuZXcgcHJvcGVydGllcyBpbiB0aGUg
c3BpLWNvbnRyb2xsZXIueWFtbCBmaWxlLgoqIEFkZGVkIGFuIGV4YW1wbGUgdXNpbmcgdHdvIHN0
YWNrZWQgbWVtb3JpZXMgaW4gdGhlCiAgc3BpLWNvbnRyb2xsZXIueWFtbCBmaWxlLgoqIFJlbmFt
ZWQgdGhlIHByb3BlcnRpZXMgdG8gZHJvcCB0aGUgWGlsaW54IHByZWZpeC4KKiBBZGRlZCBhIHBh
dGNoIHRvIGZpeCB0aGUgc3BpLW5vciBqZWRlYyB5YW1sIGZpbGUuCgpNaXF1ZWwgUmF5bmFsICgz
KToKICBkdC1iaW5kaW5nczogbXRkOiBzcGktbm9yOiBBbGxvdyB0d28gQ1MgcGVyIGRldmljZQog
IHNwaTogZHQtYmluZGluZ3M6IERlc2NyaWJlIHN0YWNrZWQvcGFyYWxsZWwgbWVtb3JpZXMgbW9k
ZXMKICBzcGk6IGR0LWJpbmRpbmdzOiBBZGQgYW4gZXhhbXBsZSB3aXRoIHR3byBzdGFja2VkIGZs
YXNoZXMKCiAuLi4vYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCAgICAgICAgICAgfCAg
MyArLQogLi4uL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sICAgICAgICAgIHwgIDcg
KysrKysKIC4uLi9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCAgICB8IDI5
ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
