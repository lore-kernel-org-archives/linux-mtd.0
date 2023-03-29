Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F106C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oT0CZe/XlQVqRDd6eb+USkYRhHkxgVe5JDkKWf/9N4=; b=M1YSbD6vty72gi
	x0h9EswEMIiPJTXLLUIrLCJhtTWB0+RaJbgB85lOZytfkaqSnMUkPBOGVd2zu7xFxk2AZf1vzxMH+
	TfwFUREsKY1lfYDr2+AEhuY2FB16DcIb4KyX6wzDhaP7eBUsvr+BKDbHQo7hworGG7tfOg9orpfS3
	wtffYPoUGIQ2acVybqpm2O+zpaPKLsuhA9mqR1NrjHh86n71cbLDaCXz4JxJsLEQhyu0u5n+iZaS+
	6+k2Bb6yGzv1ASLofObe231Hk6kbSReTYrE84d/B2T8xTQbVHUnpi23EkvbWRWNegN5wdJQHm+XhO
	4117YU3dZGlg8qtKm+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phR0D-00H4Bk-39;
	Wed, 29 Mar 2023 08:17:53 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phR03-00H40e-2z;
	Wed, 29 Mar 2023 08:17:48 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 760C75FD03;
	Wed, 29 Mar 2023 11:17:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680077856;
	bh=TFNrgf7o1+rxwIij+MHUfJ7WxvDDW1pBTADC57qaI2s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=VB7u9kVJZcIDJoyXGqw7psUOhxi8ziD+847dKtMek+9ctJv8ApVqCvNcacbWDg4sC
	 Amylr+2wDqioPjAg3XwiYTtTOygkRsmx4tr0PcXC+C80pNSR7e4YjgkLkLJqh2rD8M
	 xm9i1hsQr68fk3zycTI7gMxR7bIri080G6Xu8QBamfzBzc98aeQLtsnjp0UYfWhwFj
	 7zCUWTO9wfDDbFHEsjKwqgGdb+gVzdCIvVySeRXnf5y4bcL1GKrP+x9S5F5qZuOsd+
	 aSMjHRzZhrbVWTO4U34/XNTqU6UC2D4diW8sP4HntdLJd/7xOrvz5eatdHHDSdaB/N
	 fU2ABBs3fw+2g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 11:17:35 +0300 (MSK)
Date: Wed, 29 Mar 2023 11:17:34 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Arseniy Krasnov <avkrasnov@sberdevices.ru>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in
 command word
Message-ID: <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
 <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13>
 <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
 <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
 <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
 <20230329093145.52790647@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329093145.52790647@xps-13>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 04:10:00 #21025776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_011744_652275_2D8F196B 
X-CRM114-Status: GOOD (  30.57  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMDk6MzE6NDVBTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIZWxsbywKPiAKPiBhdmtyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2Vk
LCAyOSBNYXIgMjAyMyAxMDoxMjoxMCArMDMwMDoKPiAKPiA+IE9uIDI4LjAzLjIwMjMgMjM6MjUs
IE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiA+IEhpIEFyc2VuaXksCj4gPiA+IAo+ID4g
PiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCA4OjM54oCvUE0gQXJzZW5peSBLcmFzbm92Cj4gPiA+
IDxhdmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+ID4gPiBbLi4uXSAgCj4gPiA+Pj4K
PiA+ID4+PiBCeSB0aGUgd2F5IGFueSByZWFzb24gbm90IHRvIGhhdmUgQ2MnZWQgc3RhYmxlPyAg
Cj4gPiA+Pgo+ID4gPj4gU29ycnksIHdoYXQgZG8gWW91IG1lYW4/IEkndmUgaW5jbHVkZWQgbGlu
dXgtbXRkIG1haWxpbmcgbGlzdHMsIHRoZXJlIGlzCj4gPiA+PiBvbmUgbW9yZSBsaXN0IGZvciBt
dGQgcmV2aWV3cz8gSSB3aWxsIGFwcHJlY2lhdGUgaWYgWW91IGNhbiBwb2ludCBtZSAgCj4gPiA+
ICJzdGFibGUiIHR5cGljYWxseSByZWZlcnMgdG8gdGhlIHN0YWJsZSB0cmVlIHdoZXJlIGZpeGVz
IGZvciBhbHJlYWR5Cj4gPiA+IHJlbGVhc2VkIGtlcm5lbCB2ZXJzaW9ucyBhcmUgbWFpbnRhaW5l
ZC4KPiA+ID4gV2hlbiBNaXF1ZWwgYXBwbGllcyB0aGUgcGF0Y2ggaXQgd2lsbCBlaXRoZXIgbGFu
ZCBpbiB0aGUgbmV4dCAtcmMgb2YKPiA+ID4gdGhlIGN1cnJlbnQgZGV2ZWxvcG1lbnQgY3ljbGUg
KHR5cGljYWxseSBhcHBsaWVzIHRvIGZpeGVzIC0gY3VycmVudGx5Cj4gPiA+IDYuMy1yYzUpIG9y
IC1yYzEgb2YgdGhlIG5leHQga2VybmVsIHZlcnNpb24gKHR5cGljYWxseSBhcHBsaWVzIHRvIG5l
dwo+ID4gPiBmZWF0dXJlcywgY2xlYW51cHMsIGV0Yy4gLSBjdXJyZW50bHkgNi40LXJjMSkuCj4g
PiA+IAo+ID4gPiBMZXQncyBzYXkgeW91IGFyZSBmaXhpbmcgYSBidWcgbm93IGJ1dCB3YW50IHRo
ZSBmaXggdG8gYmUgaW5jbHVkZWQgaW4KPiA+ID4gNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJsZSkg
b3Igb3RoZXIgc3RhYmxlIHJlbGVhc2UuCj4gPiA+IEluIHRoaXMgY2FzZSBpdCdzIHJlY29tbWVu
ZGVkIHRvIENjIHRoZSBtYWludGFpbmVycyBvZiB0aGUgc3RhYmxlCj4gPiA+IHRyZWVzIGFzIHBh
cnQgb2YgeW91ciBwYXRjaCwgc2VlIFswXS4KPiA+ID4gVGhhdCB3YXkgb25jZSB0aGUgY29tbWl0
IHdpdGggeW91ciBmaXggaGl0cyBMaW51cyBUb3J2YWxkcyBsaW51eCB0cmVlCj4gPiA+IGl0IHdp
bGwgYmUgYmFja3BvcnRlZCBieSB0aGUgc3RhYmxlIHRlYW0gd2l0aGluIGEgZmV3IGRheXMgKGFz
c3VtaW5nCj4gPiA+IG9mIGNvdXJzZSB0aGF0IHRoZSBwYXRjaCBhcHBsaWVzIGNsZWFubHkgdG8g
b2xkZXIgdmVyc2lvbnMsIGlmIG5vdAo+ID4gPiB0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgo+ID4g
PiBOb3RlOiBldmVuIHdpdGhvdXQgQ2MnaW5nIHRoZSBzdGFibGUgbWFpbnRhaW5lcnMgeW91ciBj
b21taXQgbWF5IGJlCj4gPiA+IGJhY2twb3J0ZWQgKHNlbWktYXV0b21hdGljYWxseSkgaWYgaXQg
aGFzIGEgRml4ZXMgdGFnIGFuZCB0aGUgc3RhYmxlCj4gPiA+IG1haW50YWluZXJzIGZpbmQgeW91
ciBjb21taXQuIEJ1dCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQncwo+ID4gPiBlYXNpZXN0
IGZvciB0aGVtIGlmIHRoZXkncmUgZXhwbGljaXRseSBDYydlZCBvbiB0aGUgcGF0Y2guCj4gPiA+
IAo+ID4gPiBJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYgbm90OiBkb24ndCBoZXNpdGF0ZSB0
byBhc2suICAKPiAKPiBUaGF0IGlzIGFuIGV4Y2VsbGVudCBzdW1tYXJ5LCBJIHNob3VsZCBjb3B5
L3Bhc3RlIGl0IHNvbWV0aW1lcyA6KQo+IAoKRmluYWxseSBJIGZ1bGx5IHVuZGVyc3RhbmQgd2h5
ICdGaXhlcycgdGFnIGlzIHNvIGhlbHBmdWwhClRoYW5rIHlvdSBNYXJ0aW4hCgpbLi4uXQoKLS0g
ClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
