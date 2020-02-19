Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE659C3404C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 01:13:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CF924655
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 01:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3jKb+L/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85CF924655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeFEKPySNLM4yto1PmPZNIMAn8/ag5wLwK4cOhTmop0=; b=p3jKb+L/eQ/nHf
	TvLX/GldNJqSXRi//jhAjdAuO7wBPdMKPDbhOyFn3GfSTbGDNcsJeBKjDcO7Fo0MfXr56fqDb80sk
	Pcah+Y8It75v9dHU3NAK0MEko82PnidhnXGXJjM9mT6lE+Wlss5Y47X8h5VaTbtDY0tfU+sEGNiaV
	97kd1Et+iR5s1yUdQt3i5uT6EgnfYRPfrpTBIKnU2QFZR2fMK9HscpxOWFMynO1Pj3Bk0VMhmlBiz
	eBlemYV5d/Lxa7aY5fObhntjHbNVsVnz02uV6/621mLpiaFvODuppWMaWQGjdCqPyNn2jIdk/8jys
	hG6VSpfIqgdkXbXTw8hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Dv7-0000l6-0s; Wed, 19 Feb 2020 01:12:57 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Dv3-0000jq-K2
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 01:12:55 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07472768|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.264101-0.0159969-0.719902;
 DS=SPAM|spam_other|0.930438-0.00178347-0.0677784; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03310; MF=liaoweixiong@allwinnertech.com; NM=1; PH=DS; RN=16; RT=16;
 SR=0; TI=SMTPD_---.GpVrOsg_1582074763; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.GpVrOsg_1582074763)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 19 Feb 2020 09:12:44 +0800
Subject: Re: [PATCH v2 11/11] mtd: new support oops logger based on pstore/blk
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
 <20200218113449.5ac44955@xps13>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <5e95d596-3ba1-09e6-1777-007a5257f1cc@allwinnertech.com>
Date: Wed, 19 Feb 2020 09:13:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200218113449.5ac44955@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_171253_837677_56E77B7D 
X-CRM114-Status: GOOD (  15.42  )
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
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aGkgTWlxdWVsIFJheW5hbCwKCk9uIDIwMjAvMi8xOCDkuIvljYg2OjM0LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+IEhpIFdlaVhpb25nLAo+IAo+IFdlaVhpb25nIExpYW8gPGxpYW93ZWl4aW9uZ0Bh
bGx3aW5uZXJ0ZWNoLmNvbT4gd3JvdGUgb24gRnJpLCAgNyBGZWIKPiAyMDIwIDIwOjI1OjU1ICsw
ODAwOgo+IAo+PiBJdCdzIHRoZSBsYXN0IG9uZSBvZiBhIHNlcmllcyBvZiBwYXRjaGVzIGZvciBh
ZGFwdGl2ZSB0byBNVEQgZGV2aWNlLgo+Pgo+PiBUaGUgbXRkcHN0b3JlIGlzIHNpbWlsYXIgdG8g
bXRkb29wcyBidXQgbW9yZSBwb3dlcmZ1bC4gSXQgYmFzZXMgb24KPj4gcHN0b3JlL2JsaywgYWlt
cyB0byBzdG9yZSBwYW5pYyBhbmQgb29wcyBsb2dzIHRvIGEgZmxhc2ggcGFydGl0aW9uLAo+PiB3
aGVyZSBpdCBjYW4gYmUgcmVhZCBiYWNrIGFzIGZpbGVzIGFmdGVyIG1vdW50aW5nIHBzdG9yZSBm
aWxlc3lzdGVtLgo+Pgo+PiBUaGUgcHN0b3JlL2JsayBhbmQgYmxrb29wcywgYSB3cmFwcGVyIGZv
ciBwc3RvcmUvYmxrLCBhcmUgZGVzaWduZWQgZm9yCj4+IGJsb2NrIGRldmljZSBhdCB0aGUgdmVy
eSBiZWdpbm5pbmcsIGJ1dCBub3csIGNvbXBhdGlibGUgdG8gbm90IG9ubHkKPj4gYmxvY2sgZGV2
aWNlLiBBZnRlciB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLCBwc3RvcmUvYmxrIGNhbiBhbHNvIHdv
cmsKPj4gZm9yIE1URCBkZXZpY2UuIFRvIG1ha2UgaXQgd29yaywgJ2Jsa2Rldicgb24ga2NvbmZp
ZyBvciBtb2R1bGUKPj4gcGFyYW1ldGVyIG9mIGJsa29vcHMgc2hvdWxkIGJlIHNldCBhcyBtdGQg
ZGV2aWNlIG5hbWUgb3IgbXRkIG51bWJlci4KPj4gU2VlIG1vcmUgYWJvdXQgcHN0b3JlL2JsayBh
bmQgYmxrb29wcyBvbjoKPj4gICAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJs
b2NrLnJzdAo+Pgo+PiBXaHkgZG8gd2UgbmVlZCBtdGRwc3RvcmU/Cj4+IDEuIHJlcGV0aXRpdmUg
am9icyBiZXR3ZWVuIHBzdG9yZSBhbmQgbXRkb29wcwo+PiAgICBCb3RoIG9mIHBzdG9yZSBhbmQg
bXRkb29wcyBkbyB0aGUgc2FtZSBqb2JzIHRoYXQgc3RvcmUgcGFuaWMvb29wcyBsb2cuCj4+ICAg
IFRoZXkgaGF2ZSBtdWNoIHNpbWlsYXIgbG9naWMgdGhhdCByZWdpc3RlciB0byBrbXNnIGR1bXBl
ciBhbmQgc3RvcmUKPj4gICAgbG9nIHRvIHNldmVyYWwgY2h1bmtzIG9uZSBieSBvbmUuCj4+IDIu
IGRvIHdoYXQgYSBkcml2ZXIgc2hvdWxkIGRvCj4+ICAgIFRvIG1lLCBhIGRyaXZlciBzaG91bGQg
cHJvdmlkZSBtZXRob2RzIGluc3RlYWQgb2YgcG9saWNpZXMuIFdoYXQgTVRECj4+ICAgIHNob3Vs
ZCBkbyBpcyB0byBwcm92aWRlIHJlYWQvd3JpdGUvZXJhc2Ugb3BlcmF0aW9ucywgZ2V0aW5nIHJp
ZCBvZiBjb2Rlcwo+PiAgICBhYm91dCBjaHVuayBtYW5hZ2VtZW50LCBrbXNnIGR1bXBlciBhbmQg
Y29uZmlndXJhdGlvbi4KPj4gMy4gZW5oYW5jZWQgZmVhdHVyZQo+PiAgICBOb3Qgb25seSBzdG9y
ZSBsb2csIGJ1dCBhbHNvIHNob3cgaXQgYXMgZmlsZXMuCj4+ICAgIE5vdCBvbmx5IGxvZywgYnV0
IGFsc28gdHJpZ2dlciB0aW1lIGFuZCB0cmlnZ2VyIGNvdW50Lgo+PiAgICBOb3Qgb25seSBwYW5p
Yy9vb3BzIGxvZywgYnV0IGFsc28gbG9nIHJlY29yZGVyIGZvciBwbXNnLCBjb25zb2xlIGFuZAo+
PiAgICBmdHJhY2UgaW4gdGhlIGZ1dHVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogV2VpWGlvbmcg
TGlhbyA8bGlhb3dlaXhpb25nQGFsbHdpbm5lcnRlY2guY29tPgo+IAo+IEFja2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+IFJpY2hhcmQsIHlvdXIg
UG9WIG9uIHRoaXMgaXMgd2VsY29tZS4KPiAKPiBJIHN1cHBvc2UgdGhpcyBwYXRjaCBkZXBlbmRz
IG9uIHRoZSBvdGhlcnMgdG8gd29yayBjb3JyZWN0bHkgc28gbWF5YmUKPiB3ZSBzaG91bGQgd2Fp
dCB0aGUgbmV4dCByZWxlYXNlIGJlZm9yZSBhcHBseWluZyBpdC4KPiAKCk9mIGNvdXNlLCB0aGFu
ayB5b3UgZm9yIHlvdXIgcmV2aWV3Cgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgotLSAKbGlhb3dl
aXhpb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
