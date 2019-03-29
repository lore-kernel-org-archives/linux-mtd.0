Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C85EC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 10:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFD720811
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 10:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oR7ICdSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AFD720811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MfgGcxDg+mvS3ISJTtgT3QQ3XbMgkKEloqPRPlTWPI=; b=oR7ICdSs+KBjgd
	MRUtfVwh4yF1X2mNum1Gu1PpeJZwZeK+B8PZ7HjpOr74aHudvGd5mPudXiFQSrhEyx5CVybIFxHoh
	Sxgo0TeQthxRepQ1D30zntEWiQfUZXEMB93IvS64/uiRS3d69uiOlgyoDnLdYmkeZNScSY40nUALt
	ExaVbxZ7l3B/gKFo7A7NtTfwkZIwvSNVzju0GAjM6mYdpIE/c9qV1KxKDi2ZLcahRpoXTpexFtccl
	0old/x7aYWa4/XSgIJaJjJkiahVjr/G47v/FTM1TCAHB5XX/lGSgTNGtveI4rDFzfVTrX5pye/OmM
	jJTYjMjsj/vDmbpC668g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9p5d-0008FP-VY; Fri, 29 Mar 2019 10:50:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9p5a-0008Dw-LV
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 10:50:24 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3E0AF240002;
 Fri, 29 Mar 2019 10:50:07 +0000 (UTC)
Date: Fri, 29 Mar 2019 11:50:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for MTD
Message-ID: <20190329115007.7b3afb8d@xps13>
In-Reply-To: <20190325094846.30709-1-vigneshr@ti.com>
References: <20190325094846.30709-1-vigneshr@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_035022_848077_3F8AF1E4 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKClZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4gd3JvdGUg
b24gTW9uLCAyNSBNYXIgMjAxOQoxNToxODo0NiArMDUzMDoKCj4gSSBoYXZlIGJlZW4gY29udHJp
YnV0aW5nIGFuZCByZXZpZXdpbmcgTVREIHBhdGNoZXMgZm9yIGEgd2hpbGUgbm93IGFuZAo+IHdv
dWxkIGxpa2UgdG8gYWRkIG15c2VsZiBhcyBjby1tYWludGFpbmVyIGZvciBNVEQgdG8gaGVscCBt
YWludGFpbgo+IENGSSBhbmQgU1BJIE5PUiBwYXJ0cyBvZiB0aGUgc3Vic3lzdGVtLgo+IEhvcGVm
dWxseSwgdGhpcyB3aWxsIGhlbHAgaW4gdGFraW5nIHNvbWUgbG9hZCBvZmYgY3VycmVudCBtYWlu
dGFpbmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNo
ckB0aS5jb20+Cj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
Cj4gaW5kZXggMzQ1M2YzOTdhZDg3Li5kOTUwZmEwMWQ4MjkgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRB
SU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xMDAxNCw2ICsxMDAxNCw3IEBAIE06CUJy
aWFuIE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPgo+ICBNOglCb3JpcyBCcmV6
aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4KPiAgTToJTWFyZWsgVmFzdXQgPG1hcmVrLnZh
c3V0QGdtYWlsLmNvbT4KPiAgTToJUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4K
PiArTToJVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ICBMOglsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICBXOglodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRl
YWQub3JnLwo+ICBROglodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1t
dGQvbGlzdC8KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
