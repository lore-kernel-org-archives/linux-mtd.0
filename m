Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAB7C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0D29aRafCRYsj/zq6xaQkBY4qEGkk/reiPxxs6DecZw=; b=hpa/FK8VR0lh30
	ybgatp26H+xDmUOQ6G12QTHrrnctS09slRBMP8q/2XpveBt2xgIz8wB75ZBt5UiIwy+gHWB60puv2
	k8cIuBiKGKJzxJapSUtZsaQD+SsnSEsYoLRX4BAO8rcdTU4BKbG1vW8swtIhINxXLK4KRFZhPjLx5
	+VHJ8KCnGGRhfKyDaVzjF9nhagRZMZs3PfjBUW+GKC6PbdpzWqbQbQpnFFh+6A2nQ+v/HlK15grVl
	vLPhVHgqByhKvoIvppyPvqQRVHGDxGIas47fP0C8fWNoUdHe1EIOT8r/KlgV4gXCnhR0BXDWfrY8d
	dKvmrCV26dLwomntnhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYyq-000000092pU-1U7L;
	Mon, 26 May 2025 14:39:08 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYym-000000092nR-2dlr
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 14:39:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54382442B3;
	Mon, 26 May 2025 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748270342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Urg+sqezh7vF8gKr14xmsaMNiNghGrMmO41OBVt6LD8=;
	b=KgP3tfqBZ/iWYbHdKEFt7kVeOdg6D/q2LaBqD6vDZ61oy1GLoR+FiP2swbMSfGyMhzcliZ
	7YyQiR6lpJ63NFRbqqgj9vNPsCzi5ko80V1R3mAbWChsVG7T70JW4/sqVkEArWop11Xzti
	Jj+DoYhFR4Jv8pkzpuwjxx07y/NR9EbRI6dkmN+Lxe6t3t9zloCbeHQGfKrhM0MKNySb9F
	NG+SgHTHuH4SaRX3UakT1E9SLbIbROWsyAofoDZ/F8W0XALXduTMyw46+QqdHotD3s6oOK
	VMszTyabVYTf/fsLsFBjBIjMpa6F6QZohdR3sMO+fb5XUZAM1TeeeQ91f2FVWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Mon, 26 May 2025 14:27:37 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87ecwb3i80.fsf@bootlin.com>
	<IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 16:39:00 +0200
Message-ID: <87msazv3ln.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohept
 ghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_073904_986126_875B1CE5 
X-CRM114-Status: GOOD (  34.54  )
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

T24gMjYvMDUvMjAyNSBhdCAxNDoyNzozNyBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKCj4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPgo+PiA+IFtBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldCj4+ID4KPj4gPj4g
T24gMTMvMDUvMjAyNSBhdCAxNDo0NTozOSBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLQo+PiA+PiBtYWhhcGF0cmFAYW1kLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+ID4g
W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0K
Pj4gPj4gPgo+PiA+PiA+IEhlbGxvIE1pcXVlbCwKPj4gPj4gPgo+PiA+PiA+PiA+PiA+ICsgICAg
ICAgICAgIG10ZC0+ZGV2LnBhcmVudCA9IGNvbmNhdC0+c3ViZGV2WzBdLT5kZXYucGFyZW50Owo+
PiA+PiA+PiA+PiA+ICsgICAgICAgICAgIG10ZC0+ZGV2ID0gY29uY2F0LT5zdWJkZXZbMF0tPmRl
djsKPj4gPj4gPj4gPj4gPiArCj4+ID4+ID4+ID4+ID4gKyAgICAgICAgICAgLyogUmVnaXN0ZXIg
dGhlIHBsYXRmb3JtIGRldmljZSAqLwo+PiA+PiA+PiA+PiA+ICsgICAgICAgICAgIHJldCA9IG10
ZF9kZXZpY2VfcmVnaXN0ZXIobXRkLCBOVUxMLCAwKTsKPj4gPj4gPj4gPj4gPiArICAgICAgICAg
ICBpZiAocmV0KQo+PiA+PiA+PiA+PiA+ICsgICAgICAgICAgICAgICAgICAgZ290byBkZXN0cm95
X2NvbmNhdDsKPj4gPj4gPj4gPj4gPiArICAgfQo+PiA+PiA+PiA+PiA+ICsKPj4gPj4gPj4gPj4g
PiArICAgcmV0dXJuIDA7Cj4+ID4+ID4+ID4+ID4gKwo+PiA+PiA+PiA+PiA+ICtkZXN0cm95X2Nv
bmNhdDoKPj4gPj4gPj4gPj4gPiArICAgbXRkX2NvbmNhdF9kZXN0cm95KG10ZCk7Cj4+ID4+ID4+
ID4+ID4gKwo+PiA+PiA+PiA+PiA+ICsgICByZXR1cm4gcmV0Owo+PiA+PiA+PiA+PiA+ICt9Cj4+
ID4+ID4+ID4+ID4gKwo+PiA+PiA+PiA+PiA+ICtsYXRlX2luaXRjYWxsKG10ZF92aXJ0X2NvbmNh
dF9jcmVhdGVfam9pbik7Cj4+ID4+ID4+ID4+Cj4+ID4+ID4+ID4+IFRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWxzLCBJCj4+ID4+ID4+ID4+
IGJlbGlldmUgaXQgc2hvdWxkIGJlIGhhbmRsZWQuCj4+ID4+ID4+ID4KPj4gPj4gPj4gPiBJIHNl
ZSB0aGF0IHRoZSBwYXJzZV9tdGRfcGFydGl0aW9ucygpIEFQSSBjYW4gcmV0dXJuCj4+ID4+ID4+
ID4gLUVQUk9CRV9ERUZFUiBkdXJpbmcgTVREIGRldmljZSByZWdpc3RyYXRpb24sIGJ1dCB0aGlz
IGJlaGF2aW9yCj4+ID4+ID4+ID4gaXMgc3BlY2lmaWMgdG8gdGhlIHBhcnNlX3Fjb21zbWVtX3Bh
cnQgcGFyc2VyLiBOb25lIG9mIHRoZSBvdGhlcgo+PiA+PiA+PiA+IHBhcnNlcnMgYXBwZWFyIHRv
IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWwuIEFzIGRpc2N1c3NlZCBpbiBSRkMKPj4gPj4gPj4gPiBb
MV0sIHRoZSB2aXJ0dWFsIGNvbmNhdCBmZWF0dXJlIGlzIHB1cmVseSBhIGZpeGVkLXBhcnRpdGlv
bgo+PiA+PiA+PiA+IGNhcGFiaWxpdHksIGFuZCBiYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nLCB0
aGUgZml4ZWQtcGFydGl0aW9uIHBhcnNlciBkb2VzCj4+IG5vdCBzdXBwb3J0IHByb2JlIGRlZmVy
cmFsLgo+PiA+PiA+PiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgY2FuIHRoaW5rIG9mIGFu
eSBvdGhlciBwcm9iZSBkZWZlcnJhbAo+PiA+PiA+PiA+IHNjZW5hcmlvcyB0aGF0IG1pZ2h0IGlt
cGFjdCB0aGUgdmlydHVhbCBjb25jYXQgZHJpdmVyLgo+PiA+PiA+Pgo+PiA+PiA+PiBUaGF0J3Mg
dHJ1ZSwgYnV0IEkga2luZCBvZiBkaXNsaWtlIHRoZSBsYXRlX2luaXRjYWxsLCBJIGZlYXIgaXQK
Pj4gPj4gPj4gbWlnaHQgYnJlYWsgaW4gY3JlYXRpdmUKPj4gPj4gd2F5cy4KPj4gPj4gPgo+PiA+
PiA+IEkgdW5kZXJzdGFuZCwgYnV0IHNpbmNlIHdlIHJlcXVpcmUgdGhlIHBhcnRpdGlvbiBpbmZv
cm1hdGlvbiB0byBiZQo+PiA+PiA+IGF2YWlsYWJsZSwgbGF0ZV9pbml0Y2FsbCBzZWVtcyB0byBi
ZSB0aGUgbW9zdCBzdWl0YWJsZSBjaG9pY2UgYW1vbmcKPj4gPj4gPiB0aGUgaW5pdGNhbGwgbGV2
ZWxz4oCUaWYgd2UgZGVjaWRlIHRvIHByb2NlZWQgd2l0aCB1c2luZyBhbiBpbml0Y2FsbC4KPj4g
Pj4gPiBSZWdhcmRpbmcgcG90ZW50aWFsIGZhaWx1cmVzLCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwg
dGhlIG9wZXJhdGlvbgo+PiA+PiA+IHdvdWxkIGZhaWwgaWYsIGF0IHRoZSB0aW1lIG9mIGNvbmNh
dGVuYXRpb24sIG9uZSBvciBtb3JlIG9mIHRoZSBNVEQKPj4gPj4gPiBkZXZpY2VzIGludm9sdmVk
IGluIHRoZSBjb25jYXQgYXJlIG5vdCB5ZXQgYXZhaWxhYmxlLiBJbiBzdWNoIGEKPj4gPj4gPiBz
Y2VuYXJpbywgd2UgY2FuIGlzc3VlIGEga2VybmVsIHdhcm5pbmcgYW5kIGV4aXQgZ3JhY2VmdWxs
eS4gQnV0LAo+PiA+PiA+IEhvd2V2ZXIsIGlmIHlvdSBwcmVmZXIgdG8gbW92ZSBhd2F5IGZyb20g
dXNpbmcgaW5pdGNhbGxzIGFuZCBoYXZlCj4+ID4+ID4gYW4gYWx0ZXJuYXRpdmUgaW1wbGVtZW50
YXRpb24gYXBwcm9hY2ggaW4gbWluZCwgcGxlYXNlIGxldCB1cyBrbm93Lgo+PiA+Pgo+PiA+PiBJ
IGFtIHNvcnJ5IGJ1dCB0aGlzIGRvZXMgbm90IHdvcmsgd2l0aCBtb2R1bGVzLCBhbmQgd2UgY2Fu
bm90IGlnbm9yZQo+PiA+PiB0aGlzIGNhc2UgSSBiZWxpZXZlLiBNb3JlIHNwZWNpZmljYWxseSwg
aWYgYSBjb250cm9sbGVyIHByb2JlIGlzCj4+ID4+IGRlZmVycmVkICh3aXRoIEVQUk9CRV9ERUZF
UiBvciBqdXN0IHByZXZlbnRlZCBiZWNhdXNlIHNvbWUKPj4gPj4gZGVwZW5kZW5jaWVzIGFyZSBu
b3QgeWV0IHNhdGlzZmllZCksIHlvdSdsbCBnZXQgaW5jb3JyZWN0bHkgZGVmaW5lZCBtdGQgZGV2
aWNlcy4KPj4gPgo+PiA+IE9rLCBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbiBjb3VsZCBiZSB0byBy
ZW1vdmUgdGhlIGluaXRjYWxsCj4+ID4gcmVnaXN0cmF0aW9uIGFuZCBpbnN0ZWFkIGludm9rZSBt
dGRfdmlydF9jb25jYXRfY3JlYXRlX2pvaW4oKeKAlHdoaWNoCj4+ID4gd2FzIHByZXZpb3VzbHkg
cmVnaXN0ZXJlZCBhcyBhIGxhdGVfaW5pdGNhbGzigJRkaXJlY3RseSBmcm9tCj4+IG10ZF9kZXZp
Y2VfcGFyc2VfcmVnaXN0ZXIoKS4KPj4gPiBJIGJlbGlldmUgdGhpcyBhcHByb2FjaCB3b3VsZCBh
ZGRyZXNzIGJvdGggb2YgeW91ciBjb25jZXJucyByZWdhcmRpbmcKPj4gPiBtb2R1bGUgc3VwcG9y
dCBhbmQgcHJvYmUgZGVmZXJyYWwuIEFkZGl0aW9uYWxseSwgd2UgY291bGQgY29uc2lkZXIKPj4g
PiBtb3ZpbmcgdGhlIGVudGlyZSBjb2RlIGZyb20gbXRkX3ZpcnRfY29uY2F0LmMgaW50byBtdGRj
b25jYXQuYy4KPj4gPiBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciB0YWtlIG9uIHRoaXMuCj4+Cj4+
IFdoYXQgd291bGQgdGhpcyBicmluZz8KPj4KPj4gTWF5YmUgd2Ugc2hvdWxkIHRyaWdnZXIgc29t
ZSBraW5kIG9mIG5vdGlmaWVyIGFmdGVyIHJlZ2lzdGVyaW5nIGFuIG10ZCBkZXZpY2UgYW5kIGlu
Cj4+IHRoZXJlIGF0dGVtcHQgdG8gZ2F0aGVyIGFsbCBtdGQgZGV2aWNlcyByZXF1aXJlZCBmb3Ig
dGhlIGNvbmNhdGVuYXRpb24uIENhbiB5b3UKPj4gcGxlYXNlIHByb3Bvc2Ugc29tZXRoaW5nIGxp
a2UgdGhhdD8KPgo+IEluIHRoZSBjdXJyZW50IHBhdGNoLCBkdXJpbmcgTVREIHJlZ2lzdHJhdGlv
biwgaWYgYSBkZXZpY2UgaXMKPiBwYXJ0IG9mIGEgY29uY2F0ZW5hdGVkIChjb25jYXQpIGRldmlj
ZSwgaXQgaXMgbm90IHJlZ2lzdGVyZWQgaW5kaXZpZHVhbGx5Lgo+IEluc3RlYWQsIGl0cyBpbmZv
cm1hdGlvbiBpcyBzdG9yZWQgaW4gYSBjb25jYXQtc3BlY2lmaWMgZGF0YSBzdHJ1Y3R1cmUsIGFz
Cj4gaXQgaXMgbm90IG1lYW50IHRvIGJlIGV4cG9zZWQgYXMgYSBzdGFuZGFsb25lIE1URCBkZXZp
Y2UuIEFzIHBlciBteQo+IGVhcmxpZXIgcHJvcG9zYWwsIG9uY2UgYWxsIGluZGl2aWR1YWwgTVRE
IGRldmljZXMgYXJlIHJlZ2lzdGVyZWQsCj4gbXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2luKCkg
aXMgY2FsbGVkIGZyb20KPiBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyKCkgdG8gc2NhbiB0aGlz
IGRhdGEgc3RydWN0dXJlIGFuZCBjcmVhdGUgdGhlCj4gY29ycmVzcG9uZGluZyBjb25jYXQgZGV2
aWNlcy4gSnVzdCB0byBjb25maXJtLCBhcmUgeW91IHN1Z2dlc3RpbmcgdGhhdAo+IG10ZF92aXJ0
X2NvbmNhdF9jcmVhdGVfam9pbigpIHNob3VsZCBiZSB0cmlnZ2VyZWQgdGhyb3VnaCBhIG5vdGlm
aWVyCj4gaW5zdGVhZD8gQXQgdGhlIHBvaW50IHdoZW4gYWxsIGluZGl2aWR1YWwgTVREIGRldmlj
ZXMgYXJlIHJlZ2lzdGVyZWQsCj4gd2UgYWxyZWFkeSBoYXZlIHRoZSBjb21wbGV0ZSBpbmZvcm1h
dGlvbiByZXF1aXJlZCBmb3IgY29uY2F0ZW5hdGlvbi4KPiBTbywgcmF0aGVyIHRoYW4gcmVseWlu
ZyBvbiBhIGxpc3RlbmVyIG5vdGlmaWNhdGlvbiwgd2UgY2FjIGRpcmVjdGx5IGNhbGwgdGhlCj4g
QVBJLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5nIGFueXRoaW5nIGhlcmUuCgpU
aGlzIGFwcHJvYWNoIGRvZXMgbm90IHN0YW5kIGJlY2F1c2UsIGFmYWlyLCBpdCByZWxpZXMgb24g
YSBzaW5nbGUKbGF0ZV9pbml0Y2FsbCgpIHdoaWNoIGlzIHRvbyBlYXJseS4gV2Ugd2FudCBjb25j
YXRlbmF0aW9uIHRvIHdvcmsKcmVnYXJkbGVzcyBvZiB0aGUgS2NvbmZpZyBzZWxlY3Rpb24gPXkg
b3IgPW0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
