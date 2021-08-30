Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06257C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 15:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE29460F5B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE29460F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTNkl1FxweGlJLwladftS4tRaHFbHzobhQbY2XewJrE=; b=Uy7SmHmbkYjbUv
	w5ZwmftU7VGjOSJgGQgLi+5/au/txRolOz5zF7BDZ/ZGNcxmJZM9KRkriAocVRVaoMCeUmORSBmoU
	FmPHXBvy5wreHb1TYct0+VfzCc7AIZZ1HRgdJ14o+bUxnZb9DfNdJCyGSbaJcdOqhYV1NsXVLcoJ+
	ESPv1vg4fK9RRyD9a3C6N92KEhx3t48AVjIGR4jn7IwOF0qhFSv8XBe+cLt3KQhkFVRxSoRcxiRNM
	wO04DUkkp2+IzAg49jTgNA6fWT1jnMPfiuT407KZ10S47HfiqMQ0PxwKHA0smepX8NGHBrpud+mLL
	P/WTTJc0bdtQsd1dMNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKjgM-00HZIU-Oc; Mon, 30 Aug 2021 15:58:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKjgJ-00HZHq-Q9
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 15:58:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id mf2so32170892ejb.9
 for <linux-mtd@lists.infradead.org>; Mon, 30 Aug 2021 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzLND7Bopp3YFFk8qiP7F6kcwfQFWTuokrIXZ++/vhE=;
 b=fWObb/2djR3cm5fTeSb9+LO040MhFz5L6dYeZV2JHwopgB9+uTVKX06+arqZaC/X/A
 CieSqOlJb1rXXSJrzxaNkQgh8u3zzv/A4aEBrh2o1JhmOaeb6vwugLWOQlJsYiJIw8qS
 tvHq6oG1/2ZJ274+HV+NShdq6LN2DQLgmxfNjjMaMFcYx//2fA862tSOQj5f/eZQ9DfX
 b1gkzvAZtFQ9xT5v8M/Au7rrlv1090n1d+lzlw4QyHtMacgZE0HLJkoZFCQ3WBimy/7R
 zt5JCF0eDOzbL0fjAB/CVVnoMQbx01IaCxBvsW0dA0TSgbbANhLMeSAQie1MFUoCqDbJ
 DMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzLND7Bopp3YFFk8qiP7F6kcwfQFWTuokrIXZ++/vhE=;
 b=QazBi+w21pe++lUVU7fVgktAA9PPAguDuS19r4H899/VHxKX28LEJyK22qfQDPRofx
 jahtZufyloFDPSJRZnoA6q/m+IVPL1n965lfB2WMh6/b5zwHwPOQPNsYsEK4xF6t2/hl
 GcOKMzZ5cCO3gJ1bAK8CXTtQSoJot/tQbuD0+jbVOGlFKAAkAHIdPaQ/098wsUwrUGx0
 NXKxqi9mwcfCd9AbcasJdWPErlAPSKvA26loLp2a6ZYl+iBUrb8xZE70fMvyzUoOFJvk
 YI0S512FpcAc1IV7VyNjAF4cHkx2j3XFL+4RG/Nqu7C0k5EHDhScGXtlHpE2mDe0Asuu
 2R1A==
X-Gm-Message-State: AOAM532mLTaliWucz+HSbQvG1A8EfOTqhlOwyoyEicaxaN9nRgPpmzIf
 debOm8/q+KVHjCnT53NH82386sroX3cBj9pCMXM=
X-Google-Smtp-Source: ABdhPJzLFV/rR6wo4yVk550MR8vklFxaVF9r2OFQz46oVJLdEyjG3JtCYPFfu2QJXiMKd5YRHHpxH9vLiBtmGZzmN1k=
X-Received: by 2002:a17:906:3e10:: with SMTP id
 k16mr26711718eji.116.1630339120139; 
 Mon, 30 Aug 2021 08:58:40 -0700 (PDT)
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
In-Reply-To: <CAAEAJfBuut7VSbrrz6CxOC+Cke36eGGv8VUvfdbfLwvSBxOAAA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 30 Aug 2021 21:28:28 +0530
Message-ID: <CAOuPNLjJMCyxK8mvnBo2aZQXSNqY47YeXCxWmtPECq-=csz6bQ@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_085843_907303_608E9C32 
X-CRM114-Status: GOOD (  17.49  )
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

On Sun, 22 Aug 2021 at 19:51, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:

> In other words, IMO it's best to expose the NAND through UBI
> for both read-only and read-write access, using a single UBI device,
> and then creating UBI volumes as needed. This will allow UBI
> to spread wear leveling across the whole device, which is expected
> to increase the flash lifetime.
>
> For instance, just as some silly example, you could have something like this:
>
>                                | RootFS SquashFS  |
>                                | UBI block        | UBIFS User R-W area
> ------------------------------------------------------------------------
> Kernel A | Kernel B | RootFS A | RootFS B         | User
> ------------------------------------------------------------------------
>                                  UBIX
> ------------------------------------------------------------------------
>                                  /dev/mtdX
>
> This setup allows safe kernel and rootfs upgrading. The RootFS is read-only
> via SquashFS and there's a read-write user area. UBI is supporting all
> the volumes, handling bad blocks and wear leveling.
>
Dear Ezequiel,
Thank you so much for your reply.

This is exactly what we are also doing :)
In our system we have a mix of raw and ubi partitions.
The ubi partitioning is done almost exactly the same way.
Only for the rootfs (squashfs) I see we were using /mtd/block<id> to
mount the rootfs.
Now, I understood we should change it to use /dev/ubiblock<id>
This might have several benefits, but one most important could be,
using ubiblock can handle bad-blocks/wear-leveling automatically,
whereas mtdblocks access the flash directly ?
I found some references for these..
So, this seems good for my proposal.

Another thing that is still open for us is:
How do we calculate the exact image size from a raw mtd partition ?
For example, support for one of the raw nand partitions, the size is
defined as 15MB but we flash the actual image of size only 2.5MB.
So, in the runtime how to determine the image size as ~2.5MB (at least
roughly) ?
Is it still possible ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
