Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92EDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ofOQoJQg5tCZIwQnqchMm/wLZfgf8RwpzF8JJLH/wY=; b=Ymn9Jnqt3f1LGq
	kAP/0WfctR6fzgjoDET7uJb7hhflMNddWwwiWAzze+J8yC3ERqVEcx+VvCo2G4D58LFyV55OFbFC2
	skztnFDEppH2GMXWFrm1RF+Viukswel1xMQTqhCeN6eQCSVqZlGXiFbCOw5mD6m6OVWr1t02GMyu1
	PLAs56+6hE05DbkpJjfSMwSWK9nyaQZ1crZR8vC/u0FzOrabMfJHZjLQNHvoHqQGjcJ5UClG+Lx3N
	N0nmQ5GwCgs0EO9b1qYrzR47Pq62XZGIyLxsTSxMUoDY597S7NjR3O87KidmMcrvWYUmQt8xFnbqG
	eseRWyvmDUvxqESFioTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdoj-00976l-Tq; Mon, 16 May 2022 16:43:33 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdnd-0096Tc-HL
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 16:42:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88E3240004;
 Mon, 16 May 2022 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652719340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9S9+th7rU3Rsy/agoDwBNpYebT5h45qKTkkAgb5i+ow=;
 b=KqC5L1jBIVTcNdDQV9G0TZydeNYtFVoCqm2TPUfCvIAUrhXh69sueODdd86L3hlwI6p9Ls
 qVuDEJUzQEhxMlnqdf3cNvfuNYY+/ABTa2PaNMtdZ/kYMyichuOe4YTirJG/8o5qDE1+Vd
 +GlNM+KZz35lVt5i+evsEg+ywM2O4kmXzRrviG95I19+NG+gwC8McZbok1UKpcEJph26W1
 Ao1I6nZNvY0z6d8i6gLkuDbYTsGCpf2jUqYXMup8E0TWOTpU5Se9ocCu57MH9j243aM2o2
 faBADVnV+YGGceFzTyfv0NAJ6dWrjmmI+P7n3QXbXvbFBkKcPjDanxVIvvWDzA==
Date: Mon, 16 May 2022 18:42:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Karim
 <Karimdplay@gmail.com>, M <x1@disroot.org>
Subject: Re: [PATCH v5 0/3] Add support for Sercomm partitions
Message-ID: <20220516184217.4e2957fc@xps-13>
In-Reply-To: <20220516151228.885222-1-csharper2005@gmail.com>
References: <20220516151228.885222-1-csharper2005@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_094225_824360_1EBCAD89 
X-CRM114-Status: GOOD (  17.50  )
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

SGkgTWlraGFpbCwKCmNzaGFycGVyMjAwNUBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAxNiBNYXkg
MjAyMiAxNToxMjoyOCArMDAwMDoKCj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9y
IFNlcmNvbW0gbXRkIHBhcnRpdGlvbiB0YWJsZSBwYXJzZXIuIEl0J3MKPiB1c2VkIGluIHNvbWUg
QmVlbGluZSwgTmV0Z2VhciBhbmQgU2VyY29tbSByb3V0ZXJzLiBUaGUgU2VyY29tbSBwYXJ0aXRp
b24KPiBtYXAgdGFibGUgY29udGFpbnMgcmVhbCBwYXJ0aXRpb24gb2Zmc2V0cywgd2hpY2ggbWF5
IGRpZmZlciBmcm9tIGRldmljZSB0bwo+IGRldmljZSBkZXBlbmRpbmcgb24gdGhlIG51bWJlciBh
bmQgbG9jYXRpb24gb2YgYmFkIGJsb2NrcyBvbiBOQU5ELgoKU2VyaWVzIGFwcGxpZWQgaW4gcGxh
Y2Ugb2YgdGhlIHByZXZpb3VzIHZlcnNpb24gb24gbXRkL25leHQuCgo+IAo+IENoYW5nZXMgc2lu
Y2U6Cj4gdjQ6Cj4gIC0gQWRkIEFja2VkLWJ5IHRvIHRoZSBmaXJzdCBwYXRjaAo+IAo+IHYzOgo+
ICAtIEZpeCBjb21taXQgbWVzc2FnZSBvZiB0aGUgZmlyc3QgcGF0Y2gKPiAgLSBBZGQgUmV2aWV3
ZWQtYnkgdG8gdGhlIHNlY29uZCBwYXRjaAo+IAo+IHYyOgo+ICAtIEZpeCBtaXN0YWtlcyBpbiBk
dC1iaW5kaW5nCj4gIC0gQWRkIHBhdGNoIGZvciBuZXcgdmVuZG9yIHByZWZpeAo+ICAtIEFkZCB2
ZW5kb3IgcHJlZml4IHRvIHNjcGFydC1pZCBwcm9wZXJ0eQo+IAo+IHYxOgo+ICAtIEFkZCBkdC1i
aW5kaW5nIGluIGEgc2VwYXJhdGUgcGF0Y2gKPiAgLSBSZW1vdmUgcmVkdW5kYW50IGJyYWNlcyBh
bmQgbG9naWNhbCBOT1Qgb3BlcmF0b3IKPiAgLSBEZWZpbmUgcHJfZm10Cj4gIC0gUmVwbGFjZSBr
Y2FsbG9jIGJ5IGt6YWxsb2MKPiAgLSBVc2Ugb2ZfZ2V0X2NoaWxkX2NvdW50KCkgYW5kIGFsbG9j
IGJpZyBlbm91Z2ggYXJyYXkgYmVmb3JlIHRoZQo+ICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUo
KQo+IAo+IE1pa2hhaWwgWmhpbGtpbiAoMyk6Cj4gICBkdC1iaW5kaW5nczogQWRkIFNlcmNvbW0g
KFN1emhvdSkgQ29ycG9yYXRpb24gdmVuZG9yIHByZWZpeAo+ICAgZHQtYmluZGluZ3M6IG10ZDog
cGFydGl0aW9uczogRXh0ZW5kIGZpeGVkLXBhcnRpdGlvbnMgYmluZGluZwo+ICAgbXRkOiBwYXJz
ZXJzOiBhZGQgc3VwcG9ydCBmb3IgU2VyY29tbSBwYXJ0aXRpb25zCj4gCj4gIC4uLi9tdGQvcGFy
dGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgICB8ICA1NSArKystCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAgMiArCj4gIGRyaXZlcnMv
bXRkL3BhcnNlcnMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgOSArCj4gIGRyaXZlcnMv
bXRkL3BhcnNlcnMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
bXRkL3BhcnNlcnMvc2NwYXJ0LmMgICAgICAgICAgICAgICAgICB8IDI0MCArKysrKysrKysrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzMDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3BhcnNlcnMvc2NwYXJ0LmMKPiAK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
