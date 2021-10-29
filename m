Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C4FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 16:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6532561040
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 16:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6532561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZ3TxL5OXuzGpxuh8jb4f27K722k+61reaqK3g9To3A=; b=3V7OjKlmHeYLdk
	FaQYCig9PZzC863AiScMLs67r0QwoqW+YSQnTo6hfizXAgB/nhtvlvReIvQsDYYKsSLS4jsGhGlN9
	KJKWeYMQnqVLLi0GVt++kOEZxazmPy0H+ep4LT2D3pxqDdLU7CxNBa4OPQjSX0Rnl6mM35IkV8T5W
	NNmZMe4aEGI/H6JX6uA5zw0xUKrIk0/h9L01ncqeCOPCu1JcxDACW8NZvLz/L33RbFNF84kojeob8
	ILhXr/qrGluKKzr5BC8I/PRMcY6R4nBB5b0cnIyywTvnxEIrqAMprX721hSWtFuqT9bDDEuEyBDRY
	HzXk2igQjoBLzRMDQ1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgUVE-00BQnL-Ly; Fri, 29 Oct 2021 16:13:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgUVB-00BQm1-6j
 for linux-mtd@lists.infradead.org; Fri, 29 Oct 2021 16:13:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s1so40470986edd.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2021 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0wvzHoUOEfSo0QpbymG71OXbWd0opNeWs5Mvq+1kJHs=;
 b=bttkRNnwDVZGZ/506wkfjbdj4MbdiwdXcjXepVjxY6RlXLPW0JoGna2rKlMRho/QsF
 CUboZ2XXsB1Gixrkq+Wryu8Rg7jOhaX1IVBA+rL/JcPi+TKwGxQrf52qrKOZ8Y64pMRr
 3hg34vj7Sac9UUVNkFkTA1EV5tXlrKo0p0HvyEcNTWpb5RFHAmGEp8NrqfCnQ/QpIU5i
 zDrxZ7aXNZP8XmPIEwbKxwD5tJ+A3tpuIVlm4HBmS9Cm7mUO+eUdBL1WthVMU2nWIzzS
 1RAT9OMIbeJS+KCOIFBrnbZRKuCpLbHE2GuwtlhUYh//TlOYv+kJEZaTPS5FMMOgY4+M
 VDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0wvzHoUOEfSo0QpbymG71OXbWd0opNeWs5Mvq+1kJHs=;
 b=m27DP3kmpK1D/d7wNJIM9PpBHRMW4zfLUADGgNdcsEi1iazojbOmJeFThnFMu0qZca
 XiLW2kM7bbNPTuBIgmGCn/DqCF0BMc/1VqzmbFX0pVC4JADwsofJ3+WD5eybjjy0kdok
 O3fXR+/QemkIiQR6EsW/HaEQcdAxIrXHZxkAB4ZyneqtvgxSvJ4BKzgpgkMf54ymWk1T
 wen33epd52h9SSWqL9a67eG5jvY++zmND/uVbv3Pz3TGEWdyeu8n+EhT82dcMPHDN3h3
 simQU8sWby1olfboeKoJdEnHs6QfOmX2NikqnrOR5aaFA7FibFqX5h7vVSNBknrliwuO
 jl6A==
X-Gm-Message-State: AOAM532QDZjXroI86vHYJghLrvJmCLQ6yF38aBn3O9V/F8YiXYxQ3ZvO
 Q1pb2puUEqg7voHXdwAiaUpcs8C8tNH0fdNDuvw=
X-Google-Smtp-Source: ABdhPJzdQkG5B+bZTPGh0PQuLtcPMbFfSIS5r54brUfY+4yiYodQuzSWzST1ZdK4jctl+4Y+AjBBqCQU9lJF/eEi1yk=
X-Received: by 2002:a17:906:1db2:: with SMTP id
 u18mr14568403ejh.227.1635523987737; 
 Fri, 29 Oct 2021 09:13:07 -0700 (PDT)
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
In-Reply-To: <CAOuPNLjJMCyxK8mvnBo2aZQXSNqY47YeXCxWmtPECq-=csz6bQ@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 29 Oct 2021 21:42:56 +0530
Message-ID: <CAOuPNLghc1ktLrOEf8PN+snMB3QZG-LwzPbd3kGzrhGz8mEAVg@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_091309_273668_59276D16 
X-CRM114-Status: GOOD (  30.37  )
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

Hi All,

On Mon, 30 Aug 2021 at 21:28, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> On Sun, 22 Aug 2021 at 19:51, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
>
> > In other words, IMO it's best to expose the NAND through UBI
> > for both read-only and read-write access, using a single UBI device,
> > and then creating UBI volumes as needed. This will allow UBI
> > to spread wear leveling across the whole device, which is expected
> > to increase the flash lifetime.
> >
> > For instance, just as some silly example, you could have something like this:
> >
> >                                | RootFS SquashFS  |
> >                                | UBI block        | UBIFS User R-W area
> > ------------------------------------------------------------------------
> > Kernel A | Kernel B | RootFS A | RootFS B         | User
> > ------------------------------------------------------------------------
> >                                  UBIX
> > ------------------------------------------------------------------------
> >                                  /dev/mtdX
> >
> > This setup allows safe kernel and rootfs upgrading. The RootFS is read-only
> > via SquashFS and there's a read-write user area. UBI is supporting all
> > the volumes, handling bad blocks and wear leveling.
> >
> Dear Ezequiel,
> Thank you so much for your reply.
>
> This is exactly what we are also doing :)
> In our system we have a mix of raw and ubi partitions.
> The ubi partitioning is done almost exactly the same way.
> Only for the rootfs (squashfs) I see we were using /mtd/block<id> to
> mount the rootfs.
> Now, I understood we should change it to use /dev/ubiblock<id>
> This might have several benefits, but one most important could be,
> using ubiblock can handle bad-blocks/wear-leveling automatically,
> whereas mtdblocks access the flash directly ?
> I found some references for these..
> So, this seems good for my proposal.
>
> Another thing that is still open for us is:
> How do we calculate the exact image size from a raw mtd partition ?
> For example, support for one of the raw nand partitions, the size is
> defined as 15MB but we flash the actual image of size only 2.5MB.
> So, in the runtime how to determine the image size as ~2.5MB (at least
> roughly) ?
> Is it still possible ?
>

I am happy to inform you that using "ubiblock" for squashfs mounting
seems very helpful for us.
We have seen almost the double performance boost when using ubiblock
for rootfs as well as other read-only volume mounting.

However, we have found few issues while defining the read only volume as STATIC.
With static volume we see that OTA update is failing during "fsync".
That is ota_fsync is failing from here:
https://gerrit.pixelexperience.org/plugins/gitiles/bootable_recovery/+/ff6df890a2a01bf3bf56d3f430b17a5ef69055cf%5E%21/otafault/ota_io.cpp
int status = fsync(fd);
if (status == -1 && errno == EIO)
*
{ have_eio_error = true; }
*
return status;
}

Is this the known issue with static volume?

For now we are using dynamic volume itself but the problem is that
with dynamic volume we cannot get the exact image size from:
$ cat /sys/class/ubi/ubi0_0/data_bytes
==> In case of dynamic volume this will return the total volume size.
==> Thus our md5 integrity check does not match exactly with the
flashed image size.

Is there an alternate way to handle this issue ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
