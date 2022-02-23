Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F656C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uLR4hmV400egWe8HNXGJuGOGZsTPehx7z5AKrDkCnnE=; b=rn6VqhpwstlBG4WSalLb02c5Yf
	qcTg6o1KTl6oRamMtqn9zAf8GROrBrutpNA+j9lG+IOUvFJVAGxNsyoUgh7ahj+M2niGKFCkesVYA
	MzVzQD91XaClG0oRfNutjP2Gq6g22WC2Fi3aTfdkVKjI/66oy33imYyE+zblhx9Zw0lUodGpq4gFk
	y95aFVOMdKzH/SZhGrDPIstMKLdgfORlLQAF3o5A9y5LAjsdAOD3pjaT6/VA1AgrEznv4/TTsLNdS
	1+Jz+udyC8tNGcBVnx85NDYgVqIbY+MGpZtAaV1QXHhpYpUHMjTKTSkkDNiF2zPN/PSDoKmVdVRf+
	Spqb4y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpMV-00DmWP-0M; Wed, 23 Feb 2022 10:59:11 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpMS-00DmU2-0W
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 10:59:09 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id BFFB05F896;
 Wed, 23 Feb 2022 11:59:02 +0100 (CET)
To: Han Xu <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?Q?Lothar_Wa=c3=9fmann?=
 <LW@KARO-electronics.de>, Brian Norris <computersforpeace@gmail.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
From: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
Date: Wed, 23 Feb 2022 11:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20220222220235.pyvhaiieimf7uv74@umbrella>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_025908_245964_59A99955 
X-CRM114-Status: GOOD (  11.00  )
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

QW0gMjIuMDIuMjIgdW0gMjM6MDIgc2NocmllYiBIYW4gWHU6Cj4gT24gMjIvMDIvMjEgMDg6MDBQ
TSwgRGFuaWVsIEdsw7Zja25lciB3cm90ZToKPj4gd2UgYXJlIHVzaW5nIFVCSSBvbiBhIE5BTkQg
Zmxhc2ggd2l0aCBCQlQgYW5kIGhhdmUgcmVjZW50bHkgb2JzZXJ2ZWQKPj4gYmFkIGJsb2NrcyB3
aGVyZSBuYW5kX21hcmtiYWRfYmJtIHJldHVybnMgYW4gZXJyb3IuIFNpbmNlIHRoYXQgZXJyb3Ig
aXMKPj4gcmV0dXJuZWQgYnkgbmFuZF9ibG9ja19tYXJrYmFkX2xvd2xldmVsIGV2ZW4gd2hlbiBt
YXJraW5nIHRoZSBibG9jayBpbgo+PiB0aGUgQkJUIHN1Y2NlZWRzLCBVQkkgZ29lcyBpbnRvIHJl
YWQtb25seSBtb2RlLiBXZSB3b3VsZCB0aGVyZWZvcmUgbGlrZQo+PiB0byBzZXQgTkFORF9CQlRf
Tk9fT09CX0JCTS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJlIG1vcmUgZGV0YWlscyBh
Ym91dCB3aGF0IGtpbmQgb2YgZXJyb3IsIGhvdyB0bwo+IHJlcHJvZHVjZSBpdCBhbmQgb24gd2hp
Y2gga2VybmVsIHZlcnNpb24/CgpZb3UgbmVlZCBhIGZsYXNoIHRoYXQgaGFzIG9uZSBiYWQgYmxv
Y2sgd2hlcmUgcHJvZ3JhbW1pbmcgdGhlIEJCTSBzZXRzCk5BTkRfU1RBVFVTX0ZBSUwgaW4gaXRz
IHN0YXR1cyByZWdpc3Rlci4gVGhlIGxhdGVzdCBrZXJuZWxzIHNob3VsZCBzdGlsbApoYXZlIHBy
b2JsZW1zIHdoZW4gdGhpcyBoYXBwZW5zIGluIGEgVUJJLgoKQmVzdCByZWdhcmRzLAoKICBEYW5p
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
