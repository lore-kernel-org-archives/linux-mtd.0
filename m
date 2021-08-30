Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC17C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:26:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CC460ED6
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6CC460ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98OuWANBH+/AdpQPE15xiLbM10KKJhLAoYZHXS98Tsg=; b=bbxY78QyoIoi+F
	DpRP1RjQYN++qrpdxDfNmqFOseCYuC+mvk5xSkcfglWvXtQPTmT2qvbb/6ZcNg1IB77p3pZ0Ds4wy
	ih22Z3MN5SR6Jswcim+6AN7lluGX4z0FmT2hjoeeOLRkmFFpt8ojJOGOpJg/IXXRuPp/uLcIrwqkG
	CU9UIAssb/BQO/Bxa3MoISb80vLYTbyo14sA/zKqmHzXez9eRiKpiP4gE68jFGI388dzGZ6l4yHun
	bt+kuTmgOLUt0ZP7qIrLgU/jZaNkhaiG/dzg+PAvUGIhuYia7ecFJKryHvdwCjOcqha2/Sc5T8FzR
	v24Hn2JRDLkfBrn+p51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKk6K-0004BT-8I; Mon, 30 Aug 2021 16:25:36 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKk6G-0004AU-QC
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 16:25:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id r7so6495826edd.6
 for <linux-mtd@lists.infradead.org>; Mon, 30 Aug 2021 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nM2mQX3CjHoVvQzXA9QRVqQGDAbVu2Bb047tmbqXsXo=;
 b=bA1E1KgWEDH/JcQBubmzNzyWUytl4cFe1kH1PHzTekCt2/yQWDd9CgouzSCv4R5Vi4
 EAAT69bmH3esYn8vAL2aDmmP0bTIOyhneMcIKUrz/BGD9oiHxicw70vvihG98A9qa/qc
 keNzwt5MF1V7X099AZ2XqHRnAKPBeXfaXlZaBMQCydYPuTQVE6Lqqanx0X9VRfP+suuQ
 uMjyKJ0lRrurDG5/5T1+XuL9kAQal6psuSclzLdI540j58xR/20m8n0N8uEMb3mYL8dn
 H7PyCSmpnrntHaDQgdvamIsORLZVaJXj4guatB/MWW+Qcj4uLzMMs8fFK/zsKrcHxkEj
 fGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nM2mQX3CjHoVvQzXA9QRVqQGDAbVu2Bb047tmbqXsXo=;
 b=fajSyzJeB2GWK76mRomRJCRnJcspVRRgaD8PElb9CQoz+rUg0BAzVQMPuTEApb32zB
 LylegDrrND1efBaCnRtGdhN8OGrSWOjv8p5RZ9wjhMaRkuH+2hLzgT8jEZtZYukdSJX9
 OKF1tKH2yoyp7jeu7Ts9gwqG7Z+J3oQoSeIZIEb4RPN1ri82EhhqAMOOETejXojLy8oI
 neejL2Qslip+TFamrJVLpSdI/B5yNcMYOaqeLOpcOk3dvG+fGZdoBAiCWNlHSLYAQ7ae
 XQ1TAL5I59Vyc2G1v+HHbhEk638YtDRarEXzjUiG1L7A8bAb/UKZZfHhJRJsJ9J43QEi
 hmKw==
X-Gm-Message-State: AOAM53263h9YVi30Lf95/p9K7nexz5CBTQFq/p+iEL7HigFmypOXePmT
 +Oi+CHzy/fQ+Em2LpTcSWgg7Spg+ILo0snAn4w8=
X-Google-Smtp-Source: ABdhPJxFVwH5a9vwpgHr69uleyHJFXry4tEBhgWEqP3jLJ2yNeNcN8OYKvlGgPaWD3RXyoBlU+G/vqMKDepmDLjCHqM=
X-Received: by 2002:a05:6402:2050:: with SMTP id
 bc16mr5209767edb.92.1630340730956; 
 Mon, 30 Aug 2021 09:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
In-Reply-To: <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 30 Aug 2021 21:55:19 +0530
Message-ID: <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 dm-devel@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 agk@redhat.com, 
 snitzer@redhat.com, Sami Tolvanen <samitolvanen@google.com>,
 thomas.petazzoni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_092532_891926_3CCB8FF5 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, 21 Jul 2021 at 22:59, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> On Wed, 21 Jul 2021 at 22:40, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> > > >
> > > > Try to set up dm-verity with block size 512 bytes.
> > > >
> > > > I don't know what block size does squashfs use, but if the filesystem
> > > > block size is smaller than dm-verity block size, it doesn't work.
> > > >
> > > Okay thank you so much for this clue,
> > > It seems we are using 65536 as the squashfs block size:
> >
> > 65536 is the compression block size - it is unrelated to I/O block size.
> >
> > There's a config option SQUASHFS_4K_DEVBLK_SIZE. The documentation says
> > that it uses by default 1K block size and if you enable this option, it
> > uses 4K block size.
> >
> Okay it seems this config is set in our case:
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
> So, with this the squashfs and dm-verity block size exactly matches (4K)
>
> > So, try to set it. Or try to reduce dm-verity block size down to 1K.
> >
Hi,

Sorry for coming back to this again..
Unfortunately, none of the options is working for us with squashfs
(bootloader, initramfs).
initramfs have different kinds of challenges because of the partition
size issue.
So, our preferred option is still the bootloader command line approach..

Is there a proven and working solution of dm-verity with squashfs ?
If yes, please share some references.

The current problem with squashfs is that we could not append the
verity-metadata to squashfs, so we store it on a separate volume and
access it.
By specifying it like : /dev/mtdblock53

Then we get the error like this:
{
[    4.950276] device-mapper: init: attempting early device configuration.
[    4.957577] device-mapper: init: adding target '0 95384 verity 1
/dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
restart_on_corruption ignore_zero_blocks use_fec_from_device
/dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026'
[    4.975283] device-mapper: verity: sha256 using implementation
"sha256-generic"
[    4.998728] device-mapper: init: dm-0 is ready

[    5.614498] 1f35            1736 mtdblock53
[    5.614502]  (driver?)
[    5.621098] fc00           61504 ubiblock0_0
[    5.621102]  (driver?)
[    5.627661] fd00           47692 dm-0
[    5.627665]  (driver?)
[    5.633663] No filesystem could mount root, tried:
[    5.633667]  squashfs
[    5.636009]
[    5.643215] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(253,0)
}

Do you see any other problem here with dm-verity cmdline or with squashfs ?

Is squashfs ever proved to be working with dm-verity on higher kernel version ?
Currently our kernel version is 4.14.

Or, another option is to use the new concept from 5.1 kernel that is:
dm-mod.create = ?
But, currently I don't know how to use it with squashfs either...
Any reference example will be helpful..

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
