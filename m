Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6bEAcspCzBew/hgFDrBdfgCLpaPUjrHS57Y+30sfxCw=; b=KYgsGRDE3cdOpIkq8YouD13V/i
	cd6rE+NtMgZM7TT4MCflPhOERZVFtq29f5JNZTFR+HOyiWYLrqVmPdyxAEJnnnR0WhxjQmhk0bzHn
	ymXX7P6WBTCiN1S2/OhY9y8KFrmSpetDy1DzVYGjhwrkNh49f1zN3QAsO5vRUBtZibGQdfpDiex3R
	19zrqFsaPmXFXWqvySY8jnI07XydPTuDDbOtD1eYy/pP/71eqSRXOZzzbi29aU5cxfQIB3pm4n3yZ
	OJ77bXV1OBYttzUChnnH9zEJnIDQuTanI46XeH1kyVUVxZwG2OglJidNShG87fPa7Wbr8rRSsoB//
	AwWiZytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Fm5-00G8mi-DI; Tue, 11 Jan 2022 11:57:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Fm2-00G8lh-5d
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 11:57:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C077C62DA5F1;
 Tue, 11 Jan 2022 12:57:06 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8N8Bh8g4hSgT; Tue, 11 Jan 2022 12:57:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AE98862DA607;
 Tue, 11 Jan 2022 12:57:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id K3l-nBqFw9Lo; Tue, 11 Jan 2022 12:57:05 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 83EFC62DA5F1;
 Tue, 11 Jan 2022 12:57:05 +0100 (CET)
Date: Tue, 11 Jan 2022 12:57:05 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
In-Reply-To: <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
 <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
 <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: rCOpT4sWmQTdmQnL93nvG0YJPXMarw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_035710_538139_B9222688 
X-CRM114-Status: UNSURE (   8.24  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJtY29xdWVsaW4gc3RtMzIiCj4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+LCAia2lyaWxsIHNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4sICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRGll
bnN0YWcsIDExLiBKYW51YXIgMjAyMiAxMjo0NDo0OQo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjYg
MTIvMTVdIHViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50byAnYWktPmZhc3Rt
YXAnIHdoZW4gZm0tPnVzZWRfYmxvY2tzPj0yCgo+IEhpIFJpY2hhcmQsCj4+IEluIHViaV93bF9p
bml0KCkgdGhlcmUgaXMgYW5vdGhlciBjb3JuZXIgY2FzZSBkb2N1bWVudGVkOgo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyoKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAqIFRoZSBm
YXN0bWFwIHVwZGF0ZSBjb2RlIG1pZ2h0IG5vdCBmaW5kIGEgZnJlZSBQRUIgZm9yCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKiB3cml0aW5nIHRoZSBmYXN0bWFwIGFuY2hvciB0byBhbmQg
dGhlbiByZXVzZXMgdGhlCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBjdXJyZW50IGZh
c3RtYXAgYW5jaG9yIFBFQi4gV2hlbiB0aGlzIFBFQiBnZXRzIGVyYXNlZAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICogYW5kIGEgcG93ZXIgY3V0IGhhcHBlbnMgYmVmb3JlIGl0IGlzIHdy
aXR0ZW4gYWdhaW4gd2UKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAqIG11c3QgbWFrZSBz
dXJlIHRoYXQgdGhlIGZhc3RtYXAgYXR0YWNoIGNvZGUgZG9lc24ndAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICogZmluZCBhbnkgb3V0ZGF0ZWQgZmFzdG1hcCBhbmNob3JzLCBoZW5jZSB3
ZSBlcmFzZSB0aGUKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAqIG91dGRhdGVkIGZhc3Rt
YXAgYW5jaG9yIFBFQnMgc3luY2hyb25vdXNseSBoZXJlLgo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICovCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYWViLT52b2xfaWQgPT0g
VUJJX0ZNX1NCX1ZPTFVNRV9JRCkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3luYyA9IHRydWU7Cj4+IAo+PiBTbyB1Ymlfd2xfaW5pdCgpIG1ha2VzIHN1cmUgdGhhdCBhbGwg
b2xkIGZhc3RtYXAgYW5jaG9ycyBnZXQgZXJhc2VkIGJlZm9yZSBVQkkKPj4gc3RhcnRzIHRvIG9w
ZXJhdGUuIFdpdGggeW91ciBjaGFuZ2UgdGhpcyBpcyBubyBsb25nZXIgc2F0aXNmaWVkCj4gSSBz
ZWVtIHRvIHVuZGVyc3RhbmQgdGhlIGFub3RoZXIgY2FzZS4gQnV0IEknbSBzdGlsbCBjb25mdXNl
ZCB0aGF0IHdoeQo+IG91dGRhdGVkIGZhc3RtYXAgUEVCcyBjYW5ub3QgYmUgZXJhc2VkLiBXaGVu
IFVCSSBjb21lcyB0byB0aGlzIHBvaW50LCBpdAo+IG1lYW5zIFVCSSBpcyBhdHRhY2hlZCBieSAq
KmZ1bGwgc2Nhbm5pbmcgbW9kZSoqLCBzY2FuX2Zhc3QoKSByZXR1cm5zIHR3bwo+IHZhbHVlczoK
PiAgIFVCSV9OT19GQVNUTUFQOiBzY2FuIGFsbCBwZWJzIGZyb20gcG51bSBVQklfRk1fTUFYX1NU
QVJULCBhaSBpcwo+IGFzc2lnbmVkIHdpdGggc2Nhbl9haSwgYXQgbGFzdCwgYWxsIGZhc3RtYXAg
cGVicyBhcmUgYWRkZWQgaW50bwo+ICdhaS0+ZmFzdG1hcCcKPiAgIFVCSV9CQURfRkFTVE1BUDog
c2NhbiBhbGwgcGVicyBmcm9tIHBudW0gMCwgYWxsIGZhc3RtYXAgcGVicyBhcmUKPiBhZGRlZCBp
bnRvICdhaS0+ZmFzdG1hcCcKCkkgZmVhciwgSSdtIHVuYWJsZSB0byBmb2xsb3cgeW91ciB0aG91
Z2h0cy4KdWJpX3dsX2luaXQoKSBpcyBjYWxsZWQgaW4gYm90aCBjYXNlcywgd2l0aCBhbmQgd2l0
aG91dCBmYXN0bWFwLgpBbmQgYWktPmZhc3RtYXAgY29udGFpbnMgYWxsIGFuY2hvciBQRUJzIHRo
YXQgc2Nhbl9mYXN0KCkgZm91bmQuClRoaXMgY2FuIGJlIHRoZSBtb3N0IHJlY2VudCBidXQgYWxz
byBvdXRkYXRlZCBhbmNob3IgUEVCcy4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
