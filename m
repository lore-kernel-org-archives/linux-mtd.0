Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F6DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2Fj9inKkJIb+9BOhARW9Vzv/nnIAbUdqXHRe4tyy0Hk=; b=RfQ7niO/dP4MriFyOsyhhFLy6m
	2b5f9/t7yk2MVCN5zrR4QiIFcPJ7ujnOn6G6QPGfJ3ZqgUWa2EFbr1OIOQq/JFQNhrlvtSxfgi5u6
	XBIM34Fp1w5KdfwBFmTqmIRdCkFkE0p+oz+IQrVtmIRVnZPxICymXMAc0qdbN3CMcUypQmpfL/XYs
	fLoORcRnxS6BptJQ4e56XFHMMiDwWi6CPT3hKXHvdu13NebVwWZlWm0pinGFCZvbVONPkBUMNy1HS
	Y+WT1Pc2VlFw26V2kVeL8HuyeCCBg5gnp+oIEXaZf8TJPQrYR81mkKMiuQYZi09XYIwlG9doQLir5
	k+vHN79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7bgr-002GAo-Jk; Wed, 12 Jan 2022 11:21:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7bgp-002G9O-0K
 for linux-mtd@lists.infradead.org; Wed, 12 Jan 2022 11:21:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1F4AF614E2CD;
 Wed, 12 Jan 2022 12:21:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0MUe_mo7SAe9; Wed, 12 Jan 2022 12:21:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 90DCA614E2CF;
 Wed, 12 Jan 2022 12:21:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id INi9dmG6Ndt1; Wed, 12 Jan 2022 12:21:03 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7082B614E2CD;
 Wed, 12 Jan 2022 12:21:03 +0100 (CET)
Date: Wed, 12 Jan 2022 12:21:03 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <dedekind1@gmail.com>
Message-ID: <1878699032.252529.1641986463352.JavaMail.zimbra@nod.at>
In-Reply-To: <0ce6e992f6f24238bcb599f84aef243d@axis.com>
References: <e90b59f8c1f842cca8a6db59239a9d67@XBOX02.axis.com>
 <0ce6e992f6f24238bcb599f84aef243d@axis.com>
Subject: Re: ubi2 error: scan_pool: unable to read EC header! PEB:569 err:1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubi2 error: scan_pool: unable to read EC header! PEB:569 err:1
Thread-Index: AQHYB6K16bkKIx7DMEiexDW+j9+B2F41rV6I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_032115_243403_21EA6974 
X-CRM114-Status: UNSURE (   6.10  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgWCBBbmRlcnNz
b24iIDxSaWNrYXJkLkFuZGVyc3NvbkBheGlzLmNvbT4KPiBBbjogImxpbnV4LW10ZCIgPGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIkFydGVtIEJpdHl1dHNraXkiIDxkZWRla2luZDFA
Z21haWwuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sCj4gIlJpY2hhcmQgV2VpbmJl
cmdlciIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+Cj4gR2VzZW5kZXQ6IE1pdHR3b2No
LCAxMi4gSmFudWFyIDIwMjIgMTE6NTQ6MDEKPiBCZXRyZWZmOiB1YmkyIGVycm9yOiBzY2FuX3Bv
b2w6IHVuYWJsZSB0byByZWFkIEVDIGhlYWRlciEgUEVCOjU2OSBlcnI6MQoKPiBIaSwKPiAKPiBB
ZnRlciBhIGZpcm13YXJlIHVwZ3JhZGUgdGhlIGZvbGxvd2luZyBlcnJvciBpcyByZXBvcnRlZCBi
eSB0ZXN0ZXJzIGFmdGVyCj4gcmVib290Ogo+IAo+IFsgICAgOC4wMTc3MjBdWyAgVDMwNl0gdWJp
MiBlcnJvcjogc2Nhbl9wb29sOiB1bmFibGUgdG8gcmVhZCBFQyBoZWFkZXIhIFBFQjo1NjkKPiBl
cnI6MQo+IFsgICAgOC4wMTc5MDBdWyAgVDMwNl0gdWJpMiBlcnJvcjogdWJpX3NjYW5fZmFzdG1h
cDogQXR0YWNoIGJ5IGZhc3RtYXAgZmFpbGVkLAo+IGRvaW5nIGEgZnVsbCBzY2FuIQoKMSBpcyBV
QklfSU9fRkYuIFNvIGEgZmFzdG1hcCBwb29sIHBvaW50cyB0byBhIGZyZXNobHkgZXJhc2VkIGJs
b2NrLgogCj4gSXMgdGhpcyBzb21ldGhpbmcgd2UgbmVlZCB0byB0YWtlIHNvbWUgYWN0aW9uIHRv
IHNvbHZlIG9yIGlzIGl0IHVuaGFybWZ1bD8KPiBFdmVyeXRoaW5nIHNlZW1zIHRvIHdvcmsgYXMg
bm9ybWFsLgoKTG9va3MgbGlrZSBlcmFzaW5nIGEgUEVCIHdhcyBpbnRlcnJ1cHRlZCAoYnkgYSBw
b3dlci1jdXQpIGJlZm9yZSBVQkkgaGFkIGEgY2hhbmNlIHRvCndyaXRlIGFuIEVDIGhlYWRlciB0
byBpdCBhbmQgRmFzdG1hcCBiZWluZyBwYXJhbm9pZCByZWZ1c2VkIHRvIGRvIGEgZmFzdCBhdHRh
Y2guCgpBZnRlciB0aGF0IGV2ZW50LCBkaWQgZXZlcnl0aGluZyB3b3JrIGFnYWluIGFuZCBGYXN0
bWFwIGlzIGhhcHB5PwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
