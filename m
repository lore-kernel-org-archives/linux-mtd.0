Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7F0C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xxtVT6r5SovEsCWyt2qpC8WDSoHBiz00lxRlUoqc65Q=; b=mDAkrdB8QqVumu
	BbfZrjvsjVH0WNuuhd7Fa5eMf+DZVVJ6fagN3KQur0mhm9qPaNjCJoGGtvTJiP6a0fff/wj8TT7QD
	ywFX1MJ+/vS1nj4qB7fihPMT+xHPl1eeV4elzsSOVVmp8i03i+sG1cv462j9vbqqzi/oraxuD5xaZ
	HrdsvkRsEpEFbyijlsqND7fhSvISHEY0KIwNzPrgohe2lt8P3qlieMSVO4ojHFYmWnIdXnUtOKPWY
	eWt9Xp+DnPw9H9iiYzDAY2Ppv4q4bu/0nAiullyyvhCGoaUS7KBAQnCY7vybrz5Xa7BzwKUF3ys2d
	jMSQ0AL8YiAaEf5a5Opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgTl-00BTuI-RH; Wed, 26 Jan 2022 11:28:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgRI-00BTJj-CQ
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:26:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7938960002;
 Wed, 26 Jan 2022 11:26:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 0/3] Stacked/parallel memories bindings
Date: Wed, 26 Jan 2022 12:26:04 +0100
Message-Id: <20220126112608.955728-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_032612_617018_63A41994 
X-CRM114-Status: GOOD (  12.56  )
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

SGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAoKSGVyZSBpcyBhIHNpeHRoIHZlcnNp
b25zIGZvciB0aGVzZSBiaW5kaW5ncywgd2hpY2ggYXBwbGllcyBvbiB0b3Agb2YKdGhlIHY1LjE3
LXJjMSBub3cgdGhhdCBQcmF0eXVzaCdzIHdvcmsgYXMgYmVlbiBtZXJnZWQuCihodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMTExMDkxODE5MTEuMjI1MS0xLXAueWFkYXZAdGkuY29tLykK
CkNoZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2NjoKKiBBZGRlZCBQcmF0eXVzaCdzIGFja3Mu
CiogVGhlIHRvb2xpbmcgbm93IHZhbGlkYXRlcyB0aGUgYmluZGluZyAodXBkYXRpbmcgZHQtc2No
ZW1hIGlzCiAgbmVjZXNhcnkpLgoqIFVwZGF0ZWQgdGhlIG1heEl0ZW1zIGZpZWxkIHRvIDQgYXMg
YSAiYmlnIGVub3VnaCB2YWx1ZSIgYXMgZGlzY3Vzc2VkLgoKQ2hhbmdlcyBpbiB2NToKKiBVc2Vk
IHRoZSB1aW50NjQtYXJyYXkgaW5zdGVhZCBvZiB0aGUgbWF0cml4IHR5cGUuCiogVXBkYXRlZCB0
aGUgZXhhbXBsZSBhcyB3ZWxsIHRvIHVzZSBhIHNpbmdsZSAiL2JpdHMvIDY0IiBjYXN0IGJlY2F1
c2UKICBkb2luZyBpdCB0d2ljZSwgZGVzcGl0ZSBiZWluZyBzdXBwb3J0ZWQgYnkgdGhlIGxhbmd1
YWdlIGl0c2VsZiwgaXMgbm90CiAgeWV0IHNvbWV0aGluZyB0aGF0IHdlIGNhbiB1c2UgZm9yIGRl
c2NyaWJpbmcgYmluZGluZ3MuCgpDaGFuZ2VzIGluIHY0OgoqIENoYW5nZWQgdGhlIHR5cGUgb2Yg
cHJvcGVydGllcyB0byB1aW50NjQtYXJyYXlzIGluIG9yZGVyIHRvIGJlIGFibGUgdG8KICBkZXNj
cmliZSB0aGUgc2l6ZSBvZiBlYWNoIGVsZW1lbnQgaW4gdGhlIGFycmF5LgoqIFVwZGF0ZWQgdGhl
IGV4YW1wbGUgYWNjb3JkaW5nbHkuCgpDaGFuZ2VzIGluIHYzOgoqIFJlYmFzZWQgb24gdG9wIG9m
IFByYXR5dXNoJ3MgcmVjZW50IGNoYW5nZXMuCiogRHJvcHBlZCB0aGUgY29tbWl0IGFsbG93aW5n
IHRvIHByb3ZpZGUgdHdvIHJlZyBlbnRyaWVzIG9uIHRoZSBub2RlCiAgbmFtZS4KKiBEcm9wcGVk
IHRoZSBjb21taXQgcmVmZXJlbmNpbmcgc3BpLWNvbnRyb2xsZXIueWFtbCBmcm9tCiAgamVkZWMs
c3BpLW5vci55YW1sLCBub3cgcmVwbGFjZWQgYnkgc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCBh
bmQKICBhbHJlYWR5IGRvbmUgaW4gUHJhdHl1c2gncyBzZXJpZXMuCiogQWRkZWQgUm9iJ3MgQWNr
LgoqIEVuaGFuY2VkIGEgY29tbWl0IG1lc3NhZ2UuCiogTW92ZWQgdGhlIG5ldyBwcm9wZXJ0aWVz
IHRvIHRoZSBuZXcgU1BJIHBlcmlwaGVyYWwgYmluZGluZyBmaWxlLgoKQ2hhbmdlcyBpbiB2MjoK
KiBEcm9wcGVkIHRoZSBkdGMgY2hhbmdlcyBmb3Igbm93LgoqIE1vdmVkIHRoZSBwcm9wZXJ0aWVz
IGluIHRoZSBkZXZpY2UncyBub2Rlcywgbm90IHRoZSBjb250cm9sbGVyJ3MuCiogRHJvcHBlZCB0
aGUgdXNlbGVzcyAjYWRkcmVzcy1jZWxscyBjaGFuZ2UuCiogQWRkZWQgYSBtaXNzaW5nICJtaW5J
dGVtcyIuCiogTW92ZWQgdGhlIG5ldyBwcm9wZXJ0aWVzIGluIHRoZSBzcGktY29udHJvbGxlci55
YW1sIGZpbGUuCiogQWRkZWQgYW4gZXhhbXBsZSB1c2luZyB0d28gc3RhY2tlZCBtZW1vcmllcyBp
biB0aGUKICBzcGktY29udHJvbGxlci55YW1sIGZpbGUuCiogUmVuYW1lZCB0aGUgcHJvcGVydGll
cyB0byBkcm9wIHRoZSBYaWxpbnggcHJlZml4LgoqIEFkZGVkIGEgcGF0Y2ggdG8gZml4IHRoZSBz
cGktbm9yIGplZGVjIHlhbWwgZmlsZS4KCk1pcXVlbCBSYXluYWwgKDMpOgogIGR0LWJpbmRpbmdz
OiBtdGQ6IHNwaS1ub3I6IEFsbG93IHR3byBDUyBwZXIgZGV2aWNlCiAgc3BpOiBkdC1iaW5kaW5n
czogRGVzY3JpYmUgc3RhY2tlZC9wYXJhbGxlbCBtZW1vcmllcyBtb2RlcwogIHNwaTogZHQtYmlu
ZGluZ3M6IEFkZCBhbiBleGFtcGxlIHdpdGggdHdvIHN0YWNrZWQgZmxhc2hlcwoKIC4uLi9iaW5k
aW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sICAgICAgICAgICB8ICAzICsrLQogLi4uL2JpbmRp
bmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sICAgICAgICAgIHwgIDcgKysrKysrCiAuLi4vYmlu
ZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgICAgfCAyNSArKysrKysrKysrKysr
KysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Ci0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
