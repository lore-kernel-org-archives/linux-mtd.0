Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1413BC6FD18
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95dHPqeelkrTxsAA79FadHFHyJ7HVJSpIwqgV8CgbY4=; b=eMdV8+FhtLvdWl
	oA9JZP1pynB1bs+Cfs7ePMG/yi9ljjBl8z5t1ni1G+KQtMrjE8PJp1pukHb4o0F2xFDh5a2DzaRWO
	OD9WVqAC1UIfi3VlIqXcXPFCgt6thB1is3gAPt9lgqe1HQsEiS+OlP7MFl3mqyRMiHZvGnsEUnDJn
	xa98vY/uZyv6UetGygNCm5tSImFqD0T3JllFaRUTplEK+6UkeI59o/WExqtjY5/aT3FvB3Joj9vEZ
	MqiqxKtL/rsiZCynSOViE54YyCNsDzuHQipolQ/mkIWLwciIigHG/YJBf1npUrfHdt/T0xtYECuVJ
	PBXABp0yzVpJRaa6EbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY8B-000u3I-38;
	Wed, 29 Mar 2023 15:54:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY85-000tur-2W
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 15:54:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A3161BF204;
	Wed, 29 Mar 2023 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680105264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ik6VA5/O4bfb2QZv+TNi9tynbKEN1V0x7QzIUnGobU=;
	b=lmXC+h5NEhVsiPxedwwsWTs9Z+Ajr48MtUDE7kXzzL7GwgKLVy89oRKiaJiKlwH0YEJkqA
	3wZt0Jqp7r+lRFuWqHci4vbxZ6ZSiz2aPfH62Rgwk8092f2Id7PbiUfLAoXgyrVzSruNOK
	iJCUqpSLzopMjWFPckrsFjNUJjqV7CopKetKiewnl7FaqyRceu6jZrNI0Db3da7SLznSbt
	w4qsNVug2xyIsgqpzI5vXE9fWIvp2lDMQu048xgfui50HHBb7WqzkWj7yEmE21Q7g4OBKZ
	bhl6dbT6+xv2x2WWViroGnrIoeGNT9kguBfov8F8yPCFrvnzxcsF8SpHZnSB0w==
Date: Wed, 29 Mar 2023 17:54:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Nicolas Schichan <nschichan@freebox.fr>, <george.kennedy@oracle.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <s.hauer@pengutronix.de>, <yi.zhang@huawei.com>
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
Message-ID: <20230329175421.3bd4906e@xps-13>
In-Reply-To: <2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com>
	<20230324161923.1456371-1-nschichan@freebox.fr>
	<2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085429_989428_7051309D 
X-CRM114-Status: GOOD (  15.33  )
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

SGVsbG8sCgpjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbSB3cm90ZSBvbiBTYXQsIDI1IE1hciAyMDIz
IDA5OjAyOjQwICswODAwOgoKPiBIaSwKPiA+ICAgCj4gPj4gRm9sbG93aW5nIHByb2Nlc3Mgd2ls
bCBtYWtlIHViaSBhdHRhY2hpbmcgZmFpbGVkIHNpbmNlIGNvbW1pdAo+ID4+IDFiNDJiMWEzNmZj
OTQ2ICgidWJpOiBlbnN1cmUgdGhhdCBWSUQgaGVhZGVyIG9mZnNldCAuLi4gc2l6ZSIpOgo+ID4+
Cj4gPj4gSUQ9IjB4ZWMsMHhhMSwweDAwLDB4MTUiICMgMTI4TSAxMjhLQiAyS0IKPiA+PiBtb2Rw
cm9iZSBuYW5kc2ltIGlkX2J5dGVzPSRJRAo+ID4+IGZsYXNoX2VyYXNlYWxsIC9kZXYvbXRkMAo+
ID4+IG1vZHByb2JlIHViaSBtdGQ9IjAsMjA0OCIgICMgc2V0IHZpZF9oZHIgb2Zmc2V0IGFzIDIw
NDggKG9uZSBwYWdlKQo+ID4+IChkbWVzZyk6Cj4gPj4gICAgdWJpMCBlcnJvcjogdWJpX2F0dGFj
aF9tdGRfZGV2IFt1YmldOiBWSUQgaGVhZGVyIG9mZnNldCAyMDQ4IHRvbyBsYXJnZS4KPiA+PiAg
ICBVQkkgZXJyb3I6IGNhbm5vdCBhdHRhY2ggbXRkMAo+ID4+ICAgIFVCSSBlcnJvcjogY2Fubm90
IGluaXRpYWxpemUgVUJJLCBlcnJvciAtMjIKPiA+Pgo+ID4+IFJld29yayBvcmlnaW5hbCBzb2x1
dGlvbiwgdGhlIGtleSBwb2ludCBpcyBtYWtpbmcgc3VyZQo+ID4+ICd2aWRfaGRyX3NoaWZ0ICsg
VUJJX1ZJRF9IRFJfU0laRSA8IHViaS0+dmlkX2hkcl9hbHNpemUnLAo+ID4+IHNvIHdlIHNob3Vs
ZCBjaGVjayB2aWRfaGRyX3NoaWZ0IHJhdGhlciBub3QgdmlkX2hkcl9vZmZzZXQuCj4gPj4gVGhl
biwgdWJpIHN0aWxsIHN1cHBvcnQgKHN1YilwYWdlIGFsaWdpbmVkIFZJRCBoZWFkZXIgb2Zmc2V0
LgoKCQkJCQlhbGlnbmVkCgo+ID4+Cj4gPj4gRml4ZXM6IDFiNDJiMWEzNmZjOTQ2ICgidWJpOiBl
bnN1cmUgdGhhdCBWSUQgaGVhZGVyIG9mZnNldCAuLi4gc2l6ZSIpCgpUaGlzIGNvbW1pdCBoYXMg
YmVlbiBiYWNrcG9ydGVkIHRvIHN0YWJsZSwgc28gaXQgaXMgaW1wb3J0YW50IHRoaXMgZml4CmFs
c28gZ2V0cyB0aGVyZSBxdWlja2x5OgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gPj4g
U2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiA+
PiAtLS0KPiA+PiAgIHYyLT52MzogVXNlIHByaW50aW5nIGZvcm1hdCAnJXp1JyBmb3IgVUJJX1ZJ
RF9IRFJfU0laRS4KPiA+PiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMjEgKysrKysrKysr
KysrKysrLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkgIAo+ID4gCj4gPiBbLi4uXQo+ID4gCj4gPiBIZWxsbywKPiA+IAo+ID4gSGF2
aW5nIGhhZCB0aGUgcHJvYmxlbSwgYW5kIGZvdW5kIHRoaXMgcGF0Y2ggYXMgYSBmaXgsIGZlZWwg
ZnJlZSB0bwo+ID4gYWRkIG15Ogo+ID4gICAKPiAKPiBUaGFua3MgZm9yIHRlc3RpbmcuCj4gCj4g
PiBUZXN0ZWQtYnk6IE5pY29sYXMgU2NoaWNoYW4gPG5zY2hpY2hhbkBmcmVlYm94LmZyPgoKU2Ft
ZSBoZXJlLgoKVGVzdGVkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiAjIHY1LjEwLCB2NC4xOQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
