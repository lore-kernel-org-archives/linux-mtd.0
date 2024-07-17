Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AD3C3DA5E
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StoF/Iu0lfIhL4Lt7aw0zWtZTvdJx6BFIy6qQc1HhDQ=; b=SL6T40VnqPC2Mj
	we3xTVwUxu5ZSeQeD22aSpN0/k+0Mu+ItFg0/e5p51RQgJAp4Fkb6LGdjusqcNSuborQxUFrMelwI
	XAEXxMTIz7IXye+pLHE12fSPeHFGq9oD9CKCG11h40cWxwvQG9w8AekNvY5o8WhyvBPRnqfsKApee
	oxAMbbzN+YViq2uCBw8lZf5GOIomx7pCfcdFTbQEsS2EsR91i3pVBtehtOuifZcRO1XvtZfFjjV83
	vnXNAUznv4z/srfGKLTGa9VPezdeHb7HgNqZZsezM5zDfsn1ZHFBx2E0OHM8D9DuxqjItvirp6JWY
	MPGQBhfzffONpxqheVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzpj-0000000D5wH-41jN;
	Wed, 17 Jul 2024 08:16:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzpg-0000000D5vJ-28gg
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jul 2024 08:16:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3E3420008;
	Wed, 17 Jul 2024 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721204172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BO7Fy/QrnT1QJQqKob04tOemjYG1MLIYQ2dRjjYvVOo=;
	b=bUKZEbJfsOkFLzCmb2K0Sawv+n7Y7r+WhN5p1ayfFODIWZJmJ1jSWvJVDHy3m267aHUOp4
	7M6D6l20IOZdZBdN4LqqI0nIsy6UDzjr3WlnNkng8gPdYw0XQtrhZ5jWtwyMgI0BqGUYjn
	MWeIrUxL7kxolNnvuxm/wttQQsMT7y4CWblHi7kUTOF2p5eSz/2CH+nKIPcXz5UZz/cFeM
	MumZwBEBZQtl2mrEdtgnoIOGJXf98PKEqHIiOjqrFIPwNIS9hfxxeNEEItcLgqKly+8S8c
	yuVoiVEBI9zz7lHc5/xkdIv2xA+V0GZQJZ3Se+RcvW69pOnXxq7GYwdVvztBFA==
Date: Wed, 17 Jul 2024 10:16:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 0/3] Add fixups for two-plane serial NAND flash
Message-ID: <20240717101610.792a4a11@xps-13>
In-Reply-To: <20240710011541.342682-1-linchengming884@gmail.com>
References: <20240710011541.342682-1-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_011616_717846_4EFE5655 
X-CRM114-Status: GOOD (  13.67  )
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

SGkgQ2hlbmcsCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTAgSnVs
IDIwMjQgMDk6MTU6MzggKzA4MDA6Cgo+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmds
aW5AbXhpYy5jb20udHc+Cj4gCj4gTWFjcm9uaXggc2VyaWFsIE5BTkQgZmxhc2ggd2l0aCBhIHR3
by1wbGFuZSBzdHJ1Y3R1cmUKPiByZXF1aXJlcyBpbnNlcnRpb24gb2YgUGxhbmUgU2VsZWN0IGJp
dCBpbnRvIHRoZSBjb2x1bW4KPiBhZGRyZXNzIGR1cmluZyB0aGUgd3JpdGVfdG9fY2FjaGUgb3Bl
cmF0aW9uLgo+IAo+IEFkZGl0aW9uYWxseSwgZm9yIE1YMzV7VSxGfTJHMTRBQywgaW5zZXJ0aW9u
IG9mIFBsYW5lCj4gU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBpcyByZXF1aXJl
ZCBkdXJpbmcKPiB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiAKPiBJbiBzcGluYW5k
LmgsIGFkZCBzdHJ1Y3Qgc3BpX25hbmRfZml4dXBzIGFzIFNQSSBOQU5ECj4gZml4dXAgaG9va3Mu
Cj4gCj4gSW4gbWFjcm9uaXguYywgYWRkIGZpeHVwIGZ1bmN0aW9ucyBhbmQgdXBkYXRlIElEIHRh
YmxlLgo+IAo+IEluIGNvcmUuYywgYWRkIGFuIGlmIHN0YXRlbWVudCB0byBkZXRlcm1pbmUgd2hl
dGhlciB0bwo+IGluc2VydCB0aGUgUGxhbmUgU2VsZWN0IGJpdCBmb3IgdGhlIGNvbHVtbiBhZGRy
ZXNzLgo+IAo+IFRoZXNlIGZsYXNoZXMgaGF2ZSBiZWVuIHZhbGlkYXRlZCBvbiBYaWxpbnggenlu
cS1waWNvemVkCj4gYm9hcmQgd2hpY2ggaW5jbHVkZWQgTWFjcm9uaXggU1BJIEhvc3QuCj4gCj4g
Q2hlbmcgTWluZyBMaW4gKDMpOgo+ICAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oOiBBZGQg
Zml4dXBzIGZvciBzcGluYW5kCj4gICBtdGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBGaXh1cHMgZm9y
IFBMQU5FX1NFTEVDVF9CSVQKPiAgIG10ZDogc3BpbmFuZDogSW5zZXJ0IFBsYW5lIFNlbGVjdCBi
aXQgZm9yIHRoZSBjb2x1bW4gYWRkcmVzcwoKSSBiZWxpZXZlIHBhdGNoZXMgMSBhbmQgMyBzaG91
bGQgYmUgc3F1YXNoZWQgYW5kIGNvbWUgYmVmb3JlIHBhdGNoIDIuCgpJbiBnZW5lcmFsIGluIHlv
dXIgY29kZSwgcGxlYXNlIGF2b2lkIGNhbWVsQ2FzZS4KCkZpbmFsbHksIEkgYW0gbm90IGNvbnZp
bmNlZCB5ZXQgYnkgdGhpcyBpbXBsZW1lbnRhdGlvbiwgSSBkb24ndCBrbm93CndoYXQgdG8gcHJv
cG9zZSB5ZXQsIGJ1dCBJIGFtIG5vdCBwYXJ0aWN1bGFybHkgaW4gZmF2b3Igb2YgYWRkaW5nIHN1
Y2gKaG9va3MuIENhbiB5b3UgcG9pbnQgdG8gYSBkYXRhc2hlZXQgKHVybCBhbmQgcGFnZSkgd2hl
cmUgSSBjb3VsZCBnZXQKbW9yZSBpbmZvcm1hdGlvbj8KCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYyAgICAgfCAgNyArKysrKwo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25p
eC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gIGluY2x1ZGUvbGlu
dXgvbXRkL3NwaW5hbmQuaCAgICAgfCAxNyArKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQs
IDY5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
