Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2E1C30653
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSHq4I5pnArv5LwN/FowrkNblgiKDHbqq2KJIDOt9Z0=; b=Zx/SicsFZ2/tGy
	jtV6dmRgV+wyFxxEXsxcb1crWTk+fjM+OD76kW7RGL3QY1yow1IBkjc6anekoRoDXj1fbBhlbo3BD
	Fl+Whr2Zimiqn4ySrwBMSUft22R0sMhxrVOathRGBGKbwHm8f7lXzMRxlSnDj0Ho2Lb5yICnWaQEq
	QcZ1Krdp9qBHn4J0vr6sjVhnI9Z/kug5oeJDPaZXTjZ13wxhybCFiS0Zq310+oSIJrJEvSJ6d14wm
	SX6WpO7FV7nuuIvL/FxQ+p+O054MfVFs7kOFzF8PskQThv1pSyVlkvD0kiEWBwqbI1aVgmI0dThEw
	qd2mz2TC091mRYvHSjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQMTK-00000001UcT-16UB;
	Sun, 07 Jul 2024 07:38:10 +0000
Received: from 9.mo575.mail-out.ovh.net ([46.105.78.111])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQMTG-00000001Ubc-31gJ
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 07:38:09 +0000
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.140.194])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4WGzcf0Hf7z1RTP
	for <linux-mtd@lists.infradead.org>; Sun,  7 Jul 2024 07:37:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7hjjw (unknown [10.110.113.129])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 592ED1FE1E;
	Sun,  7 Jul 2024 07:37:51 +0000 (UTC)
Received: from milecki.pl ([37.59.142.108])
	by ghost-submission-6684bf9d7b-7hjjw with ESMTPSA
	id 1GHDEc9Fimb2UQoARsdD+Q
	(envelope-from <rafal@milecki.pl>); Sun, 07 Jul 2024 07:37:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00297993a4f-17e4-4353-9d0d-40a5a04800ad,
                    9FB31564A4F31A61F7AB0932BCD271886B876CF9) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 31.11.218.106
Message-ID: <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
Date: Sun, 7 Jul 2024 09:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM linux-next]
To: Mirsad Todorovac <mtodorovac69@gmail.com>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <47e0483d-6e3d-43a8-9273-25278a4a74b9@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <47e0483d-6e3d-43a8-9273-25278a4a74b9@gmail.com>
X-Ovh-Tracer-Id: 5030802259375991588
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeggdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeetteefjeejgefhieekveelveekhedtgefhgfdutdehhffggfevudehteevjeeuteenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_003807_216410_EC1B60CD 
X-CRM114-Status: GOOD (  13.06  )
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

U29tZSBtb3JlIGRlc2NyaXB0aXZlIHN1YmplY3Qgd291bGQgYmUgbmljZSA6KQoKCk9uIDcuMDcu
MjAyNCAwMjoxMCwgTWlyc2FkIFRvZG9yb3ZhYyB3cm90ZToKPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi9pbmNsdWRlL2FzbS1nZW5lcmljL2J1Zy5oOjIyLAo+ICAgICAgICAgICAgICAgICAgIGZy
b20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9idWcuaDo4NywKPiAgICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9idWcuaDo1LAo+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9p
bmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6NiwKPiAgICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDozNzQsCj4gICAgICAgICAgICAgICAgICAgZnJvbSAu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2VfMzIuaDoxOCwKPiAgICAgICAgICAgICAgICAgICBm
cm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZS5oOjE0LAo+ICAgICAgICAgICAgICAgICAg
IGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDoyMCwKPiAgICAgICAgICAg
ICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vdGltZXguaDo1LAo+ICAgICAgICAg
ICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3RpbWV4Lmg6NjcsCj4gICAgICAgICAgICAg
ICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdGltZTMyLmg6MTMsCj4gICAgICAgICAgICAgICAg
ICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdGltZS5oOjYwLAo+ICAgICAgICAgICAgICAgICAgIGZy
b20gLi9pbmNsdWRlL2xpbnV4L3N0YXQuaDoxOSwKPiAgICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC9tb2R1bGUuaDoxMywKPiAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZl
cnMvbXRkL210ZHBhcnQuYzoxMDoKPiBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6IEluIGZ1bmN0aW9u
IOKAmHBhcnNlX210ZF9wYXJ0aXRpb25z4oCZOgo+IGRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6
MzQ6IGVycm9yOiDigJglc+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1m
b3JtYXQtb3ZlcmZsb3c9XQo+ICAgIDY5MyB8ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2Rl
YnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFzdGVyLT5uYW1lLAo+ICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5j
bHVkZS9saW51eC9wcmludGsuaDozNzY6MjE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g
4oCYcHJfZm104oCZCj4gICAgMzc2IHwgI2RlZmluZSBwcl9mbXQoZm10KSBmbXQKPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgIF5+fgo+IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVn
Lmg6MjQ4Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2R5bmFtaWNfZnVuY19j
YWxsX2Nsc+KAmQo+ICAgIDI0OCB8ICAgICAgICAgX19keW5hbWljX2Z1bmNfY2FsbF9jbHMoX19V
TklRVUVfSUQoZGRlYnVnKSwgY2xzLCBmbXQsIGZ1bmMsICMjX19WQV9BUkdTX18pCj4gICAgICAg
IHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9keW5h
bWljX2RlYnVnLmg6MjUwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfZHluYW1p
Y19mdW5jX2NhbGxfY2xz4oCZCj4gICAgMjUwIHwgICAgICAgICBfZHluYW1pY19mdW5jX2NhbGxf
Y2xzKF9EUFJJTlRLX0NMQVNTX0RGTFQsIGZtdCwgZnVuYywgIyNfX1ZBX0FSR1NfXykKPiAgICAg
ICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAuL2luY2x1ZGUvbGludXgvZHlu
YW1pY19kZWJ1Zy5oOjI2OTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX2R5bmFt
aWNfZnVuY19jYWxs4oCZCj4gICAgMjY5IHwgICAgICAgICBfZHluYW1pY19mdW5jX2NhbGwoZm10
LCBfX2R5bmFtaWNfcHJfZGVidWcsICAgICAgICAgICAgIFwKPiAgICAgICAgfCAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9wcmludGsuaDo2MTA6OTogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGR5bmFtaWNfcHJfZGVidWfigJkKPiAgICA2MTAgfCAg
ICAgICAgIGR5bmFtaWNfcHJfZGVidWcoZm10LCAjI19fVkFfQVJHU19fKQo+ICAgICAgICB8ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6MjU6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhwcl9kZWJ1Z+KAmQo+ICAgIDY5MyB8ICAgICAg
ICAgICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFzdGVy
LT5uYW1lLAo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gZHJp
dmVycy9tdGQvbXRkcGFydC5jOjY5Mzo1MDogbm90ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVk
IGhlcmUKPiAgICA2OTMgfCAgICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXM6IGdv
dCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKPiAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiAKPiBPZmZlbmRpbmcgY29tbWl0
IGlzIDViNjQ0YWEwMTJmNjcuCgpBY3R1YWxseSBpdCBnb2VzIGJhY2sgdG8gMjAxNSB0byB0aGUg
Y29tbWl0IDhlMmM5OTJiNTlmYyAoIm10ZDogbXRkcGFydDogYWRkIGRlYnVnIHByaW50cyB0byBw
YXJ0aXRpb24gcGFyc2VyLiIpLgoKCj4gUHJvcG9zZWQgbm9uLWludHJ1c2l2ZSBmaXggcmVzb2x2
ZXMgdGhlIHdhcm5pbmcvZXJyb3IsIGJ1dCBJIGNvdWxkIG5vdCB0ZXN0IHRoZSBjb2RlLgo+IChJ
IGRvbid0IGhhdmUgdGhlIHBoeXNpY2FsIGRldmljZS4pCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0+
PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiBpbmRleCA2
ODExYTcxNDM0OWQuLjgxNjY1ZDY3ZWQyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRw
YXJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiBAQCAtNjkxLDcgKzY5MSw3IEBA
IGludCBwYXJzZV9tdGRfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwgY29uc3Qg
Y2hhciAqY29uc3QgKnR5cGVzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXBhcnNl
ciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXJzZXIgPSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFz
dGVyLT5uYW1lLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyc2VyID8gcGFy
c2VyLT5uYW1lIDogTlVMTCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJz
ZXIgPyBwYXJzZXItPm5hbWUgOiAiKG51bGwiKSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGlmICghcGFyc2VyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBtdGRfcGFydF9kb19wYXJzZShwYXJz
ZXIsIG1hc3RlciwgJnBwYXJ0cywgZGF0YSk7Cj4gCj4gCj4gSG9wZSB0aGlzIGhlbHBzLgoKSSdk
IHNheSBpdCdzIHNpbXBsZSBlbm91Z2ggdG8gc2VuZCBwYXRjaCB3aXRob3V0IGFjdHVhbCBodyB0
ZXN0aW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
