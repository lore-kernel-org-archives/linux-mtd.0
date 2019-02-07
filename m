Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7393C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746B7218FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrGfKh8Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jUm9/gTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746B7218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmEWUvbWcsGIudOrPR8Wb05RumJlqvE7DVhZzHJsbns=; b=hrGfKh8ZUuGVAe
	MOdJ5ZEiMnewAPSOjchLlYTns/1HVKnO0k8C9NtS9+ZdwLPnijJ+ZKxR1DnkIerQfMZn63RWSzGlU
	qKn6c6ToXzIUGc6ow1LhAbKDkD+vGQiQZ7CMirNJ0KLEzNKZ5BFtUInkR1XQvkoUe+klAn8YdUU+Z
	vVzMQR5+TxKc3DOutc69eAv7gA6Z9oxWLD9LL3C68Z8AEbVdLe7Cl9Dp5auNVNS29osGiBVmKGZqh
	uly7MYf69MKl1Iyqh6Px/V4jX5QPd8WvG/jx60/BhLJ+PLj2PtcdD4rAaOOqxwpS8AnO5CqT8nT4w
	jMD/j861BTpVk3RX0aLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grgje-00057H-BW; Thu, 07 Feb 2019 10:16:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgjc-000577-CV
 for linux-mtd@bombadil.infradead.org; Thu, 07 Feb 2019 10:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fuc+bYAtV2yT7Ej0JaxDitiTLRPpXWb4PCNqtpSx0bU=; b=jUm9/gTTGiR61TmtEf0boAuEar
 fFQbO3pQMaftRC8xP0aIA5gzgpOVE2TTiAVS+BYbmmZnK1D/0W76i5seOebDZwlW32XH4NbshJ31B
 /j8iLVnoS3MmXwhto3aRGTHOMoZQUPIg/+ipTraOmWvDYAoa9Ld+qUKOPZvC7oQjF5+CEyriCCzBe
 d8Z+R+vuxd+oQJg0wacgo5GcuI1iPknJx0FBChsRMx+SwtJb+lR3tKOnJ8X6zCHhWKqCHZ0+bnGOP
 SyrTFBLnA3cLZtrslHx7G2Ja/7K08ID6oHPVaHUJeXZPgAhoeU5E8eeyrBHCT/ZQH9qNHEF7HInkI
 EDIhBVdg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgjY-0008SF-Sk
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:16:43 +0000
X-Originating-IP: 90.88.22.177
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 261A360009;
 Thu,  7 Feb 2019 10:16:06 +0000 (UTC)
Date: Thu, 7 Feb 2019 11:16:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once
 again after nand_detect
Message-ID: <20190207111606.6b72dc34@xps13>
In-Reply-To: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_101641_072745_DDAE0AE4 
X-CRM114-Status: GOOD (  22.75  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUaHUsICA3IEZlYgoyMDE5IDE4OjU3OjU2ICswOTAwOgoKPiBuYW5kX3Nj
YW5faWRlbnQoKSBjYWxscyBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSBhdCBpdHMgZW50cnkK
PiB0byBzZXQgdXAgdGhlIGluaXRpYWwgdGltaW5nIHBhcmFtZXRlcnMuCj4gCj4gVGhlIHRpbWlu
ZyBwYXJhbWV0ZXJzIGFyZSBuZWVkZWQgbm90IG9ubHkgZm9yIC0+c2V0dXBfZGF0YV9pbnRlcmZh
Y2UoKSwKPiBidXQgYWxzbyBmb3IgZ2l2aW5nIHRoZSBjb3JyZWN0IGRlbGF5IHRvIE5BTkRfT1Bf
V0FJVF9SRFksIGZvciBleGFtcGxlLgo+IAo+IElmIHRoZSBkcml2ZXIgc2V0cyB0aGUgTkFORF9L
RUVQX1RJTUlOR1MgZmxhZywgb3IgZG9lcyBub3Qgc3VwcG9ydAo+IC0+c2V0dXBfZGF0YV9pbnRl
cmZhY2UoKSBob29rLCB0aG9zZSBwYXJhbWV0ZXJzIHdpbGwgbmV2ZXIgdXBkYXRlZC4gCgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
IGJlIAoKPiAKPiBCZWZvcmUgbmFuZF9kZXRlY3QoKSwgd2UgbmV2ZXIga25vdyB3aGV0aGVyIHRo
ZSBjaGlwIGlzIE9ORmkgb3Igbm90Lgo+IFNvLCBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSBo
YXMgdG8gYXNzdW1lIHRoZSB3b3JzdCBjYXNlLCBpLmUuCj4gbm9uLU9ORmkuCgpzL09ORmkvT05G
SS8/Cgo+IAo+IEFmdGVyIG5hbmRfZGV0ZWN0KCksIGlmIHRoZSBjaGlwIHR1cm5zIG91dCB0byBi
ZSBPTkZpLWNvbXBsaWFudCwKPiB3ZSBjYW4gb3B0aW1pemUgdFBST0dfbWF4LCB0QkVSU19tYXgs
IGV0Yy4KPiAKPiBDYWxsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIG9uY2UgYWdhaW4uCgpT
b3JyeSBidXQgSSBkb24ndCBnZXQgd2h5IHRoaXMgaXMgbmVlZGVkIGFzIHRoZXJlIGlzIHRoZSBz
YW1lIGNhbGwgYXQKdGhlIHRvcCBvZiB0aGlzIGZ1bmN0aW9uLiBDYW4geW91IGJlIG1vcmUgc3Bl
Y2lmaWMgb24gd2hlcmUvd2hlbiB0aGUKbWlzc2luZyBjYWxsIHByb2R1Y2VzIGEgZmFpbHVyZT8K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29j
aW9uZXh0LmNvbT4KPiAtLS0KPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMKPiBpbmRleCA5YjNkN2ZmLi4zNWU1NDNjIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMKPiBAQCAtNTA0MCw2ICs1MDQwLDkgQEAgc3RhdGljIGludCBuYW5kX3Nj
YW5faWRlbnQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG1heGNoaXBzLAo+
ICAKPiAgCW5hbmRfZGVzZWxlY3RfdGFyZ2V0KGNoaXApOwo+ICAKPiArCS8qIElmIHRoZSBjaGlw
IHR1cm5zIG91dCBPTkZpLCB3ZSBjYW4gb3B0aW1pemUgdGltaW5nIHBhcmFtZXRlcnMuICovCj4g
KwlvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoY2hpcCwgTkFORF9TRFJfSUZBQ0UsIDApOwo+ICsK
PiAgCS8qIENoZWNrIGZvciBhIGNoaXAgYXJyYXkgKi8KPiAgCWZvciAoaSA9IDE7IGkgPCBtYXhj
aGlwczsgaSsrKSB7Cj4gIAkJdTggaWRbMl07CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
