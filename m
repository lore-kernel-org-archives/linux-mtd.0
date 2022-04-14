Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62891C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvqaE5yAq3k+UnQCitS44hnDAMIHkGcFrNrPU/tXpLo=; b=B0X0i/VMvnt8+R
	WmgRwdGkpLmrlLrci+Y7bVB/MlSbH3P593tZGotKzrR6SdF+/9i4715p7Avy8eBUgRn57ag/4VSjb
	xo0kkwF+KHHQsekOixiL3p8vS18JQjA1xMHE2y67evgWIUokIXzAzQxXQoBS0kIARVQEImxsIQQuq
	4cW/aWYl9FZ+WfFgqb+wXDxgV5HCWx8Iv0G7mSQdkz8g1XIGjmVGPck9P9dcQgua8SQxn899f301l
	w0XlNXkDO3nJGyJwiQP6wGyHYz3E3wKMlvzQCXXw6QHVR8JuF6uqVBY4NFnN7Dvhzg48+qAzsaN5N
	aPgKqT177YjwDbuQe3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Ch-006bFn-HZ; Thu, 14 Apr 2022 17:24:23 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3Cc-006bC5-Pn
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 17:24:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A7111BF209;
 Thu, 14 Apr 2022 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649957054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53bp4149yfS1XBgmPTpLnQMxhy71JoIOyALxAPXtfBs=;
 b=BtntvDVUC09xGOZ2JCfcRIryGltwgnLlCBZFpOfBmsT8Dxo8WERj7ZNp81M/sUIPO+yawJ
 MQ1IExnDYQMQTqpwkjHDYySm1hw5erZfnvrxiYmbcFDQjJFWyoz+Abfh8F4g/IFSbk+doO
 OVebRCbdaYAUkcLZfJyBtHDzf40IGXfWkvPOmN4CvndMuQSQi61dR6XLlHzyzov4CAWO9R
 N/u7k4A3QeSW1S+Oa2g+8LOU5LZGnppogPm0dxSQuy7FadcrprRSk7SiMJNU5vkDE4/dyV
 ulbtR3LG/T3OzPiwap6wg6D3x0uSq/Sd8spPPXILdrnTeTjjR+ZtFficE2AOLQ==
Date: Thu, 14 Apr 2022 19:24:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Scott Zhang <macromarship@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
Message-ID: <20220414192413.0db7ef46@xps13>
In-Reply-To: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_102419_305408_21C9B118 
X-CRM114-Status: GOOD (  14.97  )
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

SGkgU2NvdHQsCgptYWNyb21hcnNoaXBAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMTUgQXByIDIw
MjIgMDA6NDU6MjMgKzA4MDA6Cgo+IEhlbGxvLiBFdmVyeW9uZS4KPiAgICAgIEkgZW5jb3VudGVy
ZWQgYSBzdHJhbmdlIHByb2JsZW0gYWJvdXQgdWJpZnMuIE15IGVtYmVkIGxpbnV4IHJ1bnMKPiB3
ZWxsIG5vcm1hbGx5LiBCdXQgYWZ0ZXIgYWJvdXQgMy00IGRheXMsIGRldmVsb3BpbmcgcGhwIGFw
cGxpY2F0aW9uLAo+IGNvcHlpbmcgZmlsZXMgZXRjLi4gdGhlIC9vcHQgcGFydGl0aW9uIHdoZW4g
cmVhZCwgdGhlIHN5c3RlbSBiZWNvbWUKPiB2ZXJ5IHNsb3cuIEFmdGVyIGNoZWNrIGRtZXNnCj4g
dGhlIG91dHB1dCBjb250YWlucyBmdWxsIG9mIGRlYnVnIGxvZ3MgYXMgYmVsb3cuCj4gCj4gWzE3
NTg4LjA0MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTU2OTEpOiBkb19yZWFkcGFnZTog
Y2Fubm90Cj4gcmVhZCBwYWdlIDE1IG9mIGlub2RlIDM5NiwgZXJyb3IgLTIyCj4gWzE3NTkwLjA4
MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTU2OTUpOiB1Ymlmc19kZWNvbXByZXNzOgo+
IGNhbm5vdCBkZWNvbXByZXNzIDIyOTMgYnl0ZXMsIGNvbXByZXNzb3IgbHpvLCBlcnJvciAtMjIK
PiBbMTc1OTAuMDkwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTY5NSk6IGRvX3JlYWRw
YWdlOiBiYWQgZGF0YQo+IG5vZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4gbG90cyBvZiBoZXgg
ZHVtcCwgc2VlbXMgbm9ybWFsIGRhdGEKPiAKPiBCYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nIG9m
IHViaSBhbmQgdWJpIGZzLiBUaGUgYm90dG9tZXN0IG5hbmQgZHJpdmVyCj4gaGFzIHRoZSBlY2Mg
Y29ycmVjdGlvbiwgdGhlbiB1YmkgaGFzIGNyYzMyIHRvIHZlcmlmeSBkYXRhIHdyaXRlIGFuZAo+
IHJlYWQuIFRoZW4gd2hlbiBkYXRhIGNvbWUgdG8gdWJpZnMsIHRoZSBkYXRhIHNob3VsZCBiZSBh
bHdheXMgY29ycmVjdC4KPiBBbnl0aGluZyB3cm9uZyB3aWxsIGJlIHJlcG9ydGVkIGZpcnN0bHkg
YnkgdWJpIGJlbG93IG9yIG10ZCBuYW5kCj4gZHJpdmVyIGJlbG93Lgo+IFNvIHRoZSBtc2cgc2hv
d3MgYWJvdmUgY29uZnVzZSBtZS4gV2h5IGRpZCBkZWNvbXByZXNzIGZhaWwgZm9yIHBhc3NlZAo+
IGNyYzMyIGRhdGHvvJ8KPiBJcyB0aGVyZSBhbnl3YXkgdG8gc2ltcGxlIGRyb3AgdGhlIGJsb2Nr
IDE1LCBpbm9kZSAzOTYgc28gbm8gd2FybmluZwo+IGFueW1vcmUuIEV2ZW4gc28gbWFueSBsb2dz
IGR1bXBlZCAsdGhlIHN5c3RlbSBjb250aW51ZXMgcnVucyAsIGJ1dAo+IHJhbWRvbWx5IGhhbmdz
LiBNYXliZSBubyBoYW5nLCB0aGUgbGludXggcnVuIGxlZCBjb250aW51ZXMgYmxpbmssCj4gbmV0
d29yayBsZWQgYmxpbmssIHRoZSBwaW5nIGlwIGlzIG5vdCByZWFjdC4KPiBCZWNhdXNlIEkgcG9y
dCB0aGUgbmFuZCBkcml2ZXIgbXlzZWxmLCBhbmQgcG9ydCBldmVyeXRoaW5nIHRvIG1ha2UKPiBu
YW5kIHdvcmtpbmcuIFNvIElzIHRoZXJlIGEgcG9zc2liaWxpdHkgSSBtYWtlIGVjYyBjaGVja3N1
bSB3cm9uZywKPiB0aGVuIGdldCB0aGlzIHdpZXJkIHByb2JsZW0/Cj4gCj4gSSBnb29nbGVkIGZp
cnN0LCBhbmQgb25seSBzZWUgcmVsYXRlZCBkaXNjdXNzIG9uIDIwMTEgYnV0IGNhbid0IHNlZSBp
dCBoZWxwLgo+IGh0dHBzOi8vbGludXgtbXRkLmluZnJhZGVhZC5uYXJraXZlLmNvbS9jNjVTZWRZ
cC91Ymlmcy1kZWNvbXByZXNzLWNhbm5vdC1kZWNvbXByZXNzCgpIZWxsbyBTY290dCwgaWYgeW91
IGFyZSB1bnN1cmUgYWJvdXQgeW91ciBOQU5EIGltcGxlbWVudGF0aW9uIHlvdSBjYW4KcnVuIGFs
bCB0aGUgbmFuZC91YmkgdGVzdHMgYXZhaWxhYmxlIGluIHRoZSBtdGQtdXRpbHMgdGVzdCBzdWl0
ZSAoYWxzbwphdmFpbGFibGUgYXMgYSBCdWlsZHJvb3QgcGFja2FnZSk6Cmh0dHBzOi8vZ2l0Lmlu
ZnJhZGVhZC5vcmcvbXRkLXV0aWxzLmdpdAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
