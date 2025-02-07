Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912CFC02194
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+ECabpb/VI2ZmJdTRzccfjJ+CDr3bed6xiLMlW3KFc=; b=bwpntMpIeA4402
	luV1WHuVpHmQ1DjZpGWuVp5ai8ZkKNRB5ldDnI8AHIae609EGhTaT1ROK7xQCP5XAZkL/HAK2pTqB
	WNn5LJSz40+ESumu9DXdrwSkP6vaBEArEkjdgkjNjAJEgMxtKBLdv1MsQ+5SnfEpb2RcmgguShcay
	QISWRTcFBKGJxl4k3g1VpJjYUmR9GaLVXmkH7gNVCX7KBfMZllNHcT7r7V2N9IFa4pOJ+roosyA2O
	FOf479DFo+sUlhLTCd1Eq2wbP37A5VJCZst9qITM9HBmj9DpukM3Sfrwkad/1Rx3ps2AJ/fVrlZxS
	T+Lw9tLb+0zio1uI0d7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOKI-00000009dWZ-0Gbu;
	Fri, 07 Feb 2025 13:23:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOJ4-00000009dJh-3usL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 13:22:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 757C044408;
	Fri,  7 Feb 2025 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738934523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAoBxYtUrA+ImixRo4h70vs5ozOMbJ+LCR06GvVPFo4=;
	b=afh4qDIV12OqDpxGG9POlW/Ful9p+5JGQ5qX3/lTlhDj5DUKDoL5jTNdjweBuT6KjAxufx
	dddXk3qct2y18ieVIkccL3yPotdffCSZKl0bq0LnUu1rkTcsaQfZ2SOD1HawnHLhiG5UtV
	satrL61jVdC+nRv3WQbrtpBvEhOXX+wefn5P1seGOUuud7vc8KnIc8e7jsKaqIB119V8fx
	S5prJcTsbD4km1s6jbbThG14GmOpeYLZjqn4gc7aBroQapHT/Zq/boIRoz1gfLo4Afu5Kd
	qY22F5tMCVb0Nbq+RJpPlmU3t5yGf2bCrHCdhFpfQqKGFbdEol+sJ4wU/QagUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <BL3PR11MB65320CBE12D13EBD3940CE44A2F12@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Fri, 7 Feb 2025 09:12:44 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87o6zi83se.fsf@bootlin.com>
	<BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87frkt96nw.fsf@bootlin.com>
	<BL3PR11MB653239DDBD9D8E7D413B60F4A2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<877c6357o5.fsf@bootlin.com>
	<BL3PR11MB65320CBE12D13EBD3940CE44A2F12@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Feb 2025 14:22:01 +0100
Message-ID: <87ikpl3n5y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeetueegtdekjeekueekfeeuudekkedutdejhfefgfevtdeutdetgfduvdfggfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnihhrrghvkhhumhgrrhdrlhdrrhgrsggrrhgrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepshhhvghnl
 hhitghhuhgrnhesvhhivhhordgtohhmpdhrtghpthhtoheprhhurghnjhhinhhjihgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_052207_560671_48B4C422 
X-CRM114-Status: GOOD (  22.05  )
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

Cj4+ID4+ID4+ID4gTXkgYXBvbG9naWVzIGZvciB0aGUgY29uZnVzaW9uLgo+PiA+PiA+PiA+IFNs
YXZlIERNQSB0ZXJtaW5vbG9neSB1c2VkIGluIGNhZGVuY2UgbmFuZCBjb250cm9sbGVyIGJpbmRp
bmdzCj4+ID4+ID4+ID4gYW5kIGRyaXZlciBpcyBpbmRlZWQgY29uZnVzaW5nLgo+PiA+PiA+PiA+
Cj4+ID4+ID4+ID4gVG8gYW5zd2VyIHlvdXIgcXVlc3Rpb24gaXQgaXMsCj4+ID4+ID4+ID4gMSAt
IEV4dGVybmFsIERNQSAoR2VuZXJpYyBETUEgY29udHJvbGxlcikuCj4+ID4+ID4+ID4KPj4gPj4g
Pj4gPiBOYW5kIGNvbnRyb2xsZXIgSVAgZG8gbm90IGhhdmUgZW1iZWRkZWQgRE1BIGNvbnRyb2xs
ZXIgKDIgLQo+PiA+PiA+PiA+IHBlcmlwaGVyYWwKPj4gPj4gPj4gRE1BKS4KPj4gPj4gPj4gPgo+
PiA+PiA+PiA+IEZZUiwgaG93IGV4dGVybmFsIERNQSBpcyB1c2VkLgo+PiA+PiA+PiA+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzLjEvc291cmNlL2RyaXZlcnMvbXRkL25h
bmQKPj4gPj4gPj4gPiAvcmEKPj4gPj4gPj4gPiB3L2MKPj4gPj4gPj4gPiBhZGVuY2UtbmFuZC1j
b250cm9sbGVyLmMjTDE5NjIKPj4gPj4gPj4KPj4gPj4gPj4gSW4gdGhpcyBjYXNlIHdlIHNob3Vs
ZCBoYXZlIGEgZG1hcyBwcm9wZXJ0eSAoYW5kIHBlcmhhcHMgZG1hLW5hbWVzKSwKPj4gbm8/Cj4+
ID4+ID4+Cj4+ID4+ID4gTm8sIEkgYmVsaWV2ZS4KPj4gPj4gPiBDYWRlbmNlIE5BTkQgY29udHJv
bGxlciBJUCBkbyBub3QgaGF2ZSBkZWRpY2F0ZWQgaGFuZHNoYWtlCj4+ID4+ID4gaW50ZXJmYWNl
IHRvIGNvbm5lY3Qgd2l0aCBETUEgY29udHJvbGxlci4KPj4gPj4gPiBNeSB1bmRlcnN0YW5kaW5n
IGlzIGRtYXMgKGFuZCBkbWEtbmFtZXMpIGFyZSBvbmx5IHVzZWQgZm9yIHRoZQo+PiA+PiA+IGRl
ZGljYXRlZCBoYW5kc2hha2UgaW50ZXJmYWNlIGJldHdlZW4gcGVyaXBoZXJhbCBhbmQgdGhlIERN
QQo+PiBjb250cm9sbGVyLgo+PiA+Pgo+PiA+PiBJIGRvbid0IHNlZSB3ZWxsIGhvdyB5b3UgY2Fu
IGRlZmVyIGlmIHRoZXJlIGlzIG5vIHJlc291cmNlIHRvIGdyYWIuCj4+ID4+IEFuZCBpZiB0aGVy
ZSBpcyBhIHJlc291cmNlIHRvIGdyYWIsIHdoeSBpcyBpdCBub3QgZGVzY3JpYmVkIGFueXdoZXJl
Pwo+PiA+Pgo+PiA+Cj4+ID4gU2luY2UgTkFORCBjb250cm9sbGVyIGRvIG5vdCBoYXZlIGhhbmRz
aGFrZSBpbnRlcmZhY2Ugd2l0aCBETUEKPj4gY29udHJvbGxlci4KPj4gPiBEcml2ZXIgaXMgdXNp
bmcgZXh0ZXJuYWwgRE1BIGZvciBtZW1vcnktdG8tbWVtb3J5IGNvcHkuCj4+IAo+PiBJJ20gc29y
cnkgeW91IGxvc3QgbWUgYWdhaW4uIFdoYXQgZG8geW91IG1lYW4gaGFuZHNoYWtlPyBUaGVyZSBp
cyBubwo+PiByZXF1ZXN0IGxpbmU/IFRoZXJlIGlzIG5vIHdheSB0aGUgTkFORCBjb250cm9sbGVy
IGNhbiB0cmlnZ2VyIERNQSB0cmFuc2ZlcnM/Cj4+IAo+IFllcywgSSBtZWFuIHRoZXJlIGlzIG5v
IHJlcXVlc3QgbGluZSwgc28gdGhlcmUgaXMgbm8gd2F5IHRoZSBOQU5EIGNvbnRyb2xsZXIgY2Fu
Cj4gdHJpZ2dlciBETUEgdHJhbnNmZXIuCj4KPiBTb3JyeSBJIHVzZWQgdGhlIHRlcm1pbm9sb2d5
IGJhc2VkIG9uIFN5bm9wc3lzIERlc2lnbldhcmUgQVhJIERNQSBDb250cm9sbGVyCj4gdGhhdCBp
cyB1c2VkIHdpdGggQWdpbGV4NSBTb0NGUEdBIHBsYXRmb3JtLiAgCj4gaHR0cHM6Ly9naXRodWIu
Y29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTQtcmMxL2RyaXZlcnMvZG1hL2R3LWF4aS1kbWFj
L2R3LWF4aS1kbWFjLXBsYXRmb3JtLmMjTDEzNzIKPgo+PiBXaGF0IGRvIHlvdSBtZWFuIG1lbS10
by1tZW0sIGhvdyBpcyB0aGlzIHVzZWZ1bCB0byB0aGUgY29udHJvbGxlcj8KPj4gCj4gSSBtZWFu
IHN5c3RlbSBtZW1vcnkgdG8vZnJvbSBOQU5EIE1NSU8gcmVnaXN0ZXIgYWRkcmVzcyBmb3IgcGFn
ZQo+ICByZWFkL3dyaXRlIGRhdGEgdHJhbnNmZXIuIAo+Cj4gCXJlZyA9IDwweDEwYjgwMDAwIDB4
MTAwMDA+LCAKPiAJCTwweDEwODQwMDAwIDB4MTAwMD47IDwtLS0gVGhpcyBNTUlPIGFkZHJlc3Mg
YmxvY2sKPiAJcmVnLW5hbWVzID0gInJlZyIsICJzZG1hIjsKPgo+PiA+IFlvdXIgcG9pbnQgaXMg
c2luY2UgdGhlIGRyaXZlciBpcyB1c2luZyBleHRlcm5hbCBETUEgYW5kIGl0IHNob3VsZCBiZQo+
PiA+IGRlc2NyaWJlZCBpbiBiaW5kaW5ncz8KPj4gCj4+IFllcy4gQnV0IG1heWJlIEkgc3RpbGwg
ZG9uJ3QgZ2V0IGl0IGNvcnJlY3RseS4KPj4gCj4gZG1hcyBpcyBhbiBvcHRpb25hbCBwcm9wZXJ0
eSBpbiBjYWRlbmNlIG5hbmQgY29udHJvbGxlciBiaW5kaW5ncy4gCj4gaHR0cHM6Ly9naXRodWIu
Y29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTQtcmMxL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvY2RucyUyQ2hwLW5mYy55YW1sI0wzNgo+IERvZXMgaXQgbmVlZCB0byBj
aGFuZ2UgdG8gcmVxdWlyZWQgcHJvcGVydHkgaW4gYmluZGluZ3M/CgpPbiBvbmUgc2lkZSB5b3Ug
aGF2ZSBhIGRlZGljYXRlZCBNTUlPIHJlZ2lvbiwgd2hpY2ggaW1wbHkgd2Ugc2hvdWxkIGhhdmUK
YW4gZXh0ZXJuYWwgRE1BIGVuZ2luZSB0aGF0IGlzIHByb2JhYmx5IGdlbmVyaWMuIE9uIHRoZSBv
dGhlciBzaWRlIGl0CmZlZWxzIGxpa2Ugb25seSB0aGUgTkFORCBjb250cm9sbGVyIHVzZXMgaXQg
YW5kIGl0IHNob3VsZCBiZSBwaWN0dXJlZCBhcwphIHBlcmlwaGVyYWwgRE1BIGNvbnRyb2xsZXIg
YW5kIGluIHRoaXMgY2FzZSB3ZSBzaG91bGQgbm90IHVzZSB0aGUgRE1BCmVuZ2luZSBBUEkgYXQg
YWxsLiBZb3VyIGNhc2UgaXMgc29tZXRoaW5nIGluIGJldHdlZW4sIEkgZG9uJ3QgbGlrZSBpdApt
dWNoLiBBbnl3YXksIHdlIGNhbm5vdCBicmVhayBiaW5kaW5ncywgc28gcGxlYXNlIHJlc3BpbiB0
aGUgc2VyaWVzCmJlY2F1c2UgSSB0b3RhbGx5IGxvc3QgeW91ciBpbml0aWFsIHRhcmdldC4KCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
