Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575E3CCA480
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 02:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=325C2QvaGEKWaQN2RTW8OTagK347kMqHtH9kxdLKLjw=; b=RNofZk4GCmUgpv
	ma7agE8rzNQBSP4sWFe3gLqS2zOwLRH567/5I+emwldDQW8CyClf9T6h8yGTMB4cZER6xKdmFc8KC
	YwJEpDoSXQDN36M4MVIOhUH56z49dkdkYN5RuK2nn4RgVsIDmxWsQWuYIdIiSEsMZB61KhHB4FiHz
	OX28VBUABR3XWQKp1R3kr+P/IGSX2sXzwHzTFCuRFANGYloF+sLZudJQ4/kiv3RK6NkxFiuDgTfdf
	DyUqf+Zqmw3FAyT+J9tXxXALnMGNU+gwkeYCYlhRxEyN2iTtX31GgQztIVZZDN5muuCtwozNvYFjY
	8qVrsFy32bNP8qkz91RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ecn-00EhFX-AY; Mon, 27 Jun 2022 02:37:17 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5eca-00EhAy-R1; Mon, 27 Jun 2022 02:37:06 +0000
Received: from [10.28.39.121] (10.28.39.121) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 27 Jun
 2022 10:36:56 +0800
Message-ID: <af10ff7f-b9e7-7bdc-a5ba-855b891f1110@amlogic.com>
Date: Mon, 27 Jun 2022 10:36:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 5/5] mtd: rawnand: meson: not support legacy clock
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
References: <20220624131257.29906-1-liang.yang@amlogic.com>
 <20220624131257.29906-6-liang.yang@amlogic.com>
 <5f1bd986-e193-b147-8322-3a0bf14fc373@baylibre.com>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <5f1bd986-e193-b147-8322-3a0bf14fc373@baylibre.com>
X-Originating-IP: [10.28.39.121]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_193704_915351_5BA3FE6F 
X-CRM114-Status: UNSURE (   9.34  )
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

SGkgTmVpbCwKCk9uIDIwMjIvNi8yNCAyMToyNywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gSGksCj4gCj4gT24gMjQvMDYvMjAyMiAxNToxMiwgTGlhbmcg
WWFuZyB3cm90ZToKPj4gbWVzb24gTkZDIGRyaXZlciB1c2UgY29tbW9uIGNsb2NrIGludGVyZmFj
ZXMuIHNvIHRoZSB0ZXN0IHJvYm90IHJlcG9ydAo+PiBzb21lIGVycm9ycyBvbmNlIHVzaW5nIHRo
ZSBsZWdhY3kgY2xvY2sgd2l0aCBIQVZFX0xFR0FDWV9DTEsgb24uCj4+Cj4+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTGlh
bmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbXRk
L25hbmQvcmF3L0tjb25maWcgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPj4gaW5kZXggNjdiN2Ni
NjdjMDMwLi4wZmY4NmNhNTkzMmQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+PiBAQCAtMzk1
LDcgKzM5NSw3IEBAIGNvbmZpZyBNVERfTkFORF9TVE0zMl9GTUMyCj4+IMKgIGNvbmZpZyBNVERf
TkFORF9NRVNPTgo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJTdXBwb3J0IGZvciBOQU5EIGNvbnRy
b2xsZXIgb24gQW1sb2dpYydzIE1lc29uIFNvQ3MiCj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBBUkNI
X01FU09OIHx8IENPTVBJTEVfVEVTVAo+PiArwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8
fCBDT01QSUxFX1RFU1QgfHwgQ09NTU9OX0NMSwo+IAo+IFRoaXMgc2hvdWxkIGJlIDoKPiAgwqDC
oMKgwqBkZXBlbmRzIG9uIENPTU1PTl9DTEsgJiYgKEFSQ0hfTUVTT04gfHwgQ09NUElMRV9URVNU
KQoKb2ssIGkgd2lsbCBmaXggaXQuIHRoYW5rcy4KCj4gCj4+IMKgwqDCoMKgwqAgc2VsZWN0IE1G
RF9TWVNDT04KPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIEVuYWJsZXMgc3Vw
cG9ydCBmb3IgTkFORCBjb250cm9sbGVyIG9uIEFtbG9naWMncyBNZXNvbiBTb0NzLgo+IAo+IE5l
aWwKPiAKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
