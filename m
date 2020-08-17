Return-Path: <SRS0=2ZLh=B3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1B8C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 13:22:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D51732072D
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 13:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HoPGRxvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D51732072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nn3IOr/vm6gGsMahYcjeIWpFp37kQILN6UEwAso9VAE=; b=HoPGRxvMu/IjIwlS7XjXdr87p
	EmuHHX+Wr4J0BxItbWn27XSXxNvwvcUnaCaYt9ooF68g4Ww9laibc0g9lqs6w5C/ChZPKvrmZdVqi
	7Qd9uku5XDV3Ds7Lpe0NioQv6CfzVRKFdcSQ4KDzX0FuBNxZNsBgVhfmsvbXCJvO4KBPqDHHDlUSP
	mfz45vDf92s5WYeB/fMyGaBMsMHzoFhpZPShtkCN9mHI/UI1HQfTu07CREEkveVqApvUqGOi4b2nn
	s0BknuPKiDvbcKnCs5YJTLVaUf3pFPOXDkRX0P+zyIjayiLhQjFCS7AdZrvLy5pR6DYLfFdKAtcCI
	ThzkU3PaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7f4x-0003om-4v; Mon, 17 Aug 2020 13:21:35 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7f4u-0003o2-Ew
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2020 13:21:33 +0000
Received: by mail-oi1-f194.google.com with SMTP id j7so14737866oij.9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2020 06:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Kc3WTUpOwNkmQ3vO1d9YQM+sAy36NgWXJVc8/GCvo0=;
 b=nKKHP05cfS87somjG9gkTlcMIldGz1ByExiiDBB2p/MHm5PLqul6QjkOJHZqbmxlKe
 hTPZ5z6iihn1peAelBVQUlWN5JgToWToKsI5D0e8huiFKVBNDAI/NWsiAK8bm0VXO9Pj
 kW9RKvLwEWLWuJVUWwyS4OvHxELMYGzLaaV9ZcB9eblEnDubAS5azCAf9QrPq+hqkIfP
 vgseGidBIXJhpl1ysScAiguIWYS8KptgB94oxVWJZloL01U0YkkSC21cczaDogzgZWAO
 0MwwqWKOMqom9YldktK/QadnTRc/6bQHD3crqjbdVqj0/IO/lLhASX4S06+n7apt645f
 JXjg==
X-Gm-Message-State: AOAM533xW48YhwG0VLGW/F0Vg2eoFwbOtBBdzbzN0QSKcXL/zAbmlKvR
 Jgr8s9EuhLNJO+hZv5hWxbNKA/P4dyqZLWSr3Sk=
X-Google-Smtp-Source: ABdhPJzItNUIHsOHtQm0H1dNHrsGUloh2lbcfGxKniDyRwtjNJUiQ6I4x9yNJC3XaRbZLGs5NYZ4qE8ARv6PvNWeH+0=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr8982386oie.153.1597670487791; 
 Mon, 17 Aug 2020 06:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200817131209.20027-1-geert@linux-m68k.org>
In-Reply-To: <20200817131209.20027-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2020 15:21:16 +0200
Message-ID: <CAMuHMdVT470w9j7rsj1L22zRq=+_XZ01Kw7hzBUmm9omHrMFBw@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.9-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_092132_513901_EBFDDC9C 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 3:18 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.9-rc1[1] compared to v5.8[2].
>
> Summarized:
>   - build errors: +1/-12
>   - build warnings: +68/-124
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9123e3a74ec7b934a4a099e98af6a61c2f80bbf5/ (all 192 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/bcf876870b95592b52519ed4aafcf9d95999bc9c/ (all 192 configs)
>
>
> *** ERRORS ***
>
> 1 error regressions:
>   + error: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!:  => N/A

mips-allmodconfig (reported against next 3 weeks ago)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
