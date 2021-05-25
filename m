Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F55C2B9F8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 09:23:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F2C61378
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 09:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F2C61378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdOJSnzfy6aUVOPZ/lxucxvykEgkuMVCoWbhwMruNNE=; b=19MzJ8Hh0B7v2l
	4XaIRn3wjD8u3loxkheNl212fsxFih7HiUGHu8DhLObRyMT12zd5h1R2S3Dr88u2TlPJPz3S00629
	qE16zwYQXlh5vQ9M61RVZhixSY72rMUK7gjVC1NNkIgCS/JnshiXQh1N/TH+YNRZ0DmBefZAaAxHI
	tiJL5M1uXMn74emRBjxhcE70HsiJvqJlOjKuyc2qdOdFPHAs3fdklAIX+b8J4P4LvqFiDqTzU+UiH
	JKwQplIjxsd7ascmpFxYM/EGcaBUyBxfzfMjSqHNEq3NOMZd5UzmnCDKCCbJJVnuTqV/GSHqCFd8w
	nsS6dYNY2TdDPtjCv+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTGZ-004Kxb-Dq; Tue, 25 May 2021 09:22:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llTGV-004Kvm-KI
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 09:22:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id r11so35242360edt.13
 for <linux-mtd@lists.infradead.org>; Tue, 25 May 2021 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4WpDFzjrpXp5hP9+v4938PGOuID77BZ1+yoSzNr4bw=;
 b=aZgrutsc1m9tSr4hBJxEgoXTPkpi+M04jPX97JYoXk0DECbfii3wJvYf/10Qf2eBuK
 k1wIdc84jsy0PLkiG1QLRUm7WRkFkJNUOJ7kxOcpcWplwI6clR/o52Jnzt2Hnv7CI+iL
 YApQWP86Q2iCfglmBKUZBEbLewHv3AAGVa+n/bp+Pqyn3BH+WA31yoIyV4/vtwP6K0i5
 foZx3ib56Gh6Y61t5cGVd3eei85F68GsG+jdSKqqinNG1KZerpnlOTFEjtCm+DBfBel9
 ke/0+B5oGRNdxlXy+M47uvRh7X/hBT1TobVh7NSwTZF+8y/P6kFDrCX7KTd9kIxL5o7A
 SGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4WpDFzjrpXp5hP9+v4938PGOuID77BZ1+yoSzNr4bw=;
 b=l38knN3udPCuoAoY4MMAq9Sa+Uh2CnRcGMZ7UFJvj+yLpQ8+kzhuroyvpzbR/cwWkr
 v3qFziDuMsVOQ1V6ciOzP3zBeQBZcin0iGMsdN3qfv/jLAd0eS1GYe9uxdfhZ8c5JDTn
 LjtzNWjp7ze5LhVpRYoN61HN9zkojqwno1GFriTulD3zJ4bBtyqzGXQRTpzhLJZhnnXK
 5NwAT3Vl80BRLS2vls3MmLsxca1C5rGCBiQXWB+Mq99FIZd5y3JvgbKQnqInmiTam7yQ
 p9Nmi2OxVdDnd56T+MtI0N2YBl4fkliV51rnsxHMjo6EXXi7FAM4vhnccrtPSCX/nisR
 S8pA==
X-Gm-Message-State: AOAM533ZBQaLTCGAGTAVrATMMv/18k4Z2kUBcJWMlRAm/8Khcry/5/gr
 N+TRsRGLZc3xPP0qwdA8uCW70boIpv9xAeXdRbWMbboEcxI=
X-Google-Smtp-Source: ABdhPJxSspRrEdzmSkEjEkJp7+mPyCDdSHTlgwh1A+zFibAdE7o8FKoR4TgcbystH6uJzQMBL8BnZShsXhII1ig9tY8=
X-Received: by 2002:a50:ccdc:: with SMTP id b28mr30538106edj.92.1621934537751; 
 Tue, 25 May 2021 02:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
 <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
 <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
 <CAOuPNLiMnHJJNFBbOrMOLmnxU86ROMBaLaeFxviPENCkuKfUVg@mail.gmail.com>
 <877196209.4648525.1621840046695@webmail.123-reg.co.uk>
In-Reply-To: <877196209.4648525.1621840046695@webmail.123-reg.co.uk>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 25 May 2021 14:52:06 +0530
Message-ID: <CAOuPNLgrwnqv_=Ux5SeY3XTDG2b0=ntRbciWVshhaVwJYFEZ3g@mail.gmail.com>
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Sean Nyekjaer <sean@geanix.com>, open list <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_022219_690111_706DFA9A 
X-CRM114-Status: GOOD (  42.58  )
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

On Mon, 24 May 2021 at 12:37, Phillip Lougher <phillip@squashfs.org.uk> wrote:
>
> > No, this is still experimental.
> > Currently we are only able to write to ubi volumes but after that
> > device is not booting (with rootfs volume update).
> > However, with "userdata" it is working fine.
> >
> > I have few more questions to clarify.
> >
> > a) Is there a way in kernel to do the ubi volume update while the
> > device is running ?
> >     I tried "ubiupdatevol" but it does not seem to work.
> >     I guess it is only to update the empty volume ?
> >     Or, maybe I don't know how to use it to update the live "rootfs" volume
> >
> > b) How to verify the volume checksum as soon as we finish writing the
> > content, since the device is not booting ?
> >      Is there a way to verify the rootfs checksum at the bootloader or
> > kernel level before mounting ?
> >
> > c) We are configuring the ubi volumes in this way. Is it fine ?
> > [rootfs_volume]
> > mode=ubi
> > image=.<path>/system.squash
> > vol_id=0
> > vol_type=dynamic
> > vol_name=rootfs
> > vol_size=62980096  ==> 60.0625 MiB
> >
> > Few more info:
> > ----------------------
> > Our actual squashfs image size:
> > $ ls -l ./system.squash
> > rw-rr- 1 pintu users 49639424 ../system.squash
> >
> > after earse_volume: page-size: 4096, block-size-bytes: 262144,
> > vtbl-count: 2, used-blk: 38, leb-size: 253952, leb-blk-size: 62
> > Thus:
> > 49639424 / 253952 = 195.46 blocks
> >
> > This then round-off to 196 blocks which does not match exactly.
> > Is there any issue with this ?
> >
> > If you have any suggestions to debug further please help us...
> >
> >
> > Thanks,
> > Pintu
>
> Three perhaps obvious questions here:
>
> 1. As an experimental system, are you using a vanilla (unmodified)
>    Linux kernel, or have you made modifications.  If so, how is it
>    modified?
>
> 2. What is the difference between "rootfs" and "userdata"?
>    Have you written exactly the same Squashfs image to "rootfs"
>    and "userdata", and has it worked with "userdata" and not
>    worked with "rootfs".
>
>    So far it is unclear whether "userdata" has worked because
>    you've written different images/data to it.
>
>    In other words tell us exactly what you're writing to "userdata"
>    and what you're writing to "rootfs".  The difference or non-difference
>    may be significant.
>
> 3. The rounding up to a whole 196 blocks should not be a problem.
>    The problem is, obviously, if it is rounding down to 195 blocks,
>    where the tail end of the Squashfs image will be lost.
>
>    Remember this is exactly what the Squashfs error is saying, the image
>    has been truncated.
>
>    You could try adding a lot of padding to the end of the Squashfs image
>    (Squashfs won't care), so it is more than the effective block size,
>    and then writing that, to prevent any rounding down or truncation.
>

Just wanted to share the Good news that the ubi volume flashing is
working now :)
First I have created a small read-only volume (instead of rootfs) and
tried to write to it and then compared the checksum.
Initially when I checked, the checksum was not matching and when I
compared the 2 images I found there were around 8192 blocks containing
FF data at the end of each erase block.
After the fix, this time the checksum matches exactly.

/data/pintu # md5sum test-vol-orig.img
6a8a185ec65fcb212b6b5f72f0b0d206  test-vol-orig.img

/data/pintu # md5sum test-vol-after.img
6a8a185ec65fcb212b6b5f72f0b0d206  test-vol-after.img

Once this is working, I tried with rootfs volume, and this time the
device is booting fine :)

The fix is related to the data-len and data-offset calculation in our
volume write code.
[...]
size += data_offset;
[...]
ubi_block_write(....)
buf_size -= (size - data_offset);
offset += (size - data_offset);
[...]
In the previous case, we were not adding and subtracting the data_offset.

The Kernel command line we are using is this:
[    0.000000] Kernel command line: ro rootwait
console=ttyMSM0,115200,n8 [..skip..] rootfstype=squashfs
root=/dev/mtdblock34 ubi.mtd=30,0,30 [...skip..]

Hope, this parameters are fine (no change here).

Thank you Phillip and Sean for your help.
Phillip I think this checksum trick really helped me in figuring out
the root cause :)

Glad to work with you...

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
