Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 03:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr4lwQ5b0PkqkWlwoV7BRS+/w9VOti6fIKe5mcxNzfc=; b=n1T68743/yi+9Y
	1ixrIQE00dF3yxXcYfTW3qt0F6qTtHIgDV1x2Smhe2BvgPjGg7AORpdYiB8PhdYENQLBYxPp4yyY9
	mZAGpNylTqG8PS7oWHQsUrr4zpwRvH6yQfl+v9ykueiQt5BPnb7sc9RQgbvDtlczMFzonEiHkjf31
	/2QYMGn+OUrSTlEq5padg6zh6Xj7nTsiHUh6giFdZopTgdq1DCGoM56L++sQ/OeRWKR9MRwV+/yct
	6/P3mE4gnEKvl1ao26dHJ/53thFO3otIGsSio8QYKGE7MBUktdVyoSwBnEFTJnj7q2d5DHnAU3rCQ
	aV3vm/XTRdGirvnPO7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngIFa-00FSqC-B4; Mon, 18 Apr 2022 03:40:30 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngIFP-00FSnr-AL; Mon, 18 Apr 2022 03:40:20 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 18 Apr
 2022 11:40:10 +0800
Message-ID: <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
Date: Mon, 18 Apr 2022 11:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Content-Language: en-US
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
In-Reply-To: <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_204019_384654_135B7E4F 
X-CRM114-Status: GOOD (  11.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKaSBoYXZlIHNvbWUgY29uZnVzaW9uIHdoZW4gaSBwcmVwYXJlIHRoZSBwYXRj
aGVzLiBmb3IgRFQgY29tcGF0aWJpbGl0eSwgCml0IGZhbGxzIGJhY2sgdG8gdGhlIG9sZCBEVCB3
aGVuIGZhaWxlZCB0byBnZXQgcmVzb3VyY2UgYnkgdGhlIG5ldyBEVCwgCmJ1dCB0aGVyZSBpcyBz
b21lIHBvaW50czoKYS4gb2xkIERUIGRlcGVuZHMgb24gTU1DIHN1YiBjbG9jayBkcml2ZXIsIGJ1
dCBpdCBuZXZlciBiZSBtZXJnZWQsIHNvIGl0IApjYW4ndCB3b3JrLgpiLiBpZiBpdCBmYWxscyBi
YWNrIHRvIHRoZSBvbGQgRFQsIGJlc2lkZSB0aGUgcmVnbWFwIGxvb2t1cCBiZWxvdywgaXQgCnNl
ZW1zIHRoYXQgd2UgaGF2ZSB0byBwcmVzZXJ2ZSB0aGUgY29kZSBvZiB0aGUgb2xkIGNsb2NrIHNl
dHRpbmcgaW4gCm5mY19jbGtfaW5pdCgpLiBkbyB3ZSBzdGlsbCBuZWVkIHRvIGF2b2lkIGJyZWFr
IERUIGNvbXBhdGliaWxpdHk/CgpUaGFua3MuCgpPbiAyMDIyLzQvMTEgMTA6NDAsIExpYW5nIFlh
bmcgd3JvdGU6Cj4+PiDCoMKgwqDCoMKgIG5mYy0+ZGV2ID0gZGV2Owo+Pj4gLcKgwqDCoCByZXMg
PSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+Pj4gLcKg
wqDCoCBuZmMtPnJlZ19iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsKPj4+
ICvCoMKgwqAgbmZjLT5yZWdfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9i
eW5hbWUocGRldiwgIm5mYyIpOwo+Pgo+PiBUaGlzIGNoYW5nZSBzZWVtcyB1bnJlbGF0ZWQuCj4g
Cj4gVG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZSBmb2xsb3dpbmcgCj4gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiZW1tYyIpLiBkbyB5b3UgbWVhbiB0aGF0IHdl
IAo+IGRvbid0IG5lZWQgaXQ/Pgo+Pj4gwqDCoMKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+cmVnX2Jh
c2UpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKG5mYy0+cmVnX2Jhc2Up
Owo+Pj4gLcKgwqDCoCBuZmMtPnJlZ19jbGsgPQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHN5c2Nvbl9y
ZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLAo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsbW1jLXN5c2NvbiIpOwo+
Pj4gLcKgwqDCoCBpZiAoSVNfRVJSKG5mYy0+cmVnX2NsaykpIHsKPj4+IC3CoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBsb29rdXAgY2xvY2sgYmFzZVxuIik7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdfY2xrKTsKPj4+IC3CoMKgwqAgfQo+
Pj4gK8KgwqDCoCBuZmMtPnNkX2VtbWNfY2xvY2sgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2VfYnluYW1lKHBkZXYsIAo+Pj4gImVtbWMiKTsKPj4+ICvCoMKgwqAgaWYgKElTX0VSUihu
ZmMtPnNkX2VtbWNfY2xvY2spKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKG5m
Yy0+c2RfZW1tY19jbG9jayk7Cj4+Cj4+IFdoaWxlIEkgYWdyZWUgdGhpcyBpcyBtdWNoIGJldHRl
ciB0aGFuIHRoZSBwcmV2aW91cyBzb2x1dGlvbiwgd2UgY2Fubm90Cj4+IGJyZWFrIERUIGNvbXBh
dGliaWxpdHksIHNvIHlvdSBuZWVkIHRvIHRyeSBnZXR0aW5nIHRoZSBlbW1jIGNsb2NrLCBidXQK
Pj4gaWYgaXQgZmFpbHMgeW91IHNob3VsZCBmYWxsYmFjayB0byB0aGUgcmVnbWFwIGxvb2t1cC4K
PiAKPiBvaywgaSB3aWxsIGZpeCBpdCBuZXh0IHZlcnNpb24uIHRoYW5rcy4KPiAKPj4KPj4+IMKg
wqDCoMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
