Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA674CD1283
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXd1kJMJtbq/8Z4j6rSbvgi3PHtBhILdP4ObUSmjyM4=; b=pZy0r3L1Son1ipYm02AcFavWOJ
	OocI9IKf+ZXvEMbsYSqSY/8zITJF0obEyzOyzHZviCw5OFrzF3nRXL+RLoUl9SpaDHynM6eAsy9TK
	GdKRQ0D6pPdnDr7vkzbLyqb1Lek37HaaMMsz9uWTIYHOgJN/atHbvi6cITx5KbkamuUZwoAeWS/Bq
	95e8WCUBe0dD68Vum4H/BBnkkQHccxHkZdxOmFzT6Um3o7Uxdw2PPRdsgTXevgTqsEvTXK3UdpzFo
	04tjPfAlG1+T6/GsGQECUNEpad96m1ZKQftPPpNOWTqRGVA9WHw1ozNW9AfIx/uQ4LCG6GJkuFZsf
	Oo1mjUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqzZ-0000000ENQo-2uLZ;
	Thu, 28 Mar 2024 14:44:33 +0000
Received: from 12.mo561.mail-out.ovh.net ([188.165.41.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqzW-0000000ENPY-0jCq
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 14:44:32 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.17.154])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4V55sD6nXfz1PNF
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2024 14:44:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wxtpn (unknown [10.110.113.85])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7E9DF1FE90;
	Thu, 28 Mar 2024 14:44:15 +0000 (UTC)
Received: from milecki.pl ([37.59.142.101])
	by ghost-submission-6684bf9d7b-wxtpn with ESMTPSA
	id IMV9Hj+CBWbZXggAzwvfSA
	(envelope-from <rafal@milecki.pl>); Thu, 28 Mar 2024 14:44:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G0045d0b1274-b274-498f-8ead-e6da2683c4fd,
                    2235DC1EC97375EE3D784BB84CDB06A8C08B71DD) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 51.255.71.60
MIME-Version: 1.0
Date: Thu, 28 Mar 2024 15:44:15 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
In-Reply-To: <66057c71.050a0220.e4ba.97dc@mx.google.com>
References: <20240322040951.16680-1-ansuelsmth@gmail.com>
 <30bc0d38-b610-4397-ba42-46819d5507fc@milecki.pl>
 <66057c71.050a0220.e4ba.97dc@mx.google.com>
Message-ID: <a4632f1ba701f6b333c50a5366723cf4@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 9385501623872629561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudduledgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghfkfigihgtgfesthekjhdttddtjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgedttdevfffhueduvddvgfeufedtudevgefgteehhfehudelteehteekteeuffeinecuffhomhgrihhnpehophgvnhifrhhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdehuddrvdehhedrjedurdeitddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_074430_582424_1B80306F 
X-CRM114-Status: GOOD (  19.10  )
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

T24gMjAyNC0wMy0yOCAxNToxOSwgQ2hyaXN0aWFuIE1hcmFuZ2kgd3JvdGU6Cj4gT24gV2VkLCBN
YXIgMjcsIDIwMjQgYXQgMTE6MTU6MDJQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+
PiBPbiAyMi4wMy4yMDI0IDA1OjA5LCBDaHJpc3RpYW4gTWFyYW5naSB3cm90ZToKPj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4+
ID4gaW5kZXggNTg4N2ZlYjM0N2E0Li4wZGU4N2JjNjM4NDAgMTAwNjQ0Cj4+ID4gLS0tIGEvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4+ID4g
QEAgLTkwMCw3ICs5MDAsNyBAQCBzdGF0aWMgc3RydWN0IG52bWVtX2RldmljZSAqbXRkX290cF9u
dm1lbV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPj4gPiAgIAljb25maWcubmFtZSA9
IGNvbXBhdGlibGU7Cj4+ID4gICAJY29uZmlnLmlkID0gTlZNRU1fREVWSURfQVVUTzsKPj4gPiAg
IAljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsKPj4gPiAtCWNvbmZpZy5hZGRfbGVnYWN5X2Zp
eGVkX29mX2NlbGxzID0gdHJ1ZTsKPj4gPiArCWNvbmZpZy5hZGRfbGVnYWN5X2ZpeGVkX29mX2Nl
bGxzID0gIW10ZF90eXBlX2lzX25hbmQobXRkKTsKPj4gPiAgIAljb25maWcudHlwZSA9IE5WTUVN
X1RZUEVfT1RQOwo+PiA+ICAgCWNvbmZpZy5yb290X29ubHkgPSB0cnVlOwo+PiA+ICAgCWNvbmZp
Zy5pZ25vcmVfd3AgPSB0cnVlOwo+PiAKPj4gSSB0aGluayB0aGVyZSBtYXkgYmUgZXZlbiBtb3Jl
IHVud2FudGVkIGJlaGF2aW91ciBoZXJlLiBJZgo+PiBtdGRfb3RwX252bWVtX3JlZ2lzdGVyKCkg
ZmFpbHMgdG8gZmluZCBub2RlIHdpdGggInVzZXItb3RwIiAvCj4+ICJmYWN0b3J5LW90cCIgY29t
cGF0aWJsZSB0aGVuIGl0IHNldHMgImNvbmZpZy5vZl9ub2RlIiB0byBOVUxMIGJ1dCAKPj4gdGhh
dAo+PiBtZWFucyBOVk1FTSBjb3JlIHN0aWxsIGxvb2tzIGZvciBOVk1FTSBjZWxscyBpbiBkZXZp
Y2UncyAib2Zfbm9kZSIuCj4+IAo+PiBJIGJlbGlldmUgd2Ugc2hvdWxkIG5vdCBsb29rIGZvciBP
VFAgTlZNRU0gY2VsbHMgb3V0IG9mIHRoZSAidXNlci1vdHAiIAo+PiAvCj4+ICJmYWN0b3J5LW90
cCIgY29tcGF0aWJsZSBub2Rlcy4KPj4gCj4+IFNvIG1heWJlIHdoYXQgd2UgbmVlZCBpbiB0aGUg
Zmlyc3QgcGxhY2UgaXMganVzdDoKPj4gY29uZmlnLmFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMg
PSAhIW5wOwo+PiA/Cj4+IAo+PiBBbnkgZXh0cmEgbGltaXRhdGlvbiBvZiAuYWRkX2xlZ2FjeV9m
aXhlZF9vZl9jZWxscyBzaG91bGQgcHJvYmFibHkgYmUKPj4gdXNlZCBvbmx5IGlmIHdlIHdhbnQg
dG8gcHJldmVudCBuZXcgdXNlcnMgb2YgdGhlIGxlZ2FjeSBzeW50YXguIFRoZQo+PiBwcm9ibGVt
IGlzIHRoYXQgbXRkLnlhbWwgYmluZGluZyBhbGxvd2VkICJ1c2VyLW90cCIgYW5kICJmYWN0b3J5
LW90cCIKPj4gd2l0aCBvbGQgc3ludGF4IGNlbGxzLiBJdCBtZWFucyBldmVyeSBNVEQgZGV2aWNl
IHdhcyBhbGxvd2VkIHRvIGhhdmUKPj4gdGhlbS4KPj4gCj4+IE5vIGluLWtlcm5lbCBEVFMgZXZl
biB1c2VkICJ1c2VyLW90cCIgb3IgImZhY3Rvcnktb3RwIiB3aXRoIE5WTUVNIAo+PiBsZWdhY3kK
Pj4gY2VsbHMgYnV0IEknbSBub3Qgc3VyZSBhYm91dCBkb3duc3RyZWFtIERUUyBmaWxlcy4gSWRl
YWxseSB3ZSB3b3VsZCBkbwo+PiBjb25maWcuYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyA9IGZh
bHNlOwo+PiBidXQgdGhhdCBjb3VsZCBicmVhayBjb21wYXRpYmlsaXR5IHdpdGggc29tZSBkb3du
c3RyZWFtIERUUyBmaWxlcy4KPiAKPiBZZXMgdGhlIG1haW4gcHJvYmxlbSBpcyBwcmV2ZW50IHJl
Z3Jlc3Npb24gaW4gZG93bnN0cmVhbS4gSSBmZWVsIGZvciAKPiB0aGUKPiBuYW5kIHVzYWdlLCB0
aGlzIGlzIDEwMCUgb2YgdGhlIHRpbWVzIGJyb2tlbi4gRm9yIFNQSSBhbmQgb3RoZXIgY29ybmVy
Cj4gY2FzZSBNVEQgZGV2aWNlcyBpdCdzIG5vdD8KPiAKPiBBbnl3YXkgZGlkIHlvdSBieSBjaGFu
Y2UgaGF2ZSBhIHN1Z2dlc3Rpb24gZm9yIGEgYmV0dGVyIGZpeGVzIHRhZz8KCk15IHBlcnNvbmFs
IGlkZWEgZm9yIHRoYXQgd291bGQgYmUgdG8gcHV0IHR3byBGaXhlcyB3aXRoIHR3byBjb21taXRz
IGFuZApkZXNjcmliZSBpbiBjb21taXQgYm9keSB0aGF0IG9uZSBqdXN0IGV4cG9zZWQgZXhpc3Rp
bmcgYnVnLgoKWW91IG1heSBjaGVjayBteSBPcGVuV3J0IHF1aWNrIHBhdGNoIGZvciBhbiBpZGVh
IGhvdyBJJ2QgaGFuZGxlIHRoYXQ6Cmh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53cnQv
b3BlbndydC5naXQ7YT1ibG9iO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy02LjYvNDQw
LW10ZC1kb24tdC1sb29rLWZvci1PVFAtbGVnYWN5LU5WTUVNLWNlbGxzLWlmLXByb3Blci0ucGF0
Y2g7aD1kOWQxNWE0MDQ4YzE0NGQ4NTY1YzhlYTM4ZTE1YTc5ZjdmNGE1ZmUxO2hiPWRkNzhhNTlj
ZDdiMDI5NTYwYjMzY2IzYWMwZTFhYThiNzQ3YmQ4MDcKCi0tIApSYWZhxYIgTWnFgmVja2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
