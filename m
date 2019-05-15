Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7441EC04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 22:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3239A20862
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 22:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JfYzb2Hm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3239A20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgmCL08p3hxcZImINLoyPSJtOxrXbd7tn4HZvtR3YaQ=; b=JfYzb2HmfP0qjP
	ecDlLY7TgrIO8RI6DUvyWjYCVRfpqNSKGvm67g0oBKwVbeb1vsKiRco7iYwsLgNv5gAm8uVCMN4cO
	Qm5cB1unwWcYXf6c5PcbjuJCRFT30nQnjlIG+zvLom1V6weRZAtGH7OygcLa6YlCEs/u3KPxdxDwf
	s/SRCulF8XVBmKcWa/hE3m+s/0T+7i1cioCPSYg7Jv4DfqRUwgHtmUb6T/sJ0Wlj7GvY5rPwPGSXO
	yhKig5caWrYS0W12MoH6LRMzhPlLaZxExwfhzPCpTkeBi9Dwo9ye+e14DqEIDFgJuyCX3ptaU/gKD
	0JK7NVKPnka4McXhiUnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR2bO-0003zN-78; Wed, 15 May 2019 22:42:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR2bK-0003z5-Qi
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 22:42:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 62E226083269;
 Thu, 16 May 2019 00:42:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 29sXjIG9xhFg; Thu, 16 May 2019 00:42:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 293E9608326A;
 Thu, 16 May 2019 00:42:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PGqMw6b-hVq2; Thu, 16 May 2019 00:42:15 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EDF4C6083269;
 Thu, 16 May 2019 00:42:14 +0200 (CEST)
Date: Thu, 16 May 2019 00:42:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Joe Perches <joe@perches.com>
Message-ID: <494585403.60051.1557960134909.JavaMail.zimbra@nod.at>
In-Reply-To: <391f21cf5f04c61b75e739f67c8a308864b4e68c.camel@perches.com>
References: <20190515200423.17809-1-richard@nod.at>
 <391f21cf5f04c61b75e739f67c8a308864b4e68c.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Update UBI/UBIFS git tree location
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: MAINTAINERS: Update UBI/UBIFS git tree location
Thread-Index: o5MYdfaQzQvdZiRYyG/tqbW6MDBO/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_154219_015565_B2C408B6 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpvZSBQZXJjaGVzIiA8am9l
QHBlcmNoZXMuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxpbnV4LW10
ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAibGludXgta2VybmVsIiA8
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMTYu
IE1haSAyMDE5IDAwOjI5OjQ4Cj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gTUFJTlRBSU5FUlM6IFVw
ZGF0ZSBVQkkvVUJJRlMgZ2l0IHRyZWUgbG9jYXRpb24KCj4gT24gV2VkLCAyMDE5LTA1LTE1IGF0
IDIyOjA0ICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IExpbnVzIGFza2VkIHRv
IHVzZSBrZXJuZWwub3JnLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KPj4gLS0tCj4+ICBNQUlOVEFJTkVSUyB8IDIgKy0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5kZXggNWMzOGYyMWFlZTc4Li5iYTQy
OGNkNjEzYjggMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJT
Cj4+IEBAIC0xNTg3OSw3ICsxNTg3OSw3IEBAIE06CVJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+Cj4+ICBNOglBcnRlbSBCaXR5dXRza2l5IDxkZWRla2luZDFAZ21haWwuY29tPgo+
PiAgTToJQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4+ICBMOglsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiAtVDoJZ2l0IGdpdDovL2dpdC5pbmZyYWRlYWQu
b3JnL3ViaWZzLTIuNi5naXQKPj4gK1Q6CWdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9ydy91Ymlmcy5naXQKPiAKPiBQbGVhc2Uga2VlcCB0aGUgaW5pdGlhbCBz
ZXBhcmF0ZSBnaXQKPiAKPiBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3J3L3ViaWZzLmdpdAoKV2lsbCBmaXguCgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
