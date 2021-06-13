Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98839C48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 15:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C35F610FB
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 15:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C35F610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcfgSfpd0KNcF+cxCBEqMLQtNnq3JhFPtJsPllguIzg=; b=LYXu77kCmUW4ku
	aEDrRdcaZhytkAajgqUq0yc2yQXYqyPZDUdeEAQtDGNAKdqvrgdHZkYWcWX0Mu9oWjgyds4/8LI/c
	R/IOxy6yL0l3NGt8a0j5L/deWta8+r4M7sRhSo27827GZq3CNJ1sqBTvdn7UWezwCMtxZ+f78ISnT
	k6U/4gQCQAhaHm8yg4xa99FVNkRMGujRBANXtC250vWZIwqh3LS8YVP8U5E5clbh8wpUmxi0iEFI9
	yVzNmVszDjHWkCDzUCCm5eTcYOUg2Ap/edIEOeDhZ8+pgjih9+0QtdwGOHM0K8NvcRAfe/itYz22r
	7Fj/IS5zuxGTp6Chx1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsRme-00AdLX-56; Sun, 13 Jun 2021 15:12:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsRma-00AdKi-LK
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 15:12:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 34F4C1BF205;
 Sun, 13 Jun 2021 15:12:09 +0000 (UTC)
Date: Sun, 13 Jun 2021 17:12:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>
Subject: Re: [PATCH 0/6] Fix deadlock in ftl formating on mtd
Message-ID: <20210613171208.64395d32@xps13>
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_081216_858804_9548D57E 
X-CRM114-Status: UNSURE (   9.58  )
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

SGkgWmhpaGFvLAoKWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gU3VuLCAxMyBKdW4gMjAyMQoxOTozMDoyOSArMDgwMDoKCj4gVGhlcmUgaXMgYW4gQUEtZGVh
ZGxvY2sgcHJvYmxlbSB3aGlsZSBmb3JtYXRpbmcgbXRkIGRldmljZSB0byBnZW5lcmF0ZQo+IGEg
ZnRsIGRldmljZS4gRml4IGl0IGJ5IHJldmVydGluZyAibXRkOiBhbGxvdyB0byB1bmxvYWQgdGhl
IG10ZHRyYW5zCj4gbW9kdWxlIGlmIGl0cyBibG9jayBkZXZpY2VzIGFyZW4ndCBvcGVuIiByZWNv
bW1lbmRlZCBpbiBbMV0uCj4gCj4gWzwwPl0gYmxrdHJhbnNfb3BlbisweDQ3LzB4MzQwICAgICAg
ICAgICAgTE9DSyhtdGRfdGFibGVfbXV0ZXgpCj4gWzwwPl0gX19ibGtkZXZfZ2V0KzB4NWIvMHgz
ZTAKPiBbPDA+XSBibGtkZXZfZ2V0X2J5X2RldisweDE4Zi8weDM3MAo+IFs8MD5dIF9fZGV2aWNl
X2FkZF9kaXNrKzB4MmRiLzB4NzAwCj4gWzwwPl0gZGV2aWNlX2FkZF9kaXNrKzB4MTcvMHgyMAo+
IFs8MD5dIGFkZF9tdGRfYmxrdHJhbnNfZGV2KzB4MzllLzB4NmQwCj4gWzwwPl0gZnRsX2FkZF9t
dGQrMHg3OTIvMHg5MDggW2Z0bF0KPiBbPDA+XSByZWdpc3Rlcl9tdGRfYmxrdHJhbnMrMHhmYi8w
eDE3MCAgICBMT0NLKG10ZF90YWJsZV9tdXRleCkKPiBbPDA+XSBmdGxfdHJfaW5pdCsweDE4LzB4
MTAwMCBbZnRsXQo+IFs8MD5dIGRvX29uZV9pbml0Y2FsbCsweDcxLzB4MzMwCj4gWzwwPl0gZG9f
aW5pdF9tb2R1bGUrMHhhNi8weDM1MAo+IAo+IFsxXSBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9waXBlcm1haWwvbGludXgtbXRkLzIwMTctTWFyY2gvMDcyODk5Lmh0bWwKPiAKPiBaaGloYW8g
Q2hlbmcgKDYpOgo+ICAgUmV2ZXJ0ICJtdGQ6IGJsa2RldnM6IGZpeCBwb3RlbnRpYWwgZGVhZGxv
Y2sgKyBsb2NrZGVwIHdhcm5pbmdzIgo+ICAgUmV2ZXJ0ICJtdGQ6IGZpeDogYXZvaWQgcmFjZSBj
b25kaXRpb24gd2hlbiBhY2Nlc3NpbmcgbXRkLT51c2Vjb3VudCIKPiAgIFJldmVydCAibXRkOiBt
dGRfYmxrZGV2czogZG9uJ3QgaW5jcmVhc2UgJ29wZW4nIGNvdW50IG9uIGVycm9yIHBhdGgiCj4g
ICBSZXZlcnQgIm10ZDogbXRkX2Jsa2RldnM6IGZpeCBlcnJvciBwYXRoIGluIGJsa3RyYW5zX29w
ZW4iCj4gICBSZXZlcnQgIm10ZDogUmVtb3ZlIHJlZHVuZGFudCBtdXRleCBmcm9tIG10ZF9ibGtk
ZXZzLmMiCj4gICBSZXZlcnQgIm10ZDogYWxsb3cgdG8gdW5sb2FkIHRoZSBtdGR0cmFucyBtb2R1
bGUgaWYgaXRzIGJsb2NrIGRldmljZXMKPiAgICAgYXJlbid0IG9wZW4iCgpJIHVuZGVyc3RhbmQg
dGhhdCBzb21lIGZpeGVzIG5lZWQgdG8gcmV2ZXJ0IGEgY291cGxlIG9mIHBhdGNoZXMsIGJ1dApp
c24ndCByZXZlcnRpbmcgNiBjb21taXRzIGZyb20gdGhlIHYyLjYuMzIga2VybmVsIGEgYml0IG9k
ZCBmb3IgdGhhdD8KQXQgbGVhc3QsIGNhbiB5b3UganVzdGlmeSB0aGlzIGNob2ljZT8gQXJlIGFs
bCB0aGVzZSBjb21taXRzIHVzZWxlc3MKYW5kIGJ1Z2d5PwoKPiAKPiAgZHJpdmVycy9tdGQvbXRk
X2Jsa2RldnMuYyB8IDc3ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCj4gCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
