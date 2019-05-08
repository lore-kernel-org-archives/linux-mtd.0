Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24EDC04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 09:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99A82053B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 09:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DSac1eiI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gEWoPK36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99A82053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPgjWoP7TtkoA4kfuQEdqPjbda+DPxtqpqDDXXEF0OM=; b=DSac1eiI/DFbZx
	ZvuMnBmX6D6z3M6Y60caUCEFTuqIu3m+xyYGHvMZlpcSebbC9jV0ubSYeSf2OTzJyDYHewARwv0jz
	dgUWes4CTTCUXvmqZ7v7bXULU2LB28RbUa98yZ8nBlUGYB3bNqgdO0gP8/6jiAMbFXuk/3ybqE8GO
	Wqoe1LAaaGysDx4EmvDkhZsVRdjjE01G7bK0T7F7r+a29Qd/W6u2JWE3oDJm4IsmpkbhoA+f1xrB4
	GSOTfqg/mYyUdXrLuQ78MoSkGOrAQmSxRLctUxObQEJEFClvoBUNpN2liBqW+3w4fzWGfabiXCW7I
	lqb/XsCqNiJ58bI+4RzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOIcr-0002xQ-Hf; Wed, 08 May 2019 09:12:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOIcl-0002wr-6y
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 09:12:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id s18so1464248wmh.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 May 2019 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JIsTq0RQdeIxc0gZNCHCrNxpo0d9hP+I+mP8JMmRxE=;
 b=gEWoPK36+sn8s7xK1Su8o083hY8Mh59Zgao7rkOxbxXUbg69ln4x31cQV3HgNcuVZ1
 7wsE+utxmkSczi5F96vClfgVoA/NuJfv7c0zfkV79A3nO2F7pVLpwvrwPPJgBsCZzHXS
 K7KfYQHruWvM7CB9XE9RWbtjAIw17PUHaKAak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JIsTq0RQdeIxc0gZNCHCrNxpo0d9hP+I+mP8JMmRxE=;
 b=rs0H8BxbdQ4Jum+NWXQ6FuENSMTMc5cPHEasjVz4qboSKjKqD97QELt9fLhUQhiS7T
 b/kjCpUVXoBKtkFpQne2/4linxuhPq6eLot0YDjqZxFF8fK6uheeqemsA17jv5jhtFBR
 BfWz6Na2K1/JOv/PyVbJdAZOFCaskJ8R6p6eL2qkCJ5SmvKdVa8NgAFSPEAU34204Ffq
 eVtJPe1JlZTsPLKlLhp/TrmURzcrq4dQzI/BbDxiM86/CO1youIDvXailJVLnYuco2TD
 xpdvTm0Nervk7rubM1j7E3fpqANIuHr+JDQOFCnwqUY8N9fyaIDYuD38JnwgpPzGzIkM
 GSpA==
X-Gm-Message-State: APjAAAVPTnXuht7Xjf0rC/DU+Txa3M9bQVayWv9Szhc3sp78nCFqCCgS
 ZZLHj9ki2L/VGdyooNrW+CH3ACpyE5Lma0fUyShI2w==
X-Google-Smtp-Source: APXvYqwOAsoWqB88k+3lDYLR6VyqKxoF+kJlnMDepPtmdd3NpqBWpJVXn1bl2eAHJt5nWDWjz3wLMxpuqgwSNaSzyyc=
X-Received: by 2002:a1c:f111:: with SMTP id p17mr1846910wmh.62.1557306744615; 
 Wed, 08 May 2019 02:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190506084414.89702-1-zhuohao@chromium.org>
 <CANMq1KBpqb5-Ab1z_9zzvNVCkY72pBrAEJ2UVO1CgOjP=xXQ+A@mail.gmail.com>
 <CABD5ybnTbKLNUU68+bN9EcbkJECU6egPghUm=h=xHToWGmeWUw@mail.gmail.com>
 <CANMq1KCxRyvsQ++eDHt3wko6j05kBNUHjWCQtLMKBJxO8-Fwxg@mail.gmail.com>
 <CABD5ybk+NFsVtdg06=s=iGczoCe2e2s1M+yWZMaUix02uggnrQ@mail.gmail.com>
 <20190507171038.0413678f@collabora.com>
In-Reply-To: <20190507171038.0413678f@collabora.com>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Wed, 8 May 2019 17:12:13 +0800
Message-ID: <CABD5yb=Chp8ifGgg=zYO1E2qc+oM0L1g5quq2UXr4nQJr0+rLg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add debugfs nodes for querying the flash
 name and id
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_021227_975348_7CE712AF 
X-CRM114-Status: GOOD (  20.51  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 7, 2019 at 11:10 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 7 May 2019 23:06:32 +0800
> Zhuohao Lee <zhuohao@chromium.org> wrote:
>
>
> > > > > > @@ -231,8 +231,11 @@ static int m25p_probe(struct spi_mem *spimem)
> > > > >
> > > > > Can we add this to function that is generic to all spi-nor devices,
> > > > > instead of making this specific to m25p?
> > > > I can't find a better way to insert the spi_nor_debugfs_create()
> > > > inside spi_nor.c.
> > > > Another way is adding spi_nor_debugfs_create() to all of the caller.
> > > > What do you think? Any other suggestion?
> > >
> > > That, or maybe create a new spi_nor_device_register that does both
> > > mtd_device_register and that spi_nor_debugfs_create call?
> > Thanks for suggestion. I feel that putting the mtd_device_register
> > (high level api) inside the spi-nor (low level api)
> > isn't perfect. This also will limit the caller to call this api to
> > register mtd device with debugfs and lost the flexibility.
> > I'll keep the original idea that adding spi_nor_debugfs_create() to
> > all of the caller.
>
> Why don't you move that to the MTD layer? If you add partname/partid
> fields to mtd_info you'll have everything you need to make that generic.
> It's then up to the upper layer to fill those fields before calling
> mtd_device_register().
>
Ah... i took the wrong way. I removed the partname/partid from mtd.h.
So, i can't use it inside the mtd_core.c. Instead, i created
spi_nor_debugfs_create()
for creating debugfs.
i'll submit a patch to add back the partname/partid to mtd.h
>
> > > > >
> > > > > > +               return;
> > > > > > +       }
> > > > > > +       debugfs_create_file("flashid", S_IRUSR, root, nor,
> > > > > > +                       &flashid_dbg_fops);
> > > > > > +       debugfs_create_file("flashname", S_IRUSR, root, nor,
> > > > > > +                       &flashname_dbg_fops);
>
> I thought we agreed on partname/partid. Any reason for switching back
> to flashname/flashid?
Sorry, per reply above, i took the wrong approach. So, i used old name
because i put the debugfs stuff in spi-nor.c.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
