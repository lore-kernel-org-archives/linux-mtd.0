Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E571C4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 15:21:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A5822A99
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 15:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A5822A99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lMoiN9YudFwPHizCB7npt62hRTvD4oNwcLSzIpIvo3w=; b=U4lwb31XWqcEZqyP0k8uFcJy6
	4AmiYAUHffpR9h6tQHcFtUNNBFAZ+kw95Ux3bt5tzU1iQQbN0Nts3suaZgZati5FxFU5l2W2DhbQd
	EsQnQupBECFdTqOvF+7Q/1diUdY9BA3TNIRTksIhjQP3lQwlKBJ5n99jlJHDrl60Mst6GTpErk0M6
	S7TacKLV5RxgdbOzJOXQDSyQ06AmEtZPpsNGxZszd3s0JQpM7eP3wn0w8g1U1rRI0HILPUBOHVy4X
	DWG9FMKjdqFXAPsnCXxCe4fLLsxyPGOmyklJSrgj8xWMGKyhDyZRII3B3zc2/05VVly/eKpOJXHVw
	TJuRcf4PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kopeU-0000Tu-DT; Mon, 14 Dec 2020 15:20:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kopeR-0000Rq-K2
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 15:20:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CFEF0607400C;
 Mon, 14 Dec 2020 16:20:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id M9bEQS2fhJX2; Mon, 14 Dec 2020 16:20:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7438B607400F;
 Mon, 14 Dec 2020 16:20:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UYgQWsYOsUbd; Mon, 14 Dec 2020 16:20:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4FEE1607400C;
 Mon, 14 Dec 2020 16:20:29 +0100 (CET)
Date: Mon, 14 Dec 2020 16:20:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Schaefer <david.tillmann.schaefer@gmail.com>
Message-ID: <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
In-Reply-To: <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
Thread-Index: UB8gKuXGx9jtOQWN9U+os0Cq68UqSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_102039_782573_D5651EB4 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RGF2aWQsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gSSBoYXZlIGNoZWNrZWQg
dGhlIGtlcm5lbCBjb25maWd1cmF0aW9uLiBGb3IgNC4xNS4xOCBJIGhhdmUgdGhlc2Ugc2V0dGlu
Z3M6Cj4gQ09ORklHX01URF9OQU5EX0VDQz15Cj4gQ09ORklHX01URF9OQU5EPXkKPiBDT05GSUdf
TVREX05BTkRfUFhBM3h4PXkKPiAKPiBhbmQgZm9yIDQuMTYuMQo+IAo+IENPTkZJR19NVERfTkFO
RF9FQ0M9eQo+IENPTkZJR19NVERfTkFORD15Cj4gQ09ORklHX01URF9OQU5EX01BUlZFTEw9eQo+
IAo+IEkgYWN0dWFsbHkgY29waWVkIHRoZSB3b3JraW5nIGNvbmZpZ3VyYXRpb24gZnJvbSA0LjE1
LjE4IHRvIDQuMTYuMSwKPiBkaWQgbWFrZSBvbGRjb25maWcsIGFuZCBjb21waWxlZCBpdCB0aGUg
c2FtZSB3YXkgYXMgNC4xNS4xOC4gTGlrZSBJCj4gc2FpZCBhYm92ZSwgNC4xNSB3b3JrcywgNC4x
NiBkb2VzIG5vdC4KPiBJIGhvcGUgdGhpcyBhbnN3ZXJzIHlvdXIgcXVlc3Rpb24gd2hldGhlciBJ
IHNlZSB0aGUgaXNzdWUgd2l0aCB0aGUgbmV3Cj4gYW5kIHRoZSBvbGQgbWFydmVsbCBkcml2ZXJz
IGJlY2F1c2UgSSBhbSBub3QgMTAwJSBzdXJlIHdoYXQgeW91IHJlZmVyCj4gdG8gaGVyZSAoSSBn
dWVzcyB5b3UgbWVhbiBQWEEzWFggdnMgTkFORCkuCgpBaCwgcmlnaHQuIEkgZm9yZ290IHRoYXQg
dGhlIG9sZCBkcml2ZXIgZ290IHJlbW92ZWQuIEkgdGhvdWdodCB3ZSBrZXB0IGl0IGZvciBhIGZl
dyByZWxlYXNlcy4gOy1cClNvIHRoZXJlIGlzIGEgcmVncmVzc2lvbi4KClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
