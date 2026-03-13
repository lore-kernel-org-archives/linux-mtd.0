Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C5105F78F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzl49FOmwDUuB2L14G0EivWF5dr/e6Em9Jnl8LqLGJI=; b=Eb32L01Z2CJLHZ
	6hA380nDmpRcPEyD9h7DPd6HGy3314fqFELygO3HBOopjJPo1Hwm2soPa5edMqYAf3ec6aWUvOiS5
	ZrOwdK01jIA1Y7EV5IxrcF64FeuBMXrSHxXmW+2TdMl8qqjkIzSlFd18/VD8fVLftGRinltaGL4TB
	sWVrdT76OW4lCe6iyYpnEOVyIONrX0WTs1Vuhz/iTv8rrcxQe3XsRLk/6HEiJInBn2+Dfl9yJBLWb
	YLIlcw47yT0hqAkMQzqUwpPMnfEJifgZmTjcvzv55yQeUNzY4pGpdQgG5KUAKYqYTYTR8sft1r95y
	Kckhk702r+Rzs60sXdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zZt-0000000HV6m-0sME;
	Fri, 13 Mar 2026 10:17:09 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zZp-0000000HV6C-2KQj
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 10:17:07 +0000
Message-ID: <de081bdc-4b10-4cbe-9b09-4652b63bc4b9@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773397021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnv2zs1n1NJvvwgzygTG+a3peXBLg5pti3my1UnuhZ0=;
	b=qMFR/wGM1bTY3Y0t3IVpsJ9hSEoJ9JlEM6tNvs5lZQmXRV7FXke71RM6wXNtnwPaoEpICP
	3XLw+Crc7sjc1FbE5nM52DcMHVZ5X0wZglmVVrYrSdfrOtiLqhruMghDs2abHvR3C1Un8j
	1Kagu06pKKacVctLVXBQtyIC2pEypNtcw+Tt0WqrajiuOW2UVNS+b+fZCDRAd9kcElUy06
	J8TKetjXtRsJSksCTgNDArqTe03Ua7tEDhcKaFqNQ8xABqvj7aLNTX1He0PHe4eB+F9gAN
	XLhlNu+4UGF0PHAq/+AOavQf2N4hg65+u61hmolLWwzIeJAJPWkmArSQj9y7uw==
Date: Fri, 13 Mar 2026 07:16:48 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Miquel Raynal <miquel.raynal@bootlin.com>, Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
 <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
 <87ecn7jin5.fsf@bootlin.com>
 <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
 <87jywthpsj.fsf@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <87jywthpsj.fsf@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_031705_949530_93DECFA0 
X-CRM114-Status: GOOD (  20.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8zLzI2IDExOjIwIEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgoKPj4+PiBGb3Igc29tZXRo
aW5nIGxpa2UgdGhlICJEUFAiIHBhcnRpdGlvbiwgSSB0aGluayBpdCdzIGJldHRlciB0byBhY2Nl
c3MgaXQKPj4+PiBmcm9tIHVzZXJzcGFjZSB0aGFuIGZyb20ga2VybmVsLgo+Pj4gSWYgaXQncyBh
IE1BQyBhZGRyZXNzIHRoYXQgeW91IGFyZSBhY2Nlc3NpbmcsIGRpcmVjdCB1c2Vyc3BhY2UgZG9l
cyBub3QKPj4+IHNvdW5kIGxpa2UgYSBnb29kIGZpdC4gSWYgSSBtYXksIE5WTUVNIGNlbGxzIGFy
ZSB0aGVyZSBleGFjdGx5IGZvciB0aGlzCj4+PiBwdXJwb3NlOiBpZGVudGlmeWluZyB0aGUgY29u
dGVudCBvZiBhIHN1YnBhcnQgb2YgYSBzdG9yYWdlIGRldmljZSBpbiBhCj4+PiBzdG9yYWdlIGFn
bm9zdGljIHdheS4gVGhlIE5WTUVNIGNlbGxzIGFyZSBtYWRlIGF2YWlsYWJsZSB0byBpbi1rZXJu
ZWwKPj4+IGRyaXZlcnMgKGllLiBuZXR3b3JrIGRldmljZXMgaGF2ZSBhbGwgdGhlIGluZnJhc3Ry
dWN0dXJlIHRvIGdldCB0aGUgTUFDCj4+PiBhZGRyZXNzIGZyb20gdGhlcmUpIGFuZCB0aGVpciBj
b250ZW50IGlzIGFsc28gZXhwb3NlZCB0byB1c2Vyc3BhY2UKPj4+IHRocm91Z2ggc3lzZnMgbm93
Lgo+PiBRdWFsY29tbSdzIFNQSS1OT1IgYm9vdCBmaXJtd2FyZSB1c2VzIGEgR1BUIHBhcnRpdGlv
biB0YWJsZS4gVGhlICJEUFAiCj4+IHBhcnRpdGlvbiBjb250YWlucyBhIEZBVCBmaWxlIHN5c3Rl
bSwgYW5kIHRoZSBNQUMgYWRkcmVzcyBpcyBzdG9yZWQgaW4KPj4gb25lIG9mIHRoZXNlIGZpbGVz
Lgo+Pgo+PiBCZWNhdXNlIHRoZSBkYXRhIGlzIHN0b3JlZCBpbnNpZGUgYSBmaWxlc3lzdGVtIHJh
dGhlciB0aGFuIGF0IGEgZml4ZWQKPj4gb2Zmc2V0LCBpdCBkb2VzIG5vdCBmaXQgd2VsbCB3aXRo
IHRoZSBOVk1FTSBtb2RlbCwgd2hpY2ggYXNzdW1lcyBzaW1wbGUKPj4gb2Zmc2V0LWJhc2VkIGFj
Y2Vzcy4KPiBOb3QgYW55bW9yZSwgdGhlcmUgYXJlIG52bWVtIGxheW91dHMgbm93IHRoYXQgYXJl
IG11Y2ggbW9yZQo+IGZsZXhpYmxlLCBzbyBpZiBhIG5ldHdvcmsgZHJpdmVyIHNoYWxsIGdldCB0
aGlzIE1BQyBhZGRyZXNzLCBpdCBpcyBzdGlsbAo+IGRvYWJsZS4KPgo+IE90aGVyd2lzZSB0aGVy
ZSBpcyBubyBzdWNoIG5lZWQsIGFuZCBpbiB0aGUgY2FzZSBvZiBhIGZpbGUgaW4gYSBGQVQKPiBm
aWxlc3lzdGVtLCBJIGd1ZXNzIGl0IGlzIHByZWZlcmFibGUgdG8gdXNlIG10ZGJsb2NrL3ViaWJs
b2NrIGluIG9yZGVyCj4gdG8gZXhwb3NlIGEgYmxvY2sgZGV2aWNlIGFuZCBtb3VudCBpdCBmcm9t
IHVzZXJzcGFjZS4KPgo+IFBsZWFzZSBub3RlIHRoYXQgZXhwb3NpbmcgYSBGQVQgZmlsZXN5c3Rl
bSBvbiB0b3Agb2YgYSBTUEkgTk9SIGlzIHZlcnkKPiBpbmFwcHJvcHJpYXRlLiBGQVQgaXMgYSBi
bG9jayBmaWxlc3lzdGVtLCBub3QgYXdhcmUgb2YgYWxsIHRoZSBNVEQKPiBzcGVjaWZpY2l0aWVz
IChsaWtlIGJhZCBibG9ja3MpLgoKRldJVyB0aGVyZSBpcyBhbiBleGlzdGluZyB3aWRlbHkgdXNl
ZCBzb2x1dGlvbiAod29ya2Fyb3VuZD8pIGZvciB0aGUgTUFDIAphZGRyZXNzOiBkdGJsb2FkZXIg
cmVhZHMgdGhlIERQUCBwYXJ0aXRpb24gaW4gVUVGSSBhbmQgYXBwbGllcyB0aGUgTUFDIAphZGRy
ZXNzIGFzIGEgRFQgZml4dXAuCgpodHRwczovL2dpdGh1Yi5jb20vVHJhdk11cmF2L2R0YmxvYWRl
ci9ibG9iLzQ5M2U3ZTgyMDI1ZWRkZGFiMjlmZTk5YzJiNmVjNTY2ZjZlMDFhYzEvc3JjL3Fjb20u
YyNMMjYwCgooQnV0IHRoaXMgbWVhbnMgdGhhdCBhbnkgZHRibG9hZGVyIGFsdGVybmF0aXZlIHN1
Y2ggYXMgdGhlIHN5c3RlbWQgVUtJIApzdHViIG11c3QgYWxzbyBpbXBsZW1lbnQgdGhlIHNhbWUg
dGhpbmcsIHdoaWNoIGlzIG5vdCBncmVhdC4pCgpSZWFkaW5nIHRoYXQgY29kZSwgaXQgZG9lcyBu
b3Qgc2VlbSB0byBiZSBhIEZBVCBmaWxlc3lzdGVtIGV4YWN0bHk/IEl0J3MgCnNvbWV0aGluZyBj
YWxsZWQgIlJXRlMiIHdoZXJlIGZpbGVzIGhhdmUgNDktY2hhciBsb25nIG5hbWVzIGFuZCBhIAo0
OS1jaGFyICJ2ZW5kb3IiIHN0cmluZyBmaWVsZCB0aGF0J3MgZWl0aGVyICJRQ09NIiBvciAiT0VN
Ii4KCgpBbHNvIG9uIHRoZSByYXJlIG9sZGVyIGRldmljZXMgdGhhdCBoYXZlIFNOT0MgV2lGaS9t
b2RlbSBidXQgTlZNZSAKc3RvcmFnZSDigJRiYXNpY2FsbHkgdGhlIFN1cmZhY2UgUHJvIFjigJQg
dGhlIG1vZGVtIHBhcnRpdGlvbnMgbmVlZCB0byBiZSAKYWNjZXNzZWQgZnJvbSB1c2Vyc3BhY2Ug
KHJtdGZzKSBhbmQgdGhleSdyZSBzdG9yZWQgb24gdGhlIE5PUiBmbGFzaC4gCldlbGwsIGF0IGxl
YXN0IGluIHRoZSBXaUZpLW9ubHkgY2FzZSBldmVuIGJsYW5rIGZpbGVzIGFyZSBlbm91Z2ggdG8g
CnJlcGxhY2UgdGhlbSA6KSBidXQgZm9yIGNlbGx1bGFyIEkgdGhpbmsgdGhlIElNRUkgYW5kIHN0
dWZmIGlzIHRoZXJlLi4KCgpTbyB0aGlzIGFsbCBzb3VuZHMgc3VwcmVtZWx5IGFubm95aW5nLCB3
ZSBoYXZlIGEgR1BUIHBhcnRpdGlvbmVkIGZsYXNoIAp3aGVyZSBzb21lIHNwZWNpZmljIHBhcnRp
dGlvbnMgc2hvdWxkIGJlIGdpdmVuIHRvIHRoZSBXaUZpJkJUIGRyaXZlcnMgCihhcyBudm1lbSBj
ZWxscz8pIGJ1dCBvdGhlcnMgc2hvdWxkIGJlIGFjY2Vzc2libGUgYXMgbXRkYmxvY2sgZGV2aWNl
cyBpbiAKdXNlcnNwYWNlID5fPAoKCn52YWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
