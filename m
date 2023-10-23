Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC434CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XbDz/GomEKUYjjxr8zzwz5bnMpXVO2I+5uoqwppG7E4=; b=JyBNvUY6nSKcCYo7tNqxOx70jH
	4FpzAhEUoNzFk15KWOLFte1AVyfe8kPnt+oRnJeZyEQoE3nxkRw9FjJXtWR+6L06VcBqYNK+C3B3D
	B9VouNfZG2YCk1CfYyz0vTI0ZrR4uJHF/U943pv5Z8YMTQpy0ZH3oGzOgygsvApJgcNmptbbc9QKn
	RVizPT9TbMo+VZAwffNHwnutxacZzuRYy4rpTj3oBkW9+kKWP1ZK6oFH1b7hSq1qvRFk11QkAQVCt
	Heli2Hd8RJ1nSNpsww64p3HO5QpwbXlUINnWmqJBBF8JnZwTbTSXzYaDbxlutj0HJsUY4Pd7FflqI
	G8E2TgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quohm-006ZMA-02;
	Mon, 23 Oct 2023 06:46:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quohh-006ZFs-39
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 06:46:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C2FF96343CB8;
	Mon, 23 Oct 2023 08:46:05 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id OIXc1Ua0y-Zo; Mon, 23 Oct 2023 08:46:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EBFBE6343CC3;
	Mon, 23 Oct 2023 08:46:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Yfd4N8mtWQUK; Mon, 23 Oct 2023 08:46:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A3DEC6343CB8;
	Mon, 23 Oct 2023 08:46:04 +0200 (CEST)
Date: Mon, 23 Oct 2023 08:46:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <1141312317.29142.1698043564332.JavaMail.zimbra@nod.at>
In-Reply-To: <9b543be7-a858-c982-3fcf-408701ae4ac9@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com> <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at> <891e554b-c133-6378-3a65-836fc9147e54@huawei.com> <441107100.23734.1697904580252.JavaMail.zimbra@nod.at> <9b543be7-a858-c982-3fcf-408701ae4ac9@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: K47lzcDEhIbqXCtxL40/66d/VssadQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_234622_171362_A1D22A95 
X-CRM114-Status: UNSURE (   6.01  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3
YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
LCAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gQ0M6ICJNaXF1ZWwg
UmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hhdmVuZHJh
IiA8dmlnbmVzaHJAdGkuY29tPiwgImRwZXJ2dXNoaW4iCj4gPGRwZXJ2dXNoaW5AZW1iZWRkZWRh
bGxleS5jb20+LCAiQXJ0ZW0gQml0eXV0c2tpeSIgPEFydGVtLkJpdHl1dHNraXlAbm9raWEuY29t
PiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgt
a2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJ5aSB6aGFuZyIgPHlpLnpo
YW5nQGh1YXdlaS5jb20+LAo+ICJ5YW5nZXJrdW4iIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiBH
ZXNlbmRldDogTW9udGFnLCAyMy4gT2t0b2JlciAyMDIzIDA4OjQxOjEyCj4gQmV0cmVmZjogUmU6
IFtQQVRDSCB2Ml0gdWJpOiBnbHVlYmk6IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgY2F1
c2VkIGJ5IGZ0bCBub3RpZmllcgoKPj4gCj4+IElPVywgbm8gbXRkYmxvY2sgKGhlbmNlLCBhbHNv
IG5vIEZUTHMpIG9uIHRvcCBvZiBnbHVlYmkuCj4+IAo+PiBXaGF0IGRvIHlvdSBndXlzIHRoaW5r
Pwo+PiAKPj4gVGhhbmtzLAo+PiAvL3JpY2hhcmQKPj4gCj4gCj4gCj4gSkZGUzIgbmVlZHMgdG8g
d29yayBvbiB0aGUgYmxvY2sgZGV2aWNlLCBzbyB0aGUgbXRkYmxvY2sgbmVlZHMgdG8gd29yawo+
IG9uIHRoZSB0b3Agb2YgZ2x1ZWJpLgo+IAo+IFRoaXMgaXMgZGlyZWN0bHkgcmVmbGVjdGVkIGlu
IHRoZSBqZmZzMiBtb3VudCBjb21tYW5kLCBzdWNoIGFzCj4gCj4gICAjIG1vdW50IC10IGpmZnMy
IC9kZXYvbXRkYmxvY2tYIC9tbnQvamZmczIKClRoZSBsaW1pdGF0aW9uIGlzIGxvbmcgZ29uZS4g
SXQgY29tZXMgZnJvbSB0aGUgZGFyayBhbmQgb2xkIHRpbWVzCndoZXJlIExpbnV4IHdhcyBvbmx5
IGFibGUgdG8gbW91bnQgYmxvY2sgZGV2aWNlcy4KCllvdSBjYW4gZG86IG1vdW50IC10IGpmZnMy
IG10ZFggL21udC9qZmZzMgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
