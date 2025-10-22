Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C6CCD1BB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyyYnMcrlp8vcK5RQc+8l5Xl/i+keUvYby8EE1TkG3w=; b=ZHkGAYtQm/Lljg
	rTWr0OUBIR1XyBV2QPax/jJkCY3w2/ojMFB0g+U5JvYNHd2ybm42XMGUnEuouFQfqHPhOkE/7B/R7
	5usBjDUAkca5vszun3Z1tMo001s+1/72ZRuJUETzaQsRqBlheO/jsG9MQFt26rz7HWGFf8x00MGxa
	pBRQ49acUWJ3u6bosKi2xPXPOwWMzwA7PXPO7QF+HKybUplwMi4ypjzCAT7vqYrF+HuaH1oym7Rdy
	QyrtZgabw39KbWAWazmbFnO5wWnm9GxaLRDvdQRnMuth/L0o0KYLY7fGcqXRI3Jf6FqlIv+C8QBwy
	v5J1oh/tm56EvgDrqhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVag-00000002LNN-0c6o;
	Wed, 22 Oct 2025 09:57:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVaZ-00000002LHJ-3pWf
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FA24C0B8B2
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 09:56:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01742606DC;
	Wed, 22 Oct 2025 09:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA887102F2393;
	Wed, 22 Oct 2025 11:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=py/joS4ENFAHsqOoPu+WZNHWvYMaLEPvguSi1YRJFBc=;
	b=eP5M5GGLDw4sy4SguHUspO5TJPrnKONLGwVSsYggCa/sFPBpbM/Zk3AjLZu4ZOfmdCepxx
	SSLSocst/EnqArvXljkzoIqHZFM3T1kn1E4SbQNHAHhKDiSMIOHRVaME1vyo/IwQhds+C/
	7qGbEpXtTIUfzxABEbpB+5+MJQoV0A9mkjaCxvlli0nxzomA9suYLEPhKjNlKlICvKSXix
	LFnWleMbAogkiWJpm1MAgu+ByEn5WITFHld6jHP1wbyVWwTPEGRmtvW1AxfeDrrRIdlyXo
	4qCup8lriEZXlKgjlohIYFmEjOv74CC40nkOQF+zbEkHkUDiDM2ZdcTmYSV/Yg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Li Qiang <liqiang01@kylinos.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251020125333.3400488-1-liqiang01@kylinos.cn>
References: <20251020125333.3400488-1-liqiang01@kylinos.cn>
Subject: Re: [PATCH] mtd: rawnand: realtek: Make rtl_ecc_engine_ops const
Message-Id: <176112701869.140484.14078085027048590161.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:58 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025706_065698_B6C32641 
X-CRM114-Status: UNSURE (   5.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBPY3QgMjAyNSAyMDo1MzozMyArMDgwMCwgTGkgUWlhbmcgd3JvdGU6Cj4gVGhl
IHJ0bF9lY2NfZW5naW5lX29wcyBzdHJ1Y3R1cmUgaXMgb25seSB1c2VkIHRvIHByb3ZpZGUgYSBz
ZXQgb2YKPiBjYWxsYmFjayBmdW5jdGlvbnMgYW5kIGlzIG5ldmVyIG1vZGlmaWVkIGFmdGVyIGlu
aXRpYWxpemF0aW9uLgo+IE1hcmsgaXQgYXMgY29uc3Qgc28gaXQgY2FuIGJlIHBsYWNlZCBpbiB0
aGUgcmVhZC1vbmx5IHNlY3Rpb24sIHdoaWNoCj4gaW1wcm92ZXMgc2FmZXR5IGFuZCBhbGxvd3Mg
YmV0dGVyIGNvbXBpbGVyIG9wdGltaXphdGlvbi4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL2ZpeGVz
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHJlYWx0ZWs6IE1ha2UgcnRsX2VjY19lbmdp
bmVfb3BzIGNvbnN0CiAgICAgIGNvbW1pdDogOTYzMTM1MDg4NTkyOTgxOWQ0ZTQ2YzY1MjFkZjM1
OTYwYjQ3MmVmMwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
