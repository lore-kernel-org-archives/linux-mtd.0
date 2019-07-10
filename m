Return-Path: <SRS0=e8Hz=VH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADE9C74A21
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2019 15:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CBD42054F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2019 15:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ty1hTiLF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWtsWonF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CBD42054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B32uNEpCt5W1IIUE3ipNffHnLNWBaEjDzJ+KyjchU4E=; b=ty1hTiLF4RjsjC
	HaFDdeQmla5tYQCoHMSbEmgTY7GUeKJgT/+sKpr2jADbO51PqPBzdNAHpSubae0FuJuTjex5z1dNH
	vOGc0uBDGsUI6WShYPTGDuts2vXUnIC/tlBpIm7qBwcWpYbEUcEq5gSMycIBnIKipVUKw8XwHmXRG
	AMtSZh5NaDrx3Wi2id6r30C98q0aJneF5hUJUaqYZwNRGPFfEdDmEPzrVlKgHNLhqLMMhyZk7ayHy
	f7Eue2v3BNjEbh0wmaapVvBHOayfDKVSTlOA886rDzXI5RP+/CA3p/KfcyI6W+YmQ7Bqa5KLfLhVw
	hwAm4QMBABmWgRDPg30g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlEMR-0008Si-4m; Wed, 10 Jul 2019 15:18:23 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlEMK-0008S7-Rv
 for linux-mtd@lists.infradead.org; Wed, 10 Jul 2019 15:18:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id h28so1872988lfj.5
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2019 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcLCwlbXUioe/kWZ5KJfX5PHg1894kfSeDh/xywHqqU=;
 b=iWtsWonFCiZfA2lp5sSIJEF+XhgnPeH7ms/918aJo8t0gkEosoKd3PsNiH+SxxN9yz
 pM8pn6mMxy0+uCb30At/LA2q+LdnO7aiWsDSXTkPcHsMvYrT2sudSfsH3oIUOPFks6Hx
 m4Yf3ZM9xXHgbp57d3fJVHJy9tJkIU551uyEWSkaBqv+D1izqlNTexqekCcX5DuBuPaJ
 LK4WF9EV/VxNdWx+NeSBxYb18N1fLaRJsTeqoSnsP3V7i3jeO7oQgW7TTw8Ri19GzkTC
 FyriDZzfKe3ipst+jGanc3wO8Naal0askOruaURBidWWjtsP0XzQBm/HbEYaIapn3Wgi
 haJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcLCwlbXUioe/kWZ5KJfX5PHg1894kfSeDh/xywHqqU=;
 b=CKT3eXwkx7A4NFVxAmPnWnpoM9IVOLQKOztLNhhZ3bFQW/tKDX8riPfRhdpmWD+WUY
 JH0IphdzikQW5wpojbXszZgBqEgV7xup5a2gQr1YDcRfIz8Fl4rx+xLn7JuJONlAmzUj
 3lfLCUHG97dXGFRC/3Q1Hm4OKSAx9iRi+uNEEtayKtA5dBdxpAbSUplqoddAVkRQSUxS
 cQGpLUpmi+W5U3k2TPJCXygQGbqDj90Oi8aZS5XMDvPRn2zHD+kHOpnxNgBSC4t07H4B
 /RKGnxHXYq1kwXi+pDSxYXzsFjKXR3qa99uf/FzRkpIfVJp28bmOrDqzVAaQGLPOjVTa
 xu6w==
X-Gm-Message-State: APjAAAU8xV6a0ACPzHxv3JhzXb52xg/hbytGG6C3gWIlC21P/Z4L9g47
 BK6awhEepP24VPnTKjLBv+FfxR8eKsU1F5Re0mc=
X-Google-Smtp-Source: APXvYqxvoQkWphcQXU39VWsrSp0aFdwOOh7qSSBGfvUnIgrZGGUNoGgUjgluJvGxSd1TmaFVzl7AEFepNRDXMKoXxMc=
X-Received: by 2002:a19:7509:: with SMTP id y9mr15301832lfe.117.1562771895046; 
 Wed, 10 Jul 2019 08:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMk-x8NpDDjqtJQ0WqqRcggQxBp3uu7QbQET0m019LoG9OSkvA@mail.gmail.com>
 <CAFLxGvy=iwwUbS8O1xMAtMZYibzQ+vbft1ZVpg9erR=S1c8s2g@mail.gmail.com>
In-Reply-To: <CAFLxGvy=iwwUbS8O1xMAtMZYibzQ+vbft1ZVpg9erR=S1c8s2g@mail.gmail.com>
From: Ben Schroeder <klowd92@gmail.com>
Date: Wed, 10 Jul 2019 18:18:03 +0300
Message-ID: <CAMk-x8NfGfXZ6c0QV9kVO677PSo4gmHCgPKV=7_iz7HYX6wYEQ@mail.gmail.com>
Subject: Re: Available space loss due to fragmentation?
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_081816_929495_345ACF69 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 10, 2019 at 12:34 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> Ben,
>
> On Wed, Jul 10, 2019 at 5:32 AM Ben Schroeder <klowd92@gmail.com> wrote:
> > Why do I see a loss of space when rewriting the same file?
>
> Please see my answer below.
>
> > Can I use an upgrade scheme with file binary diff as mentioned above -
> > One that would run correctly with low available space?
>
> If the filesystem is full and all nodes are already packed, it can be
> a challenge.
>
> > Can I use an upgrade scheme with UBI volume binary diff?
>
> Yes, you can alter a dynamic volume as you wish. But keep NAND odds on mind.
> So you need to replace whole LEBs.
>
> > Sorry for the long mail, I have not found much information about fragmentation
> > and space loss in UBIFS. Let me know if I forgot any relevant details.
>
> I think the root cause of the problem you see is how NAND works.
> On NAND we write always full pages. So if you ask UBIFS to change one byte
> of a file or change meta data, it has to waste a full page.
>
> Luckily Linux is a modern operating system with a write-cache and upon
> write-back UBIFS can pack nodes (UBIFS data nodes, inode nodes, etc...) together
> and wastes less space.
> But it wastes still a significant amount of space if userspace forces
> it to persist data.
> i.e. by using fsync()/fdatasync().
> If UBIFS runs out of space the garbage collector will rewrite nodes
> and pack them tightly
> together.
>
> So, if you have a pre-created UBIFS, nodes are already packed and your
> update mechanism
> might force UBIFS to faster than the garbage collector can pack nodes.
>
> With that information in mind, do your other questions resolve?
>

Thanks for the reply Richard.
I just wanted to reiterate that i am using SPI NOR Flash, partitioned
in an A/B scheme as so:

mtd7
Name:                           rootfs
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          880 (57671680 bytes, 55.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:14
Bad blocks are allowed:         false
Device is writable:             true

mtd8
Name:                           rootfs1
Type:                           ubi
Eraseblock size:                65408 bytes, 63.9 KiB
Amount of eraseblocks:          353 (23089024 bytes, 22.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:16
Bad blocks are allowed:         false
Device is writable:             true

mtd9
Name:                           rootfs2
Type:                           ubi
Eraseblock size:                65408 bytes, 63.9 KiB
Amount of eraseblocks:          353 (23089024 bytes, 22.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:18
Bad blocks are allowed:         false
Device is writable:             true

I am not sure the garbage collector will improve the available space issue.
Regardless of the UBI being mounted with sync option enabled or disabled,
the issue persists. Even if i allow time for the background thread to run.
The issue seems very problematic when considering the fact that i am
downgrading the filesystem, patching files to be slightly smaller size
than before,
and i am still running out of disk space, regardless of how long i
wait for garbage collection.
On this regard, i will stick with your answer that it can be a serious
challenge if all nodes are packed,
and there is little available free space.

Could you please clarify your answer regarding binary patching UBI Volumes:
> Yes, you can alter a dynamic volume as you wish. But keep NAND odds on mind.
> So you need to replace whole LEBs.

It was my understanding that because UBI keeps tracks of bad blocks
and erase counters,
so that overwriting an existing and running UBI partition using a
binary diff against a newer UBI partition,
might cause loss of that metadata, or even corruption.

> --
> Thanks,
> //richard

Thanks,
Ben.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
