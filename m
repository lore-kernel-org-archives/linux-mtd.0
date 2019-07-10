Return-Path: <SRS0=e8Hz=VH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A62C73C7C
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2019 09:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B56F20665
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2019 09:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecOSt4OP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B56F20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agjUTutwcgsYf2nCephOlFfOi9LTHUTe5uwgz6g1GQE=; b=ecOSt4OPSMu4dy
	8XxvAMudtmaChbNN0xysLpD5ExxrH76xIp+s5sxUYYbjFRlJKegiiVsjp5UpvYtGdu0Ej2ZoaaEX7
	gV1xLNw4dTWdATZzeO3xlfTpqoYqDzdThQm5NDhxLHsilCOlurfwCzI8RDET+vil10vPIcYaX28yA
	fxEj0DBvRbVJ2oT9xg8XVBCjONKWcVVJ91+KVHMhr/CEc7EyVYVFCzSTIkI4gLLlBs0BMH0AJ1hC4
	ynR7n85HgWf945uaHKWveqHLVEdW3qQ/3xiXoTmJSjTih6e+mTLpMvtnpDTNrc97KHOV1v8TCuQOf
	LtbdHxH1G7nxzI7A3vEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hl8cL-0002P8-Dr; Wed, 10 Jul 2019 09:10:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hl8cG-0002Oa-Uw
 for linux-mtd@lists.infradead.org; Wed, 10 Jul 2019 09:10:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 273816089332;
 Wed, 10 Jul 2019 11:02:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QAkHxHc6p76f; Wed, 10 Jul 2019 11:02:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DE43D608898B;
 Wed, 10 Jul 2019 11:02:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TWR15XaPeeXm; Wed, 10 Jul 2019 11:02:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BFEB06089332;
 Wed, 10 Jul 2019 11:02:26 +0200 (CEST)
Date: Wed, 10 Jul 2019 11:02:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Lars Persson <lists@bofh.nu>
Message-ID: <1817515813.35893.1562749346619.JavaMail.zimbra@nod.at>
In-Reply-To: <CADnJP=ssoVB_XJ_hp8LgVipz3uH3PFf6j48NBEHseLnaMiN16g@mail.gmail.com>
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <1586391.XHllXIAzYb@blindfold>
 <CADnJP=usEgBQH5tL2k79kFhraDvir6Byt5j7n1FHfT8z84ET+A@mail.gmail.com>
 <2946812.3xOJdY2bgb@blindfold>
 <CADnJP=ssoVB_XJ_hp8LgVipz3uH3PFf6j48NBEHseLnaMiN16g@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
Thread-Index: Mrw54cRh9RojKFZ1tynRACczZPFoaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_021021_154977_EA422CBA 
X-CRM114-Status: UNSURE (   3.08  )
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

TGFycywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBSaWNoYXJkLCB3ZSB0ZXN0
ZWQgdGhpcyBwYXRjaCBmb3IgdHdvIHdlZWtzIGFuZCBzYXcgbm8gZnVydGhlciBpc3N1ZXMuCj4g
V2UgY2FuIGFzc2lzdCBhZ2FpbiB3aXRoIHRlc3RpbmcgaWYgeW91IG1ha2UgdGhlIG9wdGltaXpl
ZCBwYXRjaC4KCkNvb2whClRoZSBvcHRpbWl6ZWQgcGF0Y2ggaXMgaW4gbGludXgtbmV4dC4gSWYg
eW91IGNvdWxkIHRlc3QgbGludXgtbmV4dCBpdCB3b3VsZCBiZSBhd2Vzb21lLgoKVGhhbmtzLAov
L3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
