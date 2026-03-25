Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C002FEA81A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5YfqzYSw5iEUiA0jAvbUzkwx7lluY4Gfk6Wgdjc6Glg=; b=y1GwdfdReqM0mUSI26/BA+4xU5
	Me+yyf8hiEoVOEIFOcSIgglJRPqMte07D40AvhmqF7RHvtaAZZRtvi/HbkOSGTBVod0UBuF5Ie7GO
	KhYDgwrqg2b8ivIWI7/YxEsLfyYofkMFeozQg4c699zazYFqgGrh6p+OvZ/9LOAs70qKMi1iv4/eB
	649qbBSFm9xHnkG7hPkJRZAlgOOsvPNKkjD1T83kl/FWLF9b6xvooZHnEB9OXMcKxciPG/C/ucXrR
	yLliX8rk2LtdrLGMM//u9vKBXftgRR5An8ogYgAIjoNe7og7G83Ita+U8p9i323aCEGkRZn+h40o0
	KAzMp59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IVg-00000002qr8-0pZi;
	Wed, 25 Mar 2026 07:18:36 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IVc-00000002qqV-1dT0
	for linux-mtd@lists.infradead.org;
	Wed, 25 Mar 2026 07:18:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EAB1A298580;
	Wed, 25 Mar 2026 08:18:20 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xcqmmnRjpV9C; Wed, 25 Mar 2026 08:18:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A0BAB2918DC;
	Wed, 25 Mar 2026 08:18:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MffBK7rrhauA; Wed, 25 Mar 2026 08:18:17 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5A793298580;
	Wed, 25 Mar 2026 08:18:17 +0100 (CET)
Date: Wed, 25 Mar 2026 08:18:17 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Christoph Hellwig <hch@infradead.org>, 
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>, 
	marscheng <marscheng@google.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <2146783189.85721.1774423097193.JavaMail.zimbra@nod.at>
In-Reply-To: <20260320180938.1827148-2-visitorckw@gmail.com>
References: <20260320180938.1827148-1-visitorckw@gmail.com> <20260320180938.1827148-2-visitorckw@gmail.com>
Subject: Re: [PATCH v3 1/2] ubifs: Remove unnecessary cond_resched() from
 list_sort() compare
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Remove unnecessary cond_resched() from list_sort() compare
Thread-Index: dE1j6UB4aWpygkswihoGaLXrLVYI+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_001832_594366_D143F094 
X-CRM114-Status: UNSURE (   9.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkt1YW4tV2VpIENoaXUiIDx2
aXNpdG9yY2t3QGdtYWlsLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJB
bmRyZXcgTW9ydG9uIiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDQzogImNoZW5nemhp
aGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiwgIkNocmlzdG9waCBIZWxsd2lnIiA8aGNo
QGluZnJhZGVhZC5vcmc+LCAianNlcnYiIDxqc2VydkBjY25zLm5ja3UuZWR1LnR3PiwKPiAiZWxl
YW5vcjE1eCIgPGVsZWFub3IxNXhAZ21haWwuY29tPiwgIm1hcnNjaGVuZyIgPG1hcnNjaGVuZ0Bn
b29nbGUuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwK
PiAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJLdWFuLVdl
aSBDaGl1IiA8dmlzaXRvcmNrd0BnbWFpbC5jb20+Cj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDIwLiBN
w6RyeiAyMDI2IDE5OjA5OjM3Cj4gQmV0cmVmZjogW1BBVENIIHYzIDEvMl0gdWJpZnM6IFJlbW92
ZSB1bm5lY2Vzc2FyeSBjb25kX3Jlc2NoZWQoKSBmcm9tIGxpc3Rfc29ydCgpIGNvbXBhcmUKCj4g
SGlzdG9yaWNhbGx5LCBVQklGUyBlbWJlZGRlZCBjb25kX3Jlc2NoZWQoKSBjYWxscyBpbnNpZGUg
aXRzCj4gbGlzdF9zb3J0KCkgY29tcGFyaXNvbiBjYWxsYmFja3MgKGRhdGFfbm9kZXNfY21wLCBu
b25kYXRhX25vZGVzX2NtcCwKPiBhbmQgcmVwbGF5X2VudHJpZXNfY21wKSB0byBwcmV2ZW50IHNv
ZnQgbG9ja3VwcyB3aGVuIHNvcnRpbmcgbG9uZwo+IGxpc3RzLgo+IAo+IEhvd2V2ZXIsIGZ1cnRo
ZXIgaW5zcGVjdGlvbiBieSBSaWNoYXJkIFdlaW5iZXJnZXIgcmV2ZWFscyB0aGF0IHRoZXNlCj4g
Y29tcGFyZSBmdW5jdGlvbnMgYXJlIGV4dHJlbWVseSBsaWdodHdlaWdodCBhbmQgZG8gbm90IHBl
cmZvcm0gYW55Cj4gYmxvY2tpbmcgTVREIEkvTy4gRnVydGhlcm1vcmUsIHRoZSBsaXN0cyBiZWlu
ZyBzb3J0ZWQgYXJlIHN0cmljdGx5Cj4gYm91bmRlZCBpbiBzaXplOgo+IC0gSW4gdGhlIEdDIGNh
c2UsIHRoZSBsaXN0IGNvbnRhaW5zIGF0IG1vc3QgdGhlIG51bWJlciBvZiBub2RlcyB0aGF0Cj4g
IGZpdCBpbnRvIGEgc2luZ2xlIExFQi4KPiAtIEluIHRoZSByZXBsYXkgY2FzZSwgdGhlIGxpc3Qg
c3BhbnMgYWNyb3NzIGEgZmV3IExFQnMgZnJvbSB0aGUgVUJJRlMKPiAgam91cm5hbCwgYW1vdW50
aW5nIHRvIGF0IG1vc3QgYSBmZXcgdGhvdXNhbmQgZWxlbWVudHMuCj4gCj4gU2luY2UgdGhlIGNv
bXBhcmUgZnVuY3Rpb25zIGFyZSBjYWxsZWQgYSBmZXcgdGhvdXNhbmQgdGltZXMgYXQgbW9zdCwK
PiB0aGUgb3ZlcmhlYWQgb2YgZnJlcXVlbnQgc2NoZWR1bGluZyBwb2ludHMgaXMgdW5qdXN0aWZp
ZWQuIFJlbW92aW5nIHRoZQo+IGNvbmRfcmVzY2hlZCgpIGNhbGxzIHNpbXBsaWZpZXMgdGhlIGNv
bXBhcmlzb24gbG9naWMgYW5kIHJlZHVjZXMKPiB1bm5lY2Vzc2FyeSBjb250ZXh0IHN3aXRjaCBj
aGVja3MgZHVyaW5nIHRoZSBzb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt1YW4tV2VpIENoaXUg
PHZpc2l0b3Jja3dAZ21haWwuY29tPgoKQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
