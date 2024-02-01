Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB5C47DDB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDynaQmCMTtRJjmzLu6wwrqoTkxvU7cZ1Q0oqyNs3Co=; b=c5E/r/U+05XieA
	F4TMzuGYjWWbjkfgBoj2QCl+Ui2K96DrwxT2XWxpwqjzCIxCO+4w1b4NDmo/t2HpwmKZ99UVW+J8B
	S8i5znSrQ5ZFNgkq/Zxx2I/SHoHRaJjIQIkszCSXxT+un9mjz0em2uFU0ewGPhogNLGK0mwJ6Jvmx
	7oGmtMJxNTtiF020g6zOWOaO4Lw97M20uTP6vYgNHYeweUl4nsYNw+eZFJqVyAGUJU+2DrCNcGLMQ
	6JCz2Vc4TO6l8NcxvgCoBMhkPD9UC5ZI7HCQoqC0TOP4VnUy2zH0xFoE8N/kReQ3iVuRwuRhsSKHL
	UyzS3se7rfjF594hABgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSOi-000000073HK-1auA;
	Thu, 01 Feb 2024 08:26:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSOd-000000073Fk-0dDc;
	Thu, 01 Feb 2024 08:26:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1E3D60003;
	Thu,  1 Feb 2024 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706775961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYkQXqzcGz3hrfklpGf6cCnC1Loec/vHktXK38RmtMw=;
	b=KsjPgccLmKV1+LN1lgOi+u4HVkmk+JOojxWki84Yx7/kX3tpLAEHnbw0M5SOBRdylO+9su
	pj6qWeV3v+U2fJRx9FQH6DcrHPZMlMm41naFkDbo5k3a8t3Bagu4pyhoQGOSDkEA221+Mh
	VywBw67GHyz7WPF4/0A1LZ9y/oxvQC1FJPbEAhsRV9BRtE7PizquX+rWgGakSdWQ7qAZN2
	lR3EDPnv24fE0E1RZx2dYRR8c9hrWMw8BHwkB8IHVQCPj2NHudCoa4/rBxdRkmm5qeu8pZ
	kLkXNy2Yc1tgFCT9U6aog4tgUXUV+kIKpI2YoXd44VfoKMCc9h5sd5VMrKdTXQ==
Date: Thu, 1 Feb 2024 09:25:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: David Regan <dregan@broadcom.com>, dregan@mail.com, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin
 <joel.peshkin@broadcom.com>, Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan
 Beygelman <dan.beygelman@broadcom.com>, Anand Gore
 <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Message-ID: <20240201092558.5499ee6a@xps-13>
In-Reply-To: <bcd9f8a5-7dab-42e6-b860-8a56ebb51cb6@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-11-dregan@broadcom.com>
	<20240124184027.712b1e47@xps-13>
	<CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
	<20240126071913.699c3795@xps-13>
	<CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
	<20240129115228.06dc2292@xps-13>
	<2a3edcf5-7afc-410c-a402-3d8cd3feb1da@broadcom.com>
	<20240130120155.3cb6feed@xps-13>
	<CAA_RMS577vw=QWN9_NHfmWqt+_cDG22tA01aU019CPNjAgHqJQ@mail.gmail.com>
	<20240130195504.506fb446@xps-13>
	<bcd9f8a5-7dab-42e6-b860-8a56ebb51cb6@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_002607_625566_E09F524A 
X-CRM114-Status: GOOD (  35.65  )
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

SGkgV2lsbGlhbSwKCj4gPj4+Pj4+Pj4gVGhpcyBpcyBhIGRvdWJsZSBjaGVjayB0byB0dXJuIG9u
L29mZiBvdXIgaGFyZHdhcmUgRUNDLiAgCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSSBleHBlY3QgdGhl
IGVuZ2luZSB0byBiZSBhbHdheXMgZGlzYWJsZWQuIEVuYWJsZSBpdCBvbmx5IHdoZW4geW91Cj4g
Pj4+Pj4+PiBuZWVkIChtYXkgcmVxdWlyZSBhbiBhZGRpdGlvbmFsIHBhdGNoIGJlZm9yZSB0aGlz
IG9uZSkuICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gV2UgYXJlIGFscmVhZHkgdHVybmluZyBvbiB0aGUg
RUNDIGVuYWJsZSBhdCB0aGlzIHBvaW50LAo+ID4+Pj4+PiB0aGlzIGlzIGp1c3QgYWRkaW5nIHRo
ZSBvcHRpb24gdG8gdHVybiBpdCBvZmYgaWYgdGhlIE5BTkQgY2hpcAo+ID4+Pj4+PiBpdHNlbGYg
d2lsbCBiZSBkb2luZyB0aGUgRUNDIGluc3RlYWQgb2Ygb3VyIGNvbnRyb2xsZXIuICAKPiA+Pj4+
Pgo+ID4+Pj4+IFNvcnJ5IGlmIEkgaGF2ZSBub3QgYmVlbiBjbGVhci4KPiA+Pj4+Pgo+ID4+Pj4+
IFRoaXMgc2VxdWVuY2U6Cj4gPj4+Pj4gLSBpbml0Cj4gPj4+Pj4gLSBlbmFibGUgaHcgRUNDIGVu
Z2luZQo+ID4+Pj4+IElzIGJyb2tlbi4gIAo+ID4+Pj4+ICAgPj4+PiBFQ0MgZW5naW5lIGlzIG5v
dCBlbmFibGVkIGZvciBhbGwgdGhlIGNhc2VzLiBIZXJlIHdlIG9ubHkgaW50ZW5kZWQgdG8gZW5h
YmxlIGl0IGZvciB0aGUgbmFuZCBjaGlwIHRoYXQgaXMgc2V0IHRvIHVzZSBOQU5EX0VDQ19FTkdJ
TkVfVFlQRV9PTl9IT1NULiBUaGUgbG9naWMgaGVyZSBzaG91bGQgYmV0dGVyIGNoYW5nZSB0bzog
IAo+ID4+Pj4gaWYgKGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQ
RV9PTl9IT1NUKQo+ID4+Pj4gICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDEp
Owo+ID4+Pj4gZWxzZQo+ID4+Pj4gICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3Qs
IDApOyAgCj4gPj4+PiAgID4+Pj4+IEl0ICpjYW5ub3QqIHdvcmsgYXMgYW55IG9wZXJhdGlvbiBn
b2luZyB0aHJvdWdoIGV4ZWNfb3Agbm93IG1heSAgCj4gPj4+Pj4gcGVyZm9ybSBwYWdlIHJlYWRz
IHdoaWNoIHNob3VsZCBiZSB1bm1vZGlmaWVkIGJ5IHRoZSBFQ0MgZW5naW5lLiBZb3UgPiBkcml2
ZXIgKm11c3QqIGZvbGxvdyB0aGUgZm9sbG93aW5nIHNlcXVlbmNlOgo+ID4+Pj4+IC0gaW5pdCBh
bmQgZGlzYWJsZSAob3Iga2VlcCBkaXNhYmxlZCkgdGhlIGh3IEVDQyBlbmdpbmUKPiA+Pj4+PiAt
IHdoZW4geW91IHBlcmZvcm0gYSBwYWdlIG9wZXJhdGlvbiB3aXRoIGNvcnJlY3Rpb24geW91IG5l
ZWQgdG8KPiA+Pj4+PiAgICAgIC0gZW5hYmxlIHRoZSBlbmdpbmUKPiA+Pj4+PiAgICAgIC0gcGVy
Zm9ybSB0aGUgb3BlcmF0aW9uCj4gPj4+Pj4gICAgICAtIGRpc2FibGUgdGhlIGVuZ2luZQo+ID4+
Pj4+IE1heWJlIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgaGVyZSBidXQgYXJlIHlvdSBzYXlpbmcg
dGhlIGV4ZWNfb3AgY2FuIGhhdmUgZGlmZmVyZW50IGVjYyB0eXBlIGZvciBwYWdlIHJlYWQvd3Jp
dGUgYXQgcnVuIHRpbWUgb24gdGhlIHNhbWUgbmFuZCBjaGlwPyBJIGRvbid0IHNlZSB0aGUgb3Ag
aW5zdHIgc3RydWN0dXJlIGhhcyB0aGUgZWNjIHR5cGUgZmllbGQgYW5kIHRob3VnaHQgaXQgaXMg
b25seSBiaW5kIHRvIHRoZSBuYW5kIGNoaXAgYW5kIHdvbid0IGNoYW5nZSBhdCBydW4gdGltZS4g
U28gbG9va3MgdG8gbWUgdGhlIGluaXQgdGltZSBzZXR0aW5nIHRvIHRoZSBlbmdpbmUgYmFzZWQg
b24gZWNjLmVuZ2luZV90eXBlIHNob3VsZCBiZSBzdWZmaWNpZW50LiAgCj4gPj4+Pgo+ID4+Pj4g
V2hhdCB5b3UgZGVzY3JpYmVkIGhlcmUgY2FuIHdvcmsgZm9yIHRoZSBody5lY2MgcmVhZCBwYXRo
IChlY2MucmVhZF9wYWdlID0gYnJjbW5hbmRfcmVhZF9wYWdlKSB3aGljaCBhbHdheXMgYXNzdW1l
cyBlY2MgaXMgZW5hYmxlZC4gQWx0aG91Z2ggaXQgaXMgcHJvYmFibHkgbm90IHRvbyBiYWQgd2l0
aCB0aGVzZSB0d28gZXh0cmEgb3BlcmF0aW9uLCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2UgZG9u
J3QgaGF2ZSB0byBhZGQgYW55dGhpbmcgYXMgb3VyIGN1cnJlbnQgY29kZSBkb2VzLiBGb3IgdGhl
IGJyY21uYW5kX3JlYWRfcGFnZV9yYXcsICB3ZSBjdXJyZW50bHkgZGlzYWJsZSB0aGUgZW5naW5l
IGFuZCB0aGVuIHJlLWVuYWJsZSBpdChidXQgd2UgbmVlZCB0byBmaXggaXQgdG8gb25seSBlbmFi
bGUgaXQgd2l0aCBodyBlY2MgZW5naW5lIHR5cGUpLiAgU28gaXQgaXMganVzdCBvcHBvc2l0ZSBv
ZiB5b3UgbG9naWMgYnV0IHdvcmtzIHRoZSBzYW1lIHdpdGggbm8gaW1wYWN0IG9uIHRoZSBtb3N0
IHBlcmZvcm1hbmNlIGNyaXRpY2FsIHBhdGguICAKPiA+Pj4KPiA+Pj4gVGhpcyBpcyBub3QgIm15
IiBsb2dpYywgdGhpcyBpcyB0aGUgImNvcmUncyIgbG9naWMuIEkgYW0gc2F5aW5nOiB5b3VyCj4g
Pj4+IGFwcHJvYWNoIGlzIGJyb2tlbiBiZWNhdXNlIHRoYXQgaXMgbm90IGhvdyB0aGUgQVBJIGlz
IHN1cHBvc2VkIHRvIHdvcmssCj4gPj4+IGJ1dCBpdCBtb3N0bHkgd29ya3MgaW4gdGhlIHN0YW5k
YXJkIGNhc2UuICAKPiA+Pgo+ID4+IEluIHRoZSBpbnRlcmVzdCBvZiBtaW5pbWl6aW5nIHJlZ2lz
dGVyIHdyaXRlcywgd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0bwo+ID4+IGVuYWJsZS9kaXNhYmxl
IEVDQyBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgc3RhbmRhcmQKPiA+PiBwYXRoIHRyYW5zZmVyIGJ1
dCBub3QsIGFmdGVyIHRoZSB0cmFuc2ZlciwgdHVybiBvZmYgdGhlIEVDQz8gVGhpcyBzaG91bGQg
bm90Cj4gPj4gYWZmZWN0IG90aGVyIHN0YW5kYXJkIHBhdGggb3BlcmF0aW9ucyBub3IgYWZmZWN0
IHRoZSBleGVjX29wIHBhdGggYXMgdGhvc2UKPiA+PiBhcmUgbG93IGxldmVsIHRyYW5zZmVycyB3
aGljaCBvdXIgRUNDIGVuZ2luZSB3b3VsZCBub3QgdG91Y2ggYW5kIHRoZSBOQU5ECj4gPj4gZGV2
aWNlIGRyaXZlciBzaG91bGQgYmUgcmVzcG9uc2libGUgZm9yIHR1cm5pbmcgb24vb2ZmIGl0cyBv
d24gRUNDLiAgCj4gPiAKPiA+IERvIHlvdSBoYXZlIGxlZ2l0aW1hdGUgY29uY2VybnMgYWJvdXQg
dGhpcyByZWdpc3RlciB3cml0ZSB0YWtpbmcgd2F5Cj4gPiBtb3JlIHRpbWUgdGhhbiBJIGNvdWxk
IGV4cGVjdD8gQmVjYXVzZSBjb21wYXJlZCB0byB0aGUgdHJhbnNmZXIgb2YgYQo+ID4gTkFORCBw
YWdlICsgdFIvdFBST0cgaXQgc2hvdWxkIG5vdCBiZSBub3RpY2VhYmxlLiBJIGRvbid0IHNlZSBo
b3cgeW91Cj4gPiBjb3VsZCBldmVuIG1lYXN1cmUgc3VjaCBpbXBhY3QgYWN0dWFsbHksIHVubGVz
cyB0aGUgcmVnaXN0ZXIgd3JpdGUgZG9lcwo+ID4gd2F5IG1vcmUgdGhhbiB1c3VhbC4gSSdtIGZp
bmUgd2l0aCB0aGUgYWJvdmUgaWRlYSBpZiB5b3Ugc2hvdyBtZSBpdCBoYXMKPiA+IGFuIGludGVy
ZXN0Lgo+ID4gICAKPiBEYXZlIGRpZCB0aGUgbXRkX3NwZWVkIHRlc3QgYW5kIHdlIGNhbiBzZWUg
d2UgZ2V0IGNvbnNpc3RlbnRseSB+MzVLQi9zIHNsb3dlciB3aXRoIHRoZSBleHRyYSBlbmFibGUg
YW5kIGRpc2FibGUgZWNjIGVuZ2luZSBjYWxscyBpbiBlY2MgcmVhZCBwYWdlIHBhdGguCj4gCj4g
V2l0aCB0aGUgY2hhbmdlOgo+IFsgICAyOC4xNDgzNTVdIG10ZF9zcGVlZHRlc3Q6ICAgcGFnZSBy
ZWFkIHNwZWVkIGlzIDk4NTcgS2lCL3MKPiBbICAgMzEuNzU0MjU4XSBtdGRfc3BlZWR0ZXN0OiAy
IHBhZ2UgcmVhZCBzcGVlZCBpcyA5ODY1IEtpQi9zCj4gV2l0aG91dCB0aGUgY2hhbmdlCj4gWyAg
IDU2LjQ0NDczNV0gbXRkX3NwZWVkdGVzdDogICBwYWdlIHJlYWQgc3BlZWQgaXMgOTg5MiBLaUIv
cwo+IFsgICA2MC4wNDIyNjJdIG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDk4
OTcgS2lCL3MKCkkgYmVsaWV2ZSBpZiB5b3UgcmVwZWF0IHRoaXMgMTAgdGltZXMgeW91J2xsIGdl
dCB0b3RhbGx5IGRpZmZlcmVudApyZXN1bHRzLiBJIGRvbid0IHRoaW5rIHRoaXMgdGVzdCBvbiBh
IG5vbiBSVCBtYWNoaW5lIGlzIHByZWNpc2UgZW5vdWdoCnNvIHRoYXQgYSB1bmlxdWUgMzVraUIg
ZGlmZmVyZW5jZSBjYW4gYmUgaW50ZXJwcmV0ZWQgYXMgYmVpbmcKc2lnbmlmaWNhbnQuCgo+IEFs
dGhvdWdoIGl0IGlzIG9ubHkgbGVzcyB0aGFuIDElIGRyb3AsIGl0IGlzIHN0aWxsIHNvbWV0aGlu
Zy4gSSB1bmRlcnN0YW5kIHRoZSBwcm9jZWR1cmUgeW91IGxhaWQgb3V0IGFib3ZlIGlzIHRoZSBw
cmVmZXJyZWQgd2F5IGJ1dCB3aXRoIG91ciBkcml2ZXIgZnVsbHkgY29udHJvbCB0aGUgY2hpcCBl
Y2MgcmVhZC93cml0ZSBwYWdlLCBlY2MgcmVhZF9yYXcvd3JpdGVfcmF3IHBhZ2UgZnVuY3Rpb24g
YW5kIGV4ZWNfb3AgcGF0aCwgSSBkb24ndCBzZWUgd2hlcmUgaXQgbWF5IG5vdCB3b3JrLgoKSSBq
dXN0IHRvbGQgeW91LCB0aGUgZXhlY19vcCBwYXRoIHJ1bnMgd2l0aCBFQ0MgZW5hYmxlZC4gSSBk
b24ndCBrbm93CmhvdyB0aGlzIGNvbnRyb2xsZXIgd29ya3MuIE5vdyBpZiB5b3UgZG9uJ3QgY2Fy
ZSBhbmQgYXJlIDEwMCUgc3VyZSB0aGlzCmlzIHdvcmtpbmcgYW5kIGZ1dHVyZSBwcm9vZiwganVz
dCBrZWVwIGl0IGxpa2UgdGhpcy4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
