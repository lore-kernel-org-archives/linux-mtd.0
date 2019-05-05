Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E68CC004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 09:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0126E2082F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 09:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3C1QE2K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0126E2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5HeZ43oNlP7TQdUm3ky52gPQb7egdllN40BlPYPY1k=; b=f3C1QE2K4Bn8bk
	ZKPH/tf3LCI59sqQowyVa+6aqnEzBzPnga8QtT9lhSkcjifL7XKmPQg1hjrEyuWXCa/yWVKb84J6a
	gBTVSXWI5psCaCWZHxIp5Aqo5CZxLKxmqPSU/ThPCxfyJAKQ/SeN9XBNWpqgdp5fncTuYoJ5EnpMm
	AuXfs6qlb9TAgaeY8bNJhDUojMjg7UVJnqGysCT0h22eAEQD+Cah5KS/2b9lIRva61QO+O0loWCAk
	N8NJbPWi8Il0yYG7gn8o1J599Cyqr/H73Mj0bat+/W2CCpzJnvWEIIRyXff6663QfLNofo8R8rCvJ
	IQ5Lucr0uNvRtlrbLbEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNDCF-0004VW-K1; Sun, 05 May 2019 09:12:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNDCA-0004UI-Nw; Sun, 05 May 2019 09:12:32 +0000
X-UUID: 87d2640c1a194e78898b60608f256295-20190505
X-UUID: 87d2640c1a194e78898b60608f256295-20190505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1254162023; Sun, 05 May 2019 01:12:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 02:12:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 17:12:15 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 May 2019 17:12:14 +0800
Message-ID: <1557047534.26455.81.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v3 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
Date: Sun, 5 May 2019 17:12:14 +0800
In-Reply-To: <82cc648b1e92d5ed6876b025a2da1821@milecki.pl>
References: <20190429085116.60081-1-xiaolei.li@mediatek.com>
 <20190429085116.60081-2-xiaolei.li@mediatek.com>
 <82cc648b1e92d5ed6876b025a2da1821@milecki.pl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_021230_785811_EE00F933 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com,
 srv_heupstream@mediatek.com, yellowriver2010@hotmail.com,
 jorge.ramirez-ortiz@linaro.org, matthias.bgg@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 yingjoe.chen@mediatek.com,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwgTWlxdWVsLAoKVXAgdG8gbm93LApYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1l
ZGlhdGVrLmNvbT4gKHRoZSBhdXRob3IgYW5kIG1ham9yIGNvbnRyaWJ1dG9yKSwKSm9yZ2UgUmFt
aXJlei1PcnRpeiA8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPiAodGhlIGF1dGhvciBh
bmQKbWFqb3IgY29udHJpYnV0b3IpLApSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+
IChkZXZlbG9wZXIpLApSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IChkZXZlbG9w
ZXIpCnNlbnQgQUNLIGZvciB0aGlzIFJGQyBwYXRjaC4KCk1heSBJIGFzayBpZiBpdCBpcyBlbm91
Z2ggdG8gYWNjZXB0IHRoaXMgY2hhbmdlPyBPciBzaG91bGQgSSB3YWl0IGZvcgpvdGhlciBkZXZl
bG9wZXIncyByZXNwb25zZT8KClRoYW5rcywKWGlhb2xlaQoKT24gTW9uLCAyMDE5LTA0LTI5IGF0
IDExOjQxICswMjAwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMjAxOS0wNC0yOSAxMDo1
MSwgWGlhb2xlaSBMaSB3cm90ZToKPiA+IEl0IGlzIGFsbG93ZWQgdG8gdXNlIE1USyBOQU5EIGRy
aXZlciB3aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2UuCj4gCj4gV2hhdCBkbyB5b3UgbWVhbiBi
eSAiSXQgaXMgYWxsb3dlZCI/IEFjY29yZGluZyB0byB0aGUgbGljZW5zZSBpdCdzIAo+IHJhdGhl
ciBub3QuCj4gCj4gRGlkIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlICJJdCBpdCB3YW50ZWQiPwo+
IAo+IAo+ID4gQnV0IG5vdyBpdCBpcyBvbmx5IGxpY2Vuc2VkIGFzIEdQTC0yLjAuCj4gPiBTbyBy
ZS1saWNlbnNlIGl0IGFzIGR1YWwgTUlUL0dQTCBhbmQgcmVwbGFjZSBsaWNlbnNlIHRleHQgd2l0
aAo+ID4gU1BEWCB0YWcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW9sZWkgTGkgPHhpYW9s
ZWkubGlAbWVkaWF0ZWsuY29tPgo+ID4gQWNrZWQtYnk6IEpvcmdlIFJhbWlyZXotT3J0aXogPGpv
cmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9yZz4KPiA+IEFja2VkLWJ5OiBSeWRlciBMZWUgPHJ5
ZGVyLmxlZUBtZWRpYXRlay5jb20+Cj4gCj4gTXkgZGV2ZWxvcG1lbnQgaW52b2x2ZW1lbnQgd2Fz
IHRyaXZpYWwvbWluaW1hbCwgc28gSSdtIE9LIGlmIHRoYXQncyB3aGF0IAo+IG1vc3QKPiBkZXZl
bG9wZXJzIHdhbnQuCj4gCj4gQWNrZWQtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
