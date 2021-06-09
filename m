Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB3C47095
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802846128A
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 08:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 802846128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZKTYxYQkmT5IYUgWjCN0aPHy7SO6FrU2AWt4F8ntW+Q=; b=jiVqHF+1IPV31S
	jj6YOm5W4wpZnea5rfthXD9ktl8QM0yq9v/P/EFtBDeei0bKYXuYPPikIBrIiIbQbnEXtBuAPH1HR
	nbyQQE0Odk/BuNp7GdaNLZS2JGnKsyVz1B3hibvbym8zyw6jSq0MC2xLkXVpIIbHL+zWHwUfzDLZs
	XqsD033osnzFmIl7N9ptAi81HcslJtfhmIfsk5qTFGeS9ROgV55J4FwAfYtvrFwEla+UA6f4YLWhb
	RqocqcWqnRxfsPdVvSZmcvr3oilZoDlX57IaLY+6AmC5YLtLK9actNbLhUj2iLsK4K8pjOznVUaD1
	yHun/i8LlZamna1bieWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqt9l-00CF6H-6p; Wed, 09 Jun 2021 08:01:45 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqt9M-00CEq0-GO; Wed, 09 Jun 2021 08:01:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7FADB200013;
 Wed,  9 Jun 2021 08:01:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v22 00/18] ARM Primecell PL35x support
Date: Wed,  9 Jun 2021 10:00:54 +0200
Message-Id: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010120_842716_9DCFBF69 
X-CRM114-Status: UNSURE (   9.48  )
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

SGVsbG8sCgpJIGFtIHRha2luZyBvdmVyIE5hZ2EncyBzZXJpZXMsIGhlcmUgYXJlIHRoZSBtYWpv
ciBjaGFuZ2VzOgoqIENsZWFuaW5nIG9mIHRoZSBTTUMgYnVzIGJpbmRpbmcgZmlsZSAoYW5kIHlh
bWwgY29udmVyc2lvbikKKiBTdXBlcmZpY2lhbCBjbGVhbmluZyBhbmQgZ3JlYXQgc2ltcGxpZmlj
YXRpb24gb2YgdGhlIFNNQyBidXMgZHJpdmVyCiogQWRkaXRpb24gb2YgYSB5YW1sIGZpbGUgZGVz
Y3JpYmluZyB0aGUgTkFORCBjb250cm9sbGVyCiogRnVsbCByZXdvcmsgb2YgdGhlIE5BTkQgY29u
dHJvbGxlciBkcml2ZXIuIEpGRlMyIGFuZCBVQklGUyBub3QgdGVzdGVkCiAgeWV0LCBvbmx5IGJh
cmUgdGVzdCB0b29scyBoYXZlIGJlZW4gdXNlZCB0byBwcm9vdmUgYmFzaWMgY29ycmVjdG5lc3MK
ICBvZiB0aGUgaGVscGVycy4KKiBBZGRpdGlvbiBvZiBhIGNvdXBsZSBvZiBNQUlOVEFJTkVSUyBl
bnRyaWVzLgoKQSBHaXRodWIgYnJhbmNoIG5hbWVkIHBsMzUzIGlzIGF2YWlsYWJsZSBvbiBteSBy
ZXBvc2l0b3J5OgpodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5bmFsL2xpbnV4LwoKVGhhbmtz
LApNaXF1w6hsCgpDaGFuZ2VzIGluIHYyMjoKLSBNaXNjIHR5cG8gZml4ZXMuCi0gTGlnaHQgcmV3
b3JkaW5nIG9mIGEgZmV3IGNvbW1pdCB0aXRsZXMuCi0gTm90IGZvcmdldHRpbmcgdG8gQ2M6IFJv
YiBhbmQgS3J6eXN6dG9mIHRoaXMgdGltZS4uLgoKQ2hhbmdlcyBpbiB2MjE6Ci0gQWRkZWQgUm9i
J3MgQWNrZWQtYnkvUmV2aWV3ZWQtYnkgdGFncy4KLSBBZGRyZXNzZWQgYWxsIGNvbW1lbnRzIGZy
b20gUm9iIGFuZCBNaWNoYWVsIGFib3V0IHRoZSBiaW5kaW5ncy4KLSBUZXN0ZWQgYm90aCBKRkZT
MiBhbmQgVUJJRlMgd2l0aCBzaW1wbGUgZmlsZSBJL08uCgpNaXF1ZWwgUmF5bmFsICgxOCk6CiAg
ZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IFJlcGhyYXNlIHRoZSBiaW5kaW5nCiAgZHQt
YmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERvY3VtZW50IHRoZSByYW5nZSBwcm9wZXJ0eQog
IGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBEcm9wIHRoZSBwYXJ0aXRpb25pbmcgc2Vj
dGlvbgogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBEZXNjcmliZSB0aGUgY2hpbGQg
cmVnIHByb3BlcnR5CiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IEZpeCB0aGUgZXhh
bXBsZSBzeW50YXggYW5kIHN0eWxlCiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERy
b3AgdW5zdXBwb3J0ZWQgbm9kZXMgZnJvbSB0aGUgZXhhbXBsZQogIGR0LWJpbmRpbmc6IG1lbW9y
eTogcGwzNTMtc21jOiBGaXggdGhlIE5BTkQgY29udHJvbGxlciBub2RlIGluIHRoZQogICAgZXhh
bXBsZQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBFbmhhbmNlIHRoZSBkZXNjcmlw
dGlvbiBvZiB0aGUgcmVnCiAgICBwcm9wZXJ0eQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMt
c21jOiBDb252ZXJ0IHRvIHlhbWwKICBtZW1vcnk6IHBsMzUzLXNtYzogRml4IHN0eWxlCiAgbWVt
b3J5OiBwbDM1My1zbWM6IFJlbmFtZSBnb3RvIGxhYmVscwogIG1lbW9yeTogcGwzNTMtc21jOiBM
ZXQgbG93ZXIgbGV2ZWwgY29udHJvbGxlciBkcml2ZXJzIGhhbmRsZSBpbml0cwogIG1lbW9yeTog
cGwzNTMtc21jOiBBdm9pZCB1c2VsZXNzIGFjcm9ueW1zIGluIGRlc2NyaXB0aW9ucwogIG1lbW9y
eTogcGwzNTMtc21jOiBEZWNsYXJlIHZhcmlhYmxlcyBmb2xsb3dpbmcgYSByZXZlcnNlIGNocmlz
dG1hcwogICAgdHJlZSBvcmRlcgogIE1BSU5UQUlORVJTOiBBZGQgUEwzNTMgU01DIGVudHJ5CiAg
TUFJTlRBSU5FUlM6IEFkZCBQTDM1MyBOQU5EIGNvbnRyb2xsZXIgZW50cnkKICBkdC1iaW5kaW5n
czogbXRkOiBwbDM1My1uYW5kOiBEZXNjcmliZSB0aGlzIGhhcmR3YXJlIGNvbnRyb2xsZXIKICBt
dGQ6IHJhd25hbmQ6IHBsMzUzOiBBZGQgc3VwcG9ydCBmb3IgdGhlIEFSTSBQTDM1MyBTTUMgTkFO
RCBjb250cm9sbGVyCgogLi4uL21lbW9yeS1jb250cm9sbGVycy9hcm0scGwzNTMtc21jLnlhbWwg
ICAgIHwgIDEzMyArKwogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9wbDM1My1zbWMu
dHh0IHwgICA0NyAtCiAuLi4vYmluZGluZ3MvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbCAg
ICAgfCAgIDU3ICsKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMTYgKwogZHJpdmVycy9tZW1vcnkvcGwzNTMtc21jLmMgICAgICAgICAgICAgICAgICAg
IHwgIDMxNCArLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgIHwgICAgOCArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgfCAgICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5j
ICB8IDExOTQgKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvcGwzNTMtc21jLmggICAg
ICAgICAgICAgICAgICAgICB8ICAgMzAgLQogOSBmaWxlcyBjaGFuZ2VkLCAxNDE5IGluc2VydGlv
bnMoKyksIDM4MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2FybSxwbDM1My1zbWMueWFt
bAogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvcGwzNTMtc21jLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1s
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250
cm9sbGVyLmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BsMzUzLXNtYy5oCgot
LSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
