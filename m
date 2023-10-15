Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5546CCDB47E
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Oct 2023 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cG46k20sb3zxxT4woRprgwu1SSB0rrwXY9Fo1P2nbPw=; b=bCmQK1N4Z+gcwHIUxTIC5dj7u7
	EnxdeBC0bCdM3ZL9GtaZKZvhFo+WSWlkw6WJZA8y0PLNe9TM49i62Zlh+nGRsWryRQfGTT0SD7KkU
	jeTExd1NjWJ4Be1VlPU/fwr+kgCMBKP9kUx/sHwXAS9RkbmYlqAVR1etPHa9LxUL3XT7+HOxGCEyU
	4l8Jn8Krk34zydAtZ+q8oK9ORvl8kmA6+bNBU78SKVDXYmuWrzGgJttlZYV8pe08X1DCYNm7uvvra
	JGa80bgVNSWnHt5rTL3FXx+pzGT745MSXSienthuG5KmrRSsWB237xNfrBATQhV+/Vs109m8dCnsU
	xLswE/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs6sZ-007cWn-0K;
	Sun, 15 Oct 2023 19:34:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs6sS-007cVi-1L;
	Sun, 15 Oct 2023 19:34:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 840C6622F589;
	Sun, 15 Oct 2023 21:34:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Lylr3PuAgrRB; Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6CF8062348B3;
	Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l11TOmD_pnae; Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 32CA0622F589;
	Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
Date: Sun, 15 Oct 2023 21:34:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
	alexandre torgue <alexandre.torgue@foss.st.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <935504729.4822.1697398448017.JavaMail.zimbra@nod.at>
In-Reply-To: <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com> <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
Subject: Re: [PATCH v2 00/12] ubi: fastmap: Fix a series of wear leveling
 problems
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Fix a series of wear leveling problems
Thread-Index: ppJEmSkjOitdzNt7LeKwxHqbtGToow==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_123416_789945_620E13C7 
X-CRM114-Status: UNSURE (   8.73  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFn
aGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJtY29xdWVsaW4gc3RtMzIiIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPiwgImFsZXhhbmRyZSB0b3JndWUiIDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAibGludXgtc3RtMzIiIDxsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tPiwKPiAibGludXgtYXJtLWtlcm5lbCIgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZz4sICJCYWdhcyBTYW5qYXlhIiA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Cj4gR2Vz
ZW5kZXQ6IERvbm5lcnN0YWcsIDEyLiBPa3RvYmVyIDIwMjMgMDQ6NTc6NTIKPiBCZXRyZWZmOiBS
ZTogW1BBVENIIHYyIDAwLzEyXSB1Ymk6IGZhc3RtYXA6IEZpeCBhIHNlcmllcyBvZiB3ZWFyIGxl
dmVsaW5nIHByb2JsZW1zCgo+IOWcqCAyMDIzLzgvMjggMTQ6MzgsIFpoaWhhbyBDaGVuZyDlhpnp
gZM6Cj4+IFRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgZml4IHRocmVlIHByb2JsZW1zOgo+PiAxLiBJ
bmNvbnNpc3RlbnQgZXJhc2UgY291bnRlciBmcm9tIHdsIGVudHJ5IGFuZCBkaXNrLCBmb3IgcGF0
Y2hlcyAxfjQuCj4+IDIuIFNhbWUgUEVCIGlzIGFsd2F5cyByZXN1ZWQgZm9yIGZhc3RtYXAgZGF0
YSwgZm9yIHBhdGNoZXMgNX45Lgo+PiAzLiBGaXJzdCA2NCBQRUJzIGhhdmUgbGFyZ2UgZXJhc2Ug
Y291bnRlciB0aGFuIG90aGVycywgZm9yIHBhdGNoZXMgMTB+MTIuCj4+IAo+PiBCZXNpZGVzLCBw
YXRjaGVzIDQvNSBicmluZyBhbiBpbXByb3ZlbWVudCBvZiB0aGUgVUJJIHNlcnZpY2UgbGlmZS4K
Pj4gCj4+IFJlZ3Jlc3Npb24gdGVzdHMgYXJlIGluIFtMaW5rXS4KPj4gCj4+IExpbms6IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3Nzg3Lgo+PiAKPj4gdjEt
PnYyOgo+PiAgICBQYXRjaCA2OiBDaGFuZ2Ugd2FpdCBjb25kaXRpb24gaW4gd2FpdF9mcmVlX3Bl
YnNfZm9yX3Bvb2woKSwgdGhlcmUgYXJlCj4+IAkgICB0d28gc2l0dWF0aW9ucyB0aGF0IGNhdXNl
IHdhaXRpbmcgaW5maW5hdGVseToKPj4gCSAgIDEuIF9fZXJhc2Vfd29ya2VyIHNjaGVkdWxlcyBp
dHNlbGYgaWYgLUVCVVNZIHJldHVybmVkIHdoZW4KPj4gCSAgICAgIHNodXR0aW5nIGRvd24gc3lz
dGVtLgo+PiAJICAgMi4gVGhlICdtaW5fZXhwZWN0X2ZyZWUnIGNhbm5vdCBiZSBzYXRpc2ZpZWQg
d2hlbiBiYWQgYmxvY2sKPj4gCSAgICAgIG9jY3VycyBhbmQgdWJpIGJlY29tZXMgcm8oVGhlIGVy
YXNlZCBQRUIgc2hvdWxkIGJlIHRoZQo+PiAgICAgICAgICAgICAgICBsYXN0IG9uZSBvZiAnbWlu
X2V4cGVjdF9mcmVlJywgYnV0IGl0IGJlY29tZXMgYmFkIGluCj4+IAkgICAgICBfX2VyYXNlX3dv
cmtlcikuCj4+ICAgUFM6IEFmdGVyIHJlLXRlc3RpbmcsIHRoZSB0ZXN0aW5nIHJlc3VsdHMgaW4g
W0xpbmtdIGlzIG5vdCBhZmZlY3RlZC4KPj4gCj4gCj4gSGksIFJpY2hhcmQuIEkgaG9wZSB5b3Ug
Y2FuIHRha2Ugc29tZSB0aW1lKHdoZW4geW91IGhhdmUgZnJlZSB0aW1lKSB0bwo+IGhhdmUgYSBn
bGFuY2Ugb2YgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcywgSSBoYXZlIG1hZGUgc29tZSB0ZXN0cyBv
bgo+IHZpcnR1YWwgbWFjaGluZSBmb3IgMisgbW9udGhzKGFuZCBoYWxmIG1vbnRoIGZvciBwaHlz
aWNhbCBuYW5kIGZsYXNoKSwKPiBzbyBmYXIgdWJpIHdvcmtzIGZpbmUgd2l0aCBwYXRjaGVzIGFw
cGxpZWQuCgpJIGRpZG4ndCBmb3JnZXQuIDotKQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
