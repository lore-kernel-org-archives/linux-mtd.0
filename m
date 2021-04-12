Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26EFC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:26:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D51611C9
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D51611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0N0JBfpzgeWYiXi/R264cPXAtlZD43ke05oH6n01hDY=; b=K1fMbx1nJY2bxF
	sc+/kPIbc0vEUhFMW1+fkgfkZOAOTb7lqs0Xcq0brB/0LrDxMGdNMvxox4hvBplmcbWq5M35SXPCi
	3HVazDI/tI6aAvv4+1TQ+8dZ7KWeqvm+ZGKReLFqgVuYg/er/nSwWEeHQc+fsTJLOZVSvoONmtToX
	CKcxzgTSqJLhh5YMm8DedvBBp29CRah2XPuUxyNJlqSwbe5SQDJlWb3MnORLRf0aPm2+yq/0eBK8P
	pyCPVPrJjWZwS4eQ5RpJ6djj9soc5LosZ03kvNV0I9tHdMFsRQ2pao0RjeefKSD9Gg4pRTyPskrlQ
	rhWOQbwpiHnHIykecjYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrtU-0065oo-R1; Mon, 12 Apr 2021 08:26:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrtM-0065n7-Rt
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 08:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=s8pFcgXS4D2mlVYIusaeM+b40NAk+KHs6qPG8p+8lRo=; b=y3ASjYke2MBtdwPgJJeAHaVEop
 nvnNQpoN9aGRFxEKSLf4Ipr6mtnawV+4IH4+GO9CfbGHsJUQ7ZZUMrIneuFOiUf3LQkj1AY9p3rhM
 EvMWtJuAmG7BBXBojM9vN5YRgckbzYzjWFInTkqohhC4MzUSQzSXqhDb5hxJi/9EOPC5Abw2FWz/F
 0g0nomZ4ZmkMnu63HSr5/CL4uzcVhidkjat+lBdnT0m/lQqa+B8KrltW6sHQlEYXqimRR/0JEhm5j
 03L0zdKOf7Hg43/gPaTOxpQQnfa23G3W8N5RJqBeZMXZORPIUXYSZ2KzDX05diFHzVXjrsw7w0ZBi
 dPOzlBIw==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrtK-005yI7-DI
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 08:25:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1970A6122D5C;
 Mon, 12 Apr 2021 10:25:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kof0Fv1CO7-R; Mon, 12 Apr 2021 10:25:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B717C6122D58;
 Mon, 12 Apr 2021 10:25:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pRMRbiicGg3k; Mon, 12 Apr 2021 10:25:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8E0D56122D55;
 Mon, 12 Apr 2021 10:25:52 +0200 (CEST)
Date: Mon, 12 Apr 2021 10:25:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: tiantao <tiantao6@huawei.com>
Cc: Tian Tao <tiantao6@hisilicon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1392900373.173016.1618215952396.JavaMail.zimbra@nod.at>
In-Reply-To: <009e80a0-8aaa-4824-10c4-a5a82b2c6528@huawei.com>
References: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
 <614928182.172774.1618210140227.JavaMail.zimbra@nod.at>
 <049f8110-5777-db77-d374-275d1ceee81d@huawei.com>
 <754065655.172978.1618214872038.JavaMail.zimbra@nod.at>
 <009e80a0-8aaa-4824-10c4-a5a82b2c6528@huawei.com>
Subject: Re: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to
 sysfs_emit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: Convert sysfs sprintf/snprintf family to sysfs_emit
Thread-Index: IOtddN4tuapqgXSppqXRodCRIIb2DA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_012554_616770_42CDC0CE 
X-CRM114-Status: UNSURE (   5.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IHVuZGVyc3RhbmQuCj4gCj4gV2hhdCBk
byB5b3UgdGhpbmsgb2YgdGhlIGZvbGxvd2luZyBjb21taXQgbWVzc2FnZQo+IAo+IFVzZSBzeXNm
c19lbWl0IGluc3RlYWQgb2Ygc25wcmludGYgdG8gYXZvaWQgYnVmIG92ZXJydW4sYmVjYXVzZSBp
bgo+IHN5c2ZzX2VtaXQgaXQgc3RyaWN0bHkgY2hlY2tzCj4gCj4gd2hldGhlciBidWYgaXMgbnVs
bCBvciBidWYgd2hldGhlciBwYWdlc2l6ZSBhbGlnbmVkLCBvdGhlcndpc2UgaXQKPiByZXR1cm5z
IGFuIGVycm9yLgoKVGhpcyBtYWtlcyBwZXJmZWN0bHkgc2Vuc2UhIDotKQpBZGRpdGlvbmFsIHlv
dSBjYW4gYWxzbyBub3QgdGhhdCB0aGlzIGlzc3VlIHdhcyBmb3VuZCBieSBjb2NjaWNoZWNrLgoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
