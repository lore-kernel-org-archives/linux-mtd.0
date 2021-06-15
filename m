Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4638BC48BE5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2474611CE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2474611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXeYhWBdkfDpr8kNmRnEyEj1qqjUWeruc0iQSfbo6HY=; b=I7Gjo7OZl1MtIL
	gRwiyCTNl1shQ0xkXmXpp2aUt4nT0k7UGMWyH/STnMkrJcuj+GRg8595e2awGLhmp2mGk/HmugQ47
	SJPLCBNnpYvB+svzkI1O8Se/bLBbBBe2B3RQ2ziHAZcFJ+UuhLpdGKFY3UbtiFPLkm+ZdBkmCDqgc
	AoJcUwWx1NMucFOENn7c8fhbdWgWYHJ9AXHO0n441/sqSUn/mTCSR0OwYKHKHfq2GxjuGpgpw2YwN
	KElw3wbgW6h8HbWzRN0ApWO5opS+4c7FBRiKdE79NEgqQmPDKGYT7XK3K1c780idWhae6gybfAfMQ
	tY81w38exNxoCVqBS7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltCzI-001mok-8g; Tue, 15 Jun 2021 17:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9H6-000DEY-R2
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6z4408/6oQsiDbv7fByF9r7biAOY0o4N+GInpU23pkI=; b=OFQA6sUkk81quYfnYbJM2dRlkl
 4x6h+2NsgflhpQQOIgxccKZLOXDVbjHIfjq8wE+JIVBNGTQkGAy/yB3QsRVsTgcbgTGvtA2Zr1nSt
 zqVO19u0HajlN5BFXm9pGFuhI5UXtRP72esg6e7LzocbHlaqwkTTII9vM8DYMbiPgLSl7azKPEUfK
 Wut9C5A+Ra82QvQKFB5Qm6M/gegf49aiZNLmTaI+H/v6x9AKjXLtFmeXJgYJ5EnReLhvUiPHeNB6x
 NJlORz+AUd6l9O2CExMGI8l61vp+D9bMNFl1TZAm/oZSlJM3xwFbsXcVTpkI+wYUzod7m02gagdEU
 MewuGusg==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt5sZ-007gnc-Qf
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 10:01:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id gt18so3084932ejc.11
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jun 2021 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6z4408/6oQsiDbv7fByF9r7biAOY0o4N+GInpU23pkI=;
 b=H06GhBmxY91XwIBiT6QAmQpAftMWvSYiSkZ1ikjQiL/ABWIc6qzGO96hKW2gZMGb8i
 LPGM6p3HrLH5zBeTr2aFA0tc7/l3iZL3/+l4qB8ZwulLOQD6sIaU1oJA8GKcNaMWsbws
 lFSjtNYGjK63ptwBFN6XZPDIMY0jwp+KT/8bJMylNwfW3yTyqtzDS4rgcNqti4cqu8hF
 8F/XzvIhvRLhlw0Jw9BjtkyUHnGGJaIToVlmnZ7F3q3QjBRHXYnfJW4kOUCUtrc4W3nd
 GZRDASpUW3UpxKzXgTBfVY7kj4UzzdGgjJq/j3NKG1CqGI9Zg0Ql29g3cC7NLxBnJp/+
 JdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6z4408/6oQsiDbv7fByF9r7biAOY0o4N+GInpU23pkI=;
 b=ieocXpwTDnQbsYSFKzuFT8MM8aJVcP0gqVqoBq4CsP9xaYE73Oq5gU5+jvYG47ffjD
 EJZit+F3R3UBuaSb/dWA3cDQWAW0i9khtSmSE9v9AIzA/amaD0y28X9u+gigN1H8pbw+
 A1gM/DpqloBG0ycO/ZkyPQJtANu9u96gAqQHBPMs6Y042n4RmY9ByUWv71obCjHS7SiY
 c+k2D71R/k3qZ75CeTCWOqPcGDtB2q8jqVcdmJa3N9IPC1vKH5k+1vK8Ba0JB+A1CXbz
 vfRtk0ABq6KNTO2XpNG0PjWuEijR8V47W4LnnosOauBeDPHzAhp45DbVw8rsIjF/zsMh
 RZNg==
X-Gm-Message-State: AOAM531AOe6cei9mNeSBNvyt4pVnfQBNgyqEZM518saK/OYy+claK6oZ
 fVcg7t6YiI3Bdj+XZYX+thbZ3do6vehC/l3II50=
X-Google-Smtp-Source: ABdhPJw8+LEtoar+pUf2dCxfuXnKoD7N5HCuiqVYRWxj5aO6xnN+gaJI4iET9GPlCrNM0Q0X32v18zP6Ztg1Aywjybk=
X-Received: by 2002:a17:906:c293:: with SMTP id
 r19mr20197055ejz.252.1623751273558; 
 Tue, 15 Jun 2021 03:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
 <dacd3fd3-faf5-9795-1bf9-92b1a237626b@gmail.com>
 <CAOuPNLjCB2m7+b9CJxqTr-THggs-kTPp=0AX727QJ5CTs5OC0w@mail.gmail.com>
In-Reply-To: <CAOuPNLjCB2m7+b9CJxqTr-THggs-kTPp=0AX727QJ5CTs5OC0w@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 15 Jun 2021 15:31:01 +0530
Message-ID: <CAOuPNLio33vrJ_1am-hbgMunUJereC5GOy3QVU6PDDk-3QeneA@mail.gmail.com>
Subject: Re: Kernel 4.14: SQUASHFS error: xz decompression failed, data
 probably corrupt
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_110114_858118_9A9F9755 
X-CRM114-Status: GOOD (  23.95  )
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

On Tue, 15 Jun 2021 at 10:42, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> On Tue, 15 Jun 2021 at 03:53, Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> >
> >
> > On 6/14/2021 3:39 AM, Pintu Agarwal wrote:
> > > Hi All,
> > >
> > > With Kernel 4.14 we are getting squashfs error during bootup resulting
> > > in kernel panic.
> > > The details are below:
> > > Device: ARM-32 board with Cortex-A7 (Single Core)
> > > Storage: NAND Flash 512MiB
> > > Kernel Version: 4.14.170 (maybe with some Linaro updates)
> > > File system: Simple busybox with systemd (without Android)
> > > File system type: UBIFS + SQUASHFS
> > > UBI Volumes supported: rootfs (ro), others (rw)
> > > -------------------
> > >
> > > When we try to flash the UBI images and then try to boot the device,
> > > we observe the below errors:
> >
> > Someone in The OpenWrt community seems to have run into this problem,
> > possibly on the exact same QCOM SoC than you and came up with the following:
> >
> > https://forum.openwrt.org/t/patch-squashfs-data-probably-corrupt/70480
> >
> Thanks!
> Yes I have already seen this and even one more.
> https://www.programmersought.com/article/31513579159/
>
> But I think these changes are not yet in the mainline right ?
>
> So, I wanted to know which are the exact patches which are already
> accepted in mainline ?
> Or, is it already mainlined ?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/fs/squashfs?h=next-20210611
> From here, I see that we are only till this:
> ==> 2018-08-02: Squashfs: Compute expected length from inode size
> rather than block length
>
@Phillip Lougher, do you have any suggestions/comments on these errors ?
Why do you think these errors occur ?
Also, I noticed that even if these errors occur, the device may boot normally.
However, for some people it does not boot at all.

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
