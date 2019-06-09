Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE330C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890522089E
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBZuSSNf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 890522089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvxeEPJi+NAWruRf1iAghjQEiG5mtJiil/dM8QkuSFA=; b=bBZuSSNf/B8rJJ
	iK0oJRwx+al5sSVpSvQ7N5UWxCmqFfQfXRLdkRSnUtPZs6Aq5asjdQumpxl/FpwgW4zUScUicj0+R
	F6lii2qRp2APxkhmIs16N15S4ePCoQK1fTbTEgwuKW3ncoNwJ8Gk+6IxcFGEoHpNz57yQHs8V5qYT
	FfbP9q+dd3GUesWGOAl/vXEkRox2JKv3zh1Q7GDkflz1RRXryz2cFCsI/F9itNhKAkQnRt8eL0PJA
	W6wGCdgvD3EwCBIOIWNRH1W02tf7BB2UV4Fp1MthHeMf/9JQZcQ/fLCK/H66w3dM0Cnqftj5uqZh6
	SlkHUYzYcdBB7Dz/GWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZtaD-0004Bj-6t; Sun, 09 Jun 2019 08:53:45 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZta9-0004BO-AE
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 08:53:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C7AC2608310F;
 Sun,  9 Jun 2019 10:53:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nUs9XpeDK35U; Sun,  9 Jun 2019 10:53:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4CFD66083114;
 Sun,  9 Jun 2019 10:53:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id a4kipmp2DdGA; Sun,  9 Jun 2019 10:53:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2D20A6074CFA;
 Sun,  9 Jun 2019 10:53:34 +0200 (CEST)
Date: Sun, 9 Jun 2019 10:53:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sergei Poselenov <sposelenov@emcraft.com>
Message-ID: <1957000286.85744.1560070414116.JavaMail.zimbra@nod.at>
In-Reply-To: <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
 <08a796c9a296245c372511c683adb80913d14553.camel@emcraft.com>
 <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
 <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: UBIFS: file data corruption during the power cut-off test
Thread-Index: p6/HiKbf8zImGlUuqIoOVrlWbBoItQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_015341_505137_0D95489B 
X-CRM114-Status: UNSURE (   5.53  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE5vdywgdGhlIHF1ZXN0aW9uOiB3aHkg
YXJlIHRoZXNlIDUxMiBieXRlcyBvZiB6ZXJvcyBpbiB0ZXN0ND8KPiAKPiBFeHRyYXBvbGF0aW5n
IHRvIGEgcmVhbCB1c2UgY2FzZSwgY29uc2lkZXIgYSBzeXN0ZW0gd3JpdGluZyBhIGxvZyBmaWxl
Cj4gdG8gdGhlIFVCSSBwYXJ0aXRpb24uIFBvd2VyIGN1dG9mZiwgcmVjb3ZlcnksIGFuZCB3ZSBo
YXZlIGEgZ2FyYmFnZSBhdAo+IHRoZSBlbmQgb2YgdGhlIGxvZyBmaWxlLiBJcyB0aGlzIGV4cGVj
dGVkPwoKV2VsbCwgemVybyBieXRlcyBhcmUgbm90IGdhcmJhZ2UuIDspCkJ1dCB5ZXMsIHRoaXMg
aXMgaXMgZXhwZWN0ZWQuIEluIHlvdXIgY2FzZSwgSSBndWVzcywgdGhlIGlub2RlIHNpemUKZG9l
cyBub3QgbWF0Y2ggZXhhY3RseSB3aGF0IGlzIHByZXNlbnQgb24gZmxhc2guClNvIHRoZSBmaWxl
IHNpemUgaXMgNTEyIGJ5dGVzIHRvbyBsYXJnZSwgaWYgeW91IHJlYWQgdG9vIGZhciwgMHgwIGJ5
dGVzIGFyZSByZXR1cm5lZC4KRHVyaW5nIGpvdXJuYWwgcmVwbGF5IFVCSUZTIHRyaWVzIHRvIGZp
eHVwIGZpbGUgbGVuZ3RocyBidXQgaXMgYXBwcm9hY2gKZG9lcyBub3Qgd29yayBpbiBhbGwgY2Fz
ZXMgcGVyZmVjdGx5LgoKVGhpcyBjYXNlIGlzIGFjdHVhbGx5IGRvY3VtZW50ZWQsIHBsZWFzZSBz
ZWU6Cmh0dHA6Ly93d3cubGludXgtbXRkLmluZnJhZGVhZC5vcmcvZG9jL3ViaWZzLmh0bWwjTF9z
eW5jX3NlbWFudGljcwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
