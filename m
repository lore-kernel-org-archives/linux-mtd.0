Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B3CD3EE6B
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdrnNpblpiU0WAr7NoxoIdr+q9Ndu+wcOK3dkYdJk4g=; b=Qo/aEU5BU0Eu4K
	VirbPxiPs1DAuws1sEpxyQaG9eUwMtB2dUTsa5afRP+/yolwk2xwoYASqo/9RWShtufYvY9qNhgRn
	Yyh1pArZvD1FmL0Ypa/2x6ia/NAZYP+y5IKmUH/kaSd1qwdukFGnwpDBcqsGtbIX5cyhHl5MWiHG9
	+Oe9DNV9aliy3z5aX9d6phI20EWMpIJfgo0h+vdHVcoQegSf5SEFzGWgp+XCb3ZUFWBD9zIIDkYHw
	iVuj+FLmOz/OuEfBfndHyQJ6inAAV1TOtHcD6AUz5d+/aXH+xBzhvdS07SpdXgzSCu4dPgFr2kYJ8
	pHpUMdjMVHsqAZX1dw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN2-00000007CjE-2sVe;
	Thu, 22 Jan 2026 14:09:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN0-00000007Cik-0qwD
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 14:09:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 424BB4E421F1;
	Thu, 22 Jan 2026 14:09:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D4FB606B6;
	Thu, 22 Jan 2026 14:09:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C6B7119B8228;
	Thu, 22 Jan 2026 15:09:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769090946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6+Yuq4xZjcH9MgIV1g5wa3zzuRe006S3/bFlowjAhxo=;
	b=zHWCnTcVrhE0UWdTmd0D+01VgqI1SCsW6KHIS2YK/V1Eb22U64CmQXhM/KBKhs4HZQq7jv
	l4Yi8EmYq3ABN5fZdJYU0YHqTWoPG1NR8VHU9u5OcfhFQuVMI4Y7Ww63mvFxY9kA2d8nmP
	ZFsFn1uh+PTbdMQaAPax2pm2J7yW1aauFHZwS4r7m8esdZjBHb+HACMNpVYxPVFVeeoeX5
	ALsjsEb7a0m5ZeEAJs/Kp9W/fbMjckmq0+tbetZERZn0oPLypV6vN5/6zC27MvdE5VABKx
	P/KdH/MOEu3ucDmKRjtDSynohVWOATS0E5WXDpQGgoXbE5YFOoqhJbnLjW/lrQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Simon Glass <simon.glass@canonical.com>
In-Reply-To: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
Subject: Re: [PATCH v3 00/10] dt-bindings: mtd: Partition binding fixes and
 restructuring
Message-Id: <176909094128.3112602.14299487418440318214.b4-ty@bootlin.com>
Date: Thu, 22 Jan 2026 15:09:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_060910_398643_0CA08862 
X-CRM114-Status: UNSURE (   9.52  )
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

T24gV2VkLCAyMSBKYW4gMjAyNiAxMzo1NjozMyAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4gVGhlIHBhcnRpdGlvbiBiaW5kaW5ncyBmYWlsIHRvIHJlc3RyaWN0IHVuZGVmaW5lZCBw
cm9wZXJ0aWVzLiBUaGlzIGlzCj4gcHJpbWFyaWx5IG9uIGZpeGVkLXBhcnRpdGlvbnMgd2hpY2gg
Y2FuIGJlIG5lc3RlZCBhbmQgcGFydGl0aW9uIG5vZGVzCj4gd2l0aG91dCBhIGNvbXBhdGlibGUg
c3RyaW5nLiBUaGlzIHNlcmllcyBmaXhlcyB0aG9zZSBpc3N1ZXMgYW5kIHRoZW4KPiBzZXZlcmFs
IHByb2JsZW1zIGV4cG9zZWQgYnkgcmVzdHJpY3RpbmcgdW5kZWZpbmVkIHByb3BlcnRpZXMuIEFz
IHBhcnQgb2YKPiB0aGlzLCB0aGUgc2NoZW1hIHN0cnVjdHVyZSBpcyByZXdvcmtlZCB0byBmb2xs
b3cgbW9yZSBjb252ZW50aW9uYWwKPiBzdHJ1Y3R1cmUgb2YgYXBwbHlpbmcgc2NoZW1hcyBieSBj
b21wYXRpYmxlIGFuZCBhIHNjaGVtYSBvbmx5IGNoZWNrcyAxCj4gbGV2ZWwgb2Ygbm9kZXMgKHVu
bGVzcyBwb3NzaWJsZSBjaGlsZCBub2RlcyBhcmUgZml4ZWQpLgo+IAo+IFsuLi5dCgpBcHBsaWVk
IHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMDEvMTBdIGR0LWJpbmRpbmdzOiBtdGQ6IGJyY20sYnJj
bW5hbmQ6IERyb3AgImJyY20sYnJjbW5hbmQiIGNvbXBhdGlibGUgZm9yIGlQcm9jCiAgICAgICAg
Y29tbWl0OiA0ZGIzNTM2NmQ2ZGNkYTc0NzViNzU4ODdmODkwNzhhMTFmYjJkODlhClswMi8xMF0g
ZHQtYmluZGluZ3M6IG10ZDogZml4ZWQtcGFydGl0aW9uczogTW92ZSAiY29tcHJlc3Npb24iIHRv
IHBhcnRpdGlvbiBub2RlCiAgICAgICAgY29tbWl0OiAzMGYxMzhjMDc4NTI1ZmM0OWIwNjk0ZTg3
OWExZWI2MGVkYTQzN2Q0ClswMy8xMF0gZHQtYmluZGluZ3M6IG10ZDogcGFydGl0aW9uczogTW92
ZSAic2VyY29tbSxzY3BhcnQtaWQiIHRvIHBhcnRpdGlvbi55YW1sCiAgICAgICAgY29tbWl0OiBh
YzgzZjRmYTkxMWRiZTZiN2NjYWRlYjgyYzM1ZjJlNDJkN2NlMmYxClswNC8xMF0gZHQtYmluZGlu
Z3M6IG10ZDogcGFydGl0aW9uczogQWxsb3cgIm52bWVtLWxheW91dCIgaW4gZ2VuZXJpYyBwYXJ0
aXRpb24gbm9kZXMKICAgICAgICBjb21taXQ6IDlmMzBiYTBhMjJiNzlkNDY2ODljNjg2NTQ2ZmIz
ZmVhMjhkNDc1YTMKWzA1LzEwXSBkdC1iaW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOiBEZWZpbmUg
IiN7YWRkcmVzcyxzaXplfS1jZWxscyIgaW4gc3BlY2lmaWMgc2NoZW1hcwogICAgICAgIGNvbW1p
dDogMDAyZDJmZTc5OTIyMjBmYWI1NzQ5N2QzZDc4ZGU1MjY5ODJjZjUxMQpbMDYvMTBdIGR0LWJp
bmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6IERyb3AgcGFydGl0aW9ucy55YW1sCiAgICAgICAgY29t
bWl0OiA5NWFmMWU2NDFiMGYyNDVkMWQ2ODIwYmIwYzg2OTZmYTZhMDdmNWY1ClswNy8xMF0gZHQt
YmluZGluZ3M6IG10ZDogRW5zdXJlIHBhcnRpdGlvbiBub2RlIHByb3BlcnRpZXMgYXJlIGRvY3Vt
ZW50ZWQKICAgICAgICBjb21taXQ6IDFlYjlmYWJkNTI5MzNjZGY5YmUzNDlkZTUzOTE5MjBmYWM0
ZWQzMGIKWzA4LzEwXSBkdC1iaW5kaW5nczogbXRkOiBmaXhlZC1wYXJ0aXRpb25zOiBSZXN0cmlj
dCB1bmRlZmluZWQgcHJvcGVydGllcwogICAgICAgIGNvbW1pdDogNmVjZDc3MTVkNjRlZTNiZjBi
NTViMzc0ZjczMWQxNTE4YjU3YmM4MQpbMDkvMTBdIGR0LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlv
bnM6IENvbnZlcnQgYnJjbSx0cnggdG8gRFQgc2NoZW1hCiAgICAgICAgY29tbWl0OiBhMWZhMGY4
Y2ExZmIxMDhkMmNiZjY3ZmFkODA1NmYwN2JjZTg5OGY4ClsxMC8xMF0gZHQtYmluZGluZ3M6IG10
ZDogcGFydGl0aW9uczogQ29tYmluZSBzaW1wbGUgcGFydGl0aW9uIGJpbmRpbmdzCiAgICAgICAg
Y29tbWl0OiAxMjU5ODFmZmExNjc0NTczZDNhOTIwMGU3MmVkOTNhMjI3MDM0NGIxCgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
