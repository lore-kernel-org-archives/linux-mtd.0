Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8867C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48822613E9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48822613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rbsOZuycAqg63mMZyNhOnNJHZbDL0l1JskyVhinf910=; b=B8+hjkUZhApBDpfOHpE8jFSHBp
	r8T8WtE29AkYu3V4rqNpziVNaNmDoEBJ3CHiINFZGzAQGic++uFRjh5A7SDzod1C0BrWg8jJpF7vB
	S7AIkMSgziwMt9MTbQkGaJPLJrW/pqfzTc0wfte9EF9rOSo9giR5mxp5GPckQOxgAewtGqKZQbwYO
	7OnTKF6YDrWBuvwPJezxF1BIfh/pK2QxbGZn9xiEY9Ls7lDN60pIyHKIhXXPPNM0dYPgTTc08wZuD
	Y5pTXvmSd7kW58vtE0BFe2NHrq0RfWgw3WkAu7L0LRcPneEr8RRP1ENgQ96DoIodPZ9URdX8QQqY6
	gSJOSvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL8c-0010ab-Sk; Thu, 10 Jun 2021 13:54:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL6q-000zek-LS
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:52:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 48A4C6108195;
 Thu, 10 Jun 2021 15:52:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mdb_2wIHQ5WY; Thu, 10 Jun 2021 15:52:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DB88961081AE;
 Thu, 10 Jun 2021 15:52:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZFDMESNVU0ar; Thu, 10 Jun 2021 15:52:32 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B7A756108195;
 Thu, 10 Jun 2021 15:52:32 +0200 (CEST)
Date: Thu, 10 Jun 2021 15:52:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <361047717.98543.1623333152629.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLhPiVgi5Q343VP-p7vwBtA1-A5jt8Ow4_2eF4ZwsiA+eQ@mail.gmail.com>
References: <CAOuPNLiRDZ9M4n3uh=i6FpHXoVEWMHpt0At8YaydrOM=LvSvdg@mail.gmail.com>
 <295072107.94766.1623262940865.JavaMail.zimbra@nod.at>
 <CAOuPNLhPiVgi5Q343VP-p7vwBtA1-A5jt8Ow4_2eF4ZwsiA+eQ@mail.gmail.com>
Subject: Re: qemu: arm: mounting ubifs using nandsim on busybox
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: qemu: arm: mounting ubifs using nandsim on busybox
Thread-Index: FCBZQEPb3fuCAU5mJvWAQ23NQZd17Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_065236_888541_A74FC83F 
X-CRM114-Status: GOOD (  10.35  )
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

UGludHUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiUGludHUgQWdh
cndhbCIgPHBpbnR1LnBpbmdAZ21haWwuY29tPgo+PiBuYW5kc2ltIHdvcmtzIGFzIGV4cGVjdGVk
LiBJdCBjcmVhdGVzIGEgbmV3IGFuZCAqZXJhc2VkKiBOQU5EIGZvciB5b3UuCj4+IFNvIHlvdSBo
YXZlIG5vIFVCSSB2b2x1bWVzLiBUaGVyZm9yZSBVQklGUyBjYW5ub3QgYmUgbW91bnRlZC4KPj4g
SSBzdWdnZXN0IGNyZWF0aW5nIGEgdGlueSBpbml0cmFtZnMgdGhhdCBjcmVhdGVzIFVCSSB2b2x1
bWVzIGJlZm9yZSBtb3VudGluZwo+PiBVQklGUyBvbgo+PiBvbmUgb2YgdGhlIGZyZXNobHkgY3Jl
YXRlZCAoYW5kIGVtcHR5KSB2b2x1bWVzLgo+Pgo+IG9oIHNvcnJ5IEkgZm9yZ290IHRvIG1lbnRp
b24gdGhpcy4KPiBJIGFtIGFibGUgdG8gY3JlYXRlIGFuZCB1cGRhdGUgdm9sdW1lcyBtYW51YWxs
eSBhZnRlciBib290aW5nIHRoZQo+IHN5c3RlbSB3aXRoIGluaXRyYW1mcy4KPiB7e3sKPiBDcmVh
dGluZyByb290ZnMgdm9sdW1lOgo+IG1rbm9kIC9kZXYvdWJpMCBjIDI1MCAwCj4gbWtub2QgL2Rl
di91YmkwXzAgYyAyNTAgMQo+IHViaWF0dGFjaCAvZGV2L3ViaV9jdHJsIC1tIDIKPiB1Ymlta3Zv
bCAvZGV2L3ViaTAgLU4gcm9vdGZzIC1tCj4gdWJpdXBkYXRldm9sIC9kZXYvdWJpMF8wIHViaWZz
LXJvb3Rmcy5pbWcKPiBtb3VudCAtdCB1YmlmcyB1YmkwOnJvb3RmcyB1Ymktcm9vdC8KPiB9fX0K
PiAKPiBCdXQgSSB3YW50ZWQgdG8gZG8gYWxsIHRoZXNlIGF1dG9tYXRpY2FsbHkgZHVyaW5nIGJv
b3QgdGltZSBpdHNlbGYuCj4gQWxzbyBJIHdhbnRlZCB0byB1c2UgdWJpbml6ZS5jZmcgYXMgaXMg
ZnJvbSB0aGUgb3JpZ2luYWwgc3lzdGVtIGFuZAo+IHNpbXVsYXRlIGV2ZXJ5dGhpbmcgdXNpbmcg
cWVtdSBhbmQgbmFkc2ltIChpZiBwb3NzaWJsZSkKPiBTbyBJIHRob3VnaHQgaXQgbXVzdCBiZSBw
b3NzaWJsZSBieSBzZXR0aW5nIHNvbWUgcGFyYW1ldGVycyBpbiBxZW11IHN1Y2ggYXM6Cj4gbXRk
cGFydHM9bmFuZDosCj4gLWRldmljZSBuYW5kLGNoaXBfaWQ9MHgzOSxkcml2ZT1tdGQwLAo+IC1k
cml2ZSBpZj1tdGQsZmlsZT0uL3ViaS1ib290LmltZyxpZD1tdGQwLAo+IGFueXRoaW5nIGVsc2Ug
PwoKV2VsbCwgdGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIG5hbmRzaW0uCklmIHFlbXUgY2Fu
IGVtdWxhdGUgYSBOQU5EIGNoaXAgKHBsdXMgYSBjb250cm9sbGVyKSBhbGwgeW91IG5lZWQgaXMg
YSBkcml2ZXIgb24gdGhlIExpbnV4IHNpZGUuCgpUaGFua3MsCi8vcmljaHJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
