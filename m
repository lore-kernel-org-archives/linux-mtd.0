Return-Path: <SRS0=jI2T=XW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4BAC4360C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 15:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01864217D7
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 15:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6S96f/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01864217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHzIcnWxGdCkMBWG1RySqrojfDohhSwmR/vy4KNcS9w=; b=c6S96f/0aXgcYK
	OFPuHkuWrF3tge7TNfr+dRGE1j44NaxC4Symm/tpELkF8YubmznJQ//T4P5oCf99u7Sbu9xA8gJOs
	2BW5aEMEFpRmPNSr2IuplPa6RdP8ntt9g/+yZ2URNI8+/AmNrszQNSOqXjzFUp/rU+B41stWpql1v
	QDx5amHSRqNbRUgXNLJKvjfUKhIQZhOZa0IDauKvoG+5ICOmpgIdREGRzrI4FORcsAyTvUdNdBpIp
	IG685bj8+P+SsuJT5ibM3fFYf6pVBP4kJJFE/o4EFszQvThkABiRYxGjUBSnFHbCZ6dOtirEqfFND
	MeG27dlX6rULRePWFiYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDsBo-0002bl-V5; Fri, 27 Sep 2019 15:29:48 +0000
Received: from relaygw3-3.mclink.it ([213.21.178.142])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDsBl-0002aT-6X
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2019 15:29:46 +0000
Received: from [172.24.30.41] (HELO smtpoutgw1.mclink.it)
 by relaygw3-3.mclink.it (CommuniGate Pro SMTP 6.0.6)
 with ESMTP id 155842519 for linux-mtd@lists.infradead.org;
 Fri, 27 Sep 2019 17:29:39 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ArAABCKo5d/4zK9V8NWRoBAQEBAQIBA?=
 =?us-ascii?q?QEBDAIBAQEBgWeEOoQikH2DbYYIgT2PbQkBAQEBAQEBAQE3AQGEQAKDWjgTAgw?=
 =?us-ascii?q?BAQUBAQEBAQUEi3IBAQQjDwFGEAsYAgImAgJXBg0GAgEBgx6Bd61xdYEyhU2DO?=
 =?us-ascii?q?4FIgQwojGSBQYERJ4JrPodPglgEgS8BAQGLOIhAghOGcY5oAQYCgVZOlQUGG4I?=
 =?us-ascii?q?3h0yPMalQgXmCXoFOUCSBWheOJHKPRgEB?=
Received: from host140-202-dynamic.245-95-r.retail.telecomitalia.it (HELO
 [192.168.7.100]) ([95.245.202.140])
 by smtpoutgw1.mclink.it with ESMTP; 27 Sep 2019 17:29:39 +0200
Subject: Re: mtdpart add/del usage
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1fc7208e-145f-aeb5-61c5-cc6a8a8aedf6@mclink.it>
 <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
From: Mauro Condarelli <mc5686@mclink.it>
Message-ID: <8d6e58f6-de92-872c-ec2a-8ef5a1b4d492@mclink.it>
Date: Fri, 27 Sep 2019 17:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_082945_402497_29B252B6 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzI3LzE5IDQ6MzEgUE0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiBPbiBGcmks
IFNlcCAyNywgMjAxOSBhdCAzOjIxIFBNIE1hdXJvIENvbmRhcmVsbGkgPG1jNTY4NkBtY2xpbmsu
aXQ+IHdyb3RlOgo+PiAvICMgbXRkcGFydCBkZWwgL2Rldi9tdGQzIDMKPj4gbXRkcGFydDogZXJy
b3IhOiBGYWlsZWQgdG8gaXNzdWUgQkxLUEcgaW9jdGwKPj4gICAgICAgICAgZXJyb3IgMjIgKElu
dmFsaWQgYXJndW1lbnQpCj4+IC8gIyBtdGRwYXJ0IGRlbCAvZGV2L210ZDMgNAo+PiBtdGRwYXJ0
OiBlcnJvciE6IEZhaWxlZCB0byBpc3N1ZSBCTEtQRyBpb2N0bAo+PiAgICAgICAgICBlcnJvciAy
MiAoSW52YWxpZCBhcmd1bWVudCkKPj4gLyAjIG10ZHBhcnQgZGVsIC9kZXYvbXRkMyAyCj4+IG10
ZHBhcnQ6IGVycm9yITogRmFpbGVkIHRvIGlzc3VlIEJMS1BHIGlvY3RsCj4+ICAgICAgICAgIGVy
cm9yIDIyIChJbnZhbGlkIGFyZ3VtZW50KQo+IElzIC9kZXYvbXRkMyByZWFsbHkgdGhlIG1hc3Rl
ciBwYXJ0aXRpb24/Ck5vLCBpdCBpcyBkZWZpbml0ZWx5IG5vdC4KSXQgaXMgdGhlIHBhcnRpdGlv
biBJIHdpc2ggdG8gZGVsZXRlLgo+IElJUkMgeW91IGNhbiBvbmx5IGFwcGx5IHN1Y2ggY2hhbmdl
cyBvbiB0aGUgbXRkIG1hc3Rlcgo+IHBhcnRpdGlvbi4KVGhhdCBtYWtlcyBzZW5zZSBidXQsIGlu
IHNwaXRlIG9mIGhhdmluZyAiQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9eSIsCkkgc2Vl
IG5vICJtdGQgbWFzdGVyIHBhcnRpdGlvbiIuCgouLi4KClBsZWFzZSBmb3JnZXQgYWJvdXQgdGhh
dC4KQWZ0ZXIgYSBjb3VwbGUgb2YgcmVib290cyBJIGFjdHVhbGx5IGhhdmU6CgovICMgY2F0IC9w
cm9jL210ZApkZXY6wqDCoMKgIHNpemXCoMKgIGVyYXNlc2l6ZcKgIG5hbWUKbXRkMDogMDEwMDAw
MDAgMDAwMTAwMDAgInNwaTAuMCIKbXRkMTogMDAwNDAwMDAgMDAwMTAwMDAgInUtYm9vdCIKbXRk
MjogMDAwMTAwMDAgMDAwMTAwMDAgInUtYm9vdC1lbnYiCm10ZDM6IDAwNTUwMDAwIDAwMDEwMDAw
ICJrZXJuZWwiCm10ZDQ6IDAwYTUwMDAwIDAwMDEwMDAwICJmaWxlc3lzdGVtIgptdGQ1OiAwMDAx
MDAwMCAwMDAxMDAwMCAiZmlybXdhcmUiCgphbmQ6CgptdGRwYXJ0IGRlbCAvZGV2L210ZDAgMwoK
d29ya3MgYXMgZXhwZWN0ZWQuCgpJIGFtIHVuc3VyZSB3aHkgSSB3YXMgdW5hYmxlIHRvIHNlZSB0
aGUgbWFzdGVyIGRldmljZSBiZWZvcmUsIGl0ICpzZWVtcyoKY2hhbmdpbmcKanVzdCBDT05GSUdf
TVREX1BBUlRJVElPTkVEX01BU1RFUiBkaWQgbm90IHRyaWdnZXIgcmlnaHQgcmVjb21waWxhdGlv
bi4KQWZ0ZXIgYSBmdWxsIGtlcm5lbCByZWNvbXBpbGUgSSBzZWUgaXQuCgpTb3JyeSBmb3IgdGhl
IG5vaXNlIGFuZApUSEFOS1MhIGZvciB0aGUgaGVscC4KCk1hdXJvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
