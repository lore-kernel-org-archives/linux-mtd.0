Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351C2EE6425
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd6MsM/SV/rkLNmNngYlBo3ntzjxsATmsy3G+XgTDQM=; b=APlr2ofkn6Cr4ZywdFmQuhm2vB
	7JCUzRdgVHO+loEzKNFUos6XcY7I8TTqwVnjJm+/DyOdeFgoi+/JC8ASWrhskbO0+dzYdEQrCfZ03
	+M1FUBPiXbAEJ7OFnPNfaZjCxqUjuOzJ749dzh1ZIqgyOh0nvRn6s1F0x0+1g/qiGt4xMrXJqf2Hb
	EaFe+xd7RALCAW5bM41PA0h/Rf/7s6uHLpB32cboPQJOkJ+4/YJ3PvBskNnkr/sMaNObamGm01iqA
	d5HD0Xr3Vtie+9cRg2ijXyfrO2TF2WgnZVCiWiP5iqqiVABkeE1/WAg7KKFJB9MKdMR0C6sbBjlbz
	Jv5gGQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3DD-00A1oD-1C;
	Fri, 15 Sep 2023 07:25:59 +0000
Received: from 10.mo576.mail-out.ovh.net ([46.105.73.241])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3D9-00A1kn-0X
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 07:25:57 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.20.202])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id C32FD27DF5
	for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 07:25:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wk657 (unknown [10.110.208.116])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F6DE1FE5D;
	Fri, 15 Sep 2023 07:25:48 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
	by ghost-submission-6684bf9d7b-wk657 with ESMTPSA
	id f7YJF/wGBGUpJgAAKs0qSA
	(envelope-from <rafal@milecki.pl>); Fri, 15 Sep 2023 07:25:48 +0000
MIME-Version: 1.0
Date: Fri, 15 Sep 2023 09:25:48 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Scott Branden
 <scott.branden@broadcom.com>
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
In-Reply-To: <28fad55f-1253-deb2-9615-b32746129664@gmail.com>
References: <20230914064922.3986-1-zajec5@gmail.com>
 <28fad55f-1253-deb2-9615-b32746129664@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <58a017a92ee82f95972b0a14c604f313@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 503277259095976943
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudejuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgffhueeihfeitdettdehfefhieefffevkedvgeetteekteejtdeivddvhffgffffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudehuddrkedtrddvledrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002555_545248_4CA424CC 
X-CRM114-Status: GOOD (  10.56  )
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

T24gMjAyMy0wOS0xNCAyMzoyNiwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBPbiA5LzEzLzIz
IDIzOjQ5LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPj4gCj4+IFRoaXMgZHJpdmVyIHVzZXMgTU1JTyBhY2Nlc3MgZm9y
IHJlYWRpbmcgTlZSQU0gZnJvbSBhIGZsYXNoIGRldmljZS4KPj4gVW5kZXJuZWF0aCB0aGVyZSBp
cyBhIGZsYXNoIGNvbnRyb2xsZXIgdGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRlcwo+PiBtYXBw
aW5nIHdpbmRvdy4KPj4gCj4+IFVzaW5nIE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29udHJvbGxl
ciBjb25maWd1cmF0aW9uIGFuZCBtYXkgYnJlYWsgCj4+IHJlYWwKPj4gY29udHJvbGxlciBkcml2
ZXIuIEl0IHdhcyByZXBvcnRlZCBieSBtdWx0aXBsZSB1c2VycyBvZiBkZXZpY2VzIHdpdGgKPj4g
TlZSQU0gc3RvcmVkIG9uIE5BTkQuCj4+IAo+PiBNb2RpZnkgZHJpdmVyIHRvIHJlYWQgJiBjYWNo
ZSBhbGwgTlZSQU0gY29udGVudCBkdXJpbmcgaW5pdCBhbmQgdXNlIAo+PiB0aGF0Cj4+IGNvcHkg
dG8gcHJvdmlkZSBOVk1FTSBkYXRhIHdoZW4gcmVxdWVzdGVkLgo+PiAKPj4gTGluazogCj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC9DQUNuYTZyd2YzXzlRVmpZY00rODQ3YmlU
WD1LMEVvV1h1WGNTTWtKTzFWeV81dm1WcUFAbWFpbC5nbWFpbC5jb20vCj4+IENjOiBBcsSxbsOn
IMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxm
bG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KPj4gQ2M6IFNjb3R0IEJyYW5kZW4gPHNjb3R0
LmJyYW5kZW5AYnJvYWRjb20uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4+IC0tLQo+IFtzbmlwXQo+PiAtCXByaXYtPmJhc2UgPSBkZXZt
X3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwLCAmcmVzKTsKPj4gLQlp
ZiAoSVNfRVJSKHByaXYtPmJhc2UpKQo+PiAtCQlyZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsK
Pj4gKwliYXNlID0gZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCwgJnJlcyk7Cj4+ICsJaWYgKElTX0VSUihiYXNlKSkKPj4gKwkJcmV0dXJuIFBUUl9FUlIoYmFz
ZSk7Cj4+ICsKPj4gKwlwcml2LT5zaXplID0gcmVzb3VyY2Vfc2l6ZShyZXMpOwo+PiArCj4+ICsJ
cHJpdi0+ZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHByaXYtPnNpemUsIEdGUF9LRVJORUwpOwo+
IAo+IFRoZXNlIGNhbiBjb25jZWl2YWJseSBxdWl0ZSBiaWcgZGF0YSBzdHJ1Y3R1cmVzLCBob3cg
YWJvdXQgdXNpbmcgCj4ga3ZtYWxsb2MoKT8KCkdvb2QgaWRlYS4KCkFjdHVhbCBOVlJBTSBkYXRh
IHVzdWFsbHkgZG9lc24ndCB0YWtlIG11Y2ggc3BhY2UsIGJ1dCBpdCByZXNlcnZlcyBxdWl0ZSAK
YSBsb3QgYW5kIHdlIG5lZWQgYWxsIG9mIHRoYXQgdG8gZnVsbCBleHBvc2UgTlZNRU0gZGV2aWNl
IGNvbnRlbnQuCgotLSAKUmFmYcWCIE1pxYJlY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
