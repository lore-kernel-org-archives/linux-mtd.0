Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA4FC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 09:13:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02FA208CB
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 09:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQ+rnAzY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02FA208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvTG+zR7Q3BDY7ZSFJJtYY6KcQev0ahlH8JfGKM/d7k=; b=NQ+rnAzYUgnF+C
	ktp3BdeOGPigtX/eKdIJVMn0xGyNcRF1GyDnVvbzTc6L/cVvsaZ0T/lcPJ4rgAtwTd5Z4qWnQpTnn
	FhMPFLpNgbykt9GYC2oluhPjLdwyaUPAe8qj2deeMQ22c80Q2Qnbck47txvb2zvpYy8hz/4bfzXZw
	i4d7MYVEXh/7mb+5GEAPsQDRdNMn887HfZV3xCsE/uMOe5d5yU6xAfcPPLZwVavkCj2tH5PUklCou
	oBd8qAUisIIESQ8BlpLfkyh3lJWsa5BuvSFXl6jVlTWcz4vdBE4u0VgNTb/iEFbSui2PXsGJMWZON
	hQNY0aVMqIenkTYA1usg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgmwv-0002Gv-4s; Fri, 28 Jun 2019 09:13:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgmwR-0001sq-0h
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 09:13:12 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C0D98240005;
 Fri, 28 Jun 2019 09:12:50 +0000 (UTC)
Date: Fri, 28 Jun 2019 11:12:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Message-ID: <20190628111250.34da11be@xps13>
In-Reply-To: <OFF895B48A.00F391C1-ON48258427.002F8256-48258427.003249E0@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
 <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
 <20190627192609.0965f6d5@xps13>
 <OFFBD1710A.54AC467B-ON48258427.0023FCA3-48258427.00255B71@mxic.com.tw>
 <20190628094250.1fd84505@xps13>
 <OFF895B48A.00F391C1-ON48258427.002F8256-48258427.003249E0@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_021311_403155_E2B8EB87 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, stefan@agner.ch,
 richard@nod.at, anders.roxell@linaro.org, liang.yang@amlogic.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBGcmksIDI4IEp1biAy
MDE5IDE3OjA5OjE2ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiAKPiA+IFBsZWFzZSBhbHdh
eXMgQ2M6IFJvYiAocm9iaCtkdEBrZXJuZWwub3JnKSB3aGVuIHlvdSBzZW5kIGJpbmRpbmdzCj4g
PiByZWxhdGVkIHBhdGNoZXMuICAKPiAKPiBVbmRlcnN0b29kLiB0aGFua3MgZm9yIHlvdXIgcmVt
aW5kLgo+IAo+IAo+ID4gPiAgIAo+ID4gPiA+ICAgCj4gPiA+ID4gPiArLSByZWc6IHNob3VsZCBj
b250YWluIDEgZW50cmllIGZvciB0aGUgcmVnaXN0ZXJzICAgCj4gPiA+ID4gCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZW50cnkKPiA+ID4gPiAgIAo+ID4gPiA+ID4gKy0gcmVn
LW5hbWVzOiBzaG91bGQgY29udGFpbiAicmVncyIgICAKPiA+ID4gPiAKPiA+ID4gPiBOb3Qgc3Vy
ZSB5b3UgbmVlZCB0aGF0PyAgIAo+ID4gPiAKPiA+ID4gZm9yIGEgYmFzZSBhZGRyZXNzIG9mIGN0
bHIgcmVnaXN0ZXJzLiAgCj4gPiAKPiA+IFllcyBJIGtub3csIEkgbWVhbjogeW91IGRvbid0IG5l
Y2Vzc2FyaWx5IG5lZWQgdGhlICdyZWctbmFtZXMnIHByb3BlcnR5Cj4gPiBhcyBpdCBpcyBzdXBw
b3NlZCB0aGF0IHRoZSBvbmx5IGVudHJ5IHdpbGwgYmUgdGhlIElQIHJlZ2lzdGVycyAodW5sZXNz
Cj4gPiB0aGVyZSBhcmUgbW9yZSkuIEkgZG9uJ3Qga25vdyB3aGF0J3MgUm9iIHByZWZlcmVuY2Ug
aGVyZSBidXQgSSB3b3VsZAo+ID4gZWl0aGVyIGRyb3AgdGhlIHJlZy1uYW1lcyBwcm9wZXJ0eSBv
ciBlbmhhbmNlIHRoZSBuYW1lLCAicmVncyIgaXMKPiA+IHRlcnJpYmx5IG5vdCBkZXNjcmlwdGl2
ZS4gIAo+IAo+IEdvdCBpdCwgYW55IGNvbW1lbnQgaXMgYXBwcmVjaWF0ZWQgZm9yIGVpdGhlciBk
cm9wIHRoZSByZWctbmFtZXMgcHJvcGVydHkgCj4gb3IgZW5oYW5jZSB0aGUgbmFtZS4KPiAKPiA+
ICAgCj4gPiA+ID4gPiArLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQgbGluZSBjb25uZWN0ZWQgdG8g
dGhpcyBOQU5EIGNvbnRyb2xsZXIKPiA+ID4gPiA+ICstIGNsb2NrLW5hbWVzOiBzaG91bGQgY29u
dGFpbiAicHNfY2xrIiwgInNlbmRfY2xrIiBhbmQgICAKPiAic2VuZF9kbHlfY2xrIgo+ID4gPiA+
ID4gKy0gY2xvY2tzOiBzaG91bGQgY29udGFpbiAzIGVudHJpZXMgZm9yIHRoZSAicHNfY2xrIiwg
InNlbmRfY2xrIiAgIAo+IGFuZAo+ID4gPiA+ID4gKyAgICAic2VuZF9kbHlfY2xrIiBjbG9ja3Mg
ICAKPiA+ID4gPiAKPiA+ID4gPiBzL2VudHJpZXMvcGhhbmRsZXMvID8gICAKPiA+ID4gCj4gPiA+
ID8KPiA+ID4gYXMgSSBrbm93IHRoYXQga2VybmVsIHZpZXdzIHRoZSBwaGFuZGxlIHZhbHVlcyBh
cyBkZXZpY2UgdHJlZSAgIAo+IHN0cnVjdHVyZQo+ID4gPiBpbmZvcm1hdGlvbiBpbnN0ZWFkIG9m
IGRldmljZSB0cmVlIGRhdGEgYW5kIHRodXMgZG9lcyBub3Qgc3RvcmUgdGhlbSAgIAo+IGFzCj4g
PiA+IHByb3BlcnRpZXMuICAKPiA+IAo+ID4gVGhlIGJpbmRpbmdzIGhhdmUgbm90aGluZyB0byBk
byB3aXRoIHRoZSBrZXJuZWwgdmlld3MuIFRoZXkgbWlnaHQKPiA+IGFjdHVhbGx5IGJlIG1lcmdl
ZCBpbiBhIGRpZmZlcmVudCBwcm9qZWN0LCBvdXQgb2YgdGhlIGtlcm5lbC4KPiA+ICAgCj4gCj4g
aWYgcGF0Y2ggdG8gcGhhbmRsZSwgc2hvdWxkIHdlIGFsc28gcGF0Y2ggZHJpdmVyIHRvIG9mX3h4
eF9waGFuZGxlKCk/CgpJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBxdWVzdGlvbi4gPCZjbGsgMT4g
aXMgYSBwaGFuZGxlLCB5b3UgYWxyZWFkeQp1c2UgcGhhbmRsZXMsIGl0J3MganVzdCBtb3JlIHBy
ZWNpc2UgdGhhbiB0aGUgd29yZCAiZW50cmllcyIuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
