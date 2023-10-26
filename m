Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E8C25B6B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECxAIIJ9mqIoSjiHGxzMMLcrQBKc/eTATkyLe0S5x2M=; b=txeBtHzRyJgz61
	KePZhyU0G21qRU7EU+1w/9L0x53Rxn5/XjN+Z433QPBo7tT15eZSiDpFnB/JqQ+zyP/6QBotIAgMb
	GX8A9jY3Cz+D6jIdGcmbh59CJva0qXN03Ml0Mtg8dIt44whkpP8BDL71A2iRH1HHh+vkl4plE5Bh1
	TxF8PxGJnbsEt24lUtD5vYf828p2SIScyk2PrMf07yqYNMGy5xQilndbCL7COKV3eab+itUhUnGRO
	h1tEzJd9FwRqXFKwJMu52Dod3NLPEtys08JzOz4oq9hlUf8vAXwjP8QI9/6Xorb6yEDjqw1O4QKjK
	7SH+2tT/Zt1veI4nZjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvDu-00DtjN-0y;
	Thu, 26 Oct 2023 07:56:10 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvDp-00DthP-0Z;
	Thu, 26 Oct 2023 07:56:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A71D860006;
	Thu, 26 Oct 2023 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1698306958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxdBcXYIBUZTorVYhg4RJds1Bjahgba7qpcJmqDPZ8A=;
	b=oDvA/UVmwTewFWFQ48H2EEQ63KtqCG30kyXD/k+4mepHQCZVcJVXw2Dj751L8dclIxHUng
	b1comh2Pm6UwoMStCosj6JfWVfIFnrLaWT7tF7A9uTRwKZGdd/RnIpj6TlXjW0NN7jHQCo
	TbJ7leKf6kvQ2yMi7DI4CEyns7v8jJBzCf/D/92iRJvqFqUKSSpFermZ/2Rewql/yIj20x
	JQKBNs8aQfgi1BUKV39Lm2SPxHlHLqOQqIsy+tWW7eJth/YtPMwsphW5b1VG3ojWpf3rmu
	zR1RKuwqH5DFexvmXbv5TaIlP3BpcuymmkCJDdrlX7aF74lbOBC8tyCtYMKh1w==
Message-ID: <2a91cc9a-98ac-4751-9bdb-56d8d91c1a86@arinc9.com>
Date: Thu, 26 Oct 2023 10:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] nvmem: brcm_nvram: store a copy of NVRAM content
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>
References: <20231026073440.6724-1-zajec5@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231026073440.6724-1-zajec5@gmail.com>
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_005605_409219_07B5B496 
X-CRM114-Status: UNSURE (   8.34  )
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

T24gMjYuMTAuMjAyMyAxMDozNCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGRyaXZlciB1c2VzIE1NSU8g
YWNjZXNzIGZvciByZWFkaW5nIE5WUkFNIGZyb20gYSBmbGFzaCBkZXZpY2UuCj4gVW5kZXJuZWF0
aCB0aGVyZSBpcyBhIGZsYXNoIGNvbnRyb2xsZXIgdGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRl
cwo+IG1hcHBpbmcgd2luZG93Lgo+IAo+IFVzaW5nIE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29u
dHJvbGxlciBjb25maWd1cmF0aW9uIGFuZCBtYXkgYnJlYWsgcmVhbAo+IGNvbnRyb2xsZXIgZHJp
dmVyLiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVsdGlwbGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCj4g
TlZSQU0gc3RvcmVkIG9uIE5BTkQuCj4gCj4gTW9kaWZ5IGRyaXZlciB0byByZWFkICYgY2FjaGUg
TlZSQU0gY29udGVudCBkdXJpbmcgaW5pdCBhbmQgdXNlIHRoYXQKPiBjb3B5IHRvIHByb3ZpZGUg
TlZNRU0gZGF0YSB3aGVuIHJlcXVlc3RlZC4gT24gTkFORCBmbGFzaGVzIGR1ZSB0byB0aGVpcgo+
IGFsaWdubWVudCBOVlJBTSBwYXJ0aXRpb25zIGNhbiBiZSBxdWl0ZSBiaWcgKDEgTWlCIGFuZCBt
b3JlKSB3aGlsZQo+IGFjdHVhbCBOVlJBTSBjb250ZW50IHN0YXlzIHF1aXRlIHNtYWxsICh1c3Vh
bGx5IDE2IHRvIDMyIEtpQikuIFRvIGF2b2lkCj4gYWxsb2NhdGluZyBzbyBtdWNoIG1lbW9yeSBj
aGVjayBmb3IgYWN0dWFsIGRhdGEgbGVuZ3RoLgo+IAo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC9DQUNuYTZyd2YzXzlRVmpZY00rODQ3YmlUWD1LMEVvV1h1WGNTTWtK
TzFWeV81dm1WcUFAbWFpbC5nbWFpbC5jb20vCj4gRml4ZXM6IDNmZWY5ZWQwNjI3YSAoIm52bWVt
OiBicmNtX252cmFtOiBuZXcgZHJpdmVyIGV4cG9zaW5nIEJyb2FkY29tJ3MgTlZSQU0iKQo+IENj
OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4gQ2M6IEZsb3JpYW4gRmFp
bmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPgo+IENjOiBTY290dCBCcmFuZGVu
IDxzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+CgpBY2tlZC1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMu
dW5hbEBhcmluYzkuY29tPgoKQXLEsW7DpwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
