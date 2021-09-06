Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0798EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 16:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEFD461039
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 16:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEFD461039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25gOXnM6MzqwC4adAkDutZwXnTyWv0QzZjvMR9Oi3ik=; b=xvj2LgkQSAjJ+H
	4b5s8ThZVJVyEF/F1g4ymwtkX/N31yHKhrq7vFozKX2fjUbMuRPq/tZS6x3gis+2XUQdEnkCbPKgV
	pqrnKz+LTggZER33D0bOmPBsYwqOJ9x9u/S3wtcH4F62KzDCh1rXkcNcYEmZQ5h/6BZbQx7KfAK1A
	rRrhTKrQuV3HyjeUljKA5kVPijdadgeyOEkKVnVDkim1bmr769qgnV2uxytQSSol4tqBTUVUo4ote
	X03tVwYHLH9Dp62WlUDSSmKEMPAoGHoQDpIn4WBIJbFv2+mJWjqOo6Efx2lgrFylNguWVt5oerZDe
	tG51AOfhkYVZ8N+tLbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNHTt-001J01-8A; Mon, 06 Sep 2021 16:28:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNHTp-001Iyo-VY
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 16:28:23 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n27so14469336eja.5
 for <linux-mtd@lists.infradead.org>; Mon, 06 Sep 2021 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oKyG7zEb/nW+FeiP30bM48MUXtoqIWfTDkbvnG8BkY=;
 b=bszZ/g+TVWRlcuLYrm4cp/AJpQzap4khelKGOFDxT37GwmFEI0nnoKH1mXocTABgEr
 kVhKcce52l+Bda2ODC/ZGHW8uZSxriuGwxC0LX48Hp8snUsmUVEXttz7mv959xm+oqyF
 bAg5uikiKTYSVezC6S3St86oKeK8d99jnXGqhATYzzcK2iRXCj37sVbgIQH+FlBFzMu7
 qfs6jGjKM5o0LL9zRHBR73Sg1ZX0fRKN9P+K9qpA/WpYOc26ou7hAj7+mogNeb7JbXOf
 qOBWnKxn3Tz5Xu3MlM0GqX3FLeEaCgGOT/oL2MxPcb3m9e093RzGm+AL2OOUcvurFelA
 a4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oKyG7zEb/nW+FeiP30bM48MUXtoqIWfTDkbvnG8BkY=;
 b=p+PzVxr3/7h+9T1VaqtenkIHOe+bvttFTVrEgJlew7vQpggJE1zXOPelleo1/SVKEd
 hCHb8TRqq5d/0rWGoCMAwOhWpHm3iyVTo2Sg5FY1+NXVhOc+57Nw/D+MeDMGxpfzWXid
 Br94VTY8qcrZUMZAR66y0mKmVKodqaos/nWFjd+FDKwIhMI/xU2mglAfzQrT4cOV3+s0
 hXXVMu/9v5u3W5ogpJZazq6eqAwANOdzhEhv0yPO+YYLH/D3mMRkSfKCVqXNd7DfXtg8
 uUdCNrstvP/qHxNPc+Uak0M51fVfwBWtusDfbp+l69l/CuW26IuWveY70G15A3RcSeiE
 At7Q==
X-Gm-Message-State: AOAM530k0DpFqpgSsjy3Uw9miUqfFBeySMRTsrOpdyKInh6VUI74z2dK
 U6GaOp5g8PWEJgtFuuO4/AYFjTykMDVbG2/BlGY=
X-Google-Smtp-Source: ABdhPJwyZI2iQmBxtUR38Zx7Nafy9EsJjNnIzDOyi9cAU4A8FwKXYxAZphlwRFe+JlmOEU0Qn2HcyvKeOV2DlHvWXs0=
X-Received: by 2002:a17:906:fb19:: with SMTP id
 lz25mr14543783ejb.162.1630945699450; 
 Mon, 06 Sep 2021 09:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
 <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
 <20210830211224.76391708@windsurf>
 <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
In-Reply-To: <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 6 Sep 2021 21:58:08 +0530
Message-ID: <CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>,
 open list <linux-kernel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, dm-devel@redhat.com, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, agk@redhat.com,
 snitzer@redhat.com, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_092822_076354_2EC2CFFE 
X-CRM114-Status: GOOD (  27.18  )
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

Dear Thomas, Mikulas,
Need your help in root causing my dm-verity issue with squashfs.
Please see my comments inline.

On Tue, 31 Aug 2021 at 18:49, Pintu Agarwal <pintu.ping@gmail.com> wrote:

> > No, but you can backport it easily. Back at
> > http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> > I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> > kernels.
> >
> Yes, I can backport it to our 4.14 Kernel.
> Can you share the list of patches to be backported to make it work on 4.14 ?
> If it's backported also I need to report to our internal kernel, but
> it might be slightly easier.
> Please share the details.
>

I am interested to backport dm-mod.create related patches to our 4.14 kernel.
Please let me know where can I find all the patches ?
Is it already part of mainline 4.14 ?
Please share the list of commits (from mainline) that we need to pull
and backport.

> > > Here is our kernel command line:
> > >
> > > [    0.000000] Kernel command line: ro rootwait
> > > console=ttyMSM0,115200,n8 ....  verity="95384 11923
> > > 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3 12026
> > > " rootfstype=squashfs ubi.mtd=40,0,30 ubi.block=0,0 root=/dev/dm-0
> > > .... init=/sbin/init root=/dev/dm-0 dm="rootfs none ro,0 95384 verity
> > > 1 /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
> > > 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
> > > aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
> > > restart_on_corruption ignore_zero_blocks use_fec_from_device
> > > /dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026" ...
> >
> > I don't see how this can work without the dm-mod.create feature. Are
> > you sure the verity= and dm= kernel arguments exist?
>
I checked a little further and yes there is "dm=" command line in
kernel available.
This is already working with ext4 glue, but was never tried with squashfs.
I think it is mainline derived from Android.
https://patchwork.kernel.org/project/dm-devel/patch/2c01b2a43a46fab760208d7af3a7af37eec8c41a.1537936397.git.helen.koike@collabora.com/
https://github.com/projectceladon/device-androidia-kernel/blob/master/init/do_mounts_dm.c

Mostly, this is the main repo where our source might be derived:
https://github.com/android-linux-stable/msm-4.14

Can we backport the patches here ?
If I get the list I can try it.

>
> Also, you mentioned:
> >>> Here, it definitely worked to append the hash tree to the squashfs
> >>> image and store them in the same partition.
> Can you share some details about it ?
> How it can be done since squashfs is readonly.
Can you share your reference, how are you appending the hash tree ?
Let me try the same.

But it seems like the underlying concept is the same for both
"dm-mod.create" and "dm=".
However, I am not sure if there are any changes required for squashfs
as block device..

Errors:
Currently, we are getting this in boot logs:

[    4.962188] device-mapper: init: attempting early device configuration.
[    4.969699] device-mapper: init: created device '253:0'
[    4.975503] device-mapper: init: adding target '0 95384 verity 1
/dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
8fc2e4bb751f4b3145a486a0f4f1b58149ba3eedc2a67312f31fbee131380dab
aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
restart_on_corruption ignore_zero_blocks use_fec_from_device
/dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026'
[    4.992323] device-mapper: verity: sha256 using implementation
"sha256-generic"
[    5.015568] device-mapper: init: dm-0 is ready
[   10.080065] prepare_namespace: dm_run_setup - done
[   10.080093] prepare_namespace: saved_root_name: /dev/dm-0
[   10.083903] prepare_namespace: Inside: name_to_dev_t
[   10.089605] prepare_namespace: Calling - mount_root() ...
[   10.094519] [PINTU]: mount_block_root: called with input name:
/dev/root, fs_names: squashfs
[   10.263510] [PINTU]: do_mount_root: sys_mount failed: err: -22
[   10.263544] [PINTU]: mount_block_root: do_mount_root: err: -22, p:
squashfs, flags: 32769, root_mount_data: (null)
[..]
[   10.745672] No filesystem could mount root, tried:
[   10.745676]  squashfs
[   10.748015]
[   10.755232] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(253,0)

It seems the rootfs could not mount due to invalid arguments.
Not sure which arguments are invalid here...


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
