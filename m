Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01862C46CCD
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 14:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2buwuw/C6yuxXz5kX55HtaDxs7DFk9Kp9KHE0639Xl4=; b=wIU3ZZIszvhM+E
	d51XU8JgxDj+k+wnYconmJWvmH+hiSCVEKvqTujbdy+l9L58sdvjvh7RjNMQva3LX593cga8sZL+G
	DvS66gpZkEp2JrGHSFI4LLrB59FoQZ82ekYC7cePvHhNwLTcXa4YhtPzaQnFuOiqyMOPlI2qZhmPX
	dM6cSTNc9T2e8BWKdwr4UEpWwenkcRAD5doOYwcLkH+yM/87RLeqFPR9pJuAcjdRHdOvkh/1N7DiZ
	+SmXN4WkH912Nm8AGoi1fZS/J9+EQZOsZ5+vOrBn7ZCwl0YXRjB3seEniWFZQU3zxoI8rWU/j68bo
	GsHJkkY73NGcHidy/31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbL3-00EQTl-2A;
	Tue, 19 Dec 2023 14:44:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbL1-00EQP5-0X
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 14:44:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00BB840002;
	Tue, 19 Dec 2023 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702997084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcC1UPq/cCcwskYFv7lgPr4ovzsPPufTTXEYRTZJPi8=;
	b=drhoG56F5u53THaINE7HgunFSjNNF7X9b6BJxp9dNLp2azlG6tks0evoML1e2Z0jdEQEGZ
	LV7IilQ9oqIzjaXs8Ir8XtmwQAShLAQf+Ojn9ClGoMftbo58jAr+OPyzAN/oq/DwrV1ZpF
	7LOOSNqlw0MJyZpsjo3b6qNYc78LfFilWxqUQ2hma523rQOp2mV+srpeS3M2oqsfBnCi6K
	l7r6YqiZlfAQwylz0S2lCL77iiKhgMIaZg4lhH7//ujtuswrpAy+CUZP8ADQ/dg2O1rxga
	ZtxJOWsTfLneD4xAAJmHwgsI51vAl8cXkUm+C8MGTl5GG43LJo0NH0XRMSBU3Q==
Date: Tue, 19 Dec 2023 15:44:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 dpervushin <dpervushin@embeddedalley.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by
 ftl notifier
Message-ID: <20231219154438.2bc1820e@xps-13>
In-Reply-To: <04b4c375-d890-9458-5d62-0a9ba74b8c68@huawei.com>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
	<20231027194026.1bc32dfe@xps-13>
	<174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
	<20231029145033.0ad2682a@xps-13>
	<142222867.20038.1698593973984.JavaMail.zimbra@nod.at>
	<04b4c375-d890-9458-5d62-0a9ba74b8c68@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_064451_483523_0FACCEFB 
X-CRM114-Status: GOOD (  11.89  )
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

SGkgWmhhb0xvbmcsCgp3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20gd3JvdGUgb24gVHVlLCAxOSBE
ZWMgMjAyMyAyMjozNjo1MCArMDgwMDoKCj4gRnJpZW5kbHkgcGluZy4uLgo+IAo+IEknZCBsaWtl
IHRvIGtub3cgd2hhdCB0aGUgY3VycmVudCBzdGF0dXMgb2YgdGhpcyBwYXRjaCBpcy4gSXMgdGhl
cmUgYSBuZWVkIGZvciBmdXJ0aGVyIHByb2dyYW1tZSBpbXByb3ZlbWVudHM/CgpFYXN5LCBzZWUg
YmVsb3cuCgo+IAo+IEJhc3QgcmVnYXJkcywKPiBaaGFvTG9uZyBXYW5nCj4gCj4gCj4gPiAtLS0t
LSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+PiBWb246ICJNaXF1ZWwgUmF5bmFsIiA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+PiBBY2suIEknbGwgcXVldWUgdGhpcyBvbmNl
IHRoZSBsb2cgZml4ZWQgYW5kIHlvdXIgb2ZmaWNpYWwgQWNrLWJ5Cj4gPj4gcmVjZWl2ZWQgZm9y
IG10ZC9uZXh0IGFmdGVyIC1yYzEgaXMgb3V0LiAgCgpIZXJlIEkgZGVwaWN0IHR3byBjb25kaXRp
b25zLgoKPiA+IEFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoK
QW5kIGhlcmUgb25lIG9mIHRoZW0gaXMgZnVsZmlsbGVkLCB3aGljaCBtZWFucyB0aGUgb3RoZXIg
b25lIGlzIHN0aWxsCm5vdCBBRkFJSyA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
