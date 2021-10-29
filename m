Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C3DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 16:49:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692DA611AD
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 16:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 692DA611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uELU/s/yFOxjqQoPPohQokEhSOQbCovHbdTXq4ophrU=; b=zsO99h5ivlSHdx
	fWA0ot12WRSipYnyDIpQiNTq0uFKCUUiRnbYKKWXzkM45afct3tlAtyub+7aHg6rDT5CwgNMkLIP4
	Ok06B9pv8WjEfFMaZL4sjXl+Y5W9OIPdGjV2A/bntBg/8WX/eT0AkIN5L0Jm51RGOsfZnNx5s65gv
	P/o0SkI6CP77cvzRkDn5rfdeoM9S1puSf6y9m2+A+kfS9bRIPBNZxCCDjVc4VMJWlbdHuIBLDzGe3
	snWGdWyBXuHh7pxMVI+jBuy4BC4q7u5dxbgQy42Fr2hZlq7KPY69E8tZEvWt11uC+P2sVWnUa/h73
	g5tM3prD02Hssm6bpSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgV3x-00BUGk-2a; Fri, 29 Oct 2021 16:49:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgV3s-00BUEs-PU
 for linux-mtd@lists.infradead.org; Fri, 29 Oct 2021 16:49:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id s1so40804048edd.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2021 09:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TcdDCTnshuOVSyDW/uKIGCO0k0Q0QuNljv9FfVgGquU=;
 b=XW/nwR1DaprA+6lvFbPBCOd0bN3lJVEF9cYWuEn9m8pW5LxK3WuFsM11Z69u6vxXiO
 ztz3pSaA+w+pHCxDWruKBK5LuME726e2So8Gd4Q69RDZiFlXB0Tai0zfVV3ODIeBLz1w
 jZucDCDXy0v4fAyxVxPAeM7YwfvgsjR4IQmZNramZY2ynRWf9+jW7xkg3XxpIWmBvZJD
 8jaxGQK/OkgiysxA0EyvKupk0tRlkACraeI4VgFkFhwVoP9h4iOB5Q6n0AFyUUomukqL
 YJi/krR3ClQ9zhT3WJsDk867aNKGzp8e8b8NlJj3uxFUmKefKhw6ni07wxDj34MX9M9P
 gZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TcdDCTnshuOVSyDW/uKIGCO0k0Q0QuNljv9FfVgGquU=;
 b=UWFxyFYzKGlyQ12VYeiVvIfvKo5tsz5vE5bFIndiHHFdb7wjdaZYVsdorZpheZK3F0
 oMENO8Xt2u6le6BJIK5Igy1//ypLUO42nKMRCO1qsSLe8Mbc6o6xGWTRqCIr/kgKH0yb
 sjbW/1eryfpbnVc2XKp1eUnDBC6Ho5ual3oTbH3WavPZOK3xIISu8Ydgz2oOfRMnd+L4
 Sw1Kgc2MlQhclGjSP5gg8JU6aNVwKxi4Aa2QDq0GJnKy1Oz1gjoFC3adp1vnfV8YWDuP
 Rn/962Obm0Y5z04Dv+kjQHoC9hZVcwR66h4HmcXo2rK4nv0TxhK2ZTtbAblEYJlvyCok
 QLOw==
X-Gm-Message-State: AOAM532N0whCxWax1L34EUuWmMpfD/l3XTjWxdC768yq4ZjrfG38pCfj
 kTL8srjjBj6OCCleMxPkp/g8g+ItLvGRI4Wfng5LAg==
X-Google-Smtp-Source: ABdhPJxwvPySxfNfECgzOG4aRpUBvpfyeS07DGP4QZYA33DPlucAZRZ0p250pR1OaoRjcS21Y5oyuztLavgnQ1qombI=
X-Received: by 2002:a17:906:e011:: with SMTP id
 cu17mr15540749ejb.244.1635526137764; 
 Fri, 29 Oct 2021 09:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
 <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
 <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
 <CAAEAJfDDtGcUquyP7Jn0Urttt4kSfAQbJ_qPQ90ROtWLavW9EA@mail.gmail.com>
 <CAOuPNLj+DSigRY_AgHQnGKCK-Vm4ykQBR8UfnTi2UObORTcBFg@mail.gmail.com>
 <CAOuPNLgfJGzp-RJBjydFDL1ZAvOd7=-MgXhnsb2eb_xFSLC66w@mail.gmail.com>
 <CAAEAJfBuut7VSbrrz6CxOC+Cke36eGGv8VUvfdbfLwvSBxOAAA@mail.gmail.com>
 <CAOuPNLjJMCyxK8mvnBo2aZQXSNqY47YeXCxWmtPECq-=csz6bQ@mail.gmail.com>
 <CAOuPNLghc1ktLrOEf8PN+snMB3QZG-LwzPbd3kGzrhGz8mEAVg@mail.gmail.com>
In-Reply-To: <CAOuPNLghc1ktLrOEf8PN+snMB3QZG-LwzPbd3kGzrhGz8mEAVg@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 29 Oct 2021 13:48:46 -0300
Message-ID: <CAAEAJfDS3FK19xMs-7LcEjDe7Fx1XW6HZJGyb6Ff=zs2ZKHpJA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_094901_043207_DD7406D5 
X-CRM114-Status: GOOD (  37.83  )
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

On Fri, 29 Oct 2021 at 13:13, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi All,
>
> On Mon, 30 Aug 2021 at 21:28, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > On Sun, 22 Aug 2021 at 19:51, Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > > In other words, IMO it's best to expose the NAND through UBI
> > > for both read-only and read-write access, using a single UBI device,
> > > and then creating UBI volumes as needed. This will allow UBI
> > > to spread wear leveling across the whole device, which is expected
> > > to increase the flash lifetime.
> > >
> > > For instance, just as some silly example, you could have something like this:
> > >
> > >                                | RootFS SquashFS  |
> > >                                | UBI block        | UBIFS User R-W area
> > > ------------------------------------------------------------------------
> > > Kernel A | Kernel B | RootFS A | RootFS B         | User
> > > ------------------------------------------------------------------------
> > >                                  UBIX
> > > ------------------------------------------------------------------------
> > >                                  /dev/mtdX
> > >
> > > This setup allows safe kernel and rootfs upgrading. The RootFS is read-only
> > > via SquashFS and there's a read-write user area. UBI is supporting all
> > > the volumes, handling bad blocks and wear leveling.
> > >
> > Dear Ezequiel,
> > Thank you so much for your reply.
> >
> > This is exactly what we are also doing :)
> > In our system we have a mix of raw and ubi partitions.
> > The ubi partitioning is done almost exactly the same way.
> > Only for the rootfs (squashfs) I see we were using /mtd/block<id> to
> > mount the rootfs.
> > Now, I understood we should change it to use /dev/ubiblock<id>
> > This might have several benefits, but one most important could be,
> > using ubiblock can handle bad-blocks/wear-leveling automatically,
> > whereas mtdblocks access the flash directly ?
> > I found some references for these..
> > So, this seems good for my proposal.
> >
> > Another thing that is still open for us is:
> > How do we calculate the exact image size from a raw mtd partition ?
> > For example, support for one of the raw nand partitions, the size is
> > defined as 15MB but we flash the actual image of size only 2.5MB.
> > So, in the runtime how to determine the image size as ~2.5MB (at least
> > roughly) ?
> > Is it still possible ?
> >
>
> I am happy to inform you that using "ubiblock" for squashfs mounting
> seems very helpful for us.
> We have seen almost the double performance boost when using ubiblock
> for rootfs as well as other read-only volume mounting.
>
> However, we have found few issues while defining the read only volume as STATIC.
> With static volume we see that OTA update is failing during "fsync".
> That is ota_fsync is failing from here:
> https://gerrit.pixelexperience.org/plugins/gitiles/bootable_recovery/+/ff6df890a2a01bf3bf56d3f430b17a5ef69055cf%5E%21/otafault/ota_io.cpp
> int status = fsync(fd);
> if (status == -1 && errno == EIO)
> *
> { have_eio_error = true; }
> *
> return status;
> }
>
> Is this the known issue with static volume?
>

I don't know exactly how you are updating your volume,
the right way is using UBI_IOCVOLUP.

See http://www.linux-mtd.infradead.org/doc/ubi.html#L_volupdate

If you google around I'm sure you'll find some articles about this,
but I'm not sure if they'll go into details and subtleties.

There are probably a few different ways to do firmware upgrade
when you are on top of static volumes (and you want to be on top
of static volumes if it's read-only, because AFAIK they give you an
extra data-integrity guarantee).

One way, would be to have two static volumes A/B. The system
uses normally the A volume, and then you doUBI_IOCVOLUP
(or ubiupdatevol) to update the B volume. After the update is succesful
you run the atomic volume rename and flip A->B, B->A.

(If you don't have enough space to hold two A/B volumes....
 ... you'll have to find some other solution, I have no idea about that.)

Hope it helps,
Eze

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
