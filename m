Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3002EDE98F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pau9RgOdfTsgLrFoMqFZHJU5/4sIQIQ/3KsyJ0Cg9tw=; b=cKvfFQExRWFYNECTjYYTcNO4Lp
	1wpSBXur2uyysgEJkZHc4ljUiGy+zO5cVM8MxSLZtA8T2GB1uNA3NWwIEoyXXMynKLKjQpetiKRtk
	qfaT3Dr6Zb47G7m1ClIDOzEEGPjnvKmCI2Umv+fvT+4y5ny2p7Jn6N6O6g3JIxSeljNYnDvv1tDrD
	TcMjbPgrHUQfhq487sG66OUP2VCDgLxkoJ9NtT4v1H7D3mvNHL92pTscNn8wmNE+cA55OGlGz7fHA
	ey3VilBaSx3G8dbLydH9N8J3QltGbnzash57bi4i0YZjMEnklHDmICdd5HRmxJMgUrDKAzYKaoxe/
	OdNygw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghJd-007eHw-1Z;
	Thu, 14 Sep 2023 08:03:09 +0000
Received: from 14.mo561.mail-out.ovh.net ([188.165.43.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghJZ-007eER-1u
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:03:07 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.16.142])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id CCD0325DEB
	for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 08:02:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-hwfnb (unknown [10.110.115.90])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 45B251FEA2;
	Thu, 14 Sep 2023 08:02:47 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
	by ghost-submission-6684bf9d7b-hwfnb with ESMTPSA
	id o3rgISe+AmVUCAAA7wW1ag
	(envelope-from <rafal@milecki.pl>); Thu, 14 Sep 2023 08:02:47 +0000
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 10:02:47 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Florian
 Fainelli <florian.fainelli@broadcom.com>, Scott Branden
 <scott.branden@broadcom.com>
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
In-Reply-To: <3f175090-4c5f-4821-9155-06c4868d0489@arinc9.com>
References: <20230914064922.3986-1-zajec5@gmail.com>
 <3f175090-4c5f-4821-9155-06c4868d0489@arinc9.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d0545951a0e787792c5cc20eca66a72a@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 13702201867296680943
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudeiledguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgffhueeihfeitdettdehfefhieefffevkedvgeetteekteejtdeivddvhffgffffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudehuddrkedtrddvledrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_010305_796343_E8A541BF 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyMy0wOS0xNCAwOTo1NiwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPiBPbiAxNC4wOS4yMDIz
IDA5OjQ5LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8
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
PHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVGhpcyBpcyBhIGJ1ZyBmaXgsIGNvdWxkIHlvdSBhZGQg
YSAiRml4ZXMiIHRhZyBzbyBpdCB3aWxsIGJlIGJhY2twb3J0ZWQgCj4gdG8KPiBzdGFibGUgcmVs
ZWFzZXM/CgpJIHN1cHBvc2Ugd2UgY291bGQgdHJ5OgpGaXhlczogM2ZlZjllZDA2MjdhICgibnZt
ZW06IGJyY21fbnZyYW06IG5ldyBkcml2ZXIgZXhwb3NpbmcgQnJvYWRjb20ncyAKTlZSQU0iKQoK
U3Jpbmk6IGNhbiB5b3UgYXBwZW5kIGl0IHdoaWxlIGFwcGx5aW5nIGlmIHlvdSBmaW5kIGl0IE9L
PwoKLS0gClJhZmHFgiBNacWCZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
