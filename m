Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59665C4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0m/neFks/iTYqm4JZtZ+PRQZB0RAya1h/jfzzJnGfo8=; b=NGTcpCIOVnXGIj
	JR06jOiXOPzviqnNmRz3pUSlxjJm3uL73vDspRWWGnqod/KDgRw2bhCjLy5SWiJJZQqdmeUooSD8w
	VTWWdnnJ210qTth2bSh82+pMdRSnrRBjm2KgfJ5HW4Q9wBjtJX13oZF+Hdx3QaWMIuCHpNB90nuDq
	uTTQIm4bCwWcUhZXuau4car6myCJK3mMcSsoVpj3DR7iUbVs4kq5pKjLMyBR/7hBSIwzrvd8HLxi+
	cHQ6GVkic54a6b6AJYuHe689424EsLtVfdnJ+5gyITxCmFJx2xfqpXPAoc8wetzxDilEniDzqnz35
	lqEZ/YmLAmSfrsF4au3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxvI-00000003AYL-0FwW;
	Mon, 05 Feb 2024 12:18:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxvD-00000003AX0-4382
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 12:18:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52612240002;
	Mon,  5 Feb 2024 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707135477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+evZiLiKD7b5CexFbHLoJ/nJKE/+uE1gXiR+q3+Wjw=;
	b=BnEbuHmrgDWYV4Zwx4pHhHb3Ef7KcMKvOrrZ3+iq0AlT6UzxQe6TSa5R+imYuJy+U2bXIU
	a+QR5CQQc6wC3mNcshL90wOLjj9XtlN/9ES/waKZElJwZmkMK3wbSyFpi0iF3RFaYeI0c7
	3qHtNNtiOVMvIfRHQFVm8m+A378FLmy2D7C/hVAIujzXfWkJaojaMCzCMATuwLF4bGvxHF
	3tcSOVVUN47ZwjomCKVhHj4/GtFvlbgMzOh7AT+jic5X2ZO7o52QWvFjOlSmH5PXhhjp/Q
	Urp2dzCUeAdb4lpNuvf5W6ncJCEARN691Mmkn8ydX0tWH4RVvG1sQ4szSJBLtQ==
Date: Mon, 5 Feb 2024 13:17:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Michael Walle
 <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman
 compatible
Message-ID: <20240205131755.3462084f@xps-13>
In-Reply-To: <CAFLszTi+8ygXOidnhxj7sdJwc6X5i+++QvnUyfe-kde5eSts_w@mail.gmail.com>
References: <20231116172859.393744-1-sjg@chromium.org>
	<20231208150042.GA1278773-robh@kernel.org>
	<CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
	<CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
	<CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
	<20231214172702.GA617226-robh@kernel.org>
	<CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
	<CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
	<CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
	<CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
	<20240205085056.44278f2c@xps-13>
	<CAFLszTi+8ygXOidnhxj7sdJwc6X5i+++QvnUyfe-kde5eSts_w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_041800_434182_65DF9D69 
X-CRM114-Status: GOOD (  40.34  )
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

SGkgU2ltb24sCgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgVGhlIGJpbm1hbiBub2RlIHByb3ZpZGVzIGEgbGF5b3V0IGZv
ciBmaXJtd2FyZSwgdXNlZCB3aGVuIHBhY2thZ2luZyBmaXJtd2FyZQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArICBmcm9tIG11bHRpcGxlIHByb2plY3RzLiBJdCBpcyBiYXNlZCBvbiBmaXhlZC1w
YXJ0aXRpb25zLCB3aXRoIHNvbWUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZXh0ZW5zaW9u
cywgYnV0IHVzZXMgJ2NvbXBhdGlibGUnIHRvIGluZGljYXRlIHRoZSBjb250ZW50cyBvZiB0aGUg
bm9kZSwgdG8KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgYXZvaWQgcGVydHVyYmluZyBvciBj
b25mdXNpbmcgZXhpc3RpbmcgaW5zdGFsbGF0aW9ucyB3aGljaCB1c2UgJ2xhYmVsJyBmb3IgYQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBwYXJ0aWN1bGFyIHB1cnBvc2UuCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgQmlubWFuIHN1cHBvcnRz
IHByb3BlcnRpZXMgdXNlZCBhcyBpbnB1dHMgdG8gdGhlIGZpcm13YXJlLXBhY2thZ2luZyBwcm9j
ZXNzLAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBzdWNoIGFzIHRob3NlIHdoaWNoIGNvbnRy
b2wgYWxpZ25tZW50IG9mIHBhcnRpdGlvbnMuIFRoaXMgYmluZGluZyBhZGRyZXNzZXMKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVzLiBGb3IgZXhhbXBs
ZSwgaXQgaXMgY29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgKGFuICdvdXRwdXQnIHByb3BlcnR5KSB0byBiZSBzZXQgYnkgQmlubWFuLCBiYXNl
ZCBvbiB0aGUgYWxpZ25tZW50IHJlcXVlc3RlZAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBp
biB0aGUgaW5wdXQuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgT25jZSBwcm9jZXNzaW5nIGlzIGNvbXBsZXRlLCBpbnB1dCBwcm9wZXJ0aWVzIGhh
dmUgbW9zdGx5IHNlcnZlZCB0aGVpcgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBwdXJwb3Nl
LCBhdCBsZWFzdCB1bnRpbCB0aGUgZmlybXdhcmUgaXMgcmVwYWNrZWQgbGF0ZXIsIGUuZy4gZHVl
IHRvIGEKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZmlybXdhcmUgdXBkYXRlLiBUaGUgJ2Zp
eGVkLXBhcnRpdGlvbnMnIGJpbmRpbmcgc2hvdWxkIHByb3ZpZGUgZW5vdWdoCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgIGluZm9ybWF0aW9uIHRvIHJlYWQgdGhlIGZpcm13YXJlIGF0IHJ1bnRp
bWUsIGluY2x1ZGluZyBkZWNvbXByZXNzaW9uIGlmCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
IG5lZWRlZC4gIAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEhv
dyBpcyB0aGlzIGdvaW5nIHRvIHdvcmsgZXhhY3RseT8gYmlubWFuIHJlYWRzIHRoZXNlIG5vZGVz
IGFuZCB0aGVuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiB3cml0ZXMgb3V0ICdmaXhlZC1wYXJ0aXRp
b25zJyBub2Rlcy4gQnV0IHRoZW4geW91J3ZlIGxvc3QgdGhlIGJpbm1hbgo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gc3BlY2lmYyBwYXJ0cyBuZWVkZWQgZm9yIHJlcGFja2luZy4gIAo+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gTm8sIHRoZXkgYXJlIHRoZSBzYW1lIG5vZGUu
IEkgZG8gd2FudCB0aGUgZXh0cmEgaW5mb3JtYXRpb24gdG8gc3RpY2sKPiA+ID4gPiA+ID4gPiA+
ID4gPiBhcm91bmQuIFNvIGxvbmcgYXMgaXQgaXMgY29tcGF0aWJsZSB3aXRoIGZpeGVkLXBhcnRp
dGlvbiBhcyB3ZWxsLCB0aGlzCj4gPiA+ID4gPiA+ID4gPiA+ID4gc2hvdWxkIHdvcmsgT0suICAK
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBU
aGUgcGFydGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+ID4gPiA+
ID4gPiAnZml4ZWQtcGFydGl0aW9ucycgb3IgJ2Jpbm1hbicuICAKPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiBDYW4gd2Ugbm90IGFsbG93IGl0IHRvIGJlIGJvdGg/IEkgaGF2ZSB0cmll
ZCB0byBhZGp1c3QgdGhpbmdzIGluCj4gPiA+ID4gPiA+ID4gPiByZXNwb25zZSB0byBmZWVkYmFj
ayBidXQgcGVyaGFwcyB0aGUgZmVlZGJhY2sgd2FzIGxlYWRpbmcgbWUgZG93biB0aGUKPiA+ID4g
PiA+ID4gPiA+IHdyb25nIHBhdGg/ICAKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFN1cmUs
IGJ1dCB0aGVuIHRoZSBzY2hlbWEgaGFzIHRvIGFuZCB0aGF0IG1lYW5zIGV4dGVuZGluZwo+ID4g
PiA+ID4gPiA+IGZpeGVkLXBhcnRpdGlvbnMuICAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2Fu
IHdlIGNyb3NzIHRoYXQgYnJpZGdlIGxhdGVyPyBUaGVyZSBtaWdodCBiZSByZXNpc3RhbmNlIHRv
IGl0LiBJJ20KPiA+ID4gPiA+ID4gbm90IHN1cmUuIEZvciBub3csIHBlcmhhcHMganVzdCBhIGJp
bm1hbiBjb21wYXRpYmxlIHdvcmtzIHdlbGwgZW5vdWdoCj4gPiA+ID4gPiA+IHRvIG1ha2UgcHJv
Z3Jlc3MuICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJcyB0aGVyZSBhbnkgd2F5IHRvIG1ha2UgcHJv
Z3Jlc3Mgb24gdGhpcz8gSSB3b3VsZCBsaWtlIHRvIGhhdmUKPiA+ID4gPiA+IHNvZnR3YXJlIHdo
aWNoIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGUgYmlubWFuIGNvbXBhdGlibGUgdG8gYXQgbGVhc3Qg
YmUKPiA+ID4gPiA+IGFibGUgdG8gdW5kZXJzdGFuZCB0aGUgZml4ZWQtcGFydGl0aW9uIGNvbXBh
dGlibGUuIElzIHRoYXQgYWNjZXB0YWJsZT8gIAo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUncyBvbmx5
IDIgd2F5cyB0aGF0IGl0IGNhbiB3b3JrLiBFaXRoZXIgYmlubWFuIHdyaXRlcyBvdXQKPiA+ID4g
PiBmaXhlZC1wYXJ0aXRpb24gbm9kZXMgZHJvcHBpbmcvcmVwbGFjaW5nIGFueXRoaW5nIG9ubHkg
ZGVmaW5lZCBmb3IKPiA+ID4gPiBiaW5tYW4gb3IgZml4ZWQtcGFydGl0aW9uIGlzIGV4dGVuZGVk
IHRvIGluY2x1ZGUgd2hhdCBiaW5tYW4gbmVlZHMuICAKPiA+ID4KPiA+ID4gT0ssIHRoZW4gSSBz
dXBwb3NlIHRoZSBiZXN0IHdheSBpcyB0byBhZGQgYSBuZXcgYmlubWFuIGNvbXBhdGlibGUsIGFz
Cj4gPiA+IGlzIGRvbmUgd2l0aCB0aGlzIHY2IHNlcmllcy4gUGVvcGxlIHRoZW4gbmVlZCB0byBj
aG9vc2UgaXQgaW5zdGVhZCBvZgo+ID4gPiBmaXhlZC1wYXJ0aXRpb24uICAKPiA+Cj4gPiBJJ20g
c29ycnkgdGhpcyBpcyBub3QgYXQgYWxsIHdoYXQgUm9iIHN1Z2dlc3RlZCwgb3IgZGlkIEkgdG90
YWxseQo+ID4gbWlzdW5kZXJzdGFuZCBoaXMgYW5zd2VyPwo+ID4KPiA+IEluIGJvdGggY2FzZXMg
dGhlIHNvbHV0aW9uIGlzIHRvIGdlbmVyYXRlIGEgImZpeGVkLXBhcnRpdGlvbiIgbm9kZS4gTm93
Cj4gPiB1cCB0byB5b3UgdG8gZGVjaWRlIHdoZXRoZXIgYmlubWFuIHNob3VsZCBhZGFwdCB0aGUg
b3V0cHV0IHRvIHRoZQo+ID4gY3VycmVudCBzY2hlbWEsIG9yIGlmIHRoZSBjdXJyZW50IHNjaGVt
YSBzaG91bGQgYmUgZXh0ZW5kZWQgdG8KPiA+IHVuZGVyc3RhbmQgYWxsIGJpbm1hbidzIG91dHB1
dC4KPiA+Cj4gPiBBdCBsZWFzdCB0aGF0IGlzIG15IHVuZGVyc3RhbmRpbmcgYW5kIGFsc28gd2hh
dCBJIGtpbmQgb2YgYWdyZWUgd2l0aC4gIAo+IAo+IEkgZG8gd2FudCB0byBiaW5tYW4gc2NoZW1h
IHRvIGluY2x1ZGUgYWxsIHRoZSBmZWF0dXJlcyBvZiBCaW5tYW4uCj4gCj4gU28gYXJlIHlvdSBz
YXlpbmcgdGhhdCB0aGVyZSBzaG91bGQgbm90IGJlIGEgJ2Jpbm1hbicgIHNjaGVtYSwgYnV0IEkK
PiBzaG91bGQganVzdCBhZGQgYWxsIHRoZSBiaW5tYW4gcHJvcGVydGllcyB0byB0aGUgZml4ZWQt
cGFydGl0aW9uCj4gc2NoZW1hPwoKVGhpcyBpcyBteSBjdXJyZW50IHVuZGVyc3RhbmRpbmcsIHll
cy4gQnV0IGFja25vd2xlZGdtZW50IGZyb20gUm9iIGlzCmFsc28gd2VsY29tZS4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
