Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D4C678D5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKjEvANRxK0Vfua0SJhGoqzqSyTAkg0GQxwYl9OpdOY=; b=Zpcg2o3tUnAwOa
	FUtpYSjCuzXyU9V+Yj0GHduY0jjS4wm2ylvIbQe7AgIKp0CR8qTE54SjGdm0fbFvgmwg6DFaNJh65
	yUCise7b0Ptn18Tta2JTiUrWarcS4/nzpQGE39kczbRDkLgykerZY2OD6F6IILPnv+Tj1yDW+t0Yn
	nfNrNq3Yjh3Jy3XHGewG2voH1xx1FCV2DQcjZeAKvxhTh4xrwHezfzZXlx8+4Ma3NxagdWXHIWPZg
	eh5+FdVNoC+akLq8Nh7E1J6ONwvU7l4HkqGWDpGa2W18QYCHEuSCXsOYZ6EB8aNWoCi0r3HESBy06
	HLwyCWIxcVZ9lMRr2HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu2P-005FIf-20; Wed, 08 Mar 2023 13:41:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu2L-005FHj-Jo
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 13:40:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8E10060008;
	Wed,  8 Mar 2023 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678282851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uq54rdNF8pNGVn5GJ1nrT1LIyoDomEfDdQ9IX1YDYyE=;
	b=aFA1Rk9DF2SSje9nGVeoy0YGK/bNL7k2oziRhg7LmshTp+CbhQaoKNrS4vbyD56YqTNTmR
	RwE2ddjKd7iuCXET0y3fCqSbka/7NUKJd3EbZP3mv7t9uLQpzMXEDNH8mTtDn68m2rYCip
	Td/FYd4UA5GQnxgBmpZalWkUe60H1waup7wAqpIZiAYQ3EIgjaCVnb7DxyyoT2m+rC78/C
	pQpFFeCT6eZ79pEvM32eoIcx13yySfmQ75Y8riP6wtj1nulGln+N1jXhJD2StBXgKkiZs3
	nd/1l/BRMOgmFxtaOn1kWGnAbp3aWGIMH+BxNUmFFnzFM1meQjGn588psQddDQ==
Date: Wed, 8 Mar 2023 14:40:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mtd: core: provide unique name for nvmem device,
 take two
Message-ID: <20230308144048.473e2ec7@xps-13>
In-Reply-To: <20230308082021.870459-1-michael@walle.cc>
References: <20230308082021.870459-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_054057_852326_48D134D3 
X-CRM114-Status: GOOD (  21.00  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gV2VkLCAgOCBNYXIgMjAyMyAw
OToyMDoxOCArMDEwMDoKCj4gQ29tbWl0IGMwNDhiNjBkMzllMSAoIm10ZDogY29yZTogcHJvdmlk
ZSB1bmlxdWUgbmFtZSBmb3IgbnZtZW0gZGV2aWNlIikKPiB0cmllcyB0byBnaXZlIHRoZSBudm1l
bSBkZXZpY2UgYSB1bmlxdWUgbmFtZSwgYnV0IGZhaWxzIGJhZGx5IGlmIHRoZSBtdGQKPiBkZXZp
Y2UgZG9lc24ndCBoYXZlIGEgInN0cnVjdCBkZXZpY2UiIGFzc29jaWF0ZWQgd2l0aCBpdCwgaS5l
LiBpZgo+IENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIG5vdCBzZXQuIFRoaXMgd2ls
bCByZXN1bHQgaW4gdGhlIG5hbWUKPiAiKG51bGwpLXVzZXItb3RwIiwgd2hpY2ggaXMgbm90IHVu
aXF1ZS4gSXQgc2VlbXMgdGhlIGJlc3Qgd2UgY2FuIGRvIGlzCj4gdG8gdXNlIHRoZSBjb21wYXRp
YmxlIG5hbWUgdG9nZXRoZXIgd2l0aCBhIHVuaXF1ZSBpZGVudGlmaWVyIGFkZGVkIGJ5Cj4gdGhl
IG52bWVtIHN1YnN5c3RlbSBieSB1c2luZyBOVk1FTV9ERVZJRF9BVVRPLgo+IAo+IEZpeGVzOiBj
MDQ4YjYwZDM5ZTEgKCJtdGQ6IGNvcmU6IHByb3ZpZGUgdW5pcXVlIG5hbWUgZm9yIG52bWVtIGRl
dmljZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IC0tLQo+IHYyOgo+ICAtIGFjdHVhbGx5IHVz
ZSBOVk1FTV9ERVZJRF9BVVRPIGFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiAK
ClRoYW5rcyBmb3IgdGhlIHYyLCBhcyBJIHdhbnQgdG8gc2hhcmUgYSBjbGVhbiBpbW11dGFibGUg
YnJhbmNoIHdpdGgKR3JlZywgSSBtYWRlIGFuIGV4Y2VwdGlvbiBpbiBmb3JjZSBwdXNoaW5nIHRo
aXMgcGF0Y2ggaW4gcGxhY2Ugb2YgaXRzCnYxIGNvdW50ZXJwYXJ0LgoKPiAgZHJpdmVycy9tdGQv
bXRkY29yZS5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCAwZmVhY2I5ZmJkYWMuLjhmYzY2Y2RhNGEwOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKPiBAQCAtODg4LDggKzg4OCw4IEBAIHN0YXRpYyBzdHJ1Y3QgbnZtZW1fZGV2aWNl
ICptdGRfb3RwX252bWVtX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAKPiAgCS8q
IE9UUCBudm1lbSB3aWxsIGJlIHJlZ2lzdGVyZWQgb24gdGhlIHBoeXNpY2FsIGRldmljZSAqLwo+
ICAJY29uZmlnLmRldiA9IG10ZC0+ZGV2LnBhcmVudDsKPiAtCWNvbmZpZy5uYW1lID0ga2FzcHJp
bnRmKEdGUF9LRVJORUwsICIlcy0lcyIsIGRldl9uYW1lKCZtdGQtPmRldiksIGNvbXBhdGlibGUp
Owo+IC0JY29uZmlnLmlkID0gTlZNRU1fREVWSURfTk9ORTsKPiArCWNvbmZpZy5uYW1lID0gY29t
cGF0aWJsZTsKPiArCWNvbmZpZy5pZCA9IE5WTUVNX0RFVklEX0FVVE87Cj4gIAljb25maWcub3du
ZXIgPSBUSElTX01PRFVMRTsKPiAgCWNvbmZpZy50eXBlID0gTlZNRU1fVFlQRV9PVFA7Cj4gIAlj
b25maWcucm9vdF9vbmx5ID0gdHJ1ZTsKPiBAQCAtOTA1LDcgKzkwNSw2IEBAIHN0YXRpYyBzdHJ1
Y3QgbnZtZW1fZGV2aWNlICptdGRfb3RwX252bWVtX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLAo+ICAJCW52bWVtID0gTlVMTDsKPiAgCj4gIAlvZl9ub2RlX3B1dChucCk7Cj4gLQlrZnJl
ZShjb25maWcubmFtZSk7Cj4gIAo+ICAJcmV0dXJuIG52bWVtOwo+ICB9CgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
