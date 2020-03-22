Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CAAC54FCF
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 10:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664062072E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 10:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GfPStGfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 664062072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqueR2ik4Z4Wy0q69yOzg47FWaNjodK4zLK9gPqlCVQ=; b=GfPStGfXViePkF
	rbNxXhKu/qpzADWdZjrtA7dFlM/2hsf0zYZoaofQHuGgaBwmHmOrjH+MCEpNR0JN5gcKYvtKFeugp
	or3sn7hksfoXkJsKhgCXwJlXihop6l0TnI10olVrVm8qqsc+vJ2KCI0l15HTvn3W1fuZ8b76b1ezc
	sGrrhi0z0KO889mtys1RYD9NUcM8br1EYsko4hLVyq48a9iM39OthiGLU4W1MvC6/+ZCCo41TKfqL
	qsq5jwb9TK8MHLU2W4LlMC15vwrRdQdr2+YatpywOPz6x0Agv+tCfj9j+ZWXubAlz3HQD2+myB+o0
	QS0I4vPqOlpOnf69oBbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFxqF-0003m3-0n; Sun, 22 Mar 2020 10:28:27 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFxq9-0003lE-VJ
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 10:28:25 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07438739|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.185973-0.000472118-0.813555;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03311; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.H3OteXN_1584872892; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H3OteXN_1584872892)
 by smtp.aliyun-inc.com(10.147.41.137);
 Sun, 22 Mar 2020 18:28:13 +0800
Subject: Re: [PATCH v2 01/11] pstore/blk: new support logger for block devices
To: Kees Cook <keescook@chromium.org>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-2-git-send-email-liaoweixiong@allwinnertech.com>
 <202002251626.63FE3E7C6@keescook>
 <5fd540be-6ed9-a1c7-4932-e67194dddca8@allwinnertech.com>
 <202003180944.3B36871@keescook>
 <dab67ab1-c03f-0507-3d56-4a9578e85f6b@allwinnertech.com>
 <202003201111.BE5EAB9A@keescook>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <c49f1d24-b818-aeda-7447-b89d8eddb1c6@allwinnertech.com>
Date: Sun, 22 Mar 2020 18:28:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <202003201111.BE5EAB9A@keescook>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_032822_196309_2F07E187 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aGkgS2VlcyBDb29rLAoKT24gMjAyMC8zLzIxIOS4iuWNiDI6MjAsIEtlZXMgQ29vayB3cm90ZToK
PiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAwOTo1MDozNkFNICswODAwLCBXZWlYaW9uZyBMaWFv
IHdyb3RlOgo+PiBPbiAyMDIwLzMvMTkgQU0gMToyMywgS2VlcyBDb29rIHdyb3RlOgo+Pj4gT24g
VGh1LCBGZWIgMjcsIDIwMjAgYXQgMDQ6MjE6NTFQTSArMDgwMCwgbGlhb3dlaXhpb25nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvMi8yNiBBTSA4OjUyLCBLZWVzIENvb2sgd3JvdGU6Cj4+Pj4+IE9uIEZy
aSwgRmViIDA3LCAyMDIwIGF0IDA4OjI1OjQ1UE0gKzA4MDAsIFdlaVhpb25nIExpYW8gd3JvdGU6
Cj4+Pj4+PiArb2JqLSQoQ09ORklHX1BTVE9SRV9CTEspICs9IHBzdG9yZV9ibGsubwo+Pj4+Pj4g
K3BzdG9yZV9ibGsteSArPSBibGt6b25lLm8KPj4+Pj4KPj4+Pj4gV2h5IHRoaXMgZGFuY2Ugd2l0
aCBmaWxlcz8gSSB3b3VsZCBqdXN0IGV4cGVjdDoKPj4+Pj4KPj4+Pj4gb2JqLSQoQ09ORklHX1BT
VE9SRV9CTEspICAgICArPSBibGt6b25lLm8KPj4+Pj4KPj4+Pgo+Pj4+IFRoaXMgbWFrZXMgdGhl
IGJ1aWx0IG1vZHVsZSBuYW1lZCBibGt6b25lLmtvIHJhdGhlciB0aGFuCj4+Pj4gcHN0b3JlX2Js
ay5rby4KPj4+Cj4+PiBZb3UgY2FuIGp1c3QgZG8gYSByZWd1bGFyIGJ1aWxkIHJ1bGU6Cj4+Pgo+
Pj4gb2JqLSQoQ09ORklHX1BTVE9SRV9CTEspICs9IGJsa3pvbmUubwo+Pj4KPj4KPj4gSSBkb24n
dCBnZXQgaXQuIElmIG1ha2UgaXQgYXMgeW91ciB3b3JkcywgdGhlIGJ1aWx0IG1vZHVsZSB3aWxs
IGJlCj4+IGJsa3pvbmUua28uCj4+IFRoZSBtb2R1bGUgaXMgbmFtZWQgcHN0b3JlL2JsaywgaG93
ZXZlciBpdCBidWlsdCBvdXQgYmxrem9uZS5rby4gSSB0aGluawo+PiBpdCdzIGNvbmZ1c2luZy4K
PiAKPiBJIG1lYW4ganVzdCBwaWNrIHdoYXRldmVyIGZpbGVuYW1lIHlvdSB3YW50IGl0IHRvIGJl
IG5hbWVkLiBUaGUgTWFrZWZpbGUKPiBjYXNlIGZvciByYW1vb3BzIHdhcyB0aGF0IHJhbW9vcHMg
Z290IHJlbmFtZWQgYnV0IHdlIHdhbnRlZCB0byBrZWVwIHRoZQo+IG9sZCBBUEkgbmFtZS4KPiAK
PiBTbywgaWYgeW91IHdhbnQgaXQgbmFtZWQgcHN0b3JlLWJsay5rbywganVzdCByZW5hbWUgYmxr
em9uZS5jIHRvCj4gcHN0b3JlLWJsay5jLgo+IAoKSG93IGFib3V0IHJlbmFtZSBibGt6b25lLmMg
dG8gcHNvdHJlX3pvbmUuYyBhbmQgYmxrb29wcy5jIHRvIHBzdG9yZV9ibGsuYz8KClBsZWFzZSBy
ZWZlciB0byBteSByZXBseSBlbWFpbCBmb3IgcGF0Y2ggMi4KCj4+Pj4+IElmIHlvdSdyZSBleHBl
Y3RpbmcgY29uY3VycmVudCB3cml0ZXJzICh1c2Ugb2YgYXRvbWljX3NldCgpLCBJIHdvdWxkCj4+
Pj4+IGV4cGVjdCB0aGUgd2hvbGUgd3JpdGUgdG8gYmUgbG9ja2VkIGluc3RlYWQuIChpLmUuIHdo
YXQgaGFwcGVucyBpZgo+Pj4+PiBtdWx0aXBsZSBjYWxsZXJzIGNhbGwgYmxrel96b25lX3dyaXRl
KCk/KQo+Pj4+Pgo+Pj4+Cj4+Pj4gSSBkb24ndCBhZ3JlZSB3aXRoIGl0LiBUaGUgZGF0YWxlbiB3
aWxsIGJlIHVwZGF0ZWQgZXZlcnl3aGVyZS4gSXQncyB1c2VsZXNzCj4+Pj4gdG8gbG9jayBoZXJl
Lgo+Pj4KPj4+IEJ1dCB0aGVyZSBjb3VsZCBiZSBtdWx0aXBsZSB3cml0ZXJzOyBsb2NraW5nIHNo
b3VsZCBiZSBuZWVkZWQuCj4+Pgo+Pgo+PiBBbGwgdGhlIHJlY29yZGVycyBzdWNoIGFzIGRtZXNn
LCBwbXNnLCBjb25zb2xlIGFuZCBmdHJhY2UgaGF2ZSBiZWVuCj4+IGxvY2tlZCBvbgo+PiBwc3Rv
cmUgYW5kIHVwcGVyIGxheWVycy4gU28sIGEgcmVjb3JkZXIgd2lsbCBub3Qgd3JpdGUgaW4gcGFy
YWxsZWwgYW5kCj4+IGRpZmZlcmVudAo+PiByZWNvcmRlcnMgb3BlcmF0ZSBwcml2YXRlbHkgem9u
ZS4gVGhleSBkb24ndCBoYXZlIGFueSBpbmZsdWVuY2Ugb24gZWFjaAo+PiBvdGhlci4KPiAKPiBZ
ZXMsIHNvcnJ5LCBJIHdhcyBjb25mdXNpbmcgbXlzZWxmIGFib3V0IHBtc2csIGFuZCBJIGZvcmdv
dCBpdCBoYWQgYQo+IGdsb2JhbCBsb2NrLiBFYWNoIGFyZSBsb2NrZWQgb3Igc3BsaXQgYnkgQ1BV
Lgo+IAo+PiBUaGUgb25seSBwYXJhbGxlbCBjYXNlIEkgdGhpbmsgaXMgdGhhdCByZWNvcmRlciB3
cml0ZXMgd2hpbGUgZGlydHktZmx1c2gKPj4gdGhyZWFkIGlzCj4+IHdvcmtpbmcuIEFuZCB0aGUg
ZGlydHktZmx1c2hlciB3aWxsIGZsdXNoIHRoZSB3aG9sZSB6b25lIHJhdGhlciB0aGFuCj4+IHBh
cnQgb2YgaXQsIHNvLAo+PiBpdCBpcyBPSyB0byBjYWxsIGluIHBhcmFsbGVsLgo+IAo+IE9rYXks
IHRoYW5rcyBmb3IgY2xhcmlmeWluZy4KPiAKPj4gQmFzZWQgb24gdGhlc2UgcmVhc29ucywgSSBk
b24ndCB0aGluayBsb2NraW5nIHNob3VsZCBiZSBuZWVkZWQuCj4gCj4gQWdyZWVkLgo+IAoKLS0g
CldlaVhpb25nIExpYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
