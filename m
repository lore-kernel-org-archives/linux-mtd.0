Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C07C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jun 2022 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ijEEnOBOpCWtCAiJJb0feWXxaveFDaJ8UvhrJMECTs=; b=0Z0qaJMeOiL19h
	/XwJsd07y26A8hOtnlUQMXF8kFBho0jCDiOlCZV64V0zyBz05783b26n3ydQ0Mybg04uxWi3jmY9k
	X8C5fnAnRXAVrBoayHyv08Dj0o7WZ5gHTzqKLf56bpRd3oMSIHHUz0psXOsUroMj8FbTgPd7omaY6
	cMT1q1wYCBb1lHTERyLJmBNr+9UQCHeniYPdQXt/APGmeuB39yCdsIyVe/mciGXuMZDmOYC6vGCxh
	7bjAxezVjJCUpjYEZuf3Kg0SWUf41p2kbTOVtEARfNdXWadVvRRqqlw2YgJL0V4aGXi73n2eroKs3
	81RJtLG+8HYA+RvB3R1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Mpz-00FLum-68; Thu, 23 Jun 2022 13:25:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Mpv-00FLmm-AQ
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2022 13:25:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5928D1BF208;
	Thu, 23 Jun 2022 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655990728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGuR++xPPjUWlLqJbPCBw/3UC+BNkBSB+PamTH3u9dY=;
	b=l8+lepEVs9tKAI5uK/0Tqe3etENaFcdsvFOqPkEKq2RcOlq1qlRjIS6WKL5nitbwjZ6lA4
	Loaw5Z8Iluy7oxsNuT/NlFg2OILde8ottq77k0xBbwOe779NY/T5bR/3tlnPi2hYH4UU40
	X6oPOzJQlmJOgQTMlAN80Tu7sOU9L2Aaqgr13BCAPxXWkogbw9q26Qf5Ab57CU372lh++T
	J8DaXBZp5XMe7OUlR35do7SWP+rdp8EWcH/hAZDZ8Wa09km7/wSzBin8TpzLbG2gXyB+pE
	Aqk8Ic3Hb/N1Slou2uqh/YpZmVQk2NTNDbvW3+EzgJMCu0WfTAuXODSp1F0eGA==
Date: Thu, 23 Jun 2022 15:25:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiang Jian <jiangjian@cdjrlc.com>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubi: remove unexpected word "the"
Message-ID: <20220623152524.3970e49c@xps-13>
In-Reply-To: <20220621093656.73074-1-jiangjian@cdjrlc.com>
References: <20220621093656.73074-1-jiangjian@cdjrlc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_062531_646157_327D1B1A 
X-CRM114-Status: GOOD (  16.96  )
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

SGkgSmlhbmcsCgpqaWFuZ2ppYW5AY2RqcmxjLmNvbSB3cm90ZSBvbiBUdWUsIDIxIEp1biAyMDIy
IDE3OjM2OjU2ICswODAwOgoKPiB0aGVyZSBpcyBhbiB1bmV4cGVjdGVkIHdvcmQgInRoZSIgaW4g
dGhlIGNvbW1lbnRzIHRoYXQgbmVlZCB0byBiZSByZW1vdmVkCj4gCj4gKiBAZGV2OiBkZXZpY2Ug
b2JqZWN0IHRvIG1ha2UgdXNlIG9mIHRoZSB0aGUgTGludXggZGV2aWNlIG1vZGVsCj4gKiBAZGV2
OiBVQkkgZGV2aWNlIG9iamVjdCB0byB1c2UgdGhlIHRoZSBMaW51eCBkZXZpY2UgbW9kZWwKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKaWFuZyBKaWFuIDxqaWFuZ2ppYW5AY2RqcmxjLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvdWJpL3ViaS5oIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3ViaS91YmkuaCBiL2RyaXZlcnMvbXRkL3ViaS91YmkuaAo+IGluZGV4IDA3ODExMmUyM2RmZC4u
ZDkwMzllN2Y2NzAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS91YmkuaAo+ICsrKyBi
L2RyaXZlcnMvbXRkL3ViaS91YmkuaAo+IEBAIC0yODEsNyArMjgxLDcgQEAgc3RydWN0IHViaV9l
YmFfbGViX2Rlc2Mgewo+ICAKPiAgLyoqCj4gICAqIHN0cnVjdCB1Ymlfdm9sdW1lIC0gVUJJIHZv
bHVtZSBkZXNjcmlwdGlvbiBkYXRhIHN0cnVjdHVyZS4KPiAtICogQGRldjogZGV2aWNlIG9iamVj
dCB0byBtYWtlIHVzZSBvZiB0aGUgdGhlIExpbnV4IGRldmljZSBtb2RlbAo+ICsgKiBAZGV2OiBk
ZXZpY2Ugb2JqZWN0IHRvIG1ha2UgdXNlIG9mIHRoZSBMaW51eCBkZXZpY2UgbW9kZWwKPiAgICog
QGNkZXY6IGNoYXJhY3RlciBkZXZpY2Ugb2JqZWN0IHRvIGNyZWF0ZSBjaGFyYWN0ZXIgZGV2aWNl
Cj4gICAqIEB1Ymk6IHJlZmVyZW5jZSB0byB0aGUgVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmpl
Y3QKPiAgICogQHZvbF9pZDogdm9sdW1lIElECj4gQEAgLTQzOSw3ICs0MzksNyBAQCBzdHJ1Y3Qg
dWJpX2RlYnVnX2luZm8gewo+ICAKPiAgLyoqCj4gICAqIHN0cnVjdCB1YmlfZGV2aWNlIC0gVUJJ
IGRldmljZSBkZXNjcmlwdGlvbiBzdHJ1Y3R1cmUKPiAtICogQGRldjogVUJJIGRldmljZSBvYmpl
Y3QgdG8gdXNlIHRoZSB0aGUgTGludXggZGV2aWNlIG1vZGVsCj4gKyAqIEBkZXY6IFVCSSBkZXZp
Y2Ugb2JqZWN0IHRvIHVzZSB0aGUgTGludXggZGV2aWNlIG1vZGVsCgpGb3IgdGhpcyBraW5kIG9m
IHRyaXZpYWwgY2hhbmdlIEkgc3VnZ2VzdCB0aGF0IHlvdSBnYXRoZXIgY2hhbmdlcyBpbiBhCmdp
dmVuIHN1YnN5c3RlbSBhbmQgZ3JvdXAgdGhlbSBpbiBhIHZlcnkgbGltaXRlZCBudW1iZXIgb2Yg
cGF0Y2hlcyBzZW50CmFzIGEgc2luZ2xlIHNlcmllcy4KCj4gICAqIEBjZGV2OiBjaGFyYWN0ZXIg
ZGV2aWNlIG9iamVjdCB0byBjcmVhdGUgY2hhcmFjdGVyIGRldmljZQo+ICAgKiBAdWJpX251bTog
VUJJIGRldmljZSBudW1iZXIKPiAgICogQHViaV9uYW1lOiBVQkkgZGV2aWNlIG5hbWUKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
