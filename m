Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027ADC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BED20644
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bDYo/8Bw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7BED20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvKwaKIFDc3tr8LUyFEWZWCCnlbQ0+tjcnF+T8hR6ic=; b=bDYo/8BwhWGMLY
	okF4BWFyKZ3GyrT7ht5FG0+KcZTzjk+05BaGJXu0oZrloN0FbcT5G79MrLhUkC7AqpExxWLtGMaJp
	s8Hf44GnF1osqMwkApUf3EMTo5w+wsqj8uJJsssU/i5jV1aAqm5/JjH6i2PFODZV4ZH7KtkoZkhsZ
	6ILj0swDMcRC1qrUy7IZ8uu4Ho6oV8vXZEdRVyCqLbogFbfrW6G8XbhGMljLqai5eoGjiieLcF5+j
	74I66t4sxmcR5JMuUq+gDanrZfcrxdXt1LYNTmjOeXyKa17jGiZ7opEUO1u1YNEwiciFSnONUWjjK
	Svc8+P7CovbkETuqEWLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht7ZK-0006XT-83; Thu, 01 Aug 2019 09:40:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht7ZH-0006X5-Jb
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 09:40:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 51971608311C;
 Thu,  1 Aug 2019 11:40:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uVq3WAedljRr; Thu,  1 Aug 2019 11:40:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0ECC36083139;
 Thu,  1 Aug 2019 11:40:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vBt-rSMMZpua; Thu,  1 Aug 2019 11:40:13 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id DEEAA608311C;
 Thu,  1 Aug 2019 11:40:13 +0200 (CEST)
Date: Thu, 1 Aug 2019 11:40:13 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <699614206.55882.1564652413789.JavaMail.zimbra@nod.at>
In-Reply-To: <0B80F9D4116B2F4484E7279D5A66984F7A8A3A@dggemi524-mbx.china.huawei.com>
References: <1564651065-4585-1-git-send-email-chengzhihao1@huawei.com>
 <0B80F9D4116B2F4484E7279D5A66984F7A8A13@dggemi524-mbx.china.huawei.com>
 <1515821930.55881.1564651254907.JavaMail.zimbra@nod.at>
 <0B80F9D4116B2F4484E7279D5A66984F7A8A3A@dggemi524-mbx.china.huawei.com>
Subject: =?utf-8?Q?Re:_=E7=AD=94=E5=A4=8D:_=E7=AD=94=E5=A4=8D:_[PATCH_RFC]_ubi:?=
 =?utf-8?Q?_ubi=5Fwl=5Fget=5Fpeb:_Replace_a_l?=
 =?utf-8?Q?imited_number_of_attempts_with_polling_while_getting_PEB?=
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubi_wl_get_peb: Replace a limited number of attempts with
 polling while getting PEB
Thread-Index: AQHVSEkuRooM7Daz00mNhjuG43MDw6bmAggAJrEe1mz+ynmUUMDzNiEl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_024015_795813_AD321AD2 
X-CRM114-Status: UNSURE (   3.23  )
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
 linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBEbyB5b3UgaGF2ZSBudW1iZXJzIGhv
dyBtYW55IGF0dGVtcHRzIHdlcmUgbmVlZGVkIHRvIGdldCBhIGZyZWUgYmxvY2s/Cj4gSSB0ZXN0
ZWQgaXQgZG96ZW5zIG9mIHRpbWVzLiBUaGUgYmlnZ2VzdCBudW1iZXIgb2YgYXR0ZW1wdHMgSSd2
ZSBldmVyIGhhZCBzbyBmYXIKPiBpcyA2LiBJbiBtb3N0IGNhc2VzLCBpdCBvbmx5IHRha2VzIDIg
b3IgMyB0aW1lcy4KClNvIHJhaXNpbmcgdGhlIHJldHJ5IGNvdW50IHRvLCBsZXQncyBzYXksIDEw
IHdvdWxkIHdvcmsgdG9vPwpIYXZpbmcgaXQgdW5ib3VuZCBmZWVscyBkYW5nZXJvdXMgYmVjYXVz
ZSBpdCBtYXkgaGlkZSBvdGhlciBwcm9ibGVtcy4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
