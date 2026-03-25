Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903A109C022
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53avlj3X+k3DzEX4dLlW0Duh9aUiCCRrEE+6X8rSuZA=; b=b+adQUJj1xZoHn
	WwrXMlaNDcfs6Ii/ltY1Sibu2mZf21/Y4maJJuaedv86iRRpjJuCgJtTCvrb/Xecu7DlZsL8kSDZV
	aUaYDXT0TTQVkRLk+VTiFfgrImNti3RiHlcEruTcBbaSv38+qh31x720SBMiMXyd1x1UXuFDamONE
	76vBZbkFCs30UyA/Sy9UpU8/5xwkiEd4pcRDcSds0lZDcZAJ5BWddfPjRuSPZ6dDgYdnjP06TNp4F
	JSr0wGOahTPYMobeIORzNJX5JUNO/i8t+R3wvZh6rbemAzFU7AXI/vAtR2JGHbB3hj1TBk//x5MV3
	awG0NDtCZr1KuHSQkv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PFB-00000003bkN-27wR;
	Wed, 25 Mar 2026 14:30:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEx-00000003ban-1FEq;
	Wed, 25 Mar 2026 14:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=; b=pj3my3dL59asVzvJvYX5gd18Yj
	Ea3TooXTGS0CQWRxt2LiqsNSp82XQ1xDztF+xf93nwm20gKc91vAXS6hBYnzoHBQrbQLl8JNRrzGH
	wlvRQfntMjP0sRILKbnOAgs9RTzJ6h4XfNPQ3XwDvtUqETaSBaZaAMn6rA7aAzxdca1NEQDYalanz
	j5LM2UalItgrfmVYxz+bgJAYuQ1DzEJvH/5xr7dshrY5pARrugYigfIM9g92PDdvkVUdWnmp1LPPD
	JhwHFOrsdNw19FhTsIjgfbjgi7XsKKGEKStOF71SfBQGWfEjnb4q4rfcMvTvB69IxaPb89h9aUCvZ
	OCLxwaKw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEu-00000006M3K-2Tca;
	Wed, 25 Mar 2026 14:29:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B6E54E427EE;
	Wed, 25 Mar 2026 14:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D46F6601E2;
	Wed, 25 Mar 2026 14:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4554710451A66;
	Wed, 25 Mar 2026 15:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=;
	b=wvY+FFqzTiSwisTGKrRXWR0jYFs+09psrFJeQhfguL6DicvtQD/tIi+253WAOY/Jg71+Xx
	/kTLUL+DNTj3+l1c56KNVVd5mACd370FJXIgAxZglP72fyTaCxYqT1JxwWNZ2trOrbm0/X
	byrViwrED4FQDvFjbuE2OZtEE4s6O/b1CrP7VxwkzRVeI4aAqm0cG2OXBxxyaz/WSDC7sG
	pl/UO9KvapCs6O7Dh3N296+OzcDLA4Wy3dqNaqDoNXI4ujdu0z1jwqGqqXMI4uWn6kXitP
	o7CfPF/jMB8507LuFKEAP8332aXh+Qm3G3w/SN99sTOpL1cMvROcpi7r2JauFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
Subject: Re: [PATCH v3 0/9] mtd: rawnand: sunxi: Fixes user data length for
 H6
Message-Id: <177444896601.837464.10999633870241731377.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_142944_680154_6764E1AC 
X-CRM114-Status: GOOD (  11.51  )
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

T24gVHVlLCAxNyBNYXIgMjAyNiAxNToyNDoyOCArMDEwMCwgUmljaGFyZCBHZW5vdWQgd3JvdGU6
Cj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyB0aGUgY29ycmVjdCB1c2FnZSBvZiB1c2VyIGRhdGEg
bGVuZ3RoIGZvcgo+IEg2L0g2MTYuCj4gSWYgdGhlIG9sZGVyIFNvQ3MgbXVzdCB1c2UgYSBmaXhl
ZCB2YWx1ZSBvZiA0IHVzZXIgZGF0YSBieXRlcyBmb3IgZWFjaAo+IEVDQyBzdGVwLCB0aGUgSDYg
Y2FuIGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUgZm9yIGVhY2ggc3RlcC4KPiAKPiBJbiB0aGUgZmly
c3Qgcm91bmQsIHRoZSBiZWhhdmlvciB3YXMga2VwdCBhcyB0aGUgb25lIHVzZWQgYnkgQTEwLgo+
IEJ1dCB3ZSBoYXZlIG11bHRpcGxlIGNob2ljZXM6Cj4gLSBkbyBsaWtlIEExMCBsaWtlIGJlZm9y
ZSAoYW5kIG5vdCB1c2UgYWxsIE9PQikKPiAtIGRvIGxpa2UgdGhlIHZlbmRvciBrZXJuZWwgKGRp
ZmZlcmVudCBmcm9tIEExMCwgYnV0IG5vdCB1c2luZyBhbGwgT09CKQo+IC0gdXNlIHRoZSB3aG9s
ZSBPT0IgZm9yIHVzZXIgZGF0YSBieXRlcwo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4
dCwgdGhhbmtzIQoKWzEvOV0gbXRkOiByYXduYW5kOiBzdW54aTogc3VueGlfbmFuZF9vb2JsYXlv
dXRfZnJlZSBjb2RlIGNsYXJpZmljYXRpb24KICAgICAgY29tbWl0OiA4N2Y5YzU5Zjg5NmZkNDZk
NDViZTc2ZDhhODI4NmE2OTE2Y2UxZjFhClsyLzldIG10ZDogcmF3bmFuZDogc3VueGk6IGZpeCBz
dW54aV9uZmNfaHdfZWNjX3JlYWRfZXh0cmFfb29iCiAgICAgIGNvbW1pdDogODQ4YzEzOTk2YzU1
ZmU0ZWE2YmY1YWNjM2NlNmM4YzVjOTQ0YjVmNgpbMy85XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBk
byBub3QgY291bnQgQkJNIGJ5dGVzIHR3aWNlCiAgICAgIGNvbW1pdDogOGZhNzI4MzZiZTExZWE3
MGNiZmE0M2Y3ZjIyNTNmYTU3Y2NjNmVjZApbNC85XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiByZXBs
YWNlIGhhcmQgY29kZWQgdmFsdWUgYnkgYSBkZWZpbmUgLSB0YWtlMgogICAgICBjb21taXQ6IGUz
ZmQ5NjNkYTRjNzQ2OTc1N2Q0Zjc3NDExNTdmYzVlMjNkYTQ3ZWQKWzUvOV0gbXRkOiByYXduYW5k
OiBzdW54aTogbWFrZSB0aGUgY29kZSBtb3JlIHNlbGYtZXhwbGFuYXRvcnkKICAgICAgY29tbWl0
OiA1NDhmODdlZDQ3NDc5ZTA4MjAzYmM1NzZjYjUwMjBmNTM3ZTQ5YmNlCls2LzldIG10ZDogcmF3
bmFuZDogc3VueGk6IHJlbW92ZSBkZWFkIGNvZGUKICAgICAgY29tbWl0OiAyNzgxNTQyY2FmNjgx
Y2U1MmYyMTMxNTIxMDRmYjc2NjkyNjM2NTFjCls3LzldIG10ZDogcmF3bmFuZDogc3VueGk6IGNo
YW5nZSBlcnJvciBwcm9uZSB2YXJpYWJsZSBuYW1lCiAgICAgIGNvbW1pdDogYTFjOTY3ZjVkNmE1
NjhkZDI0NTgzOTE3Nzc0ZTAxNzhiOGUzOTIyMQpbOC85XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBm
aXggdHlwb3MgaW4gY29tbWVudHMKICAgICAgY29tbWl0OiBhMjJmNDBkOWViMWVmNTg3YTgyMDFm
ZGUzZjAwNDE3M2ZkOGI1ZThlCls5LzldIG10ZDogcmF3bmFuZDogc3VueGk6IGludHJvZHVjZSBt
YXhpbWl6ZSB2YXJpYWJsZSB1c2VyIGRhdGEgbGVuZ3RoCiAgICAgIGNvbW1pdDogNTRkY2Q2YWE2
OWRiNTQxNTI5YTA4M2IzMWYxMDZlZjdkMTQ3ZmVhMQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
