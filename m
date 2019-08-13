Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB788C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 19:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4C1206C2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 19:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UctYb5RW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC4C1206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNZqlcZHFFwuaUhjRNqEBCL1Ql41XXICgQrBq9Z+LmY=; b=UctYb5RWlMGvqV
	lZVq0LUwEMtvb5sBv4mPlbacWCDXiABJV4EJ4Zw+NsvZUvocZBcp58wG150RyYM3CbeLQnx3YSWbe
	7JJsP4l+Kc7pU2oeL4Qj/lVpJdWrqi5qX+WQSnlZ4TByViSJddz24KGI84MiWJdBIYcAn32s43mtu
	C/W7Fwro5wbIhk9ohGtbSrr5Vt4ddNx1VQBn2e2m5v8TfLPDHI6wrxMMPb2ZgUSlF7W8kgdmugz2X
	ylc68hdauw2h6Bar544wElX8YMo09Nvf8jD+Rht9oDOsQU0LMXdjWGYB7H3fKybLJR8m3QKjs5P8D
	T5gKW6osr8FwERn1PmTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxcmH-0000zp-4r; Tue, 13 Aug 2019 19:48:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxcmD-0000z3-LA
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 19:48:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C3489608311C;
 Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KN6gZ6xri91F; Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 783C36083139;
 Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id svS2yEdjcfYW; Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 54709608311C;
 Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
Date: Tue, 13 Aug 2019 21:48:10 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Han Xu <xhnjupt@gmail.com>
Message-ID: <1755548283.65333.1565725690268.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+EcR23WqQGJQ2AD1daTnw7vR5+bfhEokDwEX1UyumoJfTt74Q@mail.gmail.com>
References: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
 <CAFLxGvwZ_85eR5Qkjka4CyDOAP_jw-hpk7WwttbAzjLFS4MavQ@mail.gmail.com>
 <CA+EcR23V1nP9d6iYysT6vR+n8-BRnU-vursaxvcGB1LdBy+8NQ@mail.gmail.com>
 <411166061.63863.1565639737497.JavaMail.zimbra@nod.at>
 <CA+EcR23WqQGJQ2AD1daTnw7vR5+bfhEokDwEX1UyumoJfTt74Q@mail.gmail.com>
Subject: Re: 5.2.0-rc1 UBIFS bad unlock balance
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Index: u3HoQsIUySzQ2InmA8QWmYWa4GujZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_124813_845104_B74A2C6A 
X-CRM114-Status: UNSURE (   6.48  )
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
Cc: Han Xu <han.xu@nxp.com>, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBIdWg/IFRoZSBiYWQgY29tbWl0IHdh
cyBkcm9wcGVkLiBBcmUgeW91IHN0aWxsIHNlZWluZyB0aGlzIG9uIExpbnVzJyB0cmVlPwo+PiBN
YXliZSBzb21ldGhpbmcgZWxzZSBpcyBiYWQuCj4+Cj4gCj4gU2hvdWxkIGJlIHJlbGF0ZWQgdG8g
dGhpcyBjb21taXQuIFNlZW1zIHdvcmtpbmcgZmluZSBhZnRlciByZXZlcnRpbmcgdGhlIHBhdGNo
Lgo+IAo+IGNvbW1pdCA4MDA5Y2U5NTZjM2QyODAyMmFmNmIxMjJlNTAyMTNhZDgzMGZjOTAyCj4g
QXV0aG9yOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IERhdGU6ICAgV2Vk
IE1heSAxNSAyMTo1MjozNCAyMDE5ICswMjAwCj4gCj4gICAgdWJpZnM6IERvbid0IGxlYWsgb3Jw
aGFucyBvbiBtZW1vcnkgZHVyaW5nIGNvbW1pdAoKWW91IGFyZSBwZXJmZWN0bHkgcmlnaHQsIHRo
ZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSEKRG9lcyB0aGUgZm9sbG93aW5nIHBhdGNoIG1ha2UgdGhl
IHByb2JsZW0gZ28gYXdheT8KQWZ0ZXIgb3JwaGFuX2RlbGV0ZSgpIGMtPm9ycGhhbl9sb2NrIGlz
IGJlaW5nIHVubG9ja2VkLApzbyBhIGRvdWJsZSB1bmxvY2sgY2FuIGhhcHBlbi4KCmRpZmYgLS1n
aXQgYS9mcy91Ymlmcy9vcnBoYW4uYyBiL2ZzL3ViaWZzL29ycGhhbi5jCmluZGV4IGI1MjYyNGUy
OGZhMS4uM2I0YjQxMTRmMjA4IDEwMDY0NAotLS0gYS9mcy91Ymlmcy9vcnBoYW4uYworKysgYi9m
cy91Ymlmcy9vcnBoYW4uYwpAQCAtMTI5LDcgKzEyOSw2IEBAIHN0YXRpYyB2b2lkIF9fb3JwaGFu
X2Ryb3Aoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19vcnBoYW4gKm8pCiBzdGF0
aWMgdm9pZCBvcnBoYW5fZGVsZXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgdWJpZnNf
b3JwaGFuICpvcnBoKQogewogCWlmIChvcnBoLT5kZWwpIHsKLQkJc3Bpbl91bmxvY2soJmMtPm9y
cGhhbl9sb2NrKTsKIAkJZGJnX2dlbigiZGVsZXRlZCB0d2ljZSBpbm8gJWx1Iiwgb3JwaC0+aW51
bSk7CiAJCXJldHVybjsKIAl9CkBAIC0xMzgsNyArMTM3LDYgQEAgc3RhdGljIHZvaWQgb3JwaGFu
X2RlbGV0ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX29ycGhhbiAqb3JwaCkK
IAkJb3JwaC0+ZGVsID0gMTsKIAkJb3JwaC0+ZG5leHQgPSBjLT5vcnBoX2RuZXh0OwogCQljLT5v
cnBoX2RuZXh0ID0gb3JwaDsKLQkJc3Bpbl91bmxvY2soJmMtPm9ycGhhbl9sb2NrKTsKIAkJZGJn
X2dlbigiZGVsZXRlIGxhdGVyIGlubyAlbHUiLCBvcnBoLT5pbnVtKTsKIAkJcmV0dXJuOwogCX0K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
