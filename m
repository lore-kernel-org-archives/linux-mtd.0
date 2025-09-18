Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B1CAC597
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEUIDEhOffcpwaAB5ZAIoEWgoWQij+0H0fFpanZsh3M=; b=0Dawn2wYSsMXZw
	JsyaGBGi0DWTsg4py5grRYd/DaLTR57LUIFBQk/LRgIvsCgb0AkX8JEL9FTxGHDL1Qu+81830drZx
	J7YTQH939TRs8qkQfiQhRkgXrx6gn+GHpu5eEhJcfl19TMTZjSoJaKP1hmvdR5cYuKKR+JKt9BKHi
	+GHxFLHgl4h/yQtvAzQhUIQzmXD+PwOJ7UjA0yeEe69MM/u84XTt193yeHyhFrsguBryWiyKKpFDd
	dN17q2vxiyQTP3i6b/iTSup0ZAujNxKDVkrtZZ8XxzE1nHWWSQjWA1SKeF9eDhe+Ds4ZWCYw6UPuy
	CSKjBMwcx1z9MCGYwRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5m-0000000Gi7v-1jxx;
	Thu, 18 Sep 2025 08:34:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5j-0000000Gi6a-2neW
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 08:34:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 441E24E40D13;
	Thu, 18 Sep 2025 08:34:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0346062C;
	Thu, 18 Sep 2025 08:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0F4A102F1CA3;
	Thu, 18 Sep 2025 10:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758184449; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1MQpEGYBPOl8VaCIHk/TSQe3l232677/wOcFL1ndfZw=;
	b=N4x8KIz/jbpbq2jJRdoTFo5o0O6W3JWORRhKnAiH8MI5VUU8nwHUx15Nd/M+ASPeAlSGKj
	oYUj5h8e5x/aQToTh/jv0Zs7FTterkNPN+PJ9YGgmBE65BnlXX0R46twFRS6Jxwc5+ZpJS
	QgOEsLBan1p9YTq55eC/O0YfwTO+fLPb6yxqCyMilWTPKeDeDZdF2UFpVY+8KMSkLP0b9+
	ogF4fxbjgm6qa0XjH8D44KuN6F3tdnegAiMzefXA/TruSOok7HYXdvihkX+jf7lwYcZL2k
	5WPdVuMN4lrw06yXKP7ht/moTY2iRdj3pNCB76HjYSnM4Il0J7se8Rtd2vVP6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 Markus Stockhausen <markus.stockhausen@gmx.de>
In-Reply-To: <20250910183258.1147296-1-markus.stockhausen@gmx.de>
References: <20250910183258.1147296-1-markus.stockhausen@gmx.de>
Subject: Re: [PATCH] mtd: nand: move nand_check_erased_ecc_chunk() to
 nand/core
Message-Id: <175818444772.1151539.4277213645519842387.b4-ty@bootlin.com>
Date: Thu, 18 Sep 2025 10:34:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_013411_838021_CEC8A67B 
X-CRM114-Status: UNSURE (   7.70  )
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

T24gV2VkLCAxMCBTZXAgMjAyNSAxNDozMjo1OCAtMDQwMCwgTWFya3VzIFN0b2NraGF1c2VuIHdy
b3RlOgo+IFRoZSBjaGVjayBmdW5jdGlvbiBmb3IgYml0ZmxpcHMgaW4gZXJhc2VkIGJsb2NrcyB3
aWxsIGJlIG5lZWRlZAo+IGJ5IHRoZSBSZWFsdGVrIEVDQyBlbmdpbmUgZHJpdmVyICh3aGljaCBp
cyBjdXJyZW50bHkgdW5kZXIKPiBkZXZlbG9wbWVudCkuIFJpZ2h0IG5vdyBpdCBpcyBsb2NhdGVk
IGluIHJhdy9uYW5kX2Jhc2UuYy4KPiBXaGlsZSB0aGlzIGlzIHN1ZmZpY2llbnQgZm9yIHRoZSBj
dXJyZW50IHVzZWNhc2VzLCB0aGVyZSBpcwo+IG5vIHJlYWwgZGVwZW5kZW5jeSBmb3IgYW4gRUND
IGVuZ2luZSBvbiB0aGUgcmF3IG5hbmQgbGlicmFyeS4KPiAKPiBNb3ZlIHRoZSBmdW5jdGlvbiBv
dmVyIHRvIGEgbW9yZSBnZW5lcmljIHBsYWNlIGluIGNvcmUgbGlicmFyeS4KPiAKPiBbLi4uXQoK
QXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDogbW92ZSBuYW5k
X2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoKSB0byBuYW5kL2NvcmUKICAgICAgY29tbWl0OiA2Yjg4
MjkzYWFlN2ZiNzg4NzJlNWNjMWVjMzZlMmY3NTBhZTEyZTM4CgpQYXRjaGUocykgc2hvdWxkIGJl
IGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQg
UFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdh
cmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
