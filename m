Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ED4C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CebdrzgTfSo6Q5ImO0yw3z2/HWR5x6un0jOlavriBtQ=; b=pjXXrmZc0/0+ripnl17btiRGYP
	GeD5JTUztB/Frx0YN7XLCp4ENbqXdydjz03mpW1lZrLJ019IP4Vs/cpPWqLuORAgGXtMhF5mANraV
	F0RQqYddhRpLV6nlII/1oZC0DEtD2w57Lryj51BRx8dcJDAddsGjZIhXqgi+9AQjMTniEm6iIls1b
	/ZUigHGYwBHW1Sg0TArrj31iu8XC5ObJxtjfXE6Iuz2JqlBpL4VR6EUXbM+KZCksSBGNZrEApnyAj
	5/9mGrRUb52WF8svHTjs5pwMBwDG+RCLjd9B+vs2lCjxBlXRCHR2kIl0xsCczzcFxK8ySK8zkwMHv
	+cYZ1J3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYz0-00FUKK-07;
	Fri, 08 Dec 2023 11:25:26 +0000
Received: from 7.mo560.mail-out.ovh.net ([188.165.48.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYyv-00FUHN-1h
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 11:25:23 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.138.205])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id B18372B796
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 11:25:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7kq9l (unknown [10.110.171.110])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1973A1FE8D;
	Fri,  8 Dec 2023 11:25:08 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
	by ghost-submission-6684bf9d7b-7kq9l with ESMTPSA
	id hpf6AxT9cmXqjQAAh0gf5A
	(envelope-from <rafal@milecki.pl>); Fri, 08 Dec 2023 11:25:08 +0000
MIME-Version: 1.0
Date: Fri, 08 Dec 2023 12:25:07 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH V3] nvmem: brcm_nvram: store a copy of NVRAM content
In-Reply-To: <29d2f463-90c2-4c96-8828-96806679db8e@linaro.org>
References: <20231102062848.23965-1-zajec5@gmail.com>
 <29d2f463-90c2-4c96-8828-96806679db8e@linaro.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <7cb70a8ead5f6b74f0a287ac8832873c@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 18236200791980485615
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudekiedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpefghfeuiefhiedttedtheefhfeifeffveekvdegteetkeetjedtiedvvdfhgfffffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_032521_734511_1C91B0DF 
X-CRM114-Status: GOOD (  10.75  )
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

T24gMjAyMy0xMi0wOCAxMjoxNSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaCwKPiAKPiBPbiAwMi8xMS8yMDIzIDA2OjI4LCBSYWZhxYIgTWnFgmVj
a2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4g
Cj4+IFRoaXMgZHJpdmVyIHVzZXMgTU1JTyBhY2Nlc3MgZm9yIHJlYWRpbmcgTlZSQU0gZnJvbSBh
IGZsYXNoIGRldmljZS4KPj4gVW5kZXJuZWF0aCB0aGVyZSBpcyBhIGZsYXNoIGNvbnRyb2xsZXIg
dGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRlcwo+PiBtYXBwaW5nIHdpbmRvdy4KPj4gCj4+IFVz
aW5nIE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29udHJvbGxlciBjb25maWd1cmF0aW9uIGFuZCBt
YXkgYnJlYWsgCj4+IHJlYWwKPj4gY29udHJvbGxlciBkcml2ZXIuIEl0IHdhcyByZXBvcnRlZCBi
eSBtdWx0aXBsZSB1c2VycyBvZiBkZXZpY2VzIHdpdGgKPj4gTlZSQU0gc3RvcmVkIG9uIE5BTkQu
Cj4+IAo+PiBNb2RpZnkgZHJpdmVyIHRvIHJlYWQgJiBjYWNoZSBOVlJBTSBjb250ZW50IGR1cmlu
ZyBpbml0IGFuZCB1c2UgdGhhdAo+PiBjb3B5IHRvIHByb3ZpZGUgTlZNRU0gZGF0YSB3aGVuIHJl
cXVlc3RlZC4gT24gTkFORCBmbGFzaGVzIGR1ZSB0byAKPj4gdGhlaXIKPj4gYWxpZ25tZW50IE5W
UkFNIHBhcnRpdGlvbnMgY2FuIGJlIHF1aXRlIGJpZyAoMSBNaUIgYW5kIG1vcmUpIHdoaWxlCj4+
IGFjdHVhbCBOVlJBTSBjb250ZW50IHN0YXlzIHF1aXRlIHNtYWxsICh1c3VhbGx5IDE2IHRvIDMy
IEtpQikuIFRvIAo+PiBhdm9pZAo+PiBhbGxvY2F0aW5nIHNvIG11Y2ggbWVtb3J5IGNoZWNrIGZv
ciBhY3R1YWwgZGF0YSBsZW5ndGguCj4+IAo+PiBMaW5rOiAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkL0NBQ25hNnJ3ZjNfOVFWalljTSs4NDdiaVRYPUswRW9XWHVYY1NNa0pP
MVZ5XzV2bVZxQUBtYWlsLmdtYWlsLmNvbS8KPj4gRml4ZXM6IDNmZWY5ZWQwNjI3YSAoIm52bWVt
OiBicmNtX252cmFtOiBuZXcgZHJpdmVyIGV4cG9zaW5nIAo+PiBCcm9hZGNvbSdzIE5WUkFNIikK
PiAKPiBBbnkgcmVhc29uIG5vdCB0byBhZGQKPiBDYzogPFN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
Cj4gPwoKTm90IHJlYWxseS4gSSBiZWxpZXZlIHN0YWJsZSB0ZWFtIHdvdWxkIHBpY2sgdGhpcyBm
aXggYW55d2F5ICh0aGFua3MgdG8KdGhlIEZpeGVzOikgYnV0IGRvaW5nCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCmlzIGRlc2NyaWJlZCBhcyBzdHJvbmdseSBwcmVmZXJyZWQuCgpEbyB5b3Ug
dGhpbmsgeW91IGNhbiBqdXN0IGFtbWVuZCBteSBwYXRjaCB3aGlsZSBhcHBseWluZyBpdCBhbmQg
YWRkCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCnRvIGl0PwoKLS0gClJhZmHFgiBNacWCZWNr
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
