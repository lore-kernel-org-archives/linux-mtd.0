Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539D3C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 13:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0863E60F46
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 13:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0863E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk96LUPkj9cbOEZjbuNt9F2O/ErR5hHWCLSThMany9Q=; b=vp8blG0dlqkCcN
	qSVzUrOnCqnWewWHpWB2p/UKIUg5+xJjgb4hxcRR6xsxISwpYcsv2idnURqhVn1Df+pdz8HY4ldZQ
	WOn0FIuqSXovZ8ehzMfxx4wLhkhabco4QYTlap0xke749ulPdHLRmJuZT3/qOQAzQZmmQr/66Uqj8
	HFIWpNOEQ43bpkaOkvC/8o55OR3oIvA9V9RBUh1ubEnozSD9gzrjKoy/mhKoPuG/5+T+3ponlAB/1
	ujpjUcyAJoMSJi+y/nv661NFwd3HvwmvsVkjwHd22Zdsd/LUqSsiHqXjpzz4EuWtl9OsqK29kGZsY
	5QSv8CYY/MyWEfnGNiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL3g3-002J9E-S9; Tue, 31 Aug 2021 13:19:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL3fy-002J7V-Kx
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 13:19:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id dm15so26754445edb.10
 for <linux-mtd@lists.infradead.org>; Tue, 31 Aug 2021 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHPtKZe+G6zxzj4XJ8SxB02koJw5U2FZ5BVM7LmQV+E=;
 b=mPKAMH17uL9S9ww1ldPDQOsQ4tTR+P+D3eOikgUSj0/+DitNDCohbo4ATcp1I06SjT
 DtASqynYghW0q1tPUeMWGawXlf0BFDZDe9W9LfZoTUBzaDmO+SsnKPGwswyHM9cysBWv
 4dXshjYaPHsm5wiPS8yv5btgABt9VfHyhyTQ0pp27r3RtOEUJG4mOx9Aof4boWcpriPC
 WmAO0yAdJJ5bXh6Qcze45IPs8ymDvoyTzQWwgJe8uW2f+g+Bs5RC8aaPz2P0RFuUseWe
 b0waCZ9QlHqyvpigVnykIqxtucM9IwJpoIX/QBCE/8MkozyCsuo0YzXplg2GcSTjZIms
 JKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHPtKZe+G6zxzj4XJ8SxB02koJw5U2FZ5BVM7LmQV+E=;
 b=bG0JjoMh1XJTOB2s4SIvVzeCBvrUJge19C7GuQyQ8AtKBKF/muOJFbCzKzuDJOgVbv
 xhiiFVA+wem7j+Hfs0PLsc/pzmkr5y1nCdRZWCsjRie4u1wn9ip8uKCePQVVMszeB1kU
 gwO4j1QbjcUqTAea46I+cPHGlpnNPR1HKmXPFZE5in9DBJzao3burnmaMoMoCL6Ddf8l
 ek8635s8iTdcxi2+K8FTanreKq6L2f5Yi07MUDW2MsiSwJu86xKySrBJh34TT0Ky1chz
 gX8AeVJXrpQP4vSOVwO10NCkz+pQawMOucwY3KBfmnZPRYtn78R3u5/OLp/TAaNUDnmt
 VMCg==
X-Gm-Message-State: AOAM531T/cpVZGNYmuX5JxxOnHYSRk1SfCDMuyadMDWBY55oiGXhwiQd
 jPCRRLSiuHe3rKcg/j6yZlJzQCeMG5+uIWWMgjw=
X-Google-Smtp-Source: ABdhPJwT+pZxjrRI5pwhP4OcAeoy4nNGBgvF439fo+caHd7TPPXqp99zWOeMMGPaHPRArVb7drlTb+9fGGonvNasmbw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr29849642edd.63.1630415980838; 
 Tue, 31 Aug 2021 06:19:40 -0700 (PDT)
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
In-Reply-To: <20210830211224.76391708@windsurf>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 31 Aug 2021 18:49:28 +0530
Message-ID: <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210831_061942_751082_80AD4389 
X-CRM114-Status: GOOD (  26.56  )
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

On Tue, 31 Aug 2021 at 00:42, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 30 Aug 2021 23:48:40 +0530
> Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> > ohh that means we already have a working reference.
> > If possible can you share the details, even 4.19 or higher will be
> > also a good reference.
> >
> > > > Or, another option is to use the new concept from 5.1 kernel that is:
> > > > dm-mod.create = ?
> > > How are you doing it today without dm-mod.create ?
> > I think in 4.14 we don't have dm-mod.create right ?
>
> No, but you can backport it easily. Back at
> http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> kernels.
>
Yes, I can backport it to our 4.14 Kernel.
Can you share the list of patches to be backported to make it work on 4.14 ?
If it's backported also I need to report to our internal kernel, but
it might be slightly easier.
Please share the details.

> > Here is our kernel command line:
> >
> > [    0.000000] Kernel command line: ro rootwait
> > console=ttyMSM0,115200,n8 ....  verity="95384 11923
> > 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3 12026
> > " rootfstype=squashfs ubi.mtd=40,0,30 ubi.block=0,0 root=/dev/dm-0
> > .... init=/sbin/init root=/dev/dm-0 dm="rootfs none ro,0 95384 verity
> > 1 /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
> > 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
> > aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
> > restart_on_corruption ignore_zero_blocks use_fec_from_device
> > /dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026" ...
>
> I don't see how this can work without the dm-mod.create feature. Are
> you sure the verity= and dm= kernel arguments exist?

Sorry, I am not a security guy and this was done by someone from the
security team.
But, I know that this is already working with ext4.
The moment we change to squashfs, it does not work.

The only difference with squashfs are:
=> verity metadata are kept on separate volume
=> The rootfstype and related stuff are different
=> verity command line related stuff are almost the same.

Also, you mentioned:
>>> Here, it definitely worked to append the hash tree to the squashfs
>>> image and store them in the same partition.
Can you share some details about it ?
How it can be done since squashfs is readonly.
Do, we need to change some parameters during squashfs image generation ?
{
  $(STAGING_DIR_HOST)/bin/mksquashfs4 $(call mkfs_target_dir,$(1)) $@ \
- -nopad -noappend -root-owned \
+ -noappend -root-owned \
}

Also, for the above cmdline, is there any problem with the block size ?
As @Mikulas said before that the block size could be the issue

Also, for squashfs we are passing like this for root=. Is it fine ?
rootfstype=squashfs ubi.mtd=40,0,30 ubi.block=0,0 root=/dev/dm-0

I see that dm-0 is already passed elsewhere so do we really need it ?
I suspect it is not required as a block device.


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
