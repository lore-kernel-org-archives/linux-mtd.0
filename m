Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9F2C5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tl5ERoRZwLTJ4pbvtEnLC0TaN4VWeSklMyFAJzxn7wQ=; b=Lg2Zoqzcttdqt6
	rX3Bov4hbogzc94GGDI7ypdv7AT0pD8iikxvu2nSg2APUihNmwJj4knKQy47bz04CqL+FZgzYpOSP
	NJA4sFWaSNPjJvBDgVm0Q4U9glq0bdOD8x3QuujcAYZ0iqLRXpMSm5FkA3mnNmltaOMsUALooFnWz
	8uGEIlPL+kml7kvv9XMar41grWO7B8XfJRlyK1jl5sSUi7eXd2N4nyhhgqnNeP9CWHwQWHA9Qz2M2
	vMI9tQi6medlPqroxRyK7phos5yotG2QJHfhKUORCeVnn6z/DFPrtdQXt4gD3aEO+lxrm4aar3rBd
	9L/vJdbHUr5pw+EnnE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUpD-00000006QJT-1Um6;
	Mon, 26 Aug 2024 08:11:43 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUpA-00000006QIP-44qw
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 08:11:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AE9D4000A;
	Mon, 26 Aug 2024 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724659898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/iRKjhXlInk8nm60JRRE3I7S4+qNf65UbzImweU/hM=;
	b=NNPi6Aevx5xZ/89qX38mGbWVp71kPkd6hYyAQ8LjMLxDeHfDgW/0wA6/K27VDPC9sPUeMy
	75MshYI7r+2tHJqQtS+2DauRTNc7w3ckyezHKGgw7DITC+BxX/0j54qQcVmfB8XhhvgBgV
	iCxsm7SS7iuccM1xF5UHyVEdv0qNpRFjAvmu6gVUJDVKTVQnE5g3+81F4Fe0jPTxjytml+
	FLzYUaDGpVggw9rWc+72hw2wYjs8/7vlgarvV+LQkEG9V/eKMd/S327ejH04G3rzCLxqqw
	7dFPoCwlP73nytRhSuWZYmyf1co4LhiuNik+MZqs9IkQg4Ayi8+0MgHrVg8mDg==
Date: Mon, 26 Aug 2024 10:11:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen Ridong <chenridong@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <chenridong@huaweicloud.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 -next] mtd: rawnand: denali: Fix missing
 pci_release_regions in probe and remove
Message-ID: <20240826101136.7849f040@xps-13>
In-Reply-To: <20240826024339.476921-1-chenridong@huawei.com>
References: <20240826024339.476921-1-chenridong@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_011141_162319_82355C9D 
X-CRM114-Status: UNSURE (   8.62  )
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

SGkgQ2hlbiwKCmNoZW5yaWRvbmdAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0
IDAyOjQzOjM5ICswMDAwOgoKPiBUaGUgcGNpX3JlbGVhc2VfcmVnaW9ucyB3YXMgbWlzcyBhdCBl
cnJvciBjYXNlLCBqdXN0IGFkZCBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFJpZG9uZyA8
Y2hlbnJpZG9uZ0BodWF3ZWkuY29tPgo+IC0tLQoKTmV4dCB0aW1lIHBsZWFzZSBhZGQgYSBjaGFu
Z2Vsb2cgaGVyZSwgYmVsb3cgdGhlIC0tLS4KCk5vIG5lZWQgdG8gcmVzZW5kIGZvciB0aGlzIHRp
bWUuCgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMgfCAxMSArKysrKysrKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
