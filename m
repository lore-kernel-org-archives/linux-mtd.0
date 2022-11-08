Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7E1C4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLnn73HqSPvmeZW7xAQBsahz7TXdl8eIOPpBSxUU7/I=; b=il1e9XwK5pGRKy
	PEmApBT+lZXLLmLzEZXjdeRDD19XueTUWtdlfswWfV9ZXhjyFNlXAfM2C0s9TTvkrkNdAH1jeI8FE
	hqrkgif85EUNRqhdmI/Z1UCm7NtxWa20yqtb+Pub7Lkm06FvxpDa86J55a9D9FRw2Q5fMIkI3jllt
	e6Mb3L6JorGJ1LHCerTy5UHObydB6MpFmG5T5TrvWmXKBd0EU+x51JaA9QFqC+BRiklNv48btrKvp
	ETcVLoe3PFqNzNaLnsrBaD8iLKN6+0JwwXQofjKl6JtFcM5CMDcHHWXtPEYjoOPU6UZECc3DwS4hG
	Jr6h3fNPnggOTXpyWyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNaW-005ABM-2O; Tue, 08 Nov 2022 12:20:20 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNaJ-005A26-3m
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 12:20:09 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id BB3373200949;
	Tue,  8 Nov 2022 07:19:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 08 Nov 2022 07:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1667909994; x=
	1667996394; bh=INoMKea8/YjuVb0DOGy4KpaM4P6h8yxH9m9PnsFW8P4=; b=d
	WKg1vxP46Zv3gWDTDOZ0RESSBuxBVD4ZfAjJX1XMxbOsY1jRl3w3TFxvC46Ftwmh
	dmj1k6y82kfuqpUg/hcFeYXHZOuZAWKqFLAaKyeUOTq3aWZ6e5B5pcBfqeiyiPtv
	rmnEqCdofmZqXUzK37ZTgYtn3/sY/doXS6HjjT6O9cc+g/FZOKAupSyHy28s72Ft
	68gL7I7qdBX6as47HMWedUcPjJwfxlqVpp86ITT+VC/r/UfOcMR92YccmaFotqpP
	CyNpkI0qRZvGBAOEEfcpOgdnAF+uTzMOHuPlocDwKTRuOqK4QKjL3iwZfCGEalrX
	82D5tT7dOOXkOHGLCgrkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667909994; x=
	1667996394; bh=INoMKea8/YjuVb0DOGy4KpaM4P6h8yxH9m9PnsFW8P4=; b=A
	OkYF/OxwnkJbNcUCCh14yqAZtsbnLpEEGaUGZ9pfXRz5wTbG/tYIhdsjIqyUQ+Oq
	8kGg9Hoxno8IkSElrrV3ciaQpjx+zMgAuSWD+Ocxj4oKSU4iZuq81/znv4n/jbuR
	fi76E3G7ongzhyVGizutHtrT/d58ho4D8Pv1lhUctzQziFvHjmRrTuF/fAfrpiut
	Rycyb1QNzygFIsB0gTKFenIhN/nxQ+epadXvINuIGUdwDjQ9oMHUL10iuDRyQZfP
	do2CpdWea/hMN0Jhq4Svlqu2mWfDN6hiHU4g3mKvVuEVGfkCBFgkqbQCtKSABGrC
	aMlvE47r0XVUFfhprfucA==
X-ME-Sender: <xms:aUlqY9gtoAm16uBFEwulJ7l3UNn4zhPJmsnRYi--4Sc_hFi27C6ssg>
    <xme:aUlqYyCxed3Y73sZ6ui0g0se0KFSLwEqlIqJRYtvr6PKdng_oJEA6Hnrv2XC69nAm
    VYmt02z-TwuXw>
X-ME-Received: <xmr:aUlqY9GC06LUvFD2LC3TuBt2chNGWqRt20h-0-_wzEakB13nHca_-pHFUBYEpZRCY4KLctcAAwHg4gn0OR7-JxCp-RWlApRj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgfekff
    eifeeiveekleetjedvtedvtdeludfgvdfhteejjeeiudeltdefffefvdeinecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:aUlqYyTlJXf2gjJXqfqlVr2HnzDXxzhwAgx_iZPNAizzFOxxlpMQyA>
    <xmx:aUlqY6ysdHgvk908ViHRZawh49igNPunGYv3y0114yJOQElBYRowpQ>
    <xmx:aUlqY46pRvRNoSMzLuG5jvx9b4jEUegH6FW-flOx9_FoOcC3xrejWQ>
    <xmx:aklqY7o4qbCooT8PwHYTq7SzTEqSnUkzyFd-HNjju7EQlkZ5MxLp9w>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Nov 2022 07:19:52 -0500 (EST)
Date: Tue, 8 Nov 2022 13:19:49 +0100
From: Greg KH <greg@kroah.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sasha Levin <sashal@kernel.org>, Han Xu <han.xu@nxp.com>,
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH stable 5.4] mtd: rawnand: gpmi: Set WAIT_FOR_READY
 timeout based on program/erase times
Message-ID: <Y2pJZQvoKrwm3mjj@kroah.com>
References: <20221107173351.209558-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107173351.209558-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042007_636414_3D7A4942 
X-CRM114-Status: GOOD (  20.11  )
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

T24gTW9uLCBOb3YgMDcsIDIwMjIgYXQgMDk6MzM6NTFBTSAtMDgwMCwgVGltIEhhcnZleSB3cm90
ZToKPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gY29t
bWl0IDBmZGRmOWFkMDZmZDlmNDM5ZjEzNzEzOTg2MTU1NjY3MTY3M2UzMWMgdXBzdHJlYW0uCj4g
Cj4gMDY3ODFhNTAyNjM1MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZ
X1RJTUVPVVQgcmVnaXN0ZXIKPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lf
dGltZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+IHRob3VnaDogSXQgaXMgY2FsY3Vs
YXRlZCBiYXNlZCBvbiB0aGUgbWF4aW11bSBwYWdlIHJlYWQgdGltZSwgYnV0IHRoZQo+IHRpbWVv
dXQgaXMgYWxzbyB1c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25z
IHdoaWNoCj4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiAK
PiBGaXggdGhpcyBieSBjYWxjdWxhdGluZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1h
eGltdW0gb2YKPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KPiAKPiBUaGlzIGlzIGZvciBub3cg
dGhlIGVhc2llc3QgYW5kIG1vc3Qgb2J2aW91cyB3YXkgdG8gZml4IHRoZSBkcml2ZXIuCj4gVGhl
cmUncyByb29tIGZvciBpbXByb3ZlbWVudHMgdGhvdWdoOiBUaGUgTkFORF9PUF9XQUlUUkRZX0lO
U1RSIHRlbGxzIHVzCj4gdGhlIGRlc2lyZWQgdGltZW91dCBmb3IgdGhlIGN1cnJlbnQgb3BlcmF0
aW9uLCBzbyB3ZSBjb3VsZCBwcm9ncmFtIHRoZQo+IHRpbWVvdXQgZHluYW1pY2FsbHkgZm9yIGVh
Y2ggb3BlcmF0aW9uIGluc3RlYWQgb2Ygc2V0dGluZyBhIGZpeGVkCj4gdGltZW91dC4gQWxzbyB3
ZSBjb3VsZCB3aXJlIHVwIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0byBhY3R1YWxseSBkZXRlY3QK
PiBhbmQgZm9yd2FyZCB0aW1lb3V0cyBvY2N1cnJlZCB3aGVuIHdhaXRpbmcgZm9yIHRoZSBjaGlw
IGJlaW5nIHJlYWR5Lgo+IAo+IEFzIGEgc2lkZW5vdGUgSSB2ZXJpZmllZCB0aGF0IHRoZSBjaGFu
Z2UgaW4gMDY3ODFhNTAyNjM1MCBpcyByZWFsbHkKPiBjb3JyZWN0LiBJIHdpcmVkIHVwIHRoZSBp
bnRlcnJ1cHQgaGFuZGxlciBpbiBteSB0cmVlIGFuZCBtZWFzdXJlZCB0aGUKPiB0aW1lIGJldHdl
ZW4gc3RhcnRpbmcgdGhlIG9wZXJhdGlvbiBhbmQgdGhlIHRpbWVvdXQgaW50ZXJydXB0IGhhbmRs
ZXIKPiBjb21pbmcgaW4uIFRoZSB0aW1lIGluY3JlYXNlcyA0MXVzIHdpdGggZWFjaCBzdGVwIGlu
IHRoZSB0aW1lb3V0Cj4gcmVnaXN0ZXIgd2hpY2ggY29ycmVzcG9uZHMgdG8gNDA5NiBjbG9jayBj
eWNsZXMgd2l0aCB0aGUgOTlNSHogY2xvY2sKPiB0aGF0IEkgaGF2ZS4KPiAKPiBGaXhlczogMDY3
ODFhNTAyNjM1MCAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4IHNldHRpbmcgYnVzeSB0aW1lb3V0
IHNldHRpbmciKQo+IEZpeGVzOiBiMTIwNjEyMjA2OWFhICgibXRkOiByYXduaWFuZDogZ3BtaTog
dXNlIGNvcmUgdGltaW5ncyBpbnN0ZWFkIG9mIGFuIGVtcGlyaWNhbCBkZXJpdmF0aW9uIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8
cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBBY2tlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNv
bT4KPiBUZXN0ZWQtYnk6IFRvbWFzeiBNb8WEIDx0b21hc3oubW9uQGNhbWxpbmdyb3VwLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IFNp
Z25lZC1vZmYtYnk6IFRpbSBIYXJ2ZXkgPHRoYXJ2ZXlAZ2F0ZXdvcmtzLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgNiArKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKCk5vdyBx
dWV1ZWQgdXAsIHRoYW5rcy4KCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
