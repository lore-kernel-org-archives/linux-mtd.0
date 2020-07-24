Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1EBC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E1F20737
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wvqlfcQF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vtJk6agH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E1F20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lTR8JEaSwdfCIIuFUa/u71u+l5bK5K/AhrkV7yGptTs=; b=wvqlfcQFFB6UCVczzsmeyTG9G
	M98WRnfVROzGEl+gSgLYVOw4a7HSfOKGQ7Gs7ZrEvXApbNr0XDg0qu6fpAVMO8tgBgEZmIKspwIhp
	/n9VdpikJ+WgfHP+Tin3n8zRkyLAvc3iyaRUxZPE9uhehi7wR/rsiLXJRtnIZgWzI2q7NgG/D+z6R
	S718BfB43GA4D38TYFrsz3sjtwBFkQYFoc/9ERTU0192NSPUCAgy0CYLrqZKY5++39KGWvcBDtFBz
	YwCFT0Xem5JpcNXLDfG8lvNgaKBI/r6teceBw6x+A55Pvj/Hm7/hP++Gb1z46fTTQdmE21u2Ie+kD
	Ic8DKtsGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyzhv-0005KS-JO; Fri, 24 Jul 2020 15:33:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyzht-0005Jx-MH
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 15:33:58 +0000
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E34CB20792
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2020 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595604836;
 bh=Y8eLGkyIQiJ7cZbqycuw9fsLmUfQI/gMzh0XyGMhXcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vtJk6agHXlwFILTBY1N62BFkWqf5cBaroggOMWxOhBHWr7PnMM0fnCgJwsDoRRxYv
 4z6SfhjOAfhrnNUgNW1jIOYv2lYU00qv6X7TICKyLkmlO93q7wAqRFRb+dGhdqXiBK
 4/7cq7rS+EXs0EUB7C6/WFv8MZOHEN1D3AnsccuY=
Received: by mail-lj1-f180.google.com with SMTP id r19so10365748ljn.12
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2020 08:33:55 -0700 (PDT)
X-Gm-Message-State: AOAM531RjA5WcH56WqnD7vL6owfo6V8K71AghIv2I2cSySc7TB7txJi1
 7/qOvcIuVG71d+r+qrMr+ceo3w89MboEFBGLO44=
X-Google-Smtp-Source: ABdhPJyCEVn2wxzdMRmvBeZbB7OAx6eyGJpXsnb3GognaSnQeZtSBlDKqh69MV1B4pMx4B+uBmo9QtfaWEPljz2bxPw=
X-Received: by 2002:a2e:b6d2:: with SMTP id m18mr4189120ljo.341.1595604834184; 
 Fri, 24 Jul 2020 08:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
In-Reply-To: <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 24 Jul 2020 17:33:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
Message-ID: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Paul Cercueil <paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_113357_806938_3C885272 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNCBKdWwgMjAyMCBhdCAxNzoxOSwgUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+IHdyb3RlOgo+Cj4gSGkgS3J6eXN6dG9mLAo+Cj4KPiBMZSB2ZW4uIDI0IGp1aWwu
IDIwMjAgw6AgMTY6NTQsIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gYQo+
IMOpY3JpdCA6Cj4gPiBFbmFibGluZyB0aGUgTVREX05BTkRfSlo0NzgwIGRyaXZlciBtYWtlcyBz
ZW5zZSBvbmx5IGZvciBzcGVjaWZpYwo+ID4gaGFyZHdhcmUgLSB0aGUgSW5nZW5pYyBTb0MgYXJj
aGl0ZWN0dXJlLiAgU2V0IGl0J3MgZGVwZW5kZW5jeSB0bwo+ID4gTUFDSF9JTkdFTklDIHNvIGl0
IHdpbGwgbm90IGFwcGVhciBvbiB1bnJlbGF0ZWQgYXJjaGl0ZWN0dXJlcyAoZWFzaWVyCj4gPiBq
b2IgZm9yIGRvd25zdHJlYW0vZGlzdHJvIGtlcm5lbCBlbmdpbmVlcnMpLgo+Cj4gRGlzYWdyZWVk
LiBJdCB3YXMgZG9uZSB0aGlzIHdheSBzbyB0aGF0IGRpc3RybyBrZXJuZWxzIGNhbiBzdXBwb3J0
Cj4gbXVsdGlwbGUgU29Dcy4KClRoZXkgd2lsbCBzdGlsbCBiZSBhYmxlIHRvIHN1cHBvcnQgbXVs
dGlwbGUgU29Dcy4gTm90aGluZyBjaGFuZ2VkCmhlcmUuIFRoZSBzYW1lIHdlIGRvIGZvciBhbGwg
QVJNIGRyaXZlcnMgKFNvQ3MgYXJlIG11bHRpcGxhdGZvcm0pLi4uClVubGVzcyB5b3Ugd2FudCB0
byBzYXkgdGhhdCBpdCBpcyBwb3NzaWJsZSB0byBzdXBwb3J0IEluZ2VuaWMgU29DCndpdGhvdXQg
TUFDSF9JTkdFTklDPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
