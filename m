Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C43EC676ED
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 15:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D0CD20861
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 15:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="soTr4501"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D0CD20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHUjZSqO5VKAscF4sMxS/h2Zd0iQFbEYq3LER7mT548=; b=soTr4501xG77zF
	nrUH7W+p1AdyB6vfFCm16Znpn+lRz2cdnSbceJPKSGmHYhoEEGyO4hnkksZQwHaqPctkikdiPfkgZ
	viGRiWkaLFLMUZnViY2FII5AcwfiTvgv0FT2Epr+elu43zTwtFsp/ksbFEnPuYkEay7qprJ0mgMkI
	Hn77NiKpU58Zc1aaj5ntwH6KaNvPFvRe4cF/8SIG3hlROtP8xGPbpowCfnZJxXLnROYVi/ebgNzw9
	k7pxccf344kyWSJNtemYsBvFkCTY7GQTq5q4FXtSoBT0ovHS8VDUpO8m44c1Il731NGp50orVD0MT
	K2L/W/mq1W96V6G67B+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glEg5-0003El-N2; Sun, 20 Jan 2019 15:06:25 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glEfs-00034a-3w; Sun, 20 Jan 2019 15:06:14 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 54D372074A; Sun, 20 Jan 2019 16:06:08 +0100 (CET)
Received: from xps13 (unknown [77.136.42.183])
 by mail.bootlin.com (Postfix) with ESMTPSA id E1A0C20654;
 Sun, 20 Jan 2019 16:06:06 +0100 (CET)
Date: Sun, 20 Jan 2019 16:06:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller driver
Message-ID: <20190120160605.33689354@xps13>
In-Reply-To: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_070612_296914_12DFCC8A 
X-CRM114-Status: GOOD (  12.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmlhbnhpbiwKCkppYW54aW4gUGFuIDxqaWFueGluLnBhbkBhbWxvZ2ljLmNvbT4gd3JvdGUg
b24gU3VuLCAyMCBKYW4gMjAxOQowMTowMjozNSArMDgwMDoKCj4gQWRkIGVudHJ5IGZvciBBbWxv
Z2ljIE5BTkQgY29udHJvbGxlciBkcml2ZXIgYW5kIGl0cyBiaW5kaW5nc1swXS4KPiAKPiBbMF0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTQ3NTY2Njg0LTU3NDcyLTEtZ2l0LXNlbmQt
ZW1haWwtamlhbnhpbi5wYW5AYW1sb2dpYy5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogTGlhbmcg
WWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFueGluIFBh
biA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+CgpJZiB5b3UgYXJlIHRoZSBhdXRob3Igb2YgdGhl
IHBhdGNoIHlvdXIgU2lnbmVkLW9mZi1ieSBzaG91bGQgY29tZSBmaXJzdC4KCkFsc28sIHdoeSBp
cyBMaWFuZyB0aGUgTWFpbnRhaW5lcj8gV2h5IG5vdCB5b3U/Cgo+IC0tLQo+ICBNQUlOVEFJTkVS
UyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCAwYWJlY2M1Li43ZDk3
NmExIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAt
OTYyOCw2ICs5NjI4LDEzIEBAIEY6CWRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVzb24vYW8tY2Vj
LmMKPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lc29uLWFv
LWNlYy50eHQKPiAgVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0Cj4gIAo+
ICtNRVNPTiBOQU5EIENPTlRST0xMRVIgRFJJVkVSIEZPUiBBTUxPR0lDIFNPQ1MKPiArTToJTGlh
bmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPiArTDoJbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiArUzoJTWFpbnRhaW5lZAo+ICtGOglkcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl8qCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dp
YyxtZXNvbi1uYW5kLnR4dAo+ICsKPiAgTUlDUk9CTEFaRSBBUkNISVRFQ1RVUkUKPiAgTToJTWlj
aGFsIFNpbWVrIDxtb25zdHJAbW9uc3RyLmV1Pgo+ICBXOglodHRwOi8vd3d3Lm1vbnN0ci5ldS9m
ZHQvCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
