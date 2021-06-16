Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5BCC48BE6
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 11:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53C861245
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C53C861245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKJss0335C1jXvT7PjTi+S91waizv5xQXAzoNpD0zQk=; b=XHVE2+ZORF7prB
	GVoksqn5TCGmkr3FJ49NAwtEAIt2VREQ7E4zRaDNwU2ZPNyAsDjO2mRvW8Tez9NdMv3uK3+Q9UhFb
	llWbLOqEl2Ii8V0BvOGr688JTH5PYJVaZRrT/Bm9ifuV4+x932j5f0MGZiW6SPa+LVK1Il3osH9e0
	1ulRyB/1m/lUQAgA+goGVa9yT/lPKv/9/aysFMGgE1dLCDhyddDkPh/1xzxYxvrjV44+3zM/2WQP0
	AbdYMc1ipSggJSw65DjIQMGdrRWBjZe8zNR+++qNd79QKNLckcHT4K1QMrclHvlblQezIhzW+LTQd
	MxCdJwfUvHWIPX603bXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltU8a-0069Um-2D; Wed, 16 Jun 2021 11:55:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltU88-0069MH-Sc
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 11:54:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id r7so2271606edv.12
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=srb2aA4QI+Kt38SYZXXO2+WoZGE2YUSVVf+BZ30Sr7M=;
 b=EJNlFoLCeiKYalj/YVM+4iOQNt4iIZz3fgUM5iOrsviVv2bsoYVtmFWOfbjgcRRsEN
 vsiiF6q6jDEVfkw6XEqvvp9/NKAOKakwPCncGWwqO7L+g3IrvThkmPsYUDXWgcH44QWQ
 KGPjQwln4fSmxzb4t5U/A/QUaL4shTIIcPNLOZZr59vBdwn6X4rVKj5N+OvQ+hSv0mru
 P7Vl2BgubMqZwgwDrIfywFTnVy+BZJpnyIG+DEm1HFegF/0RHghNdP/Cf0ypfQx/cqyf
 NqAoyUlTP49E1MUadmEOc+29XrW2DQFtYeeH5FKJlHH6QhqRUFxThW4eG3OrGifUHzmn
 I2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srb2aA4QI+Kt38SYZXXO2+WoZGE2YUSVVf+BZ30Sr7M=;
 b=AvQNrK85HIaiKRneO7cjOwtIlDDCn7VWxeZzOJghCYBTBvjv2J8IcfB9F1dhvFfXqm
 87qbieqAVdVZaKyfo2RRt9oOhKp88s0ObPjWIs2jBBD8HQgB+vIuBFHdwKWv4UsrJ1mX
 xKu1J7oGDoJv6QxgIFZWRDOJm/MypfAzw4/n1CrK1jNrDn7X4V9hygE8rFdE+UWvquwi
 NgftRh2NnZRmXdjZOvPn+SmkdnHvzWw9+bg6zxDh8TPCMMXsdqe5vO1Rt7EP40Px/YAt
 7tfH4ejEoIh26VEgOAsg6n+PdnTD++3u9KK9Ppy91607iZJGeONpYj8WN5PZpRFOzdm2
 r0pA==
X-Gm-Message-State: AOAM531FTrzP7B6AEmvZCffSaqdnzN1/GlHdZY60lGVXiXKQnLgJuJnu
 VrnQxW2Y+dkK+PnU1BtzJc5LLd8WN2UD35LYQ5J2KrEMIX4=
X-Google-Smtp-Source: ABdhPJxQcv0BCqR/GZONpX232XrI7n9ZVRq7/rV84Ud53uQb3ivwJ1EyVUXdmdZOCose/YOD9vqpDclsIrMXrfPlo9Y=
X-Received: by 2002:aa7:c40a:: with SMTP id j10mr1288230edq.59.1623844486650; 
 Wed, 16 Jun 2021 04:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
 <dacd3fd3-faf5-9795-1bf9-92b1a237626b@gmail.com>
 <CAOuPNLjCB2m7+b9CJxqTr-THggs-kTPp=0AX727QJ5CTs5OC0w@mail.gmail.com>
 <CAOuPNLio33vrJ_1am-hbgMunUJereC5GOy3QVU6PDDk-3QeneA@mail.gmail.com>
In-Reply-To: <CAOuPNLio33vrJ_1am-hbgMunUJereC5GOy3QVU6PDDk-3QeneA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 16 Jun 2021 17:24:35 +0530
Message-ID: <CAOuPNLgU8K8OzFzKXgp31t6iajuo3_9GxrP4c=92idmcdJ8oZQ@mail.gmail.com>
Subject: Re: Kernel 4.14: SQUASHFS error: xz decompression failed, data
 probably corrupt
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_045448_964585_93BC74E4 
X-CRM114-Status: GOOD (  27.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 15 Jun 2021 at 15:31, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> On Tue, 15 Jun 2021 at 10:42, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > On Tue, 15 Jun 2021 at 03:53, Florian Fainelli <f.fainelli@gmail.com> wrote:
> > >
> > >
> > >
> > > On 6/14/2021 3:39 AM, Pintu Agarwal wrote:
> > > > Hi All,
> > > >
> > > > With Kernel 4.14 we are getting squashfs error during bootup resulting
> > > > in kernel panic.
> > > > The details are below:
> > > > Device: ARM-32 board with Cortex-A7 (Single Core)
> > > > Storage: NAND Flash 512MiB
> > > > Kernel Version: 4.14.170 (maybe with some Linaro updates)
> > > > File system: Simple busybox with systemd (without Android)
> > > > File system type: UBIFS + SQUASHFS
> > > > UBI Volumes supported: rootfs (ro), others (rw)
> > > > -------------------
> > > >
> > > > When we try to flash the UBI images and then try to boot the device,
> > > > we observe the below errors:
> > >
> > > Someone in The OpenWrt community seems to have run into this problem,
> > > possibly on the exact same QCOM SoC than you and came up with the following:
> > >
> > > https://forum.openwrt.org/t/patch-squashfs-data-probably-corrupt/70480
> > >
> > Thanks!
> > Yes I have already seen this and even one more.
> > https://www.programmersought.com/article/31513579159/
> >
> > But I think these changes are not yet in the mainline right ?
> >
> > So, I wanted to know which are the exact patches which are already
> > accepted in mainline ?
> > Or, is it already mainlined ?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/fs/squashfs?h=next-20210611
> > From here, I see that we are only till this:
> > ==> 2018-08-02: Squashfs: Compute expected length from inode size
> > rather than block length
> >
> @Phillip Lougher, do you have any suggestions/comments on these errors ?
> Why do you think these errors occur ?
> Also, I noticed that even if these errors occur, the device may boot normally.
> However, for some people it does not boot at all.
>

It seems we have fixed this issue now from bootloader.
I think it is related to -F (free space fixup) flag for ubifs partition.
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

During flashing, we are trying to remove -F flag from ubifs image, but
I think this should be avoided for squashfs image.
I guess this issue might occur if we are trying to mixup
squashfs/ubifs volumes together ?
Or, we are trying to flash squashfs image on UBIFS volume ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
