Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27989C44514
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8rloVQi1/yM5pcBnnWdny9KjnJFv/0pNemJXl1GDuc=; b=xcwqV7nGRF4dcf
	4J2OE7YMM3OscHycv6HiHU/UGLf4iEGkuAY+EnStN5WdmD9sef2PR1kIEW4/zsxdLiwDCod/Di+OH
	CtP8CHUnyYNvYeLvYNLJYiWmAZg3MzHmsL81r1c38/tOPUDn90hQ5zQ8EXgneeavouP0catn5l1JX
	24Ktei4aUIyJKqLF7ZDy2XOKqueB7Xroje7GbP3AveRZnMVtOCIXzM33amqTgqrLqLwDeySRxTh2L
	oBcV+kkAoGokECsxthW+Spyp+6m4TwGz6K4Aj8UwtENboLs6Piu+yDpBRmMml4Tq2uaWUv8etrnfj
	coY9PPFDkCMfiowEGg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegx-00000001oLi-32Sz;
	Fri, 17 Jul 2026 09:17:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkegs-00000001oJN-3eQ0
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 09:17:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 56B5A4E40E16;
	Fri, 17 Jul 2026 09:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 101F760363;
	Fri, 17 Jul 2026 09:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93B5611BD0186;
	Fri, 17 Jul 2026 11:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784279822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jQwElADZhrMxckAH/hrUMALB8GyVwYDhrwwh5e4mGu0=;
	b=Q9myIDEDP+Jm8WaR1pxh1BzhiEjrkuEo2bssOXsWBOdu2ktgMU4GVLvSDJ4f2Y4sk+bk1o
	wojpyCCwRGyTIDJyxMrZFQuvXwTo1zBbBbmr53jmeTkLdN9IzC9xrAeFNhmilAY4YoyxLF
	WbQY8jl5X0w4J7afUbCjOPuBQ8a5ge9MUybkI5rACoQC3mcCzRT4k+Sxs3BE/xwV7Iax0v
	mgmgTCBqogfFp43O18jqrMpTMF1om9xyiqXA41s1tiIYHLlofEBBp+UMd/wnCKBrkcECEq
	JYYenPnd9VLFcp7gUTKuxoQwSes4l9m7L2PFm5AX5/jaCF/GA5qAUGD58jMMEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <mwalle@kernel.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <b224c6938e084763b017c63e0aa3fa3f@infineon.com> (Takahiro
	Kuwano's message of "Fri, 10 Jul 2026 02:55:58 +0000")
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
	<87pl19s7ng.fsf@bootlin.com>
	<0fe3140096bc48a8e71838362220d9f8@kernel.org>
	<b224c6938e084763b017c63e0aa3fa3f@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 11:16:58 +0200
Message-ID: <8733xikmb9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_021707_054807_15D0DB0A 
X-CRM114-Status: GOOD (  10.35  )
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

SGVsbG8sCgo+PiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Nhc2hpa28tZGV2L3Nhc2hpa28vYmxv
Yi9tYWluL01BSU5UQUlORVJTX0dVSURFLm1kCj4+ID4KPj4gPiBUaGVyZSBhcmUgYSBjb3VwbGUg
bW9yZSBxdWVzdGlvbnMgd2Ugc2hvdWxkIGFuc3dlciByZWdhcmRpbmcgZS1tYWlsCj4+ID4gZGVs
aXZlcnk6Cj4+ID4KPj4gPiAtIFNoYWxsIFNhc2hpa28gcmVwbHkgdG8gYWxsL2p1c3QgdGhlIGF1
dGhvci9hIGxpc3Qgb2YgaW5kaXZpZHVhbHM/Cj4+ID4KPj4gPiAgIElmIHdlIGdvIGZvciBlLW1h
aWxzLCBJJ2QgYW5zd2VyIHRvIHRoZSB0aHJlYWQsIHNvICJyZXBseV9hbGwiLiBCdXQKPj4gPiAg
IEknbSBvcGVuLgo+PiAKPj4gSSdkIGdvIHRvIGxldCBpdCBvbmx5IHJlcGx5IHRvIHVzLCB3aGlj
aCB3aWxsIHJldmlldyB0aGUgY29tbWVudHMKPj4gYW5kIGZvcndhcmQgdGhlbSAob3IgbWVudGlv
biB0aGVtIHdpdGggYSBsaW5rIHRvIHRoZSB3ZWJpbnRlcmZhY2UpLgo+Cj4gSSdkIGxlYW4gdG93
YXJkICdvbmx5IHJlcGx5IHRvIHVzJy4KClRoYXQgbWVhbnMgbW9yZSBsb2FkIG9uIHVzIHNvbWVo
b3csIEkgd291bGQgaGF2ZSBwcmVmZXJyZWQgYW4gb3BlbgphbnN3ZXIsIGJ1dCBsZXQncyB0cnkg
aXQgeW91ciB3YXkgZmlyc3QuIFdlIGNhbiBhZGp1c3QgbGF0ZXIuCgo+PiA+IC0gU2hhbGwgU2Fz
aGlrbyBzZW5kIGEgcG9zaXRpdmUgcmV2aWV3IGluIGNhc2Ugbm90aGluZyB3YXMgc3BvdD8KPj4g
Pgo+PiA+ICAgSWYgd2UgZW5hYmxlIGUtbWFpbHMsIEknZCBiZSB0ZW1wdGVkIHRvIHNheSAieWVz
Ii4KPj4gCj4+IHllYWggcHJvYmFibHkuCgpBY3R1YWxseSwgSSBnb3QgYW5ub3llZCBieSB0aGUg
YW1vdW50IG9mIGZlZWRiYWNrIChhcyBhIGNvbnRyaWJ1dG9yIGluCm90aGVyIHN1YnN5c3RlbXMp
IGFscmVhZHksIGFuZCBhcyB0aGUgYW5zd2VycyBhcmUgcHJldHR5IGZhc3QsIEkgYmVsaWV2ZQpp
dCBpcyBub3Qgd29ydGggdGhlIGV4dHJhIGxvYWQgb2YgZS1tYWlscyB0byBnZXQgdGhvc2UgcG9z
aXRpdmUKYW5zd2Vycy4gTGV0J3MganVzdCBzdGljayB0byB0aGUgImlzc3VlcyIgaWYgeW91IGRv
bid0IG1pbmQgZm9yIG5vdy4KCkZZSSB0aGVyZSBpcyBhIHByZXR0eSAiaG90IiBkaXNjdXNzaW9u
IGFib3V0IHRoZSB1c2FnZSBieSBtYWludGFpbmVycyBvZgpTYXNoaWtvIChhbmQgQUkgcmV2aWV3
IGluIGdlbmVyYWwpIG9uIHRoZSB1c2VycyBtYWlsaW5nIGxpc3QuIEkgYW0KcGVyc29uYWxseSBu
b3QgYWxpZ25lZCB3aXRoIHRoZSBMRiBwb3NpdGlvbiBzdGF0aW5nIHRoYXQgdGhlIExpbnV4Cmtl
cm5lbCBpcyBhYm91dCB0ZWNobm9sb2d5IGFuZCBub3QgZXRoaWNzLCB0aG91Z2ggYXQgdGhpcyBz
dGFnZSBJIHdhbnQKdG8gdHJ5IGVuYWJsaW5nIHJldmlld3Mgb24gbGludXgtbXRkLCBiZWNhdXNl
IGhvcGVmdWxseSBpdCB3aWxsIGhlbHAgdXMuClNvIEkgd2lsbCBtYWtlIGEgUFIgZm9yIGVuYWJs
aW5nIGl0LCBidXQgbGV0J3Mga2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBpcwpleHBlcmltZW50YWwg
YW5kIGNhbiBiZSByZS1kaXNjdXNzZWQgYXQgYW55IHRpbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
