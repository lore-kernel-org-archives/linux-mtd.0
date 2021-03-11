Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA34C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:44:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8CA64FAA
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F8CA64FAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LxH5fwy1G35nCe+OTfEpKR1L8Wdp4UX5HAl2aW0w9oM=; b=DbwMLrLF6DcSJcOZeiHfRseQu
	BcU0KlhDQi94aQUWL97YS0XvsvLKNWq5L+QOTWyz2mrQMNBTfFeikhQ1BwbAVFM2AuE9M3QtNM32b
	7s5alcoQpLGG10CHwM248kEZ5Bg5UUThblFvIw/pO2dkL2iF97o83V1FifFnKqtuDvY/eaeUH0nyy
	ZDalKX7XIkn5cqYrcOLWQSwwloL+8FAK89fFd544Y2lJgJQLR2t74qDWqNsRdAgqkNxFIuc+AgWRn
	Ui8VfCP0R4XrlTWx30MquRVUuvZlaZboB/zfjlQB/GIycz5zFhVH8s9bRTeCgNtOS8HNUdyGJ6ZBo
	eXZ2TPcNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJjk-008y7p-EI; Thu, 11 Mar 2021 11:44:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJfA-008xDp-3M; Thu, 11 Mar 2021 11:39:35 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0AEA620002;
 Thu, 11 Mar 2021 11:39:30 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:39:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: mtk: Fix WAITRDY break condition and timeout
Message-ID: <20210311123930.0c41ec78@xps13>
In-Reply-To: <20210309000107.1368404-1-hauke@hauke-m.de>
References: <20210309000107.1368404-1-hauke@hauke-m.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113932_524291_0DA1F677 
X-CRM114-Status: GOOD (  17.44  )
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

SGkgSGF1a2UsCgpIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1a2UtbS5kZT4gd3JvdGUgb24gVHVl
LCAgOSBNYXIgMjAyMSAwMTowMTowNworMDEwMDoKCj4gVGhpcyBmaXhlcyBOQU5EX09QX1dBSVRS
RFlfSU5TVFIgb3BlcmF0aW9uIGluIHRoZSBkcml2ZXIuIFdpdGhvdXQgdGhpcwo+IGNoYW5nZSB0
aGUgZHJpdmVyIHdhaXRzIHRpbGwgdGhlIHN5c3RlbSBpcyBidXN5LCBidXQgd2Ugc2hvdWxkIHdh
aXQgdGlsbAo+IHRoZSBidXN5IGZsYWcgaXMgY2xlYXJlZC4gVGhlIHJlYWRsX3BvbGxfdGltZW91
dCgpIGZ1bmN0aW9uIGdldHMgYSBicmVhawo+IGNvbmRpdGlvbiwgbm90IGEgd2FpdCBjb25kaXRp
b24uCj4gCj4gSW4gYWRkaXRpb24gZml4IHRoZSB0aW1lb3V0LiBUaGUgdGltZW91dF9tcyBpcyBn
aXZlbiBpbiBtcywgYnV0IHRoZQo+IHJlYWRsX3BvbGxfdGltZW91dCgpIGZ1bmN0aW9uIHRha2Vz
IHRoZSB0aW1lb3V0IGluIHVzLiBNdWx0aXBsZSB0aGUKPiBnaXZlbiB0aW1lb3V0IGJ5IDEwMDAg
dG8gY29udmVydCBpdC4KPiAKPiBXaXRob3V0IHRoaXMgY2hhbmdlLCB0aGUgZHJpdmVyIGRvZXMg
bm90IHdvcmsgYXQgYWxsLCBpdCBkb2Vzbid0IGV2ZW4KPiBpZGVudGlmeSB0aGUgTkFORCBjaGlw
Lgo+IAo+IEZpeGVzOiA1MTk3MzYwZjllMDkgKCJtdGQ6IHJhd25hbmQ6IG10azogQ29udmVydCB0
aGUgZHJpdmVyIHRvIGV4ZWNfb3AoKSIpCj4gU2lnbmVkLW9mZi1ieTogSGF1a2UgTWVocnRlbnMg
PGhhdWtlQGhhdWtlLW0uZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiBpbmRleCA1N2YxZjE3MDg5OTQuLjVj
NWM5MjEzMjI4NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IEBAIC00ODgsOCArNDg4
LDggQEAgc3RhdGljIGludCBtdGtfbmZjX2V4ZWNfaW5zdHIoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwKPiAgCQlyZXR1cm4gMDsKPiAgCWNhc2UgTkFORF9PUF9XQUlUUkRZX0lOU1RSOgo+ICAJCXJl
dHVybiByZWFkbF9wb2xsX3RpbWVvdXQobmZjLT5yZWdzICsgTkZJX1NUQSwgc3RhdHVzLAo+IC0J
CQkJCSAgc3RhdHVzICYgU1RBX0JVU1ksIDIwLAo+IC0JCQkJCSAgaW5zdHItPmN0eC53YWl0cmR5
LnRpbWVvdXRfbXMpOwo+ICsJCQkJCSAgIShzdGF0dXMgJiBTVEFfQlVTWSksIDIwLAo+ICsJCQkJ
CSAgaW5zdHItPmN0eC53YWl0cmR5LnRpbWVvdXRfbXMgKiAxMDAwKTsKPiAgCWRlZmF1bHQ6Cj4g
IAkJYnJlYWs7Cj4gIAl9CgpBcHBsaWVkIHRvIG10ZC9maXhlcy4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
