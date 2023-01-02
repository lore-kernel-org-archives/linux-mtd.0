Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7EC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I6AwT2WI5m70eZWgCm1zBJYlyijH/c7EC7B6cgK4DA=; b=FWcvkTIZvbGyYG
	zCCsdYEfEwgwpuuZ6sMbARUsZsBKtS7El8Nruh21kYbbktMiqjX65OsJs1bC1pYZMLA5SpAsUQsQr
	y92ezzsDldtvClx17AP3O5WTC0BxZ8l1v8xPnglfmTj3K/gvzKk6so5Ys0gYcgqpk+TpBNY5Cg47u
	eOzf+RHeYsmbtLbV/1b1n29AVv3hmBq3ha20uPjfF04lunmQXX80X8deUcxVOea01JGKpNHFJMVdv
	gZtKinPgmcGfiJ/Xj7Jz1/3qrEj/YFCS6JMMc+zWk7wBpcC866yiaW8kcLVcxcsXIxFWJvm/dD66+
	rAMqW5ZmD8vuXDCGckGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCN5z-00CTO5-Gw; Mon, 02 Jan 2023 15:51:27 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCN5B-00CSYu-LV
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 15:50:40 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 271505C009D;
	Mon,  2 Jan 2023 10:50:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 02 Jan 2023 10:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672674623; x=
	1672761023; bh=oam6oYNXzGzzi4tbonArhmHD8y1RakV46ObBlel23fw=; b=s
	2k4aSZOJJK2KsTxRxnDZIOkLJPaj6tUhSv7phv+Is7DcdeKaFSWCNYp3ph42rdCH
	MobYPj1FwY19O4tr6TRy8RhrMFPTIq5/iJGz4naPVkgM1dmIHUm/S55cefK/SYAV
	/ON9wm+ksdvN4Yg+03+ZzVtia43Yw42OtlRCSuTA7O9oqELZQ8zJVuxpA0EFrHLv
	uFOV9pXgGemy6q+of2qi4Z9HeQIqlevLqBDzlmtDkBzeaCOW2Py5wjvv29It4xgq
	hUFDscvgufgSOX7aWPSKGhAQXg1wVvZCunY3gytZcYZoYMj2TO9PfFn6+hHZMBOv
	GagI2dht14mZkEu3CPggw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672674623; x=
	1672761023; bh=oam6oYNXzGzzi4tbonArhmHD8y1RakV46ObBlel23fw=; b=f
	0SXB6YrpUvcdCMF9S+0K9CKhLqxBkvly7toyF8f0o0tgoypRqfVorpHkRAE/Py07
	/Y4QmFgMlhx52PTb1ThySuTQZvekn5QkRtMvVo5T35EwkmWvDDdQ86w1UqlVPC6v
	f6ZnNSUfwcpjNAhG9eOYDocywJbo/TtVoQSGZs7wvTK19C+NRtjh9n1HPf5s7ZM1
	nl5YBacLXBFWhcZsQZtleMT+K2C9hqZJnJeiP/FG9vIEZY1wj4xtbJlR4aFbs/l3
	+wdMoPwkTRW9awQeaW4RfohMj5WKYbQeEu9me8GOVOUF2JzLVGWrIDSYWJi0h4Xi
	T3oPe/qUmIKQlwKIrztcg==
X-ME-Sender: <xms:Pv2yY2BPQic8p3fWT1sQHpwEwfVb9Q6G0b4pxg1-M3VAhyTNQVb8rQ>
    <xme:Pv2yYwgoAv-cFrxVZvNEyLzJvoHaTQw-eRTILc6hNyKEY24vC3Y5hx7JP6iwjAHog
    kyd2rSzB9rFpfogkA>
X-ME-Received: <xmr:Pv2yY5mTolIIvSs0uoN7SGeZvHOMSdSH5XHm7klvhTVYUSmGcCIsx-lXYHaa32hguGRPi2O5YlLa5YVM1T4r2FSP7036jGsOGVCiEojxUEfalk6Wv2dZTRA4Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnheptdegheektdejgfelgeeljeefteevffeggeejledtffffkeeghfeh
    tedvffefgeeinecuffhomhgrihhnpehsthgrtghkphgrthhhtggunhdrtghomhdpiihsoh
    hnghdrtghomhdrtghnpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hg
X-ME-Proxy: <xmx:Pv2yY0y6w0PAvC7xOjDk1vHTvLqe_Y8jhZqJSD19gN-rSc0AfAtxJQ>
    <xmx:Pv2yY7ReCpa2qkQ5yFfvY0Ij3QJIts0ttAZ5ayU_Kpd_i5UzsH9wfQ>
    <xmx:Pv2yY_amVhqe27UDLWidxsq5LDWEqpquUhlLWhtY0-cML-_cjlt_wQ>
    <xmx:P_2yY1e1FAiHdc9pgWDhgRJVCMJp224rgYjJcHrOhZbePnOI16bQjQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 10:50:22 -0500 (EST)
Message-ID: <bfc81317-3c63-cabe-f43f-c1ec216749e4@sholland.org>
Date: Mon, 2 Jan 2023 09:50:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221229190906.6467-1-samuel@sholland.org>
 <20221229190906.6467-2-samuel@sholland.org> <20221230134507.719edeae@xps-13>
 <1b17f332-827b-c8b1-807c-9c6e38caf173@sholland.org>
 <20230102110630.4c68e038@xps-13>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for H27UCG8T2FTR-BC
 MLC NAND
In-Reply-To: <20230102110630.4c68e038@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_075038_661475_1A498E7F 
X-CRM114-Status: GOOD (  26.82  )
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

T24gMS8yLzIzIDA0OjA2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFNhbXVlbCwKPiAKPiBz
YW11ZWxAc2hvbGxhbmQub3JnIHdyb3RlIG9uIEZyaSwgMzAgRGVjIDIwMjIgMTA6MDg6MTMgLTA2
MDA6Cj4gCj4+IEhpIE1pcXXDqGwsCj4+Cj4+IE9uIDEyLzMwLzIyIDA2OjQ1LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+Pj4gSGkgU2FtdWVsLAo+Pj4KPj4+IHNhbXVlbEBzaG9sbGFuZC5vcmcgd3Jv
dGUgb24gVGh1LCAyOSBEZWMgMjAyMiAxMzowOTowMyAtMDYwMDoKPj4+ICAgCj4+Pj4gSDI3VUNH
OFQyRlRSLUJDIGlzIHNpbWlsYXIgdG8gdGhlIGFscmVhZHktc3VwcG9ydGVkIEgyN1VDRzhUMkVU
Ui1CQywgYnV0Cj4+Pj4gcmVwb3J0cyBhIGRpZmZlcmVudCBJRC4gIAo+Pj4KPj4+IENhbiB5b3Ug
cHJvdmlkZSBhIGRhdGFzaGVldCBmb3IgdGhpcyBwYXJ0PyBJIGFtIHN1cnByaXNlZCBieSB0aGUg
cGFnZQo+Pj4gc2l6ZS4gSW4gZ2VuZXJhbCBhbnl3YXksIGl0J3MgYmVzdCB0byBwcm92aWRlIGEg
bGluayB3aGVuIGFkZGluZwo+Pj4gc3VwcG9ydCBmb3IgYSBuZXcgY29tcG9uZW50LiAgCj4+Cj4+
IEkgd2FzIHVuYWJsZSB0byBmaW5kIGEgZGF0YXNoZWV0IGZvciBzcGVjaWZpY2FsbHkgSDI3VUNH
OFQyRlRSLUJDLiBUaGUKPj4gYmVzdCBkYXRhc2hlZXQgSSBjb3VsZCBmaW5kIGlzIGZvciBIMjdV
Q0c4VDJFVFItQkNbMF1bMV0uIEhvd2V2ZXIsIHRoZXJlCj4+IGFyZSBsYXlvdXQgcGFyYW1ldGVy
cyBmb3IgSDI3VUNHOFQyRlRSLUJDIGluIHNvbWUgdmVyc2lvbnMgb2YgdGhlIHZlbmRvcgo+PiBO
QU5EIGRyaXZlclsyXVszXVs0XS4gVGhlIEh5bml4IGNoaXAgaXMgcGFja2FnZWQgYXMgRXNzZW5j
b3JlCj4+IEkzVC04R1E4VDJINVRBUkMsIGFzIHJlZmVyZW5jZWQgaW4gdGhhdCBOQU5EIElEIHRh
YmxlLCB3aGljaCBpcyB0aGUKPj4gYWN0dWFsIHBhY2thZ2Ugb24gdGhlIGJvYXJkIEkgaGF2ZS4K
Pj4KPj4gUmVnYXJkcywKPj4gU2FtdWVsCj4+Cj4+IFswXToKPj4gaHR0cHM6Ly96M2Q5Yjd1OC5z
dGFja3BhdGhjZG4uY29tL3BkZi1kb3duL0gvMi83L0gyN1VDRzhUMkVUUi1CQy1IeW5peC5wZGYK
PiAKPiBQb2ludGluZyB0byBbMF0gb3IgWzFdIGluIHRoZSBjb21taXQgbG9nIHdvdWxkIGJlIG5p
Y2UgYXQgbGVhc3QsIGV2ZW4KPiB0aG91Z2ggd2UgY2Fubm90IGdldCBvdXIgaGFuZHMgb24gdGhl
IHJlYWwgZGF0YXNoZWV0Li4uCgpPSywgSSB3aWxsIGRvIHRoYXQgZm9yIHYyLgoKPj4gWzFdOiBo
dHRwOi8vd3d3Lnpzb25nLmNvbS5jbi91c2VyZmlsZXMvSDI3VUMoRClHOFQoVSkyRVRSLUJDX1Jl
djEuMF8wODI2LnBkZgo+PiBbMl06Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lbmdTaW50ZWNrL0Ex
MzNfSW1hZ2UvYmxvYi9tYWluL2xvbmdhbi9rZXJuZWwvbGludXgtNC45L21vZHVsZXMvbmFuZC9z
dW44aXcxNXAxL3BoeS1uYW5kL3BoeXNpY192Mi9uYW5kX2lkMi5jI0wxNTkyCj4+IFszXToKPj4g
aHR0cHM6Ly9naXRodWIuY29tL2xhdW5jaGZ1ci9yZzgxOC1rZXJuZWwvYmxvYi9tYXN0ZXIvbW9k
dWxlcy9uYW5kL3N1bjhpdzE1cDEvcGh5LW5hbmQvcGh5c2ljX3YyL25hbmRfaWQyLmMjTDE1OTIK
Pj4gWzRdOiBBZGRpbmcgbWVtYmVyIG5hbWVzIHRvIHRoYXQgdGFibGUgZW50cnk6Cj4+Cj4+IHsu
bmFuZF9pZCAgICAgICAgICAgICAgID0gezB4YWQsIDB4ZGUsIDB4MTQsIDB4YWIsIDB4NDIsIDB4
NGEsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4ZmYsIDB4ZmZ9LAo+PiAgLmRpZV9j
bnRfcGVyX2NoaXAgICAgICA9IDEsCj4+ICAuc2VjdF9jbnRfcGVyX3BhZ2UgICAgID0gMzIsCj4+
ICAucGFnZV9jbnRfcGVyX2JsayAgICAgID0gMjU2LAo+PiAgLmJsa19jbnRfcGVyX2RpZSAgICAg
ICA9IDIxMTIsCj4+ICAjZGVmaW5lIE5BTkRfTVVMVElfUFJPR1JBTSAoMSA8PCAzKQo+PiAgI2Rl
ZmluZSBOQU5EX1JBTkRPTSAgICAgICAgKDEgPDwgNykKPj4gICNkZWZpbmUgTkFORF9SRUFEX1JF
VFJZICAgICgxIDw8IDgpCj4+ICAjZGVmaW5lIE5BTkRfTFNCX1BBR0VfVFlQRSAoMHhmZiA8PCAx
MikKPj4gIC5vcGVyYXRpb25fb3B0ICAgICAgICAgPSAweDAwMDAyMTg4LAo+PiAgLnZhbGlkX2Js
a19yYXRpbyAgICAgICA9IDg5NiwKPj4gIC5hY2Nlc3NfZnJlcSAgICAgICAgICAgPSA0MCwKPj4g
IC5lY2NfbW9kZSAgICAgICAgICAgICAgPSA4LAo+PiAgLnJlYWRfcmV0cnlfdHlwZSAgICAgICA9
IDB4MDUwODA0LAo+PiAgLmRkcl90eXBlICAgICAgICAgICAgICA9IDAsCj4+ICAub3B0aW9uX3Bo
eWlzY19vcF9ubyAgID0gMTQsCj4+ICAuZGRyX2luZm9fbm8gICAgICAgICAgID0gMCwKPj4gIC5p
ZF9udW1iZXIgICAgICAgICAgICAgPSAweDAxMDAyNiwKPj4gIC5tYXhfYmxrX2VyYXNlX3RpbWVz
ICAgPSAzMDAwLAo+PiAgLmRyaXZlcl9ubyAgICAgICAgICAgICA9IDEsCj4+ICAuYWNjZXNzX2hp
Z2hfZnJlcSAgICAgID0gNDAsCj4+ICAucmFuZG9tX2NtZDJfc2VuZF9mbGFnID0gMCwKPj4gIC5y
YW5kb21fYWRkcl9udW0gICAgICAgPSAwLAo+PiAgLm5hbmRfcmVhbF9wYWdlX3NpemUgICA9IDE2
Mzg0ICsgMTY2NH0sCj4gCj4gVGhpcyBhbmQgd2hhdCBpcyBkaXNwbGF5ZWQgaW4gdGhlIHR3byBk
YXRhc2hlZXRzIHBvaW50ZWQgYWJvdmUgbG9va3MKPiB2ZXJ5IG11Y2ggbGlrZSBvdXQtb2YtYmFu
ZCBkYXRhIHRvIG1lLCBJIGRvbid0IGdldCB3aHkgd2Ugc2hvdWxkIHRyZWF0Cj4gdGhpcyBwYXJ0
IG9mIHRoZSBhcnJheSBkaWZmZXJlbnRseT8gVGhlIE9PQiBhcmVhIGlzIG5vdCBvbmx5IHN1cHBv
c2VkIHRvCj4gYmUgdXNlZCBmb3IgRUNDIGJ5dGVzIChldmVuIHRob3VnaCB0aGF0J3MgaG93IFVC
SSBtYWtlIHVzZSBvZiBpdCksIHlvdQo+IGNhbiBzdG9yZSBhbGwgdGhlIGRhdGEgeW91IHdhbnQg
dGhlcmUgKGJ1dCBpdCdzIG5vdCBuZWNlc3NhcmlseQo+IHByb3RlY3RlZCBieSB0aGUgRUNDIGVu
Z2luZSwgd2hpY2gsIGluIGdlbmVyYWwsIG1hdHRlcnMgYSBsb3QuCj4gCj4gSSBkb24ndCBzZWUg
aG93IHRoaXMgZGF0YXNoZWV0IHdvdWxkIGJlIGRpZmZlcmVudCB0aGFuIHRoZSBvdGhlcnMuIFRo
ZXkKPiBkb24ndCBkZXRhaWwgdGhlIGdlb21ldHJ5LCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhl
bSB0byBkbyBpdCBpZiB0aGUKPiBwYWdlIHNpemUgd2FzIGFueXRoaW5nIGRpZmZlcmVudCB0aGFu
IHRoZSBzdGFuZGFyZD8KCk1heWJlIHdlIGFyZSBtaXN1bmRlcnN0YW5kaW5nIGVhY2ggb3RoZXIu
IFRoZSBwYWdlIHNpemUgSSBoYXZlIGRlY2xhcmVkCmluIHRoZSB0YWJsZSBpcyBTWl8xNkssIHdo
aWNoIEkgYmVsaWV2ZSBpcyBhIHN0YW5kYXJkIHZhbHVlLiBUaGUKbm9uLXBvd2VyLW9mLXR3byBj
aGlwIHNpemUgY29tZXMgZnJvbSB0aGUgbnVtYmVyIG9mIGJsb2NrcyBpbiB0aGUgY2hpcDsKdGhl
ICIuYmxrX2NudF9wZXJfZGllID0gMjExMiIgYWJvdmUgY29ycmVzcG9uZHMgdG8gdGhlICI4NDQ4
IiBpbiBwYXRjaCAzLgoKRm9yIEgyN1VDRzhUMkVUUiB0aGlzIGlzIGRlc2NyaWJlZCBpbiB0aGUg
ZGF0YXNoZWV0IG9uIHBhZ2UgMyBhcyAiMSwwNjAKYmxvY2tzIHggMiBwbGFuZSIgYW5kICIoMSww
MjQgYmxvY2tzICsgMzYgYmxvY2spLzFwbGFuZSIuIFRoZXNlIGV4dHJhCmJsb2NrcyBhcmUgc2Vw
YXJhdGUgZnJvbSB0aGUgT09CIGFyZWEgaW5zaWRlIGVhY2ggcGFnZS4KClJlZ2FyZHMsClNhbXVl
bAoKPj4gIi5vcHRpb25fcGh5aXNjX29wX25vID0gMTQiIHJlZmVyZW5jZXMgdGhpcyBlbnRyeToK
Pj4gewo+PiAgICAgLyogMTQgKi8KPj4gICAgIC5tdWx0aV9wbGFuZV9yZWFkX2NtZCA9IHsweDYw
LCAweDMwfSwKPj4gICAgIC5tdWx0aV9wbGFuZV93cml0ZV9jbWQgPSB7MHgxMSwgMHg4MX0sCj4+
ICAgICAubXVsdGlfcGxhbmVfY29weV9yZWFkX2NtZCA9IHsweDYwLCAweDYwLCAweDM1fSwKPj4g
ICAgIC5tdWx0aV9wbGFuZV9jb3B5X3dyaXRlX2NtZCA9IHsweDg1LCAweDExLCAweDgxfSwKPj4g
ICAgIC5tdWx0aV9wbGFuZV9zdGF0dXNfY21kID0gMHg3OCwKPj4gICAgIC5pbnRlcl9ibmswX3N0
YXR1c19jbWQgPSAweDc4LAo+PiAgICAgLmludGVyX2JuazFfc3RhdHVzX2NtZCA9IDB4NzgsCj4+
ICAgICAuYmFkX2Jsb2NrX2ZsYWdfcG9zaXRpb24gPSAweDAwLAo+PiAgICAgLm11bHRpX3BsYW5l
X2Jsb2NrX29mZnNldCA9IDEwMjQsCj4+IH0sCj4+Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
