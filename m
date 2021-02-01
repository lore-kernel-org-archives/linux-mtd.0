Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B31C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:07:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D775864DA5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D775864DA5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6aLGj+6/jfX0eIRzvHCpHkRtuETSWpnU6NBAspM5VJ4=; b=mEiFdk5hsEIMtxOooqDD7EER9
	uxEh8akshwJjVP4oXRTAJp0qw7yOaurH8UvfYKH3ntj/nkOSojS7+GXsaZUUyTFKOR9Z6VwTba4zJ
	3tqj478hUYp6WQKMQF3yXhOT0FWkCcUF+CHTymMMe3ltRnC4ROkVjupNeWOxgll94aJZBtvUqwsDE
	MtD88LBOPfRr7tjoNEY46xS0kuP3PvOPE3njFKZeQ+uwcY0Za/ZVPV+bPp6o4K5zbfHZ7bz/vHySR
	Jo1GwXtKW356pDukVHUifsX379hl4v+92GPpQpCqu8KYyczXqdBgW3pVz5NtB1jUW93Gl+1C/tw+7
	gpRDTt0yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6amh-0001wj-Ur; Mon, 01 Feb 2021 15:06:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6amf-0001wB-H8
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 15:06:34 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6E5F3200017;
 Mon,  1 Feb 2021 15:06:30 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:06:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH 1/3] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210201160629.4c872643@xps13>
In-Reply-To: <20210201154429.4bd5e15a@xps13>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210201154429.4bd5e15a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_100633_659129_787162E9 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cj4gPiArCQkJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRChTUElOT1JfT1BfV1JfQ1IyLCAxKSwK
PiA+ICsJCQkJICAgU1BJX01FTV9PUF9BRERSKDQsIFNQSU5PUl9SRUdfTVhJQ19DUjJfREMsIDEp
LAo+ID4gKwkJCQkgICBTUElfTUVNX09QX05PX0RVTU1ZLAo+ID4gKwkJCQkgICBTUElfTUVNX09Q
X0RBVEFfT1VUKDEsIGJ1ZiwgMSkpOwo+ID4gKwo+ID4gKwkJcmV0ID0gc3BpX21lbV9leGVjX29w
KG5vci0+c3BpbWVtLCAmb3ApOwo+ID4gKwkJaWYgKHJldCkKPiA+ICsJCQlyZXR1cm4gcmV0Owo+
ID4gKwo+ID4gKwkJcmV0ID0gc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsKPiA+ICsJCWlm
IChyZXQpCj4gPiArCQkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJCW5vci0+cmVhZF9kdW1teSA9
IDIwOyAgCj4gCj4gSSBhbSBub3QgZW50aXJlbHkgY29udmluY2VkIGJ5IHRoaXMgdmFsdWUsIHll
dC4KPiAKPiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHlvdXIgaXNzdWUsIHRoZSBmbGFzaCBu
ZWVkcyBzb21lIGV4dHJhIHRpbWUKPiBiZWZvcmUgcmVjZWl2aW5nL3NlbmRpbmcgZGF0YS4gWW91
IGVzdGltYXRlIGl0IHRvIGJlIGFyb3VuZCA4MDBucwo+ICgyMCBieXRlcyBAIDIwTUh6KSwgc28g
d291bGQgaXQgYmUgcG9zc2libGUgdG8gZGVyaXZlIHRoZSBtaW5pbXVtCj4gbnVtYmVyIG9mIGR1
bW15IGN5Y2xlcyBuZWVkZWQgZm9yIHRoZSBmbGFzaCBhbmQgdXNlIGEgZHluYW1pYyB2YWx1ZT8K
PiBPdGhlcndpc2UgaWYgdGhlIGNvbnRyb2xsZXIgaXMgbm90IHJ1bm5pbmcgYXQgdGhlIG1heGlt
dW0gZnJlcXVlbmN5Cj4geW91J2xsIGVuZCB1cCB3YWl0aW5nIGEgbG90IG1vcmUgdGhhbiBleHBl
Y3RlZC4KCkp1c3QgdG8gY2xhcmlmeSwgSSBtZWFudCAyMCBieXRlcyBAIDIwME1oeiwgbm90IDIw
TUh6LCBhbmQgSSBnb3QKcG9zc2libHkgZm9vbGVkIGJ5IHRoZSBmYWN0IHRoYXQgd2UgYXJlIHRh
bGtpbmcgYWJvdXQgRERSIG1vZGUsIHNvCjQwMG5zIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJhdGUg
dGhhbiA4MDAuIEJ1dCBubyBtYXR0ZXIgdGhlIGFjdHVhbApudW1iZXJzLCBsZXQncyBkaXNjdXNz
IHRoZSBsb2dpYyBtb3JlIHRoYW4gdGhlIHZhbHVlcy4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
