Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF80AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:23:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C18D61019
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C18D61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ng8IKk/hkqmcHYwuHnJ21r4kHcfnqdPY4HvlHckOk/A=; b=oWTE+49Ky0j5s1
	3sfPzh9hwYEK8uqlHQhzD5HgPgh+YxhedyQBC9IchXQ/rOFN8ckdqFqzbIHFJ03P9Fr/gsDYsElfn
	mDXPTeyU2GK3rB4JL2Sn4OLq+BzvXGT6lkFT5umEKXDwty8KcP5UknIdjbQYFex88WPHkNO/3gkuR
	+79XCE2nAYQRtKzaEz8a5nCEVKcf5FZGjTQw/7t+qnPwgXqBQq6pSQr3W5aOuuBRLbCPiS2c/3beN
	inHYXZzsfC8fC5v8hELv1HmYeaNO1RCoA+OPsM0B5JxWIV0rr0mZJnbf6f18a4QUp67oSNJUTn4Hm
	pG05pnuXELT+F5dfPp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYsdq-003Too-Uz; Fri, 08 Oct 2021 16:22:38 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsdn-003TnA-4D
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 16:22:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6B314240003;
 Fri,  8 Oct 2021 16:22:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaimeliao@mxic.com.tw, juliensu@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 00/10] Macronix ECC engine
Date: Fri,  8 Oct 2021 18:22:18 +0200
Message-Id: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_092235_326200_2A754600 
X-CRM114-Status: GOOD (  13.05  )
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

SGVsbG8gYWxsLAoKVGhpcyBzZXJpZXMgaXMgbm90IDEwMCUgc3RhYmxlIHlldCBidXQgSSBiZWxp
ZXZlIGl0IHNob3VsZCBiZQpzZW50IG91dCBpbiBvcmRlciB0byBoZWxwIG90aGVyIHBlb3BsZSB0
cnlpbmcgdG8gdXNlIHRoZSBFQ0MgZnJhbWV3b3JrCndpdGggYSBTUEkgY29udHJvbGxlci4gQmFz
aWNhbGx5LCBNYWNyb25peCBFQ0MgZW5naW5lIGNhbiBiZSB1c2VkIGFzIGFuCmV4dGVybmFsIGVu
Z2luZSAodGFrZXMgdGhlIGRhdGEsIHByb2NlZWRzIHRvIHRoZSBjYWxjdWxhdGlvbnMsIHdyaXRl
cwpiYWNrIHRoZSBFQ0MgYnl0ZXMpIG9yIGFzIGEgcGlwZWxpbmVkIGVuZ2luZSBkb2luZyBvbi10
aGUtZmx5CmNhbGN1bGF0aW9ucyAod2hpY2ggaXMgdmVyeSBjb21tb24gaW4gdGhlIHJhdyBOQU5E
IHdvcmxkKS4KCkluIHRoZSBkZXZpY2UgdHJlZSwgdGhlIEVDQyBlbmdpbmUgc2hvdWxkIGJlIGRl
c2NyaWJlZCBhcyBhIHNlcGFyYXRlZCBEVApub2RlLiBUaGVuOgoqIGV4dGVybmFsIGNhc2U6IHRo
ZSBmbGFzaCBub2RlIHNob3VsZCBwcm92aWRlIGEgbmFuZC1lY2MtZW5naW5lCiAgcHJvcGVydHkg
cG9pbnRpbmcgdG8gdGhlIEVDQyBlbmdpbmUgbm9kZS4KKiBwaXBlbGluZWQgY2FzZTogdGhlIGZs
YXNoIG5vZGUgc2hvdWxkIHByb3ZpZGUgYSBuYW5kLWVjYy1lbmdpbmUKICBwcm9wZXJ0eSBwb2lu
dGluZyB0byB0aGUgU1BJIGNvbnRyb2xsZXIsIGl0c2VsZiB3aXRoIGFub3RoZXIKICBuYW5kLWVj
Yy1lbmdpbmUgcHJvcGVydHkgcG9pbnRpbmcgYXQgdGhlIEVDQyBlbmdpbmUgbm9kZS4KCkkgd2ls
bCByZXN1Ym1pdCB0aGlzIGxhdGVyIHdoZW4gSSB3aWxsIGJlIGRvbmUgdmFsaWRhdGluZyB0aGUg
aGFyZHdhcmUKYW5kIHRoZSBkcml2ZXIuCgpDaGVlcnMsCk1pcXXDqGwKCk1hc29uIFlhbmcgKDEp
OgogIG10ZDogc3BpbmFuZDogbWFjcm9uaXg6IFVzZSByYW5kb20gcHJvZ3JhbSBsb2FkCgpNaXF1
ZWwgUmF5bmFsICg5KToKICBtdGQ6IHNwaW5hbmQ6IEZpeCBjb21tZW50CiAgZHQtYmluZGluZ3M6
IHZlbmRvci1wcmVmaXhlczogVXBkYXRlIE1hY3Jvbml4IHByZWZpeAogIGR0LWJpbmRpbmdzOiBt
dGQ6IERlc2NyaWJlIE1hY3Jvbml4IE5BTkQgRUNDIGVuZ2luZQogIG10ZDogbmFuZDogZWNjOiBB
ZGQgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydCBoYXJkd2FyZSBlbmdpbmVzCiAgbXRkOiBuYW5k
OiBteGljLWVjYzogQWRkIE1hY3Jvbml4IGV4dGVybmFsIEVDQyBlbmdpbmUgc3VwcG9ydAogIG10
ZDogbmFuZDogbXhpYy1lY2M6IFN1cHBvcnQgU1BJIHBpcGVsaW5lZCBtb2RlCiAgc3BpOiBteGlj
OiBGaXggdGhlIHRyYW5zbWl0IHBhdGgKICBzcGk6IG14aWM6IEFkZCBzdXBwb3J0IGZvciBkaXJl
Y3QgbWFwcGluZwogIHNwaTogbXhpYzogQWRkIHN1cHBvcnQgZm9yIHBpcGVsaW5lZCBFQ0Mgb3Bl
cmF0aW9ucwoKIC4uLi9iaW5kaW5ncy9tdGQvbXhpYyxuYW5kLWVjYy1lbmdpbmUueWFtbCAgICB8
ICA3OCArKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwg
ICAzICsKIGRyaXZlcnMvbXRkL25hbmQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAg
NiArCiBkcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9tdGQvbmFuZC9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICst
CiBkcml2ZXJzL210ZC9uYW5kL2VjYy1teGljLmMgICAgICAgICAgICAgICAgICAgfCA3OTcgKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL210ZC9uYW5kL2VjYy5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgODkgKysKIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICAgICAgICAgICAg
ICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyAgICAgICAgICAg
ICAgIHwgICAyICstCiBkcml2ZXJzL3NwaS9zcGktbXhpYy5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAzMDkgKysrKysrLQogaW5jbHVkZS9saW51eC9tdGQvbmFuZC1lY2MtbXhpYy5oICAgICAg
ICAgICAgIHwgIDM2ICsKIGluY2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICAgICAgICAgICAgICAg
ICAgICB8ICAxMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMjk2IGluc2VydGlvbnMoKyksIDQ4IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbXhpYyxuYW5kLWVjYy1lbmdpbmUueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbXRkL25hbmQvZWNjLW14aWMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
bGludXgvbXRkL25hbmQtZWNjLW14aWMuaAoKLS0gCjIuMjcuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
