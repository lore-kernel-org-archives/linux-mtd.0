Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8560C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:00:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E0421D40
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mOR6nLki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E0421D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDhQtkMtNvCIdI0GZaPJMXGbtTV3vND6eL6xl0OIRRU=; b=mOR6nLkirOPt6RJR5DwquFcmR
	zLM3uXDCteVn06fDVkwKGO8SpB5tyUNeQBpL0BpwIJFIoCXtOeEqae1Dh2VRE+hicYngyMY6Mygx8
	fH01iB8L7xYgPLKAd/nkQuK7EyZwyr3I1d2m7OhZmS/I2hdYDze4TFe0ixwHQpdUKuLVIrLVpSMA5
	Ypue1Zr3ysUghpE09KaZjP3kuFsvwkLS/2n0PBO8CI54ZT8Rj8Do/r/tOh6rdeJevfbArseDwxmpP
	AZoC27iT+W/Y3fWJ5GizKhy1zwKKkMM2y6gzHVvqRM4z6VfWzbKIIM33bV00EgHtfXClaYrCQq2CN
	ndaEuCmLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZuyd-0005sn-04; Tue, 03 Nov 2020 11:59:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZuyS-0005qS-Oo
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 11:59:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9802C60B33ED;
 Tue,  3 Nov 2020 12:59:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oQdy23ef3ZQl; Tue,  3 Nov 2020 12:59:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 343706125F2E;
 Tue,  3 Nov 2020 12:59:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CAsv9HTMQe0m; Tue,  3 Nov 2020 12:59:31 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1515D60B33ED;
 Tue,  3 Nov 2020 12:59:31 +0100 (CET)
Date: Tue, 3 Nov 2020 12:59:31 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <782317824.260495.1604404771008.JavaMail.zimbra@nod.at>
In-Reply-To: <f013d7af-6e1d-5b8f-4a23-7f6c150f896a@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201012180404.6476-3-p.yadav@ti.com>
 <f013d7af-6e1d-5b8f-4a23-7f6c150f896a@ti.com>
Subject: Re: [PATCH 2/3] UBI: Do not zero out EC and VID when multi-pass
 writes are not supported
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: Do not zero out EC and VID when multi-pass writes are not
 supported
Thread-Index: IYY5CPrwbEGqjygzDycc3Mf8hJzERg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_065940_971971_5ECF53B2 
X-CRM114-Status: UNSURE (   4.48  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pratyush Yadav <p.yadav@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlZpZ25lc2ggUmFnaGF2ZW5k
cmEiIDx2aWduZXNockB0aS5jb20+Cj4KPiBZb3UgbWF5IHdhbnQgdG8gZ2V0IHJpZCBvZiBhc3Nl
cnRpb24gZm9yIG10ZC0+d3JpdGVzaXplICE9IDEgaW4gY2FzZSBvZgo+IE1URF9OT1JGTEFTSC4K
CkFncmVlZC4gSSBob3BlIG5vdGhpbmcgZWxzZSBicmVha3MgaWYgTk9SIGhhcyBzdWRkZW5seSBh
IHdyaXRlc2l6ZSA+PSAxLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
