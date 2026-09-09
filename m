Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88016C79FAA
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMVYkD3AACf7E1mEqSnHDR0V1FEYzkWULOU9d5OZcfE=; b=YAnQKiQjyr4S1c
	W5YqILzPv29+/Kaor36ittpstMPRsdNc5OCkw+O1mO2KbWkPa6EeZ9yQWVYPsDexy+kwHWSXEPEu2
	7S1vTPmukTMKzUieayRyrbsC0geWGN6XRAqv0dr+DlNYuttw01nK7MZNAbFOMlnrhC9MAUS+nhVRK
	dCSeQ+DqJieO4T9w8Oep6yc/5p1SYywtH3Sc9xRr8Fc95Xk4jrnhOMXdJL/2H7WNzRILqLpwrBzYx
	JcB4XKwe6i+ggCVBEXuK0cVSa+hqZC7KJIgrzbgN6uMUlQyQK9WZ12KunIvSKVJcwG6LBXH7TZBab
	DKRsw1cn5pYkvcM2rc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D0n-0000000B15n-2j2X;
	Wed, 09 Sep 2026 07:46:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D0k-0000000B14a-0SGS
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 07:46:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F4241A199A;
	Wed,  9 Sep 2026 07:46:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECE1760448;
	Wed,  9 Sep 2026 07:46:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FCC811C7AF4A;
	Wed,  9 Sep 2026 09:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788939981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4bHYeciqDBDa9Wdfig0XVA+s1YwYjHmxZcY82nNnXvE=;
	b=ZHxpMQ+fkqEP9y3OM95fJD32bXOY3nttdySL1Pl8wGQ+Upqoz/gqRSWspRNCA4JzzroUqL
	aW37lW70dIz3eXQc9MCBENQjzrCq+bm5/68rDQEXJk9FRES2P3cPaP8I1igZPWT9y+KaIZ
	PUaCxwhX5CMerhJ1cZ6FTt+Upd55mHn1YaVKfrvKSbjGVPlZCfBfCQ7NVeBoOIc3zzn+lR
	cKlZqTH6HZZp9FYH2s/7nDDAkXtgc+TJVWsqc6xiCMpduWdfic6imkk1qmu9RXcnf2O5Wf
	7JxFgT0uDtRzne+CEvGpQduskcbjR6qAPCiGvaIBZzvIdILLhqR+++EqhPZrcA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Zongzhen Feng" <1768315307@qq.com>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>,  "linux-kernel"
 <linux-kernel@vger.kernel.org>,  "richard" <richard@nod.at>,  "vigneshr"
 <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_ADBE12933F3EE6A4DFBD640C15CB67442305@qq.com> (Zongzhen
	Feng's message of "Wed, 9 Sep 2026 14:29:21 +0800")
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
	<87o6e7u8jt.fsf@bootlin.com>
	<tencent_ADBE12933F3EE6A4DFBD640C15CB67442305@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 09 Sep 2026 09:46:16 +0200
Message-ID: <87se3isw8n.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_004626_292204_9BD7F738 
X-CRM114-Status: GOOD (  10.26  )
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

SGVsbG8sCgpPbiAwOS8wOS8yMDI2IGF0IDE0OjI5OjIxICswOCwgIlpvbmd6aGVuIEZlbmciIDwx
NzY4MzE1MzA3QHFxLmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXVlbCwKPgo+IFRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrLiBJIGNoZWNrZWQgdGhlIGVtYWlsIHRocmVhZCBhbmQgcGF0Y2h3b3JrLCBidXQK
PiBjb3VsZG4ndCBmaW5kIHRoZSBTYXNoaWtvIHJldmlldyBjb21tZW50cyBmb3IgdjMuIFRoZSB2
MiBTYXNoaWtvCj4gY29tcGxhaW50cyBhYm91dDoKPgo+IDEuIENhY2hlIG5vdCBpbnZhbGlkYXRl
ZCB3aGVuIGRhdGFidWYgaXMgb3ZlcndyaXR0ZW4gYnkgbm9uLWNhY2hlYWJsZQo+ICAgIHJlYWRz
IChSQVcsIGNvbnRpbnVvdXMsIE9PQi1vbmx5KQo+IDIuIFBhZ2VzIHdpdGggdW5jb3JyZWN0YWJs
ZSBFQ0MgZXJyb3JzIGJlaW5nIGNhY2hlZAo+Cj4gaGF2ZSBhbHJlYWR5IGJlZW4gYWRkcmVzc2Vk
IGluIHYzLgo+Cj4gQ291bGQgeW91IHBsZWFzZSBmb3J3YXJkIHRoZSByZW1haW5pbmcgU2FzaGlr
byBjb21wbGFpbnRzIG9yIHBvaW50IG1lCj4gdG8gd2hlcmUgSSBjYW4gZmluZCB0aGVtPyBJJ2Qg
bGlrZSB0byBhZGRyZXNzIHRoZW0gYmVmb3JlIHlvdXIgaHVtYW4KPiByZXZpZXcuCgpMaW5rOiBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvdGVuY2VudF9FODE4NTg2NDIzRjJGMTZEOThE
RUYxRUMyNzIzRUU0QTYzMDhAcXEuY29tP3BhcnQ9MQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
