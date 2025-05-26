Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6204FC54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgtOER3U4gxU8fyBx6xGXFGaVy0FwJBZ3S5BXefFoPs=; b=AhWG+CqlK/eh/u
	0lDYBY4KpMyubczbAvTWh+cJC5qJiTXNoJ0uDimKnWW35djvfcKlIaLByoI+sVFPLygHklHCoBwVw
	zDuE3RmbJqmNvhWrm8A0JqTRcA8ERooG+5GMFd81iSgYKSrNgA5QP9jiV7XpcHqEr308doeP+ACy7
	CKaGiSd6lhj0yQvEwoz5515ut/3nhhPEmfUdn1lpZL8U7lcshvCcq8pwBIANN8TohEq3n9j+me/OZ
	TOyktU7/VfRSy77yCTgfQ5yrdkh/mRm+aqqcmFR3dPp5U0zDr3p+nHIMRscYClznx26qT1bDNG79B
	uOoGgc6T/7/MDoQOjBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSw7-00000008Lr2-0wtD;
	Mon, 26 May 2025 08:11:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSuw-00000008LiO-2no8
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 08:10:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B0F432A2;
	Mon, 26 May 2025 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748247040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuNkJwVVyWMP6VzsZqlzIYpsiMS21Kc27Fn5oFSy5nU=;
	b=V392rnYF+b8ejLtIgotB6fZYefzXcCM9oIoTrmYQRqcddh8NRp9TXiYPMunSo0ekDYLk4m
	q5hyFi5rDu84Gd4sjlKiyYnebhwdkk+Bx2E9b+Adev/FT/IQsltonASTSAgS8DJXkgCgFr
	WInak7bY9X9wE77y51rn2FVAUhULE08I6G/9d/FIteXVPIcecPSjdh4ZVx+nKQJdjFOpU1
	3WhwjU+BiXiD9wEri6eSEEMcq+qwObwR58uTz4pUDGekjQI81xyniwZNt7hEzhTKp1hTry
	993fFwYdoOw9ypzddb+A8PgmfVYCfoee0fLvOtSJaYmT0mWpVrSjxmAZSePfDQ==
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
In-Reply-To: <IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Wed, 21 May 2025 06:13:32 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 10:10:39 +0200
Message-ID: <87ecwb3i80.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohept
 ghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_011043_285421_F84A5A6D 
X-CRM114-Status: GOOD (  26.62  )
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

T24gMjEvMDUvMjAyNSBhdCAwNjoxMzozMiBHTVQsICJNYWhhcGF0cmEsIEFtaXQgS3VtYXIiIDxh
bWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKCj4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KPgo+PiBPbiAxMy8wNS8yMDI1
IGF0IDE0OjQ1OjM5IEdNVCwgIk1haGFwYXRyYSwgQW1pdCBLdW1hciIgPGFtaXQua3VtYXItCj4+
IG1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToKPj4KPj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5
IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+PiA+Cj4+ID4gSGVsbG8gTWlxdWVs
LAo+PiA+Cj4+ID4+ID4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYucGFyZW50ID0gY29uY2F0LT5z
dWJkZXZbMF0tPmRldi5wYXJlbnQ7Cj4+ID4+ID4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYgPSBj
b25jYXQtPnN1YmRldlswXS0+ZGV2Owo+PiA+PiA+PiA+ICsKPj4gPj4gPj4gPiArICAgICAgICAg
ICAvKiBSZWdpc3RlciB0aGUgcGxhdGZvcm0gZGV2aWNlICovCj4+ID4+ID4+ID4gKyAgICAgICAg
ICAgcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOwo+PiA+PiA+PiA+ICsg
ICAgICAgICAgIGlmIChyZXQpCj4+ID4+ID4+ID4gKyAgICAgICAgICAgICAgICAgICBnb3RvIGRl
c3Ryb3lfY29uY2F0Owo+PiA+PiA+PiA+ICsgICB9Cj4+ID4+ID4+ID4gKwo+PiA+PiA+PiA+ICsg
ICByZXR1cm4gMDsKPj4gPj4gPj4gPiArCj4+ID4+ID4+ID4gK2Rlc3Ryb3lfY29uY2F0Ogo+PiA+
PiA+PiA+ICsgICBtdGRfY29uY2F0X2Rlc3Ryb3kobXRkKTsKPj4gPj4gPj4gPiArCj4+ID4+ID4+
ID4gKyAgIHJldHVybiByZXQ7Cj4+ID4+ID4+ID4gK30KPj4gPj4gPj4gPiArCj4+ID4+ID4+ID4g
K2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9qb2luKTsKPj4gPj4gPj4KPj4g
Pj4gPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgc3VwcG9ydCBwcm9iZSBk
ZWZlcnJhbHMsIEkKPj4gPj4gPj4gYmVsaWV2ZSBpdCBzaG91bGQgYmUgaGFuZGxlZC4KPj4gPj4g
Pgo+PiA+PiA+IEkgc2VlIHRoYXQgdGhlIHBhcnNlX210ZF9wYXJ0aXRpb25zKCkgQVBJIGNhbiBy
ZXR1cm4gLUVQUk9CRV9ERUZFUgo+PiA+PiA+IGR1cmluZyBNVEQgZGV2aWNlIHJlZ2lzdHJhdGlv
biwgYnV0IHRoaXMgYmVoYXZpb3IgaXMgc3BlY2lmaWMgdG8KPj4gPj4gPiB0aGUgcGFyc2VfcWNv
bXNtZW1fcGFydCBwYXJzZXIuIE5vbmUgb2YgdGhlIG90aGVyIHBhcnNlcnMgYXBwZWFyIHRvCj4+
ID4+ID4gc3VwcG9ydCBwcm9iZSBkZWZlcnJhbC4gQXMgZGlzY3Vzc2VkIGluIFJGQyBbMV0sIHRo
ZSB2aXJ0dWFsIGNvbmNhdAo+PiA+PiA+IGZlYXR1cmUgaXMgcHVyZWx5IGEgZml4ZWQtcGFydGl0
aW9uIGNhcGFiaWxpdHksIGFuZCBiYXNlZCBvbiBteQo+PiA+PiA+IHVuZGVyc3RhbmRpbmcsIHRo
ZSBmaXhlZC1wYXJ0aXRpb24gcGFyc2VyIGRvZXMgbm90IHN1cHBvcnQgcHJvYmUgZGVmZXJyYWwu
Cj4+ID4+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBjYW4gdGhpbmsgb2YgYW55IG90aGVy
IHByb2JlIGRlZmVycmFsCj4+ID4+ID4gc2NlbmFyaW9zIHRoYXQgbWlnaHQgaW1wYWN0IHRoZSB2
aXJ0dWFsIGNvbmNhdCBkcml2ZXIuCj4+ID4+Cj4+ID4+IFRoYXQncyB0cnVlLCBidXQgSSBraW5k
IG9mIGRpc2xpa2UgdGhlIGxhdGVfaW5pdGNhbGwsIEkgZmVhciBpdCBtaWdodCBicmVhayBpbiBj
cmVhdGl2ZQo+PiB3YXlzLgo+PiA+Cj4+ID4gSSB1bmRlcnN0YW5kLCBidXQgc2luY2Ugd2UgcmVx
dWlyZSB0aGUgcGFydGl0aW9uIGluZm9ybWF0aW9uIHRvIGJlCj4+ID4gYXZhaWxhYmxlLCBsYXRl
X2luaXRjYWxsIHNlZW1zIHRvIGJlIHRoZSBtb3N0IHN1aXRhYmxlIGNob2ljZSBhbW9uZwo+PiA+
IHRoZSBpbml0Y2FsbCBsZXZlbHPigJRpZiB3ZSBkZWNpZGUgdG8gcHJvY2VlZCB3aXRoIHVzaW5n
IGFuIGluaXRjYWxsLgo+PiA+IFJlZ2FyZGluZyBwb3RlbnRpYWwgZmFpbHVyZXMsIGFzIGZhciBh
cyBJIGNhbiB0ZWxsLCB0aGUgb3BlcmF0aW9uCj4+ID4gd291bGQgZmFpbCBpZiwgYXQgdGhlIHRp
bWUgb2YgY29uY2F0ZW5hdGlvbiwgb25lIG9yIG1vcmUgb2YgdGhlIE1URAo+PiA+IGRldmljZXMg
aW52b2x2ZWQgaW4gdGhlIGNvbmNhdCBhcmUgbm90IHlldCBhdmFpbGFibGUuIEluIHN1Y2ggYQo+
PiA+IHNjZW5hcmlvLCB3ZSBjYW4gaXNzdWUgYSBrZXJuZWwgd2FybmluZyBhbmQgZXhpdCBncmFj
ZWZ1bGx5LiBCdXQsCj4+ID4gSG93ZXZlciwgaWYgeW91IHByZWZlciB0byBtb3ZlIGF3YXkgZnJv
bSB1c2luZyBpbml0Y2FsbHMgYW5kIGhhdmUgYW4KPj4gPiBhbHRlcm5hdGl2ZSBpbXBsZW1lbnRh
dGlvbiBhcHByb2FjaCBpbiBtaW5kLCBwbGVhc2UgbGV0IHVzIGtub3cuCj4+Cj4+IEkgYW0gc29y
cnkgYnV0IHRoaXMgZG9lcyBub3Qgd29yayB3aXRoIG1vZHVsZXMsIGFuZCB3ZSBjYW5ub3QgaWdu
b3JlIHRoaXMgY2FzZSBJCj4+IGJlbGlldmUuIE1vcmUgc3BlY2lmaWNhbGx5LCBpZiBhIGNvbnRy
b2xsZXIgcHJvYmUgaXMgZGVmZXJyZWQgKHdpdGggRVBST0JFX0RFRkVSCj4+IG9yIGp1c3QgcHJl
dmVudGVkIGJlY2F1c2Ugc29tZSBkZXBlbmRlbmNpZXMgYXJlIG5vdCB5ZXQgc2F0aXNmaWVkKSwg
eW91J2xsIGdldAo+PiBpbmNvcnJlY3RseSBkZWZpbmVkIG10ZCBkZXZpY2VzLgo+Cj4gT2ssIGFu
IGFsdGVybmF0aXZlIHNvbHV0aW9uIGNvdWxkIGJlIHRvIHJlbW92ZSB0aGUgaW5pdGNhbGwgcmVn
aXN0cmF0aW9uCj4gYW5kIGluc3RlYWQgaW52b2tlIG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9p
bigp4oCUd2hpY2ggd2FzIHByZXZpb3VzbHkKPiByZWdpc3RlcmVkIGFzIGEgbGF0ZV9pbml0Y2Fs
bOKAlGRpcmVjdGx5IGZyb20gbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpLgo+IEkgYmVsaWV2
ZSB0aGlzIGFwcHJvYWNoIHdvdWxkIGFkZHJlc3MgYm90aCBvZiB5b3VyIGNvbmNlcm5zIHJlZ2Fy
ZGluZwo+IG1vZHVsZSBzdXBwb3J0IGFuZCBwcm9iZSBkZWZlcnJhbC4gQWRkaXRpb25hbGx5LCB3
ZSBjb3VsZCBjb25zaWRlcgo+IG1vdmluZyB0aGUgZW50aXJlIGNvZGUgZnJvbSBtdGRfdmlydF9j
b25jYXQuYyBpbnRvIG10ZGNvbmNhdC5jLgo+IFBsZWFzZSBsZXQgdXMga25vdyB5b3VyIHRha2Ug
b24gdGhpcy4KCldoYXQgd291bGQgdGhpcyBicmluZz8KCk1heWJlIHdlIHNob3VsZCB0cmlnZ2Vy
IHNvbWUga2luZCBvZiBub3RpZmllciBhZnRlciByZWdpc3RlcmluZyBhbiBtdGQKZGV2aWNlIGFu
ZCBpbiB0aGVyZSBhdHRlbXB0IHRvIGdhdGhlciBhbGwgbXRkIGRldmljZXMgcmVxdWlyZWQgZm9y
IHRoZQpjb25jYXRlbmF0aW9uLiBDYW4geW91IHBsZWFzZSBwcm9wb3NlIHNvbWV0aGluZyBsaWtl
IHRoYXQ/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
