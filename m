Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A360CC54E4A
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 20:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF2E214D8
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 20:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIrIT0hg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF2E214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSbyob4wxD06yq+jYnKDM0jvL4BGo2ceQjOSc/Frqls=; b=YIrIT0hg2XjJ/V
	KMJ6gi6u4i+PfkedEcanL6FLlBTYVRUDuozvEWQ92eYOZFMpZS26H8yo0UTYdCarBnAzCGxfTC3xO
	06u6Wswz1Nogws1+86qEgDUIZYgiJE7iiZJyJY22Xflyx5ETbASuYauPMeSkvpXZ2HBY52cXUXpwE
	ha9k6JQgOiJuOPiv9cn8HdLIykYemQ7DGbAGZCYpCZhRtB8RaNqse+/m6qIkzBYMWivsUGwDGv/Ch
	rk3G48DJU7SI6USj1yuZPjykMX8RTSQZDsRavUmtbw24JbfSIOBUieIenUlqqWJM3SiqpIZEbIBM0
	85Ftsd0AYA47UY1C0MGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXWJY-0002Ca-Lh; Sat, 09 May 2020 20:43:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXWJV-0002BN-6Q
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 20:43:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 77CF8608F452;
 Sat,  9 May 2020 22:43:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GhjG3BnEmBFb; Sat,  9 May 2020 22:43:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6B76360CEF4B;
 Sat,  9 May 2020 22:43:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BmliafshgV2g; Sat,  9 May 2020 22:43:00 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4536B6089348;
 Sat,  9 May 2020 22:43:00 +0200 (CEST)
Date: Sat, 9 May 2020 22:43:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1221365235.202803.1589056980096.JavaMail.zimbra@nod.at>
In-Reply-To: <20200509191431.15862-7-miquel.raynal@bootlin.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-7-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 06/17] mtd: rawnand: nandsim: Remove debugfs entries at
 unload time
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Remove debugfs entries at unload time
Thread-Index: Fci1+cSl1GOEDxruwy5pQE9P2wty3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_134313_382484_84023190 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: dedekind@infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
PiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiVHVkb3IgQW1iYXJ1
cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sCj4gImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+LCBkZWRla2luZEBpbmZyYWRlYWQub3JnLCAiTWlxdWVsIFJh
eW5hbCIKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBHZXNlbmRldDogU2Ftc3RhZywg
OS4gTWFpIDIwMjAgMjE6MTQ6MTkKPiBCZXRyZWZmOiBbUEFUQ0ggMDYvMTddIG10ZDogcmF3bmFu
ZDogbmFuZHNpbTogUmVtb3ZlIGRlYnVnZnMgZW50cmllcyBhdCB1bmxvYWQgdGltZQoKPiBDcmVh
dGUgYSBuc19kZWJ1Z2ZzX3JlbW92ZSgpIGhlbHBlciBmb3IgdGhhdCBhbmQgY2FsbCBpdCBpbgo+
IG5zX2NsZWFudXBfbW9kdWxlKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kc2ltLmMgfCA2ICsrKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gaW5kZXggYzhlOWM3MGE2NjQxLi43ODYyYzY1ZTMyYWQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gQEAgLTUyMCw2ICs1MjAsMTEgQEAgc3RhdGlj
IGludCBuc19kZWJ1Z2ZzX2NyZWF0ZShzdHJ1Y3QgbmFuZHNpbSAqbnMpCj4gCXJldHVybiAwOwo+
IH0KPiAKPiArc3RhdGljIHZvaWQgbnNfZGVidWdmc19yZW1vdmUoc3RydWN0IG5hbmRzaW0gKm5z
KQo+ICt7Cj4gKwlkZWJ1Z2ZzX3JlbW92ZShucy0+ZGVudCk7Cj4gK30KPiArCj4gLyoKPiAgKiBB
bGxvY2F0ZSBhcnJheSBvZiBwYWdlIHBvaW50ZXJzLCBjcmVhdGUgc2xhYiBhbGxvY2F0aW9uIGZv
ciBhbiBhcnJheQo+ICAqIGFuZCBpbml0aWFsaXplIHRoZSBhcnJheSBieSBOVUxMIHBvaW50ZXJz
Lgo+IEBAIC0yMzk4LDYgKzI0MDMsNyBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgbnNfY2xlYW51cF9t
b2R1bGUodm9pZCkKPiAJc3RydWN0IG5hbmRzaW0gKm5zID0gbmFuZF9nZXRfY29udHJvbGxlcl9k
YXRhKGNoaXApOwo+IAlpbnQgaTsKPiAKPiArCW5zX2RlYnVnZnNfcmVtb3ZlKG5zKTsKPiAJbnNf
ZnJlZShucyk7ICAgIC8qIEZyZWUgbmFuZHNpbSBwcml2YXRlIHJlc291cmNlcyAqLwoKV2h5IGlz
IHRoaXMgc3BlY2lhbCBhbmQgY2Fubm90IGRvbmUgaW4gbnNfZnJlZSgpPwoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
