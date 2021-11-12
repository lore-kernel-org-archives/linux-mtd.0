Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 13:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0E160F4F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 13:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A0E160F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1kzw5rfo69UzteakrByAv2Kb1KpO/jb0afQJRPHCCg=; b=r4AK1H0aqJuI9U
	GZn3voW69nYo2CMUJ8KY23zD7MxzC02y9fNqeveRCa6Ipp5UgW7mKk6JA6nfKihaFiVL7p6ntHF1b
	Oclkxj8Juwg/gFg9fbcWtmjJ3nHtCmfcPR7y1ApNDv+u/JBhht1N4nq7G0MsT2Gany0IUcIDcPs6m
	tNicp9wah/VXPsyUjUhQBrodE1Rkl4wPjx1jhY5H4NeBMNATvSQUQxayg6bT540rFMzgshnI9Twr3
	spJC5mfUzxoAr9ltvu5worMGUXQsdPwzVW7lrw4lvV7FuKbjRDzK+nTr3jjHsrLDldOJs4a9Q9qy1
	hq7OzNaRIgK3SL565nhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlX4z-00AgcA-Tv; Fri, 12 Nov 2021 13:58:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlX4x-00AgbO-3e
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 13:58:56 +0000
Received: by mail-ed1-x533.google.com with SMTP id e3so1656649edu.4
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 05:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OzaSt1dTEwXnQfFV568DPDqxxZKhCtXnEKChhxAww5Y=;
 b=vY2SX+G2C7yg9GCvZZeJgGhZuqp4sXWtXTNEdAJRAGtZC/yXBVZJthziyw+xsnJjhS
 4WsIfaoxJDNVu83UM+OkWa5MuwRVJ+msSBLo64CGx8hJ3lpRhawo9g+Ve2NVy1c2rhrB
 kDQMxcdpoLg6Wa46HNSfIIJxa3ZaTs9Y/8w7nSXp38H9msXovRQGZYa+973PgYddBzf8
 4NsoNqOLfnMAZ0/at2r4BoCA3HLNGdMCxLkbAQR9xT62GNeV31yRJReKqEhdEikClY9I
 5GwXFHf1gus6AjMSjM+USzzbQCor/2uBH77MUkdeMCSw6CNEMe23mXje2AoVeG/6jrPO
 zn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzaSt1dTEwXnQfFV568DPDqxxZKhCtXnEKChhxAww5Y=;
 b=gKveDh+QfVZ7y93zazRmDmxO2f3v078GWU9OxHDV88L6fgh0jPCzfiA+IEGyARNMFt
 yCiV8mYgiY+/jh6bnLJSNNRxRNHQUAMKc3DPJPBWdHq/RHnF6vK8hWvcNNgPPNfh3nEk
 xImeoj3Cwrq9+Z3gfOiGctJDzMw0hmv8RDj3G54mmgzkuZzMrVSpaqEZ3yZzYz28P+qQ
 WNoWYgEoqQLTxDgVlFGkcYVQvSeTMqWoe864GdHY36FQIRzhtgumtIWWf9s1GWtkM6LH
 K2bgOdKsPom4dG9Avduy9Oy6B6A0YuRQmyA6Lk/sSISDdFNrHB8LXWdq5TTU9kzmsLvi
 qJxQ==
X-Gm-Message-State: AOAM530GnPJRL1igTcy3Ld3vQaXtdieB1ydgtelnNJ+bnBN3iFcM9YuM
 CCm2qwJilmUpgwWYDl75OPjTSXw9YmJ1pJQFVwFfhw==
X-Google-Smtp-Source: ABdhPJxuEbX4C17B+G90OqW0eXG0c/AcsR9xxm2XLE3sU96n9kkkpyD5qlmx1r7KC6ejShM/YyWGdNH2dmWmD8Z6FuY=
X-Received: by 2002:a17:906:12db:: with SMTP id
 l27mr20466924ejb.244.1636725533848; 
 Fri, 12 Nov 2021 05:58:53 -0800 (PST)
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
 <CAOuPNLiB5UogzjHqcwEf+HbLqB9QorQ1bU4qVdMSaSsE4taszw@mail.gmail.com>
In-Reply-To: <CAOuPNLiB5UogzjHqcwEf+HbLqB9QorQ1bU4qVdMSaSsE4taszw@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 12 Nov 2021 10:58:42 -0300
Message-ID: <CAAEAJfBsgfkqL0DXaBLRyR0VzLsof6z970J4=DawspPrbSpQ0w@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_055855_181795_D5733837 
X-CRM114-Status: GOOD (  48.11  )
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

On Mon, 8 Nov 2021 at 10:51, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
>
>
> On Fri, 29 Oct 2021 at 22:18, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Fri, 29 Oct 2021 at 13:13, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> > >
> > > Hi All,
> > >
> > > On Mon, 30 Aug 2021 at 21:28, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> > > >
> > > > On Sun, 22 Aug 2021 at 19:51, Ezequiel Garcia
> > > > <ezequiel@vanguardiasur.com.ar> wrote:
> > > >
> > > > > In other words, IMO it's best to expose the NAND through UBI
> > > > > for both read-only and read-write access, using a single UBI device,
> > > > > and then creating UBI volumes as needed. This will allow UBI
> > > > > to spread wear leveling across the whole device, which is expected
> > > > > to increase the flash lifetime.
> > > > >
> > > > > For instance, just as some silly example, you could have something like this:
> > > > >
> > > > >                                | RootFS SquashFS  |
> > > > >                                | UBI block        | UBIFS User R-W area
> > > > > ------------------------------------------------------------------------
> > > > > Kernel A | Kernel B | RootFS A | RootFS B         | User
> > > > > ------------------------------------------------------------------------
> > > > >                                  UBIX
> > > > > ------------------------------------------------------------------------
> > > > >                                  /dev/mtdX
> > > > >
> > > > > This setup allows safe kernel and rootfs upgrading. The RootFS is read-only
> > > > > via SquashFS and there's a read-write user area. UBI is supporting all
> > > > > the volumes, handling bad blocks and wear leveling.
> > > > >
> > > > Dear Ezequiel,
> > > > Thank you so much for your reply.
> > > >
> > > > This is exactly what we are also doing :)
> > > > In our system we have a mix of raw and ubi partitions.
> > > > The ubi partitioning is done almost exactly the same way.
> > > > Only for the rootfs (squashfs) I see we were using /mtd/block<id> to
> > > > mount the rootfs.
> > > > Now, I understood we should change it to use /dev/ubiblock<id>
> > > > This might have several benefits, but one most important could be,
> > > > using ubiblock can handle bad-blocks/wear-leveling automatically,
> > > > whereas mtdblocks access the flash directly ?
> > > > I found some references for these..
> > > > So, this seems good for my proposal.
> > > >
> > > > Another thing that is still open for us is:
> > > > How do we calculate the exact image size from a raw mtd partition ?
> > > > For example, support for one of the raw nand partitions, the size is
> > > > defined as 15MB but we flash the actual image of size only 2.5MB.
> > > > So, in the runtime how to determine the image size as ~2.5MB (at least
> > > > roughly) ?
> > > > Is it still possible ?
> > > >
> > >
> > > I am happy to inform you that using "ubiblock" for squashfs mounting
> > > seems very helpful for us.
> > > We have seen almost the double performance boost when using ubiblock
> > > for rootfs as well as other read-only volume mounting.
> > >
> > > However, we have found few issues while defining the read only volume as STATIC.
> > > With static volume we see that OTA update is failing during "fsync".
> > > That is ota_fsync is failing from here:
> > > https://gerrit.pixelexperience.org/plugins/gitiles/bootable_recovery/+/ff6df890a2a01bf3bf56d3f430b17a5ef69055cf%5E%21/otafault/ota_io.cpp
> > > int status = fsync(fd);
> > > if (status == -1 && errno == EIO)
> > > *
> > > { have_eio_error = true; }
> > > *
> > > return status;
> > > }
> > >
> > > Is this the known issue with static volume?
> > >
> >
> > I don't know exactly how you are updating your volume,
> > the right way is using UBI_IOCVOLUP.
> >
> > See http://www.linux-mtd.infradead.org/doc/ubi.html#L_volupdate
> >
> > If you google around I'm sure you'll find some articles about this,
> > but I'm not sure if they'll go into details and subtleties.
> >
> > There are probably a few different ways to do firmware upgrade
> > when you are on top of static volumes (and you want to be on top
> > of static volumes if it's read-only, because AFAIK they give you an
> > extra data-integrity guarantee).
> >
> > One way, would be to have two static volumes A/B. The system
> > uses normally the A volume, and then you doUBI_IOCVOLUP
> > (or ubiupdatevol) to update the B volume. After the update is succesful
> > you run the atomic volume rename and flip A->B, B->A.
> >
> > (If you don't have enough space to hold two A/B volumes....
> >  ... you'll have to find some other solution, I have no idea about that.)
> >
>
> Yes, this is what we are also doing exactly.
> But, currently we are running into this issue right now:
> 1) The FOTA update is failing if we use static volume (building and
> flashing the static image is fine)

Please add traces to find what syscall is failing, and provide more
details about it.

Thanks,
Ezequiel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
