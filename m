Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A6CCD187
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Oct 2025 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npPHeJ1e5fTZ0HdguY6rBGVputp0vFaFnw3QGwNoU1U=; b=F44gEk5FpuUzEU
	86QB7y3jYLwq8d9k2nq3BY0zTX7HTyFmRxHpgbNOgs4ShDwHN+Hmh/3VcSdcHir6wVphKovuHtmZN
	fsEY7PH/q5F2cL60rEnSLLC0gUxcstpCG82ctqtLx38NDZIUYCAbImHLFmVRmOumW0JP2pWqrA/Qs
	K3YbEc4/Qwr2N0btIVWU6e3bCo/LD4Q5PKBFe20zjRA4H1YdBsVb7ETio0BFiRmPDt95gl+CEOVws
	PIihrItn2ApPbr7p0K2q5ZDGS8t5CDSNXhFf8nYumqDrUbU34IVkkKrN9bgMM0MOWFgpcuZmxIO4P
	gGbW1JO3dnskloYY5ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZEV-0000000FPYK-2CyB;
	Tue, 14 Oct 2025 07:14:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZES-0000000FPUC-08b3
	for linux-mtd@lists.infradead.org;
	Tue, 14 Oct 2025 07:14:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3977B4E41080;
	Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09945606EC;
	Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B48C7102F224B;
	Tue, 14 Oct 2025 09:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760426038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1rQPGkIVi3ODkc5CC6srqTaTWUcBBf3OLgjQBFg0e8Q=;
	b=ZZvdEf6IsnbwHKU53mCP/OJVvqaMjPPYJ6LVInAyhJAnoY5WHLT0aiiBaULt3scVtTDLfT
	MrlZ2yAeFbtlptpU58fw1BkWZsNgWzGhTJ53QT8KpCGw2yl/YYNSD3Q3ufDZmne+1ywRl5
	+7gNdp6rf94tvaKq84k92Xn+G5h3/XhB46xtaTO8T9w0Ln60XmksgF7Zne+VIN0SHmaltX
	Lm1J8uJKhiwBAJqKn7WReaj1cst9KJkCySbLwSdL0TEiEPXatY3WzkjuFpipKViGtJ+T1E
	NAcTO+x1RMvIk/TYApPpC2NoR5ozDBKtwvAZuoI/B9y6QBNHphj6Q6YLHYrMmQ==
Message-ID: <72d9b0f3-da27-4e30-b07b-d85be23b1407@bootlin.com>
Date: Tue, 14 Oct 2025 09:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-15-richard.genoud@bootlin.com>
 <20251013-parrot-sandpaper-4e31d2d1a6b3@spud>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20251013-parrot-sandpaper-4e31d2d1a6b3@spud>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_001404_378406_000EBD22 
X-CRM114-Status: GOOD (  14.78  )
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

TGUgMTMvMTAvMjAyNSDDoCAyMTo0NCwgQ29ub3IgRG9vbGV5IGEgw6ljcml0wqA6Cj4gT24gTW9u
LCBPY3QgMTMsIDIwMjUgYXQgMDU6MjY6NDRQTSArMDIwMCwgUmljaGFyZCBHZW5vdWQgd3JvdGU6
Cj4+IFRoZSBINjE2IE5BTkQgY29udHJvbGxlciBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUg
QTEwIGFuZCBBMjMgb25lcywKPj4gc29tZSByZWdpc3RlcnMgb2Zmc2V0IGNoYW5nZWQsIGFuZCBz
b21lIG5ldyBvbmUgYXJlIGludHJvZHVjZWQuCj4+IEFsc28sIHRoZSBETUEgaGFuZGxpbmcgaXMg
ZGlmZmVyZW50IChpdCB1c2VzIGNoYWluZWQgZGVzY3JpcHRvcnMpCj4+Cj4+IFNvLCBpbnRyb2R1
Y2UgYSBuZXcgY29tcGF0aWJsZSB0byByZXByZXNlbnQgdGhpcyB2ZXJzaW9uIG9mIHRoZSBJUC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3Rs
aW4uY29tPgo+PiAtLS0KPj4gICAuLi4vbXRkL2FsbHdpbm5lcixzdW40aS1hMTAtbmFuZC55YW1s
ICAgICAgICAgfCA1NyArKysrKysrKysrKysrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FsbHdpbm5lcixzdW40aS1hMTAtbmFuZC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbGx3aW5uZXIsc3Vu
NGktYTEwLW5hbmQueWFtbAo+PiBpbmRleCAwNTRiNmI4YmY5YjkuLjRiODJkZTlmYWUxNyAxMDA2
NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbGx3aW5u
ZXIsc3VuNGktYTEwLW5hbmQueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2FsbHdpbm5lcixzdW40aS1hMTAtbmFuZC55YW1sCj4+IEBAIC02LDkgKzYs
NiBAQCAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPj4gICAKPj4gICB0aXRsZTogQWxsd2lubmVyIEExMCBOQU5EIENvbnRyb2xsZXIKPj4gICAK
Pj4gLWFsbE9mOgo+PiAtICAtICRyZWY6IG5hbmQtY29udHJvbGxlci55YW1sCj4+IC0KPj4gICBt
YWludGFpbmVyczoKPj4gICAgIC0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+PiAgICAg
LSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4+IEBAIC0xOCw2ICsxNSw4IEBA
IHByb3BlcnRpZXM6Cj4+ICAgICAgIGVudW06Cj4+ICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNGkt
YTEwLW5hbmQKPj4gICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1hMjMtbmFuZC1jb250cm9sbGVy
Cj4+ICsgICAgICAtIGFsbHdpbm5lcixzdW41MGktaDYxNi1uYW5kLWNvbnRyb2xsZXIKPj4gKwo+
PiAgICAgcmVnOgo+PiAgICAgICBtYXhJdGVtczogMQo+PiAgIAo+PiBAQCAtMjUsMTQgKzI0LDEy
IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgIG1heEl0ZW1zOiAxCj4+ICAgCj4+ICAgICBjbG9ja3M6
Cj4+IC0gICAgaXRlbXM6Cj4+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBCdXMgQ2xvY2sKPj4gLSAg
ICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jawo+PiArICAgIG1pbkl0ZW1zOiAyCj4+ICsg
ICAgbWF4SXRlbXM6IDQKPj4gICAKPj4gICAgIGNsb2NrLW5hbWVzOgo+PiAtICAgIGl0ZW1zOgo+
PiAtICAgICAgLSBjb25zdDogYWhiCj4+IC0gICAgICAtIGNvbnN0OiBtb2QKPj4gKyAgICBtaW5J
dGVtczogMgo+PiArICAgIG1heEl0ZW1zOiA0Cj4gCj4gVGhlIGNsb2NrIGRlc2NyaXB0aW9ucyBh
bmQgbmFtZXMgc2hvdWxkIHJlbWFpbiBvdXQgaGVyZSwgd2l0aCB5b3VyIG5ldwo+IG1pbi9tYXgg
Y29uc3RyYWludHMsIHNpbmNlIHRoZXkncmUgaWRlbnRpY2FsIGF0IGluZGljZXMgMCBhbmQgMSB0
byBmb3IKPiBib3RoIHR5cGVzIG9mIGRldmljZS4gVGhlIGlmL3RoZW4gc2hvdWxkIG9ubHkgc2V0
IHRoZSBtaW4gdG8gNCBmb3IgdGhlCj4gbmV3IGRldmljZSBhbmQgdGhlIG1heCB0byAyIGZvciB0
aGUgZXhpc3Rpbmcgb25lcy4KCkluZGVlZC4KClRoYW5rcyEKCj4gCj4gQ2hlZXJzLAo+IENvbm9y
Lgo+IAo+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKPiAKPj4gICAKPj4gICAgIHJlc2V0czoK
Pj4gICAgICAgbWF4SXRlbXM6IDEKPj4gQEAgLTg1LDYgKzgyLDQ4IEBAIHJlcXVpcmVkOgo+PiAg
IAo+PiAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4gICAKPj4gK2FsbE9mOgo+PiAr
ICAtICRyZWY6IG5hbmQtY29udHJvbGxlci55YW1sCj4+ICsKPj4gKyAgLSBpZjoKPj4gKyAgICAg
IHByb3BlcnRpZXM6Cj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+ICsgICAgICAgICAgY29udGFp
bnM6Cj4+ICsgICAgICAgICAgICBlbnVtOgo+PiArICAgICAgICAgICAgICAtIGFsbHdpbm5lcixz
dW40aS1hMTAtbmFuZAo+PiArICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1hMjMtbmFu
ZC1jb250cm9sbGVyCj4+ICsgICAgdGhlbjoKPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAg
ICAgIGNsb2NrczoKPj4gKyAgICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAgIC0gZGVzY3Jp
cHRpb246IEJ1cyBDbG9jawo+PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogTW9kdWxlIENs
b2NrCj4+ICsgICAgICAgIGNsb2NrLW5hbWVzOgo+PiArICAgICAgICAgIGl0ZW1zOgo+PiArICAg
ICAgICAgICAgLSBjb25zdDogYWhiCj4+ICsgICAgICAgICAgICAtIGNvbnN0OiBtb2QKPj4gKwo+
PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgY29tcGF0aWJsZToK
Pj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgIGVudW06Cj4+ICsgICAgICAg
ICAgICAgIC0gYWxsd2lubmVyLHN1bjUwaS1oNjE2LW5hbmQtY29udHJvbGxlcgo+PiArICAgIHRo
ZW46Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjbG9ja3M6Cj4+ICsgICAgICAg
ICAgaXRlbXM6Cj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBCdXMgQ2xvY2sKPj4gKyAg
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jawo+PiArICAgICAgICAgICAgLSBk
ZXNjcmlwdGlvbjogRUNDIENsb2NrCj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBNQnVz
IENsb2NrCj4+ICsgICAgICAgIGNsb2NrLW5hbWVzOgo+PiArICAgICAgICAgIGl0ZW1zOgo+PiAr
ICAgICAgICAgICAgLSBjb25zdDogYWhiCj4+ICsgICAgICAgICAgICAtIGNvbnN0OiBtb2QKPj4g
KyAgICAgICAgICAgIC0gY29uc3Q6IGVjYwo+PiArICAgICAgICAgICAgLSBjb25zdDogbWJ1cwo+
PiArCj4+ICAgZXhhbXBsZXM6Cj4+ICAgICAtIHwKPj4gICAgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KCgotLSAKUmljaGFyZCBHZW5vdWQs
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
