Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB083C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:12:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6467B206B6
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdr7DOG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+FNl2Kw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6467B206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFGwqYx+oGVwhkDaY2e0aSCIBhdB/WRA3qh9KcLMAJg=; b=mdr7DOG4xjDmb9
	7n1GzODvUlrMiyGc9nEHtFlSr6E7jd6cyuKH9h7Tvoqd6vWIefOomNeAEdi1wsg4vXHoCiYLEYQro
	o6+oHrv8/t9CYrXsFcZVDftkJ3bj54qwcGKrYZazZPxhOIZIbviH8x4FJex06g0svjSXOL0NjbGkB
	0B8zXAPni4p3HIxpk1hdYYiRoNpdtlSj/V/3Q0Kid1LFQuK29Kww40geEKFWS7HefAenAKNw34gCz
	qUW9tKgBlNkUfENboONP4ZXbt4EvuuCtqXDXm2Gx+6UYpPABDyUO+1FGHu2X6jqFQsomYWGOzuT3V
	fOruvQSY20/fd+/eU3og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6X3-0001fd-Uq; Fri, 22 May 2020 12:12:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6Uj-0005V3-MX
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 12:09:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id f13so8422348wmc.5
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
 b=r+FNl2KwIQ7JgjPzvrnUaW17rVNutC2CTeAMUaRHvvsnpUtCkm2JjIRnFLtESPgc98
 bWET8r1VtyWvDebFioaQQdSqQywAIbHbtgWvJCboIHty4zcCRsHDLPEUVn206M/Y/lnC
 L1XGN0wmoFwCyTs5yYSag1A0IG431c3PHrdm9Qz2iQLbemMw7CkeUtG8zXO3x+wt6Saa
 rYi/yzSDTQervbLrgj2+Xr4TS4PITujdbP4xgZ1QXafnuii+JTLb/S1JAhpKwiQbq7ir
 s3qXFCpg/IzTKu9btruMwy1c9ljrzeWgvJHZnKXBTE4hZJk2EWBzK3bIV5Wpg1ZyxbLe
 jFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
 b=T/eFyl9BhTWpBbfSOcc3GHpxnek0xKZuF1ywCoyMrGpyQoKo8W5aIxRB9TbeDerULF
 gjFTdQaifet7T130zFbncrKH7mYsUaBlrpcjCfm+eGQfTCu5SCjctK3e7BTA8cyAMZXd
 94KK6Nd2jdknvdBXerv4juVa8MK5HHSfqbOkXOAY8hVvSl18zBWAFpaKou6NxSbU4VSz
 EUOwcGqm2oaqOFSYQ925MWoWex7RwRVWDW4NdD/V2Q8B9iac21Khz/Yqq+BlnBLoQZzs
 hM/zXFOJSn5gAKuZ9qrI3cpJj2/rjk52kI7K+B4x6dnKZ12I8DM4sa6esu/v/97VTJDe
 I9Tg==
X-Gm-Message-State: AOAM533gz9Z30MwvP0s2WkZKkiKnI+3hFIBsTamEPz8ioRZkGHCcJDVg
 dWwzdSX4q79w+Ob93jZEoQk=
X-Google-Smtp-Source: ABdhPJwcDofe/8iI1LchV/4xbq+fLSJ7DSsUdZR+A9tox/LGZa0X/bncsOu4qrCpcFWpKdta9zQA7Q==
X-Received: by 2002:a1c:2013:: with SMTP id g19mr3470829wmg.143.1590149383522; 
 Fri, 22 May 2020 05:09:43 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan
 (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id x17sm9259500wrp.71.2020.05.22.05.09.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 05:09:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 5/5] nand: brcmnand: support v2.1-v2.2 controllers
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200522132211.16c657aa@xps13>
Date: Fri, 22 May 2020 14:09:42 +0200
Message-Id: <4153A581-0894-4A4F-AE8D-22E5A976FE06@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
 <20200522072525.3919332-6-noltari@gmail.com> <20200522132211.16c657aa@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050945_755069_E701A59C 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdWVsLAoKTm8sIG5vdGhpbmcgZWxzZSBjaGFuZ2VkLgpJIHdpbGwgY2hhbmdlIGl0
IGFnYWluIHdpdGggdGhlIHByb3BlciBzdWJqZWN0LCBzb3JyeSBmb3IgdGhhdC4KCkJlc3QgcmVn
YXJkcywKw4FsdmFyby4KCj4gRWwgMjIgbWF5IDIwMjAsIGEgbGFzIDEzOjIyLCBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4gCj4+IHYyLjE6IHRl
c3RlZCBvbiBOZXRnZWFyIERHTkQzNzAwdjEgKEJDTTYzNjgpCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
