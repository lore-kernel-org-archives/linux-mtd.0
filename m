Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF51C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 14:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FFD2076A
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 14:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wh5R/UXD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mehKCxEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FFD2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KSoafn2K4wp0NeT8jyvpA9JXjzeZZJQf+SWTpRXl4w=; b=Wh5R/UXDBicLDd
	n1ONolxwv7+JujCmB7upzniDmVIIBFx2aNmFGZGtjvN6zRLsruWIpS0nompgONi8v/bCvZ70kGDhf
	8sD3UIkiW3ic6tTq+CcRDXa5tVs8Je3O+WMKuuqDwZd47BMDbYPfJQp+tKVVwq+HPH4ihb6stXVU1
	xXbhwAZhBqSh9s57kf3YH5Lc9fvNKZCcyKs4n9GLdVFS7gytwR5NtIgU12D9hKH0uJ1ZCzFcYgCNq
	bHAsGaDjYYcFZQD9X4qiHBqY9IMKWjor3GGFmW+RkH/RWa6CPHWWgCiQBiNDygotkhzCnPWyujb07
	3OSd3vv2FyQfStkavqTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbJA-0005aL-R7; Fri, 15 May 2020 14:27:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbJ8-0005Zt-M6
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 14:27:27 +0000
Received: by mail-pg1-x544.google.com with SMTP id b8so1016323pgi.11
 for <linux-mtd@lists.infradead.org>; Fri, 15 May 2020 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53n0NXxNogGd/faDRXKVA/bWobWfXTC9lWKhBDbKv8I=;
 b=mehKCxEZtPNkQpDx0oskocLvG7NqA4fkwi1nzfp/DL6XUhZeUGQyhh8OKJqroIdvcc
 f0Z02rs/kq5fx8LwLA/4HMHsnIWyjjYfp3vMuZrrcjiLZUE6IMugbRUxlLBHlsL7Od64
 8fqJQnGVKGzQrYU8DXxxzIRJEJ+Q+3uSdg8YOyBL/K9fxgyp26zcPuk/Etkkxnf4PGg2
 rX36wn8V/tZty5sO4IdIra7L5yyDQ6LTzlr7zjakz/+POV/t0Vo4GcP607WF2ftVXS8L
 GGAGDKBDF+vsh8P+k9/O9E4Z1xrAa9/X4FylchFHv5pGteJdUJCMl4MvWvaZTM+3CeIB
 y3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53n0NXxNogGd/faDRXKVA/bWobWfXTC9lWKhBDbKv8I=;
 b=IeeNpwU0l6rQUqC6iUcOVUnpB1kSo743XWoQgC7V3F/unTZP3sI6z4zRhIW1FKrVJY
 iNXFrRfzK5/Pg10/Pbq2YcnldfH4cKfQg5c/ulBG3WZsUidG1xoR+/1yHFOgu5Tdg8BY
 66zdSNA/q5vqDcl2q6bePJQWFYpISHnAc0KBzsXu71xoJszTxan4gEcIBbt0eAKVVSa0
 SPVyImdvDw7Hgq/+tQGr5fl+mmhst09Cwl8++ZzaG+bgWnqmDHFXdDMYM5U+8kHnUOv9
 i1w3siSb897bMaoVmKP4teeslDNuqU13GMnU3e8PXMlIzAHVGWyiPcdaq7SqqnDc1kcd
 s2Zg==
X-Gm-Message-State: AOAM533ptmZLrluDi0wbrWhkOEzfYE8BK7rKBE0jDIg80EHdd79x5leK
 F1meYfRbrVu8KLN0IMxA+OurTt/JsP9FrGXw19s=
X-Google-Smtp-Source: ABdhPJzS92KlQk6vGXcM8Vw9uXpx1E9E3au/e/+UxJQc18uHeaoAkWxn4K/nuitAUBEbmThwq+nxIpkDbhjQiOMUJLo=
X-Received: by 2002:a62:f908:: with SMTP id o8mr4096022pfh.170.1589552845598; 
 Fri, 15 May 2020 07:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <202005152142.AWvx4xc5%lkp@intel.com>
 <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
In-Reply-To: <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2020 17:27:19 +0300
Message-ID: <CAHp75VdUWaEAuStEQZD4yOWcxBT0EkxiX90u1_9vppFb5JniGQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: kbuild test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_072726_726000_41180E03 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 5:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:

> >    440                  reg = cpu_to_be32(*pdata++);
> >  > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
> >    442
> >    443                  reg = cpu_to_be32(*pdata);
> >    444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
>
> On BE:
> cpu_to_be32 -> no-op
> writel() -> converts reg to LE
>
> On LE:
> cpu_to_be32 -> converts to BE
> writel() -> no-op (in terms of conversion)
>
> Seems to me that the proper API (if above is intended) should be swab32().
> But something tells me that above is broken (or my understanding is wrong).

And perhaps it should use lo_hi_writeq() or something like that.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
