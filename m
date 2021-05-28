Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487CAC4708D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:03:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 108AA6135C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 108AA6135C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JyEXgeVe75vJ5fE+ZEEBTOnGFgvwx7teTLrCoUHJz1E=; b=Ls9Qblblm3SWY2
	9xS3tTMfDw4PoAfA2UEYNXkOwVOGA7+mzXLcZQYYmOe3iquWTjQvnb9LINflQHscet+KQZye84k9n
	r7OU2Fvpe8K499vPe6eGxgsMgE/ZduGFYUnYH9+oI4D8+io0KGrfcydcPLv4FdyJU5hxpjIVLofhq
	sLjXnr/jqzfwmKG5XmKl6MfdsWdmmfn1VaCh1FR8IRuiWZwKYzIDBTbWQxaFBcLtvMKfM6vVQorTJ
	ZvSiOEeA7vzibJTUzI1RbgncK9MYfTdTSkorh9krJ2DM3+knqci9uxG6RnC4/OGywldoKzVDEDsJt
	L7uckNrUjNSTYYq9KH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmZJe-00ECai-Oc; Fri, 28 May 2021 10:02:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZJX-00ECUD-5h
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 10:02:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0DC381BF213;
 Fri, 28 May 2021 10:01:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, helmut.grohne@intenta.de,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v21 00/18] ARM Primecell PL35x support
Date: Fri, 28 May 2021 12:01:33 +0200
Message-Id: <20210528100151.286662-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_030159_390221_F59B8BB1 
X-CRM114-Status: UNSURE (   9.11  )
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
dHJvbGxlciBkcml2ZXIuCiogQWRkaXRpb24gb2YgYSBjb3VwbGUgb2YgTUFJTlRBSU5FUlMgZW50
cmllcy4KCkEgR2l0aHViIGJyYW5jaCBuYW1lZCBwbDM1MyBpcyBhdmFpbGFibGUgb24gbXkgcmVw
b3NpdG9yeToKaHR0cHM6Ly9naXRodWIuY29tL21pcXVlbHJheW5hbC9saW51eC8KClRoYW5rcywK
TWlxdcOobAoKQ2hhbmdlcyBpbiB2MjE6Ci0gQWRkZWQgUm9iJ3MgQWNrZWQtYnkvUmV2aWV3ZWQt
YnkgdGFncy4KLSBBZGRyZXNzZWQgYWxsIGNvbW1lbnRzIGZyb20gUm9iIGFuZCBNaWNoYWVsIGFi
b3V0IHRoZSBiaW5kaW5ncy4KLSBUZXN0ZWQgYm90aCBKRkZTMiBhbmQgVUJJRlMgd2l0aCBzaW1w
bGUgZmlsZSBJL08uCgpNaXF1ZWwgUmF5bmFsICgxOCk6CiAgZHQtYmluZGluZzogbWVtb3J5OiBw
bDM1My1zbWM6IFJlcGhyYXNlIHRoZSBiaW5kaW5nCiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1
My1zbWM6IERvY3VtZW50IHRoZSByYW5nZSBwcm9wZXJ0eQogIGR0LWJpbmRpbmc6IG1lbW9yeTog
cGwzNTMtc21jOiBEcm9wIHRoZSBwYXJ0aXRpb25pbmcgc2VjdGlvbgogIGR0LWJpbmRpbmc6IG1l
bW9yeTogcGwzNTMtc21jOiBEZXNjcmliZSB0aGUgY2hpbGQgcmVnIHByb3BlcnR5CiAgZHQtYmlu
ZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IEZpeCB0aGUgZXhhbXBsZSBzeW50YXggYW5kIHN0eWxl
CiAgZHQtYmluZGluZzogbWVtb3J5OiBwbDM1My1zbWM6IERyb3AgdW5zdXBwb3J0ZWQgbm9kZXMg
ZnJvbSB0aGUgZXhhbXBsZQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBGaXggdGhl
IE5BTkQgY29udHJvbGxlciBub2RlIGluIHRoZQogICAgZXhhbXBsZQogIGR0LWJpbmRpbmc6IG1l
bW9yeTogcGwzNTMtc21jOiBFbmhhbmNlIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgcmVnCiAgICBw
cm9wZXJ0eQogIGR0LWJpbmRpbmc6IG1lbW9yeTogcGwzNTMtc21jOiBDb252ZXJ0IHRvIHlhbWwK
ICBtZW1vcnk6IHBsMzUzLXNtYzogRml4IHN0eWxlCiAgbWVtb3J5OiBwbDM1My1zbWM6IFJlbmFt
ZSBnb3RvIGxhYmVscwogIG1lbW9yeTogcGwzNTMtc21jOiBMZXQgbG93ZXIgbGV2ZWwgY29udHJv
bGxlciBkcml2ZXJzIGhhbmRsZSBpbml0cwogIG1lbW9yeTogcGwzNTMtc21jOiBBdm9pZCB1c2Vs
ZXNzIGFjcm9ueW1zIGluIGRlc2NyaXB0aW9ucwogIG1lbW9yeTogcGwzNTMtc21jOiBEZWNsYXJl
IHZhcmlhYmxlcyBmb2xsb3dpbmcgYSByZXZlcnNlIGNocmlzdG1hcwogICAgdHJlZSBvcmRlcgog
IE1BSU5UQUlORVJTOiBBZGQgUEwzNTMgU01DIGVudHJ5CiAgTUFJTlRBSU5FUlM6IEFkZCBQTDM1
MyBOQU5EIGNvbnRyb2xsZXIgZW50cnkKICBkdC1iaW5kaW5nczogbXRkOiBwbDM1My1uYW5kOiBE
ZXNjcmliZSB0aGlzIGhhcmR3YXJlIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBB
ZGQgc3VwcG9ydCBmb3IgdGhlIEFSTSBQTDM1MyBTTUMgTkFORCBjb250cm9sbGVyCgogLi4uL21l
bW9yeS1jb250cm9sbGVycy9hcm0scGwzNTMtc21jLnlhbWwgICAgIHwgIDEzMyArKwogLi4uL2Jp
bmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9wbDM1My1zbWMudHh0IHwgICA0NyAtCiAuLi4vYmlu
ZGluZ3MvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbCAgICAgfCAgIDU3ICsKIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTYgKwogZHJpdmVycy9t
ZW1vcnkvcGwzNTMtc21jLmMgICAgICAgICAgICAgICAgICAgIHwgIDMxNCArLS0tLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAgOCArCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgICAxICsKIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jICB8IDExOTQgKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvcGwzNTMtc21jLmggICAgICAgICAgICAgICAgICAgICB8ICAg
MzAgLQogOSBmaWxlcyBjaGFuZ2VkLCAxNDE5IGluc2VydGlvbnMoKyksIDM4MSBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVtb3J5LWNvbnRyb2xsZXJzL2FybSxwbDM1My1zbWMueWFtbAogZGVsZXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvcGwz
NTMtc21jLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BsMzUzLXNtYy5oCgotLSAKMi4yNy4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
