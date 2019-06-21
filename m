Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD1BC43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA9F208C3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QmITfkuJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg2+Knxd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CA9F208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsp8yOHrH54RFvzY/Pt/9iK2lAtOSN1wQBEycocZ24g=; b=QmITfkuJV6uEVb
	cwQ04TAzv/QbJxF0Qq8scODz4C+u/buk8WlIE5u8jiz53VksvXGvQRkenJRfhzUBoZc/I47GU8486
	sC+xBIkzMW4GhboUzrm+r4fiop7BO9yDSUv4qbtQPRdnPjpor36QmplKE5Ta71JaqcAmeYBkIGWtf
	qLst7aCJjXTQ7Km+LFqvht1/auHeISi2G1Tyunhf1aFe/NDcZW3kPR22VoqAeO46XYMWD+pVSGlDm
	cPrfT66np5leNjRSpMrQEX27NC1q43tPYoop7EmD6qVTONKN8NdRboTysq9JNfbNdJQ56SFM1wFaE
	kW+2tN58b1bYcWel/BBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heNJN-0007Dm-Os; Fri, 21 Jun 2019 17:26:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heNJL-0007DN-4Z
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 17:26:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id r16so7311507wrl.11
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02y+9uoZFXDouvvruK/PifcCpzM7c2CVOfBLEfFM9zU=;
 b=fg2+KnxdbF5d7pccdiu7fsO8U9WsC4tGO5o7RFGB9Adk8Z6TGgkBYCxalnJ1IZLWRV
 Bxeq4kJSw/Q+5vU4Cx1q7LZ7LgpHN6qPDixZEjOwo0v78jQa5jvGyzUpVfMN+TsgxjVD
 gVbeicIo1tHu/BUHjzU19u7n/RFTnVuJ2UYr9ltZolsqoomZZzyMQY2KBXSq/e7AREPg
 V1U53IAUTKyKIg/G5rw8/wMh3iVxsv5FlXMK6zKuLehi0Sku/ik7o+0pmBmt9aMyB2/0
 F7uMcNPonmMsY322wgGamupH0WdMh600HepiEHd513CeQRu5+4zCvRLLDHHhJyqZANdq
 Fy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02y+9uoZFXDouvvruK/PifcCpzM7c2CVOfBLEfFM9zU=;
 b=pmRl7QRiYNXcMBn0D+GpeI91fG0zGlmCx/yS1HQFjJDCOGqkL/81B8TeuMzkk+9EQT
 /bk1UKumi4XL47X33mc2Wdt+ccaxlP9NPH8R9l0pmgBfG4hMBLDB2PV7VvE5cXPEozH3
 hazWT/CLT4963EQHMms8Mblb9HqG1YYMQp2zRxbAncIK6faRfaqcuj0nUIqNCs7z0FXu
 LxtH9QbfPLX7RwLdB5T4hF42rTTtwQ6m1sdf9Hd+zwO57EIl4RFQf+PE4x1FxPOo7NZz
 SKK+e4lUebBA9W3jPCgObciVbUqV2vxE1bBO7ZStxP3A5bzxBfRo+jAIlWAb8P4gWZQw
 dHag==
X-Gm-Message-State: APjAAAXjvDEK5oAi65syOTOnj9n8wRc8PKM/RGDO0KJ24q3kdAMW5Cq5
 rNUT37Dgw3jxOsOsw2twBq3uPYZpLIyKKRJx12U=
X-Google-Smtp-Source: APXvYqxV0sTYsV1aTDB1VraSqjv5nLmZGf3d5FogcU1gZK7eDGj1iFPFFGGz6N9PY59581KxBD9BTKnbld3kfEKar84=
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr15427776wrm.100.1561138009387; 
 Fri, 21 Jun 2019 10:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
In-Reply-To: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 21 Jun 2019 19:26:37 +0200
Message-ID: <CAFLxGvyvFL6iHOgQzw2wqpTYOTY8eW57ORuVQnkjn+Gmub=cbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd/ubi: fix initialization order of ubi subsystems
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_102651_185002_67214478 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 3:28 PM Mikhail Kshevetskiy
<mikhail.kshevetskiy@gmail.com> wrote:
>
> during ubi initialization we have a following calling sequence
>
> 1) ubi_attach()
>
>    ----------------------------------------------------------------
>    err = ubi_wl_init(ubi, ai);
>    if (err) goto out_vtbl;
>
>    err = ubi_eba_init(ubi, ai);
>    if (err) goto out_wl;
>    ----------------------------------------------------------------
>
>    As we can see "eba" subsytem is NOT initialized at the moment of
>    initializing of "wl" subsystem
>
> 2) ubi_wl_init()
>
>    it call ensure_wear_leveling() at some moment
>
> 3) ensure_wear_leveling()
>
>    ---------------------------------------------------------------
>    e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
>    e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>    if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) goto out_unlock;
>    dbg_wl("schedule wear-leveling");
>    ---------------------------------------------------------------
>
>    so, if no wear-leveling is scheduled than everything is OK
>
>    and a little bit below
>
>    ---------------------------------------------------------------
>    wrk->anchor = 0;
>    wrk->func = &wear_leveling_worker;
>    if (nested) __schedule_ubi_work(ubi, wrk);
>    else schedule_ubi_work(ubi, wrk);
>    ---------------------------------------------------------------
>
>    as result we enter to wear_leveling_worker() function

Well, we schedule work, but don't execute it since the ubi-thread
is still disabled.

Can you please share a little more about the problem you are facing?
Also produce_free_peb() should not get called at this point.
So before we flip the order of initialization I'd like to understand the problem
better.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
