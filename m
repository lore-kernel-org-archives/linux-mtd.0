Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D152C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D87260C40
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 10:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D87260C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wkHpjCZSq7GdeprqcqTjOulKUzuTGQC/OI7ZE66UAq4=; b=iTtw9QtkXaKpoLlTDfk+1TTV+g
	2WMK6VWSHJ4umZwy6lnKc9cofze1nEttnvMGkUJBEFxBWSlgWg/u+UsfEkj9sBRA/N75x4PRSmT2z
	LofSykEpR88uwwGEQw+Q7emyIObluyzFo7qWoJNEP/YvUJpnZer1vzDSBEp/EB5CzSkpwXzRGdyd/
	6k2KWlAHlDjBMu/0OvZDP4+e/XVnwTsJC9nRolmOOXAxzii2UjDYJw+ZzVCyFYIbw/dKZRwa+PaJ+
	YEIJ5X6cFQq4RuZ6x38TA4CsxtXHO6qnVOrlOJPA3FcZq30t8Gcuw9Ex+WRsoJiR61O60NNMZEnH1
	j6P76uFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfgZZ-004dGH-63; Wed, 27 Oct 2021 10:54:21 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfgZQ-004dFL-Sa
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 10:54:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DBBAC60A59CB;
 Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jAtqK5-KKcxu; Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3B85160A59CC;
 Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4VSet6S7aa7W; Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1737160A59CB;
 Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
Date: Wed, 27 Oct 2021 12:54:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: shiva linuxworks <shiva.linuxworks@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Shivamurthy Shastri <sshivamurthy@micron.com>
Message-ID: <771780049.41543.1635332049033.JavaMail.zimbra@nod.at>
In-Reply-To: <20211027103352.8879-1-sshivamurthy@micron.com>
References: <20211027103352.8879-1-sshivamurthy@micron.com>
Subject: Re: [PATCH 0/4] enabling Advanced protection and security features
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: enabling Advanced protection and security features
Thread-Index: e9NOfgAgmG4FgeEzOITeky2aCvZksw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_035413_099576_519BDCFB 
X-CRM114-Status: UNSURE (   8.21  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInNoaXZhIGxpbnV4d29ya3Mi
IDxzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbT4KPiBBbjogIlR1ZG9yIEFtYmFydXMiIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+LCAiTWljaGFlbCBXYWxsZSIgPG1pY2hhZWxAd2FsbGUu
Y2M+LCAiUHJhdHl1c2ggWWFkYXYiCj4gPHAueWFkYXZAdGkuY29tPiwgIk1pcXVlbCBSYXluYWwi
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4s
ICJWaWduZXNoIFJhZ2hhdmVuZHJhIgo+IDx2aWduZXNockB0aS5jb20+Cj4gQ0M6ICJsaW51eC1t
dGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIlNoaXZhbXVydGh5IFNoYXN0cmkiCj4gPHNzaGl2
YW11cnRoeUBtaWNyb24uY29tPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjcuIE9rdG9iZXIgMjAy
MSAxMjozMzo0OAo+IEJldHJlZmY6IFtQQVRDSCAwLzRdIGVuYWJsaW5nIEFkdmFuY2VkIHByb3Rl
Y3Rpb24gYW5kIHNlY3VyaXR5IGZlYXR1cmVzCgo+IEZyb206IFNoaXZhbXVydGh5IFNoYXN0cmkg
PHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+IAo+IFN0YW5kYXJkIHByb3RlY3Rpb24gZmVhdHVy
ZXMgaW4gU1BJIE5PUiBmbGFzaGVzIGFyZSBsZWdhY3kgYW5kIG9mZmVyIGEKPiBzaW1wbGUgd2F5
IHRvIHByb3RlY3QgdGhlIG1lbW9yeSBhcnJheSBhZ2FpbnN0IGFjY2lkZW50YWwgb3IgdW53YW50
ZWQKPiBtb2RpZmljYXRpb24gb2YgaXRzIGNvbnRlbnQuCj4gCj4gVGhlc2UgcGF0Y2hlcyBlbmFi
bGUgdGhlIHN1cHBvcnQgZm9yIGFkdmFuY2VkIHNlY3RvciBwcm90ZWN0aW9uIHdoaWNoCj4gcHJv
dGVjdHMgbWVtb3J5IGZyb20gYWNjaWRlbnRhbGx5IGNvcnJ1cHRpbmcgY29kZSBhbmQgZGF0YSBz
dG9yZWQsIGFuZAo+IGl0IGFsc28gcHJldmVudHMgbWFsaWNpb3VzIGF0dGFja3MgdGhhdCBjb3Vs
ZCBpbnRlbnRpb25hbGx5IG1vZGlmeSB0aGUKPiBjb2RlIG9yIGRhdGEgc3RvcmVkIGluIHRoZSBt
ZW1vcnkuCj4gCj4gTWljcm9uIEZsYXNoZXMgb2ZmZXIgc29tZSBvZiB0aGUgYWR2YW5jZWQgcHJv
dGVjdGlvbiBtZXRob2RzIHVzaW5nCj4gdm9sYXRpbGUgbG9jayBiaXRzLCBub24tdm9sYXRpbGUg
bG9jayBiaXRzLCBnbG9iYWwgZnJlZXplIGJpdHMsIGFuZAo+IHBhc3N3b3JkLgoKQ2FuIHlvdSBw
bGVhc2UgcG9pbnQgdXMgdG8gdGhlIHRlY2huaWNhbCBkb2N1bWVudGF0aW9uIG9mIHRoZXNlIGZl
YXR1cmVzPwpJJ20gZXNwZWNpYWxseSBpbnRlcmVzdGVkIGluIHRoZSBwYXNzd29yZCBmZWF0dXJl
LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
