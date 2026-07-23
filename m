Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA19C44524
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mxjvT8mMKoA2WDCI5CzkXhOdQdZB3DyrCSsNNiKnh1E=; b=1NJC7/l0AZ8so9zADY+akb+nf4
	5k2Y/5mZ9KL6oa8yC7xh4AghWQRLYjYl9n5Yfhni6EBPDP1GuK+21O1Le7Gl7mWPS7l28UgDxUOub
	k3GaQXQJ9k2qpARJSROoc5LuOhtbWcByERydPbgBLsDpHoOEWycl6ioHjPzKrMmc6jQmxG+E1xj9l
	U1KS/6GrL1BSSdP816qxAe9Ja+yCCZVJF5HjxJQb36XQ1fWxqOkt2qALMzNhxSRJQRhJkLogZr7HD
	GdO5njBC1HBn6FZpcT0SNdxCsJt+GE9KrQwl7GrEMRq44TtRgpt9tC4BkHWsm9WWa3IIVuhadIyef
	41wt7M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnj3-0000000DcyA-1ZAb;
	Thu, 23 Jul 2026 07:20:13 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmniy-0000000DcxE-2rqQ
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 07:20:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2E1082698C0;
	Thu, 23 Jul 2026 09:19:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id O4k9vO5OiKkS; Thu, 23 Jul 2026 09:19:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5D6AA2698C1;
	Thu, 23 Jul 2026 09:19:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fcGjQHi4rVoz; Thu, 23 Jul 2026 09:19:56 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1F9262698C0;
	Thu, 23 Jul 2026 09:19:56 +0200 (CEST)
Date: Thu, 23 Jul 2026 09:19:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ran Hongyun <ranhongyun1@huawei.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, vapier@gentoo.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <181744126.6546.1784791195864.JavaMail.zimbra@nod.at>
In-Reply-To: <20260723060643.2939964-1-ranhongyun1@huawei.com>
References: <20260723020233.3079997-3-ranhongyun1@huawei.com> <20260723060643.2939964-1-ranhongyun1@huawei.com>
Subject: Re: [PATCH 2/2] UBI: support per-device wear-leveling threshold
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF152 (Linux)/8.8.12_GA_3809)
Thread-Topic: support per-device wear-leveling threshold
Thread-Index: fL2RXOEzzr1fO9RvcvvQOXYzAwqdjg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002008_877057_24292AED 
X-CRM114-Status: UNSURE (   3.40  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJhbiBIb25neXVuIiA8cmFu
aG9uZ3l1bjFAaHVhd2VpLmNvbT4KPiBBbjogcmFuaG9uZ3l1bjFAaHVhd2VpLmNvbQo+IENDOiAi
QXJ0ZW0gQml0eXV0c2tpeSIgPGFydGVtLmJpdHl1dHNraXlAbGludXguaW50ZWwuY29tPiwgImNo
ZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiwgImxpbnV4LWtlcm5lbCIKPiA8
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFsIgo+IDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sIHZhcGllckBnZW50b28ub3JnLCAi
VmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sCj4gInlhbmdlcmt1biIgPHlh
bmdlcmt1bkBodWF3ZWkuY29tPiwgInlpIHpoYW5nIiA8eWkuemhhbmdAaHVhd2VpLmNvbT4KPiBH
ZXNlbmRldDogRG9ubmVyc3RhZywgMjMuIEp1bGkgMjAyNiAwODowNjo0Mwo+IEJldHJlZmY6IFJl
OiBbUEFUQ0ggMi8yXSBVQkk6IHN1cHBvcnQgcGVyLWRldmljZSB3ZWFyLWxldmVsaW5nIHRocmVz
aG9sZAoKPiBSZXBseSB0byB0aGUgaXNzdWVzIHJhaXNlZCBieSBzYXNoaWtvOiBUaGUgc3RydWN0
IHNpemUgaXMgdW5jaGFuZ2VkLAo+IGFuZCBhbGwgZXhpc3RpbmcgdXNlcnNwYWNlIHByb2dyYW1z
IHplcm8taW5pdGlhbGl6ZSB0aGUgc3RydWN0Cj4gdWJpX2F0dGFjaF9yZXEsIHNvIHdsX3RocmVz
aG9sZCByZWFkcyBhcyB6ZXJvIGFuZCBmYWxscyBiYWNrIHRvCj4gQ09ORklHX01URF9VQklfV0xf
VEhSRVNIT0xELiBObyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzc3VlLgoKSSBkb24ndCBzZWUg
U2FzaGlrbydzIG1haWwuIFdoZXJlIHdhcyBpdCBzZW50IHRvPwoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
