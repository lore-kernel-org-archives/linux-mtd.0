Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679C1C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 11:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345866056C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 11:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 345866056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OR5y/uuYYnBDpXH9g81AVVMPEtnwYyzeZmdpqjF4DQ4=; b=dzUvRJyQ8DILW1zMls9Qvh0Ed8
	SZrFJGkz2ZwTm7Fyxp28vwXjUuEhblL70ry2hXaGZviWMv+i1k9KqdGapfYOsVnySvP8lBA90Koij
	eLz62mLAp9Wtt1C4gFYShKZdVSVCDC7z4lt8+5XyLbM0GS8+/Gzl8l73Pulw/T/h0rIrjTY1IERSe
	P9aMdeBN8BdPnAGDZNhdaCmr/9hXRrBxjS5XGebs0cFvNLdpdgs9aufWrBKbwDNlK4HPkEy9MZpKK
	OwxtEsLAufetSwizGeH4NMh/5YGsNtatuDvG5UqwhuZzaAyZs6OaY9p9uB81/W7oMLG+dkQQcgw+4
	2PITJHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m94UB-0040ob-96; Thu, 29 Jul 2021 11:45:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m94U8-0040nL-Ez
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 11:45:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 93E5D60A59E0;
 Thu, 29 Jul 2021 13:45:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aO_TuqCBAGxP; Thu, 29 Jul 2021 13:45:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3EEFA60A59E2;
 Thu, 29 Jul 2021 13:45:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ubc79fz-8zcI; Thu, 29 Jul 2021 13:45:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 15DB260A59E0;
 Thu, 29 Jul 2021 13:45:45 +0200 (CEST)
Date: Thu, 29 Jul 2021 13:45:44 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Pintu Agarwal <pintu.ping@gmail.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
In-Reply-To: <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
 <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: o5rhXDaMb949oL+oV/E2gN2BDVZpgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_044556_718664_99313A94 
X-CRM114-Status: UNSURE (   9.80  )
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

RXplcXVpZWwsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gW3NuaXBdCj4gCj4g
T3VjaCwgc28gc3VycHJpc2VkIHRoYXQgYWZ0ZXIgYWxsIHRoZXNlIHllYXJzIHNvbWVvbmUgaXMg
ZG9pbmcgc3F1YXNoZnMvbXRkYmxvY2sKPiBpbnN0ZWFkIG9mIHVzaW5nIHViaWJsb2NrIDotKQo+
IAo+IENhbiB3ZSBwYXRjaCBlaXRoZXIgS2NvbmZpZyBvciBhZGQgc29tZSB3YXJuX29uY2Ugb24g
bXRkYmxvY2sKPiB1c2FnZSwgc3VnZ2VzdGluZyB0byB1c2UgdWJpYmxvY2sgaW5zdGVhZD8KCmEg
aGludCBpbiBLY29uZmlnIG1ha2VzIElNSE8gc2Vuc2UuIERvIHlvdSB3YW50IHRvIHNlbmQgYSBw
YXRjaD8KQSB3YXJuaW5nIGlzIHRvbyBtdWNoIHNpbmNlIG9uIHNvbWUgdGlueSBlbWJlZGRlZCBz
eXN0ZW0gd2l0aCBOT1IgZmxhc2ggbXRkYmxvY2sgaXMgc3RpbGwKYSBnb29kIGNob2ljZS4KdWJp
YmxvY2sgaXMgbW9zdGx5IHVzZWZ1bCBmb3IgTkFORCBmbGFzaC4KCj4gSSByZW1lbWJlciB0aGVy
ZSB3YXMgc3RpbGwgc29tZSB1c2UgY2FzZShzKSBmb3IgbXRkYmxvY2sgYnV0IEkgY2FuJ3QgcmVt
ZW1iZXIKPiBub3cgd2hhdCB3YXMgaXQsIHBlcmhhcHMgd2Ugc2hvdWxkIGRvY3VtZW50IHRoZSBl
eHBlY3RhdGlvbnM/Cj4gKElzIHRoYXQgZm9yIEpGRlMyIHRvIG1vdW50PykKCmEgbG9uZyB0aW1l
IGFnbyBtb3VudCBkaWRuJ3QgYWNjZXB0IGNoYXJhY3RlciBkZXZpY2VzLCBzbyB5b3UgaGFkIHRv
IHBhc3MgbXRkYmxvY2tYIHRvIG1vdW50CkpGRlMyLgpUaGlzIGxpbWl0YXRpb24gaXMgZ29uZS4K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
