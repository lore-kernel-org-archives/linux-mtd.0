Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDA7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 13:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B26F61181
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 13:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B26F61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66TlQyrL7/672I6dHFOhQfaS74Vl0kziRqqVu7ExNK8=; b=GF0lLurpb+oS1R
	xswOqGpWI8BmrqQ4VNpkf7rUlxM5hoioaeWXX9TnN7b/g4Q82cikGA0r/3xiZw8nJOym4g6rtrVZn
	hmHlw41EFTQMEf9D1FJYjqN1GgkZkDCZW6ywfBvHC3RCOty/vk5KwAbNt3prvt1HHHNdZp+cz8mhK
	7g/LC1jKC7gfO/4iLlC8lCfXcuBt1KylEl45NXor2mA15bIMaryEseAWEbnGfdjkOz32BRazkGBq7
	ZcCdYbBUlwCcpAmG4X6GtzSVn6Op+WO3Dq+gYydgAL9TgJF4agMp/gAm3TD8lK+h9CklXAMuNh7aS
	jOPGMoHr9S+h6h+aQnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk53k-00GXMk-9g; Mon, 08 Nov 2021 13:51:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk53e-00GXLO-QU
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 13:51:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id x15so31491779edv.1
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 05:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kih4fl7OLljkrILnhClg6gIMqNW5XR9MBnfO2Pp+Auc=;
 b=FWpxv4TtkcOvo1AYCXLAUUTO91OW0Zm9ifXIsYXkKZwE79GmVtu71ss7K7MowpIXuR
 Tv+ZbOEv9M+GCWP2XlLKPoqgM6mnYXEd2xbgwcvj+C9UpmzvD8i91CvsjKtRnEuJFwq9
 NDAknGePT5SVGmIDcxC7Ru1SUdiMuo7vXOk2d4bs3LRfw5WqPZyfSp4z2CQb3zRvEYl/
 aiLjXKcTTYPUrjbKHyXIY/9y3AlITl/7JY25uKhUq1aQR4NT24u5iYpNx6gOKOtoIGhU
 htbg8YHRcAL6g2kunnrkixnAW4xZ0q7E8xv+33/A0bRZw3l10rzQ8bsnF7jVroMjoagV
 0hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kih4fl7OLljkrILnhClg6gIMqNW5XR9MBnfO2Pp+Auc=;
 b=zZrfd0svlie/2TfOpL1wm58MPoRNW9er6oBscpSKdjJqny5Pq7hI6x0dBDZj1wDORf
 GAXkJLDZ1bYjvxDbam6uwmETq0eYSezwX4Byzw6Nng3Zi1RoIAFHImNNmcNLr/Zt8Atz
 6H8gJFTZF4/npzbZXKrrwDWf66CcuPTEddUINaQICSTweZTRlyE2b84qAC2HeRF9Tqyu
 ZWXUvDqirTi24M8ILxGKyybl09asa3vqrVYUiGG6cipb6C3OSvbvUI9NXphj0q/9rk42
 MjFvSxvwQ5EGOMawHQhK7Ytf1gngWyc/0PNN8rTchyTrfksMI7Uxmm3lvNLNTPRLwJcR
 FWbw==
X-Gm-Message-State: AOAM530I5YQsp9RLF1d0cJj70X9g8zVrGhFMSMd7rAy9/zopA2drgo0i
 Ku9qCzgS8T9gZ1V0eaiJ51mtpf7VMOaIQ/1m9gA=
X-Google-Smtp-Source: ABdhPJy4jV/6tlL3qxRJNfn5m91Xz6X84Qxl3N79eKyII4LWJbORUoCopVd0T/griTLaoHNAyVxUNTfD7w94I202pSQ=
X-Received: by 2002:a17:906:2ad2:: with SMTP id m18mr84414eje.64.1636379492120; 
 Mon, 08 Nov 2021 05:51:32 -0800 (PST)
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
 <CAAEAJfDS3FK19xMs-7LcEjDe7Fx1XW6HZJGyb6Ff=zs2ZKHpJA@mail.gmail.com>
In-Reply-To: <CAAEAJfDS3FK19xMs-7LcEjDe7Fx1XW6HZJGyb6Ff=zs2ZKHpJA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 8 Nov 2021 19:21:20 +0530
Message-ID: <CAOuPNLiB5UogzjHqcwEf+HbLqB9QorQ1bU4qVdMSaSsE4taszw@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_055134_891579_FAFFD383 
X-CRM114-Status: GOOD (  47.47  )
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


On Fri, 29 Oct 2021 at 22:18, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Fri, 29 Oct 2021 at 13:13, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > Hi All,
> >
> > On Mon, 30 Aug 2021 at 21:28, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> > >
> > > On Sun, 22 Aug 2021 at 19:51, Ezequiel Garcia
> > > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > > In other words, IMO it's best to expose the NAND through UBI
> > > > for both read-only and read-write access, using a single UBI device,
> > > > and then creating UBI volumes as needed. This will allow UBI
> > > > to spread wear leveling across the whole device, which is expected
> > > > to increase the flash lifetime.
> > > >
> > > > For instance, just as some silly example, you could have something like this:
> > > >
> > > >                                | RootFS SquashFS  |
> > > >                                | UBI block        | UBIFS User R-W area
> > > > ------------------------------------------------------------------------
> > > > Kernel A | Kernel B | RootFS A | RootFS B         | User
> > > > ------------------------------------------------------------------------
> > > >                                  UBIX
> > > > ------------------------------------------------------------------------
> > > >                                  /dev/mtdX
> > > >
> > > > This setup allows safe kernel and rootfs upgrading. The RootFS is read-only
> > > > via SquashFS and there's a read-write user area. UBI is supporting all
> > > > the volumes, handling bad blocks and wear leveling.
> > > >
> > > Dear Ezequiel,
> > > Thank you so much for your reply.
> > >
> > > This is exactly what we are also doing :)
> > > In our system we have a mix of raw and ubi partitions.
> > > The ubi partitioning is done almost exactly the same way.
> > > Only for the rootfs (squashfs) I see we were using /mtd/block<id> to
> > > mount the rootfs.
> > > Now, I understood we should change it to use /dev/ubiblock<id>
> > > This might have several benefits, but one most important could be,
> > > using ubiblock can handle bad-blocks/wear-leveling automatically,
> > > whereas mtdblocks access the flash directly ?
> > > I found some references for these..
> > > So, this seems good for my proposal.
> > >
> > > Another thing that is still open for us is:
> > > How do we calculate the exact image size from a raw mtd partition ?
> > > For example, support for one of the raw nand partitions, the size is
> > > defined as 15MB but we flash the actual image of size only 2.5MB.
> > > So, in the runtime how to determine the image size as ~2.5MB (at least
> > > roughly) ?
> > > Is it still possible ?
> > >
> >
> > I am happy to inform you that using "ubiblock" for squashfs mounting
> > seems very helpful for us.
> > We have seen almost the double performance boost when using ubiblock
> > for rootfs as well as other read-only volume mounting.
> >
> > However, we have found few issues while defining the read only volume as STATIC.
> > With static volume we see that OTA update is failing during "fsync".
> > That is ota_fsync is failing from here:
> > https://gerrit.pixelexperience.org/plugins/gitiles/bootable_recovery/+/ff6df890a2a01bf3bf56d3f430b17a5ef69055cf%5E%21/otafault/ota_io.cpp
> > int status = fsync(fd);
> > if (status == -1 && errno == EIO)
> > *
> > { have_eio_error = true; }
> > *
> > return status;
> > }
> >
> > Is this the known issue with static volume?
> >
>
> I don't know exactly how you are updating your volume,
> the right way is using UBI_IOCVOLUP.
>
> See http://www.linux-mtd.infradead.org/doc/ubi.html#L_volupdate
>
> If you google around I'm sure you'll find some articles about this,
> but I'm not sure if they'll go into details and subtleties.
>
> There are probably a few different ways to do firmware upgrade
> when you are on top of static volumes (and you want to be on top
> of static volumes if it's read-only, because AFAIK they give you an
> extra data-integrity guarantee).
>
> One way, would be to have two static volumes A/B. The system
> uses normally the A volume, and then you doUBI_IOCVOLUP
> (or ubiupdatevol) to update the B volume. After the update is succesful
> you run the atomic volume rename and flip A->B, B->A.
>
> (If you don't have enough space to hold two A/B volumes....
>  ... you'll have to find some other solution, I have no idea about that.)
>

Yes, this is what we are also doing exactly.
But, currently we are running into this issue right now:
1) The FOTA update is failing if we use static volume (building and
flashing the static image is fine)
    It works fine, if we use the volume as dynamic (even for RO type
with squashfs)
    But with dynamic type we end up using the entire volume as image size.

So, we wanted to know if there is any other way to get volume image
size at runtime ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
