Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C6CCD1AB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1T1ixigYFK2+M4kcRyZtH7zoCx4BySFmzgvyua4Xz4=; b=pGWw2FpxWrLGAr
	1yY7NXfkZyHP87fb8dsa40s2pifqdFhUjviK+8EB5nxvEIssE5Z5xyIdu+vJDSj4++aY1g4nrFYiv
	LrmGhPMXP6JdK0zPouJPgDdWWKnTl+7YwA94YI6YXUBQlQkOr8cJ9Pdql6ltPOJwJ9n7JNL2P/Zd2
	cCeplw2gb9d99cXit6N1hKt/+kRbKfTs34a/LlkCwLsZmglvQKXL42vzsNgl7pMJviCenmXAqsdrp
	BPNvWwNvHotIAr9To9SSK9idVlUqVQlH9mYvmcjYmQDmp1VsQDo5/uhwWZ/8Qxij/bt6vlx3TRb62
	abrbXEkjmQFLYJILisbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCbQ-00000008Zwi-2E0K;
	Fri, 24 Oct 2025 07:52:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCbM-00000008Zvr-1lR1;
	Fri, 24 Oct 2025 07:52:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A74191A1636;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B92960703;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73F97102F23EC;
	Fri, 24 Oct 2025 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761292360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5ORYaQDkijF7os/6QWengA8q7tbB0Mw5sGUM65DCgW0=;
	b=r2dtT+baNbNBquHdAut5IY/5GURVJRkMnkhCpDIazOsLkNOBMSg9a8XjqlTTdgK7Rao36n
	QaiSjjcspFfgNJ3lWHkqT0lB6CPk/z4eErWvmXrcgc4PoQNWlb8klJf19n9bMVLLEpz35m
	tvzSZMtU4MnmhRi/3KdQUuAwki+jH10HEA7wLi/+zYTZ9ENq3vj0XiN9CH8zDtJVXy40sO
	VYZdadazMXQP96iNzcQJcjalhcNTATvJNR92ni8Hp1LMi+PrPNeZfIQguK1X78P7mLfFu5
	LZKY22AT2zCcLdLyTJKs3XrYIcQky6Dow93q3vw3X8RN8f/4NfLEQGTudUQJ6w==
Message-ID: <afd40022-012a-4fa5-90f1-a27f11aa9549@bootlin.com>
Date: Fri, 24 Oct 2025 09:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask in
 sunxi_nfc_caps
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-8-richard.genoud@bootlin.com>
 <87jz0ntigx.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87jz0ntigx.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_005244_588929_C400448F 
X-CRM114-Status: GOOD (  13.34  )
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

SGksCkxlIDIyLzEwLzIwMjUgw6AgMTE6MDUsIE1pcXVlbCBSYXluYWwgYSDDqWNyaXTCoDoKPiBI
aSBSaWNoYXJkLAo+IAo+IE9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDMgKzAyLCBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+PiBUaGUgSDYvSDYx
NiBFQ0NfTU9ERSBmaWVsZCBpcyBub3QgYXQgdGhlIHNhbWUgb2Zmc2V0LCBhbmQgaGFzIG5vdCB0
aGUKPj4gc2FtZSBzaXplLgo+PiBTbyBtb3ZlIHRoZSBtYXNrIGludG8gc3VueGlfbmZjX2NhcHMu
Cj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDEzICsrKysrKysrKy0tLS0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvc3VueGlfbmFuZC5jCj4+IGluZGV4IDcwYzk0MDg0MGRkYS4uNDExODMwN2NhYzE1IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+IEBAIC0yOSw4ICsyOSw5IEBACj4+ICAg
I2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+
PiAgIAo+PiAtLyogbm9uIGNvbXBpbGUtdGltZSBmaWVsZCBnZXQgKi8KPj4gKy8qIG5vbiBjb21w
aWxlLXRpbWUgZmllbGQgZ2V0L3ByZXAgKi8KPj4gICAjZGVmaW5lIGZpZWxkX2dldChfbWFzaywg
X3JlZykgKCgoX3JlZykgJiAoX21hc2spKSA+PiAoZmZzKF9tYXNrKSAtIDEpKQo+PiArI2RlZmlu
ZSBmaWVsZF9wcmVwKF9tYXNrLCBfdmFsKSAoKChfdmFsKSA8PCAoZmZzKF9tYXNrKSAtIDEpKSAm
Cj4+IChfbWFzaykpCj4gCj4gVGhpcyBjb3VsZCBwcm9iYWJseSByZXF1aXJlIGEgbWVudGlvbiBp
biB0aGUgY29tbWl0IG1lc3NhZ2UsIGFzIGZvciB0aGUKPiBpbnRyb2R1Y3Rpb24gb2YgdGhlIGZp
ZWxkX2dldCgpIGhlbHBlci4KPiAKPiBObyBuZWVkIHRvIHJlc2VuZCBqdXN0IGZvciB0aGlzIGVp
dGhlci4KT2ssIHdpbGwgZG8uCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gClRoYW5rcyEKCi0t
IApSaWNoYXJkIEdlbm91ZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
