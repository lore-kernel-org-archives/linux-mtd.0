Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5412DC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fc2lVyOwZgjWMCr97/MRMoRdjfWyOLQdMO2JeXKwQJo=; b=rDWwe6/V500e3F
	VwvUpO7jYsP8sU8ch+Lr9In5/3Ovsag3l2OxL5xKwihRA0aup0KdC2E0ACIVKwkGPmgwkN/3ka3ga
	xnbfHsl1gq0EqLaZHSp+ZxWOGM/viOPDjgyI12Fare2VbJDGzhzQ3FVIAMs1TsG8BioYHktISpBkX
	6fykKcDuGWoJFXlGvUDPhocSwXy6AkxS6WwcK5YWZaLtSttv8i2ceeRsIFnBBKX0gPVUsVi4l3/J6
	G5xw6j1RKgdTZCKF0YVf1zY3wUzIcQHAx0iqgBJ0QSmxrgGYMjD0u6lEvVCTHDmZhPCLqyfciMoCL
	2WpXMvlgoOr8QDDqmeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVrd-006PjU-Qq; Tue, 07 Jun 2022 09:51:05 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVed-006IQH-PB; Tue, 07 Jun 2022 09:37:41 +0000
Received: from [10.28.39.121] (10.28.39.121) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 7 Jun 2022
 17:37:32 +0800
Message-ID: <e06acb65-50fe-46e6-a302-0238c902d1a2@amlogic.com>
Date: Tue, 7 Jun 2022 17:37:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 5/5] mtd: rawnand: meson: not support legacy clock
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220607064731.13367-1-liang.yang@amlogic.com>
 <20220607064731.13367-6-liang.yang@amlogic.com>
 <791b3e4e-7348-997a-0ead-136739ec10bf@baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <791b3e4e-7348-997a-0ead-136739ec10bf@baylibre.com>
X-Originating-IP: [10.28.39.121]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_023739_874608_3F7D29E6 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIDIwMjIvNi83IDE1OjEyLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAKPiBPbiAwNy8wNi8yMDIyIDA4OjQ3LCBMaWFuZyBZ
YW5nIHdyb3RlOgo+PiBtZXNvbiBORkMgZHJpdmVyIHVzZSBjb21tb24gY2xvY2sgaW50ZXJmYWNl
cy4gc28gdGhlIHRlc3Qgcm9ib3QgcmVwb3J0Cj4+IHNvbWUgZXJyb3JzIG9uY2UgdXNpbmcgdGhl
IGxlZ2FjeSBjbG9jayB3aXRoIEhBVkVfTEVHQUNZX0NMSyBvbi4KPj4KPj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFu
ZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvS2NvbmZpZyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9LY29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+PiBpbmRleCA2N2I3Y2I2
N2MwMzAuLjUxNjk0MTJhNGFmNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
S2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4+IEBAIC0zOTUs
NyArMzk1LDcgQEAgY29uZmlnIE1URF9OQU5EX1NUTTMyX0ZNQzIKPj4gwqAgY29uZmlnIE1URF9O
QU5EX01FU09OCj4+IMKgwqDCoMKgwqAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIE5BTkQgY29udHJv
bGxlciBvbiBBbWxvZ2ljJ3MgTWVzb24gU29DcyIKPj4gLcKgwqDCoCBkZXBlbmRzIG9uIEFSQ0hf
TUVTT04gfHwgQ09NUElMRV9URVNUCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBBUkNIX01FU09OIHx8
IENPTVBJTEVfVEVTVCB8fCAhSEFWRV9MRUdBQ1lfQ0xLCj4gCj4gSSB0aGluayBkZXBlbmRpbmcg
b24gQ0NGIHdvdWxkIGJlIGJldHRlciB0aGFuIGV4Y2x1ZGluZyBsZWdhY3kgY2xvY2suCj4KaW5k
ZWVkLiBpIHdpbGwgdXNlIENPTU1PTl9DTEsgbGF0ZXIuIHRoYW5rcy4KCj4+IMKgwqDCoMKgwqAg
c2VsZWN0IE1GRF9TWVNDT04KPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIEVu
YWJsZXMgc3VwcG9ydCBmb3IgTkFORCBjb250cm9sbGVyIG9uIEFtbG9naWMncyBNZXNvbiBTb0Nz
Lgo+IAo+IE5laWwKPiAKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
