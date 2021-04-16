Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F237DC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 15:02:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB87E61166
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 15:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB87E61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aVTtn2hh7YLoew8M0ecyNe7D3VQv90jYBOi9rJ4haR4=; b=A7/3npvLGbUJX3sUVy9jBwpSB
	sN2+7fNXmhgL4oOLYsFw2AdT3ufnzx1zDZJtSBkE7RQ2XFGXPugWkIsk7P5UUBIM3Kjil2aKIsRyA
	qWEu+ad60n40EVNENVsBFQAou5Th/cyz2c0pPHw9wgVUY/wdPlfX0efUxTpmGMQ90MG7FMMTZst9k
	+E1QZ08Kox+1ay3UmaPRQHzBAzBPOaa2d5iXXf7SToowYUi7yfNY9YW2mQD1PWAyG5h3ku4Bplb95
	1XD9e+ys/XpQlICdca5RbgS3NW42uTv/qoL6Gbx/g4BDj/CaEU++yOkF4kCJ6AMtuMbeG6tuMx74I
	cI42ez89g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPxn-002XS3-Bz; Fri, 16 Apr 2021 15:00:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPxl-002XRt-Hv
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 15:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=lkHt29iJM65guAynQdyrfN9fnUoLsicjxDLbalmFZYQ=; b=W5rfxC6svyPes4RT1ZJYoQl9wL
 Cj9YGCOeXlHmuLbj7Ac0ksTnBuL1A/plSuiYZfNE3aQtZwcwDQbfTzNcHVkFECpfL8VQBNVxuoe+c
 YWpbC8AuLzZRmQgik2qFORYoW50eUpAmXuwkJgh0R60s2AoGJu58kPsYnay4OE93Bi/pbXnrN2H7l
 +w66NBuRjZjnxhWR2g49XagwhHXJ6cI+xLBnlE41UzsW5kr2WkTHgEB4W0cOsqe3NoKXOeMtvLTrJ
 DuY5XIk5iRno3RjY3j1qjKdVWA4YYUqyhgS+Hv87+YMjwKmJFk+VDb/3MOIoZRqQYectvR0O8IVK5
 h3Oz0FSw==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPxf-009Tp3-Qk
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 15:00:52 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8DB402000E;
 Fri, 16 Apr 2021 15:00:41 +0000 (UTC)
Date: Fri, 16 Apr 2021 17:00:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Manivannan Sadhasivam
 <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fix an error code in nand_setup_interface()
Message-ID: <20210416170040.4e467039@xps13>
In-Reply-To: <YHaEEYg2DUFwnxSo@mwanda>
References: <YHaEEYg2DUFwnxSo@mwanda>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_080048_019372_E80BDBA2 
X-CRM114-Status: GOOD (  18.25  )
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

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBXZWQsIDE0IEFwciAyMDIxCjA4OjU2OjMzICswMzAwOgoKPiBXZSBzaG91bGQgcmV0dXJuIGFu
IGVycm9yIGNvZGUgaWYgdGhlIHRpbWluZyBtb2RlIGlzIG5vdCBhY2tub3dsZWRnZWQKPiBieSB0
aGUgTkFORCBjaGlwLgoKVGhpcyB0cnVseSBpcyBxdWVzdGlvbmFibGUgKGFuZCBJIGFtIG5vdCB5
ZXQgZGVjaWRlZCB3aGV0aGVyIHRoZSBhbnN3ZXIKc2hvdWxkIGJlIHllcyBvciBubykuCgpSZXR1
cm5pbmcgYW4gZXJyb3IgaGVyZSB3b3VsZCBwcm9kdWNlIHRoZSBlbnRpcmUgYm9vdCBzZXF1ZW5j
ZSB0byBmYWlsLApldmVuIHRob3VnaCB0aGUgTkFORCBjaGlwIHdvdWxkIHdvcmsgaW4gbW9kZSAw
LgoKTm90IHJldHVybmluZyBhbiBlcnJvciB3b3VsZCBwcmludCB0aGUgYmVsb3cgd2FybmluZyAo
c28gdGhlCnVzZXIvZGV2ZWxvcGVyIGlzIHdhcm5lZCkgYW5kIGNvbnRpbnVlIHRoZSBib290IHdp
dGggdGhlIHNsb3dlc3QKdGltaW5nIGludGVyZmFjZS4KCkhvbmVzdGx5IEkgd291bGQgYmUgbW9y
ZSBpbiBmYXZvciBvZiBsZXR0aW5nIHRoaW5ncyBhcyB0aGV5IGFyZQpiZWNhdXNlIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBtYXkgYmUgY29uc2lkZXJlZCBhcyBhIGJ1Z2d5IHNpdHVhdGlvbiwgYnV0IEkK
YW0gb3BlbiB0byBkaXNjdXNzaW9uLgoKPiBGaXhlczogNDE1YWU3OGZmYjVkICgibXRkOiByYXdu
YW5kOiBjaGVjayBPTkZJIHRpbWluZ3MgaGF2ZSBiZWVuIGFja2VkIGJ5IHRoZSBjaGlwIikKPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4g
LS0tCj4gRnJvbSBzdGF0aWMgYW5hbHlzaXMuICBOb3QgdGVzdGVkLgo+IAo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IGZiMDcyYzQ0NDQ5NS4u
ZDgzYzA1MDNmOTZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtODgwLDYg
Kzg4MCw3IEBAIHN0YXRpYyBpbnQgbmFuZF9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwgaW50IGNoaXBucikKPiAgCWlmICh0bW9kZV9wYXJhbVswXSAhPSBjaGlwLT5iZXN0
X2ludGVyZmFjZV9jb25maWctPnRpbWluZ3MubW9kZSkgewo+ICAJCXByX3dhcm4oInRpbWluZyBt
b2RlICVkIG5vdCBhY2tub3dsZWRnZWQgYnkgdGhlIE5BTkQgY2hpcFxuIiwKPiAgCQkJY2hpcC0+
YmVzdF9pbnRlcmZhY2VfY29uZmlnLT50aW1pbmdzLm1vZGUpOwo+ICsJCXJldCA9IC1FSU5WQUw7
Cj4gIAkJZ290byBlcnJfcmVzZXRfY2hpcDsKPiAgCX0KPiAgCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
