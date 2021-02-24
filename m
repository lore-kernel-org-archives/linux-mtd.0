Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBEDC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 07:18:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD4264EBB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 07:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD4264EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CxVSHjKBCIEPu9vaSufb5WwWY9ztQegvIQ4QReCj01k=; b=uY/xdhOXjIHMlKnWXd7sM4eg5
	Od4D0DLEGdAJ/sR/SwDcYx97jQ9K9oYqlBEo4kfXeLFLEe1yTqoxPohA2nDNzYMCeQhAzJ92XE/mA
	ZsprFijgtHvzOB0kEfLhdGC7eLfc8EYd87ooqFpFHdck3jg0xiNcf/pnd213E/qHYyWOTvJhHnkec
	IeG+zrDnpTi8LdGFV/ZAJpbBHRNWZAVqEN2Cji60NnOmOJzF8L4iEjJU4fFgVEP44nrOj/hsdhHrQ
	7Z3YQlSRhaQJ8CZDssPhupSGuAXZ8bjBoTXL9wpTNg1taOG0Yxok/gQ4dOzMf1Jpj/ZSIQCLXkfYg
	25VE09u+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEoQ1-00076S-AB; Wed, 24 Feb 2021 07:17:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEoPy-00075f-UU
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 07:17:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id t15so801801wrx.13
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 23:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0E5yhifL1T90IrGyMkqbKkYPvAgoE+nUQWUj2LPWCP0=;
 b=CnMPkPlPebDewujqh7cktFnvBctn8KkHpVdBeAbQq4yPpO6boZ6J3uVQhOw81DHQXR
 mfGJUxQISlHrJEE0Iu7d0ao1dZZtXIa70y+SMYCH5oP6PWCV+xHRz8L3dR8WrfFeo/AI
 sP3Cy6ypf/ruE7Rn1ail8fCZxR27SG0ezFsrSKuxwiuROkCLDqonXflF/70s2MYtViEx
 LcK4LiA1qYngEN2Ub4i21CoSV/O+U+SU8GeQ9vdqViQsteFGZHdCihluhE9FskNe2puI
 nT9c0c/J9bASJYJRef/GgsRV51flVKlyKunZNQK5BcpaFcGbOEby3PBaVh52AIAH3KgV
 9Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0E5yhifL1T90IrGyMkqbKkYPvAgoE+nUQWUj2LPWCP0=;
 b=VJ/m7btRJ94IwZZlexHw980LKXFTIPpgE64At+dqV0n6px7rjqaHXGHXBLe9fFNyFg
 OeZ8q2hS/DkkmcuKWeo569tvzinqNxvNDHCSGgvMc80ZtYzozCNTr7qm7uy4nu0fdeUo
 tpdLFiKLKod9ecDvcmQeF5+D+DiaEosvE27SU1UTizOaH754SxcoTo3NKDi/cTESMzhz
 arOWbKXy+iBfbd9kBKWyrqtax8UjGNvc5aD3+vR41LdQZ5Jg9wi+qkB64fDOkRQnrbyn
 5E91gnqbDNhqjmWBzdSnxv0eQ95WdfOveIc10l+y+JwTWcvcTeMc/1Ov2UUChRNyO/CQ
 j86w==
X-Gm-Message-State: AOAM532/Bh8f4HfRKVrE4rSdF4IbkNKV/XNMrfnPB70iiFG7SzoqM0uX
 ICzmQsKe3t8DWIUHD9WjoLo=
X-Google-Smtp-Source: ABdhPJypZFTP90apxHS5NuiPUFUcAXaNgcvfUauvqg95MidGk51f/XpLoS23ssJDh1DQ9oB5MVchkA==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr30716137wry.254.1614151020681; 
 Tue, 23 Feb 2021 23:17:00 -0800 (PST)
Received: from macbook-pro-alvaro.lan
 (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
 by smtp.gmail.com with ESMTPSA id p9sm1330821wmg.10.2021.02.23.23.16.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Feb 2021 23:17:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] nand: brcmnand: fix OOB R/W with Hamming ECC
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <32837cb2-f7ba-d59e-de66-051019b21e89@gmail.com>
Date: Wed, 24 Feb 2021 08:16:58 +0100
Message-Id: <0670B343-C39E-4610-8061-A7F81F90B9F4@gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
 <32837cb2-f7ba-d59e-de66-051019b21e89@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_021707_038019_66D007CB 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmxvcmlhbiwKCj4gRWwgMjQgZmViIDIwMjEsIGEgbGFzIDQ6NDYsIEZsb3JpYW4gRmFpbmVs
bGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiBlc2NyaWJpw7M6Cj4gCj4gCj4gCj4gT24gMi8yMi8y
MDIxIDEyOjE2IFBNLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3JvdGU6Cj4+IEhhbW1pbmcg
RUNDIGRvZXNuJ3QgY292ZXIgdGhlIE9PQiBkYXRhLCBzbyByZWFkaW5nIG9yIHdyaXRpbmcgT09C
IHNoYWxsCj4+IGFsd2F5cyBiZSBkb25lIHdpdGhvdXQgRUNDIGVuYWJsZWQuCj4+IFRoaXMgaXMg
YSBwcm9ibGVtIHdoZW4gYWRkaW5nIEpGRlMyIGNsZWFubWFya2VycyB0byBlcmFzZWQgYmxvY2tz
LiBJZiBKRkZTMgo+PiBjbGVubWFya2VycyBhcmUgYWRkZWQgdG8gdGhlIE9PQiB3aXRoIEVDQyBl
bmFibGVkLCBPT0IgYnl0ZXMgd2lsbCBiZSBjaGFuZ2VkCj4+IGZyb20gZmYgZmYgZmYgdG8gMDAg
MDAgMDAsIHJlcG9ydGluZyBpbmNvcnJlY3QgRUNDIGVycm9ycy4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gCj4gU2hv
dWxkIHRoZXJlIGJlIGEgRml4ZXM6IHRhZyBwcm92aWRlZCBoZXJlIGZvciBiYWNrIHBvcnRpbmcg
dG8gc3RhYmxlIHRyZWVzPwoKSSB0aGluayBzbywgYnV0IHRoZSBmaXhlZCBjb21taXQgd291bGQg
YmUgdGhlIGZpcnN0IG9uZSwgcmlnaHQ/CjI3YzViMTdjZDFiMTA1NjRmYTM2ZjhmNTFlNGI0YjQx
NDM2ZWNjMzIKCj4gLS0gCj4gRmxvcmlhbgoKQmVzdCByZWdhcmRzLArDgWx2YXJvLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
