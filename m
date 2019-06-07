Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE52C2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8AE20657
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PADcR55h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8AE20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+N9bEljVwEZZk6zhkg8K1GPLeIuOc0lYb48PjivyE88=; b=PADcR55hcCR6BW
	Lz1eR3ESjWnt4pvxVAqVHnJiTwfZ7bw7oa4jAdgQqOeSo/E2gLZ38S69ru/idXbwGDUKsRo+6grkx
	vWiGMhRbjy/7320CYV9TYxJQmtVKMcfPt37l1HUId518cVy3JhBTQ4jyJ7IMrEiT/GK2YCuB0QVW+
	tPrXgYJPhDekaTwDLELH++vsIPQcIpMLFjU3kAxFwpnswk7zAkBIxWORyzUAkoqELwsXU+rur5t+v
	nir8dBibaXUgG3ol+AUnHwbDlk+Ki6TvD0LqQYUC4nmEYWj+DKfkyYZFdTD2PKXppDvhVNs609aku
	t3l7Qm0ixhaMV+Wh78EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZHK4-00079f-TR; Fri, 07 Jun 2019 16:02:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZHJz-000784-By
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 16:02:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 928DA6083112;
 Fri,  7 Jun 2019 18:02:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rjlZoY0k9Kgv; Fri,  7 Jun 2019 18:02:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4A4EE6083113;
 Fri,  7 Jun 2019 18:02:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rerAJSvn3Dop; Fri,  7 Jun 2019 18:02:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A6236083112;
 Fri,  7 Jun 2019 18:02:16 +0200 (CEST)
Date: Fri, 7 Jun 2019 18:02:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sergei Poselenov <sposelenov@emcraft.com>
Message-ID: <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
In-Reply-To: <20190607172355.6541fa51@sergmir.emcraft.com>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <CAFLxGvx4iqpU8pq8CPwah9M+Qa2YkpXEiSmndeVy2mLadNQn_g@mail.gmail.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: UBIFS: file data corruption during the power cut-off test
Thread-Index: E6SiRGl2ZRb0VUh4D5XPlS39uvDcPw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_090230_261996_DA694FAC 
X-CRM114-Status: UNSURE (   4.77  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE5vdywgSScgb3ZlcndyaXRpbmcgdGhl
IGNvbnRlbnQgb2YgdGhlICJ0ZXN0MCIgd2l0aCAidGVzdDIiLCB3aXRob3V0ICJ0ZXN0MCIKPiB0
cnVuY2F0aW9uOgo+IG1udC9kYXRhMSAjIGRkIGlmPXRlc3QyIG9mPXRlc3QwIGNvbnY9bm90cnVu
Ywo+IDIyMiswIHJlY29yZHMgaW4KPiAyMjIrMCByZWNvcmRzIG91dAo+IDExMzY2NCBieXRlcyAo
MTExLjBLQikgY29waWVkLCAwLjg1OTY2OCBzZWNvbmRzLCAxMjkuMUtCL3MKPiAvbW50L2RhdGEx
ICMgbWQ1c3VtICoKPiAyMzM3NjMxOWRlNjI5MzRjMzg1OTYxNWU2MjQ0YWFlMCAgdGVzdDAKPiAy
MzM3NjMxOWRlNjI5MzRjMzg1OTYxNWU2MjQ0YWFlMCAgdGVzdDEKPiA4N2NkMWQxYTI4ODk2ZTYz
ZWIwMzlkNzVlZmVmNDNhMyAgdGVzdDIKPiAvbW50L2RhdGExICMKPiAKPiBGb3IgdGhpcyBwYXJ0
aWN1bGFyIHRlc3QgcGFzcywgdGhlIGNvbnRlbnQgb2YgdGVzdDIgbWF0Y2hlcyB0aGUgY29udGVu
dCBvZiB0aGUKPiBvcmlnaW5hbCBmaWxlIHRlc3QwLCBzbyBvdmVyd3JpdGluZyB0ZXN0MCB3aXRo
IHRlc3QyIGRvZXNuJ3QgY2hhbmdlIHRoZSBkYXRhLgo+IAo+IEhvd2V2ZXIsIHVwb24gcmV0cnkg
b2YgdGhlIHZlcnkgc2FtZSB0ZXN0IGZyb20gdGhlIGJlZ2lubmluZyAod2l0aCB0aGUgcG93ZXIK
PiBjdXQtb2ZmIGluIHRoZSBtaWRkbGUpIGl0J3MgZWFzaWx5IHRvIGhhdmUgdGhlIGNvbnRlbnQg
b2YgdGVzdDIgKGV4YWN0bHkgdGhlCj4gbGFzdCA1MTIgYnl0ZXMgaW4gbXkgY2FzZSkgd2hpY2gg
ZG9lc24ndCBtYXRjaCB0ZXN0MCwgc28gImRkIGlmPXRlc3QyIG9mPXRlc3QwCj4gY29udj1ub3Ry
dW5jIiB3aWxsIHJlc3VsdCBpbiB0ZXN0MCB3aXRoIGEgZGlmZmVyZW50IGNoZWNrc3VtLgo+IAo+
IFRvIHJlbWluZCwgdGhlIHBhcnRpdGlvbiBpcyBtb3VudGVkIHdpdGggdGhlICJzeW5jIiBvcHRp
b24uCgpBaGhoLCBub3cgdW5kZXJzdGFuZCB3aGF0IHlvdSBkby4gU29ycnkgZm9yIGJlaW5nIGRl
bnNlLgoKSSBmZWFyIHlvdXIgYXNzdW1wdGlvbiBpcyBub3QgY29ycmVjdCBiZWNhdXNlIFVCSUZT
IGlzIHN0cmljdGx5IGNvcHktb24td3JpdGUuClNvIGlmIHlvdSBvdmVyd3JpdGUgYSBmaWxlLCBp
dCB3aWxsIGFsd2F5cyBjcmVhdGUgbmV3IGRhdGEgYmxvY2tzLiBBIGRhdGEgYmxvY2sKaGFzIDRr
LiBJZiB5b3UgZmFjZSBhIHBvd2VyLWN1dCBmcm9tIHRoaXMgNGsgYmxvY2sgdGhlIGxhc3Qgd3Jp
dHRlbiBwYWdlIGNhbiBiZQpsb3N0LiBUaGlzIGlzIGxpa2VseSB3aGF0IHlvdSBzZWUuCgpEb2Vz
IG15IGFuc3dlciBoZWxwPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
