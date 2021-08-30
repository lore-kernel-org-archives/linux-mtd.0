Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B5AC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 18:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864B560FA0
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 18:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864B560FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBENKSeMQQxUjER1tyve8BrFJIFc7QSrOSAoDF9eygc=; b=1PD9fY/DBY5cqe
	uQ7AfOnJB5AvNrvR7nKjRoit5xearT1MudECM1FB5nGfSflw/iDfzzm7VXA4m39LpgXo62UuJjXeb
	wF2oQT0bV5supWkA9Q9TUazGe+Rg0iS8zNPsJV5fAWZXzE5gNP3nTo/4fWBxaJqehuzZ44jxPucZj
	ULl8R6WgwCJvHVDXf4JE4DODfAfW1HmP5sBDkufKxlOExCB3bI5Nhn0WIVVPhcAHcwpKpnbaL0x3+
	+stnlF+jXzsdIzCRZVYrK1V5boANfM6Z2MydXPHLKu3Bfg8Cs95zlALB+aiZ0nRqwstNuIfGHnxXd
	rs2uWZZWFqwD2h1LC3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKls0-000L33-Cp; Mon, 30 Aug 2021 18:18:56 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKlrx-000L2f-Dj
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 18:18:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id mf2so33058469ejb.9
 for <linux-mtd@lists.infradead.org>; Mon, 30 Aug 2021 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nZc2m/dOqxmB1eKzo22dnXLX+VFfEl/hwdI2/cyoEM=;
 b=A7h8ybB2P+VfxNJI8xfu7cEEl6RfK7GygfAovranOttjBmqnUVsfl9rZwsB0/8ueiQ
 TbLaGdtZk1fV1H0FFIh3V5oL95D0uAw6tIhs2R9LHq+P45BwQfuIFJDU0VpbrpyWfDCw
 Irv+4eEqcirZuczPZg/tUPVRLnjcnl+E0zbbvVkSHmr5R+iDQlxAcqrYFXEyQWEOqemX
 9m9JMczC5/QBNSVhnSfD0IK8LiQC7DYhPZN1WUGN7en8Df4mqhQAB3zux9ia3wgo+WW/
 iTWX99ISGeytT5+wDhptZuK/r2To5cSyF35/RZUU5E4sRg/A+2FGJNzn02BNAOVo3i5K
 uu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nZc2m/dOqxmB1eKzo22dnXLX+VFfEl/hwdI2/cyoEM=;
 b=CV3M4aDt+84Th8qMeupOa1ek4wZ7uyTMrkTSgjs4gzyp3vvh7EQrIzGD+AUKZeKUVu
 R/4nggT+BgWNnY2FS8QVSF9oFmaL7y3GU9n5yyu0ocXsHgHLJSDQYEj3IxScGDStgrL+
 KeSRd2GVnl6Vw3rQfixFwbBXi45xvJYirlc79FBgFCOSWdSPrMSfC2D3HeQ9EokXV75s
 51ns2tINVwxIzKH5eTKXR8iOf+18OISBHhSFME3JaKqpOhQ0W7JngREvGtPr/Sh86Tlt
 LcP+d3NZbAiZbHra+fBtkVbLeHRTIDwdmBLHlCe23EfhZ/Bl28t53kntDnp51ZktGtdk
 0kTw==
X-Gm-Message-State: AOAM533jzyCYWIwpwkHhOXN65F0b9BjYErl297DQSaXYaViwsON4nqZV
 O9CyvgCIeX/5yEUIIQJzNMdl55PUCLPDunoIJrU=
X-Google-Smtp-Source: ABdhPJyQzW3MlAgCliu3WdiEbQ0YtZ+8ycOJa910u+zPDe/bD8bYKE5SakukZYmkGdvUYCdU8uIVUyt9VaN9BvcL3l4=
X-Received: by 2002:a17:906:8cc:: with SMTP id
 o12mr18643103eje.252.1630347531529; 
 Mon, 30 Aug 2021 11:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
In-Reply-To: <20210830185541.715f6a39@windsurf>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 30 Aug 2021 23:48:40 +0530
Message-ID: <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210830_111853_509793_580A9F82 
X-CRM114-Status: GOOD (  25.52  )
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

On Mon, 30 Aug 2021 at 22:25, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 30 Aug 2021 21:55:19 +0530
> Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> > Sorry for coming back to this again..
> > Unfortunately, none of the options is working for us with squashfs
> > (bootloader, initramfs).
> > initramfs have different kinds of challenges because of the partition
> > size issue.
> > So, our preferred option is still the bootloader command line approach..
> >
> > Is there a proven and working solution of dm-verity with squashfs ?
> > If yes, please share some references.
> >
> > The current problem with squashfs is that we could not append the
> > verity-metadata to squashfs, so we store it on a separate volume and
> > access it.
>
> Here, it definitely worked to append the hash tree to the squashfs
> image and store them in the same partition.
>
> > By specifying it like : /dev/mtdblock53
> >
> > Then we get the error like this:
> > {
> > [    4.950276] device-mapper: init: attempting early device configuration.
> > [    4.957577] device-mapper: init: adding target '0 95384 verity 1
> > /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
> > 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
> > aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
> > restart_on_corruption ignore_zero_blocks use_fec_from_device
> > /dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026'
> > [    4.975283] device-mapper: verity: sha256 using implementation
> > "sha256-generic"
> > [    4.998728] device-mapper: init: dm-0 is ready
>
> Could you show the full kernel command line ?
Shared below

> > Do you see any other problem here with dm-verity cmdline or with squashfs ?
> >
> > Is squashfs ever proved to be working with dm-verity on higher kernel version ?
> > Currently our kernel version is 4.14.
>
> I confirm we used squashfs on dm-verity successfully. For sure on 4.19,
> perhaps on older kernels as well.

ohh that means we already have a working reference.
If possible can you share the details, even 4.19 or higher will be
also a good reference.

> > Or, another option is to use the new concept from 5.1 kernel that is:
> > dm-mod.create = ?
> How are you doing it today without dm-mod.create ?
I think in 4.14 we don't have dm-mod.create right ?

> Again, please give your complete kernel command line.
>
Here is our kernel command line:

[    0.000000] Kernel command line: ro rootwait
console=ttyMSM0,115200,n8 ....  verity="95384 11923
16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3 12026
" rootfstype=squashfs ubi.mtd=40,0,30 ubi.block=0,0 root=/dev/dm-0
.... init=/sbin/init root=/dev/dm-0 dm="rootfs none ro,0 95384 verity
1 /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
restart_on_corruption ignore_zero_blocks use_fec_from_device
/dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026" ...

Do you see any issue here ?
Can you share your command line for squashfs to compare ?

Thank you,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
