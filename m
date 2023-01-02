Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA40C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9hTjR2V1ebkQhNKa5G0fxwAXic02j0vJZdDwh2iH+k=; b=NRNZgXGjOatV0j
	XTHBk44cAi2EPIEnPAI3HFRYCdA7uMUoWjAGh6emOks2COktv9fooVPrkvNAOmFXU1OlMRM2rlaTY
	N39Ii/RYnc1pYN4MOE1LTheIHMcxgyqEwH4QBH15dXU4Pi9QmRTVr8NuNcXDAOJ4O+trkCF45YoRG
	wg3AzCLsUk5FhGtBCLUery1EnqpWt9FdIjtMRNKjzQ7bDXbm6tCrkpRaj/7Xpz2vynhh8bJ2A6Bb2
	VVxtNdVvZcKugaIhthNjDUyK2yg9WwY07G8poaT8jhuWUoIWd0czvRsS49AYcKCjKELMmGcnLX/pA
	uURfDG0L+h9wxy9ngfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNGG-00Ca4g-4Z; Mon, 02 Jan 2023 16:02:04 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNDn-00CZaa-Qu; Mon, 02 Jan 2023 15:59:33 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 04F445C00EA;
	Mon,  2 Jan 2023 10:59:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 02 Jan 2023 10:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672675171; x=
	1672761571; bh=2+4+wGrW59MyWwPd3wsJUrFMY8syiAgC2hBl1Lb19qY=; b=C
	ZismstWwRLv9F0oVlb1eOYQ60+wnig+4Qw78XhLVH1rvv1Zs9mm1mEv+iVLx+6id
	Z0Yf4Sd5UrLNAgwwS0P18BW0uAgFmL99EiubaHoVlVjXrv8xrFDh3xnAYBFAmost
	RY4exPMUHgc8HOtWkmu6hAHO6HhnE1RWTqBN53EmqAIqPALN9Kr5GcqGOzVyNidf
	/RJU4t8nQ9BFmNhpOHa/OTAonarpbCFw4JPuxY0c2ut7Ba1BjO05PElc7MaubLum
	3naQy5RtatAFrQENwy6wA6eCfvVGirePh4L+OODbKORAS+nz+cz9m41QuMBgDBcS
	9/qrNg23tvjH92JoodejQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672675171; x=
	1672761571; bh=2+4+wGrW59MyWwPd3wsJUrFMY8syiAgC2hBl1Lb19qY=; b=s
	zq9xQqCibpSOx5F4kL3RuqG2RNBmOzS0RBkdh1stgqg5O6SetUezK9L9tdXBi2TM
	Zcp6pFi63a0ajV2V/lFpSqKHpN7qwHB5VmOPjl6Ua0+mrB5nIw5mjIiOSoLG5/1Y
	6gOpVXNNNjdieeTVvYC40SOBnQlKGrTpxKK9J2dhhmNXDZNwCJhk5I8AyvrOHt9o
	j3pW9UG02YN5IrfAmpCVl6olVeS5hGOfY3DTDybDvVcrjQ9gBGsDuJ5COQvnb5Xd
	vmuWyfk+5mTEVCPAc6jBUx9CqmM7Aj1XCGOehMXyx/pOfwSWnZ1Y0dRJ4urXaf1i
	LhJ09g5TMIJRi9UTl4jPw==
X-ME-Sender: <xms:Yv-yYxim3elaiYCmMEDu82bkco5R8wSsRJ71uE26qBwSdxCo9n-p_g>
    <xme:Yv-yY2Bkr-wk-lzHdIOCXobu5stoOpF9zjHkE83n59O_wqRc4ehxVamW-8jhDfjbi
    T39a2F4HjqCEeWz3g>
X-ME-Received: <xmr:Yv-yYxFVvBr6pijY8QL5Xys3xyNQrOkfwGR8m57eXtSgumk--nZI4MF8dhtDgjkUrDuq2ABvNrnRCHuj8F6iT3BIZXY8aWcugnZgg4B1hgEhszCFbF5g2sZe8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgeeikeeufedvvdeuteeivdeiffdtgfdtfeejgfetfeefgeffgfdv
    ffehjedvueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Yv-yY2TqLAX0ls4f_kvNeKTeriAdL-PwHjxwTLyV4OxUKD-QYuIhjw>
    <xmx:Yv-yY-xoKZfGe7uNeaGAt8dhGuKC72OfRokq8LAn2JqRVE2bWkk2ww>
    <xmx:Yv-yY85QXHNwU1m4ZnVlYLQD11IDi2rKhzUkPZ_xOW5rpWO5IzdyWw>
    <xmx:Y_-yYydsoXweit5-V2XVEMDHNoLlSHDnV9nP4LAd7ggmgcDLxIZRzw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 10:59:29 -0500 (EST)
Message-ID: <4207d4eb-31d5-31c0-1a7f-67ec00b63f58@sholland.org>
Date: Mon, 2 Jan 2023 09:59:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20221229181526.53766-1-samuel@sholland.org>
 <20221229181526.53766-5-samuel@sholland.org> <20230102101132.66aa1a1d@xps-13>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
In-Reply-To: <20230102101132.66aa1a1d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_075932_065050_30F34085 
X-CRM114-Status: GOOD (  17.89  )
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

SGkgTWlxdcOobCwKCk9uIDEvMi8yMyAwMzoxMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBT
YW11ZWwsCj4gCj4gc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEyOjE1OjIzIC0wNjAwOgo+IAo+PiBUaGlzIGlzIGFscmVhZHkgYWNjb3VudGVkIGZvciBpbiB0
aGUgc3VidHJhY3Rpb24gZm9yIE9PQiwgc2luY2UgdGhlIEJCTQo+PiBvdmVybGFwcyB0aGUgZmly
c3QgT09CIGR3b3JkLiBXaXRoIHRoaXMgY2hhbmdlLCB0aGUgZHJpdmVyIHBpY2tzIHRoZQo+PiBz
YW1lIEVDQyBzdHJlbmd0aCBhcyB0aGUgdmVuZG9yIGRyaXZlci4KPj4KPj4gRml4ZXM6IDQ3OTZk
ODY1NTkxNSAoIm10ZDogbmFuZDogc3VueGk6IFN1cHBvcnQgRUNDIG1heGltaXphdGlvbiIpCj4+
IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+PiAt
LS0KPj4KPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDMgKy0tCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gaW5kZXggMWJkZGViMWJlNjZmLi4xZWNmMmNlZTM0M2Ig
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gQEAgLTE2NDMsOCArMTY0Myw3
IEBAIHN0YXRpYyBpbnQgc3VueGlfbmFuZF9od19lY2NfY3RybF9pbml0KHN0cnVjdCBuYW5kX2No
aXAgKm5hbmQsCj4+ICAJCWVjYy0+c2l6ZSA9IDEwMjQ7Cj4+ICAJCW5zZWN0b3JzID0gbXRkLT53
cml0ZXNpemUgLyBlY2MtPnNpemU7Cj4+ICAKPj4gLQkJLyogUmVzZXJ2ZSAyIGJ5dGVzIGZvciB0
aGUgQkJNICovCj4+IC0JCWJ5dGVzID0gKG10ZC0+b29ic2l6ZSAtIDIpIC8gbnNlY3RvcnM7Cj4+
ICsJCWJ5dGVzID0gbXRkLT5vb2JzaXplIC8gbnNlY3RvcnM7Cj4gCj4gSSdtIHNvcnJ5IGJ1dCBJ
IGRvbid0IHRoaW5rIHdlIGNhbiBtYWtlIHRoaXMgd29yay4gVGhpcyBjaGFuZ2Ugd291bGQKPiBi
cmVhayBhbGwgZXhpc3RpbmcgdXNlcnMuLi4KCk9LLCBpdCBpcyBub3QgdG9vIG11Y2ggb2YgYW4g
aXNzdWUgYmVjYXVzZSBJIGNhbiBtYW51YWxseSBzcGVjaWZ5IHRoZQpFQ0MgcGFyYW1ldGVycyBp
biB0aGUgZGV2aWNldHJlZS4gRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGZpeAp0aGlz
IHdoZW4gYWRkaW5nIG5ldyBoYXJkd2FyZSB2YXJpYW50cy9jb21wYXRpYmxlIHN0cmluZ3M/CgpS
ZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
