Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BB4C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 22:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7180F64E2A
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 22:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7180F64E2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmaYoS60BMzLg6n5jm8Jox4D1qTNWT4F50PGAqekKw0=; b=A+xTQrJIp1UAVg44nwVy4dk8Q
	+vwcRdDKBf+ORN5/LYfHDuWNlVvzlnJ7m4Jah5kJOAENsZX/47pWySF/bTjupgD2l4+fi+SXGBKFM
	pdKSProLtaos0+4klWCCUGQb7gCWhuDeZdluDmSn9hj7vtUiRwVBLkQd7JpJdMHtWE9Ndflq3ibFE
	7BSkIVIQoxGUmsgFCGLFISbfBiPSXXHJDsRbg9jFgkQHd2xJJfSqY93WHwZV3p4b07BytuEXAssz5
	Cy5N870rnysI+bUxxtnrTy6pjmd8D1hRHV9LTo1uqUgONpM6meMh+hwr2Bo6WUkBJ6cMS8Q0b6EWD
	YaAfwxLVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lB2ye-0002Cj-My; Sat, 13 Feb 2021 22:01:20 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lB2yb-0002Bq-Gn
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 22:01:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A3C726089E03;
 Sat, 13 Feb 2021 23:01:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rfBklMJXd1Ph; Sat, 13 Feb 2021 23:01:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5A8FA6074009;
 Sat, 13 Feb 2021 23:01:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HnNK8I15Gyfa; Sat, 13 Feb 2021 23:01:04 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 39A476089E03;
 Sat, 13 Feb 2021 23:01:04 +0100 (CET)
Date: Sat, 13 Feb 2021 23:01:04 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Juergen Borleis <jbe@pengutronix.de>
Message-ID: <205753680.392561.1613253664135.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHp75VdJZUd6YoJ26jw0oAEQ0-k6AVXBqzVhs3oFy5+mZXiSjw@mail.gmail.com>
References: <20210202124838.30805-1-jbe@pengutronix.de>
 <CAHp75VfwD25Vfb_81eoZDG=GktSdiROtg7=2tPMDMV8k2iqdag@mail.gmail.com>
 <2022320545.389724.1613165655531.JavaMail.zimbra@nod.at>
 <CAHp75VdJZUd6YoJ26jw0oAEQ0-k6AVXBqzVhs3oFy5+mZXiSjw@mail.gmail.com>
Subject: Re: [PATCH] fs: ubifs: set s_uuid in super block to support ima/evm
 uuid options
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: set s_uuid in super block to support ima/evm uuid options
Thread-Index: ie37LadzhlxH0LWvJBRqlvqvABdvrw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_170117_702647_2412C13B 
X-CRM114-Status: UNSURE (   5.70  )
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
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBIbW0sIEkgZGlkbid0IGtub3cgdGhh
dCBoZWxwZXIuCj4+IFRoZSBvbmx5IHVzZXIgaW4gZnMvIHNlZW1zIHRvIGJlIHpvbmVmcywgYWxs
IG90aGVyIGZpbGVzeXN0ZW1zIGRvIGEgcGxhaW4KPj4gbWVtY3B5KCkuCgo+PiBEbyB5b3Ugd2Fu
dCBtZSBkbyBhIHBhdGNoIHRoYXQgY29udmVydHMgYWxsIHVzZXJzIGluIGZzLyB0byBpbXBvcnRf
dXVpZCgpPwo+IE5vdCBzdXJlIGFib3V0IGFsbCBmcywgYnV0IGluIG5ldyBjb2RlLCBsaWtlIGhl
cmUgSSB0aGluayBpdCBtYWtlcyBzZW5zZS4gQWxzbwo+IGNoZWNrIGV4cG9ydF91dWlkKCkgYW5k
IHV1aWRfY29weSgpLgoKT2theS4gSSd2ZSBkcm9wcGVkIHRoZSBwYXRjaCBmcm9tIGxpbnV4LW5l
eHQuCkp1ZXJnZW4sIHBsZWFzZSBhZGRyZXNzIEFuZHkncyBjb21tZW50cyBhbmQgcmVzZW5kLgoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
