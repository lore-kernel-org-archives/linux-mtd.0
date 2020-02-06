Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B48C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 01:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5B320658
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 01:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgDTdkra";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFcoHjgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5B320658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJz9Z69X015amZZqUkt37Lg8wpyqfJAiua0T2XLIo1s=; b=cgDTdkraQqLAvL
	kr8Ui9AY3WjwLUS8eOToEaOS59TPjIeZ53N0nZ3Xp9EELcJqPD9UUvXpOjtfrhdED15dJOidtvSnF
	lNY+aT8B/LREcROxhAhV51y81BznoWuJL9qNmIAGZYP/pq4aOsyqCuPdLs40Dvf4SP+kfQwUOwL8P
	d7Ga8dBnRVg/do+Aozwqn8C+MJblV4SRWbmhv+IqdlLfS3gbj5Ja5AoDANOwU2BL6GORmfftQkW9W
	9XwrBrnizB3Q1yN74v2Le7IsBYBfAAp9+xkonqNpf/5AkujHt8Inyfupc+RPJCcGBKe/cPqBwjQb0
	IB7stozq1wZz6dW/SAEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izWAZ-0005DV-03; Thu, 06 Feb 2020 01:41:27 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izWAU-0005D0-Ja
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 01:41:24 +0000
Received: by mail-qk1-x72d.google.com with SMTP id b7so3987875qkl.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 17:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNKU8Mvp3KeUiu0mn4IzyTzGpzmW/T91EpQv9/u35nk=;
 b=tFcoHjgFBG8Qg74M3MISYa4wziEw5w+EpM5yw3VmeRdS6QmgVgakmYQQXfENjIMJku
 K58DT9I8CmigNWYp93wzPkV/tiCqOz8dqXYWNafxTL3I6UjiWY2cuqYQc5IDV3fs9tfA
 CRFPWnop3m1umbvWsuJWmrTAiZsO+6rR0/HlMtCQnpg+HAVoEd4NfCgiYiFrcMrYe53v
 CtFgrod1eEPdxOPezC4vvz7823MTQ6V1QIcUwXr3lhsOv5dM9Ew1r6cmaZrpDJpDWKHA
 GPsQ0IYHghA0HyZz/ANeulOkLBW4uQTFv4G1ugV3/OszpUoPsyEXmHbT7pZZ8Z+Rc0Xh
 kmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNKU8Mvp3KeUiu0mn4IzyTzGpzmW/T91EpQv9/u35nk=;
 b=NBe8Gi/c7MWv+vjCumhseJBcWj6RQFkdyuoCNPWlSKONRnA/uIDHIkIdQf/nqaK5oc
 g96M3KtQcZPXJOnYE8c/EW0bsFoOBBBxGRSAc7I2pocZqNu/9NsDfavsKKveMOjIC7WU
 Noet/5rVOu+6LivBemS9wBc5wScX1472mZUobmraB8JDpWZUeyk3XP4radGffOy5HWB3
 ZhBYA7BAu6LEDhPjQRLCFRpW9/jUTWJQv0tmWTwU8GzHGGXDDZUMJgIJBB2ZSh62ZiNQ
 6qJVJRattH4HX7c2eeXjceetoaS5HoXZnlK4jCgBx/sEc8E5ImXFRk0e9rZZB9bLGtFr
 dPvA==
X-Gm-Message-State: APjAAAUTI7h4lUpn3akSF3Z+prZs9alQAPpWwS4ePs1WCNO74KXcgpM+
 RcFRREnSJKfNy5kayKGShzW3DrnAW/QX3GMGeKU=
X-Google-Smtp-Source: APXvYqzVSsnZus6oz3CJDNxwr+Kz+5udRZ1pf4MAe4w8pdaNcFKWxzzDvvvmzzn8F2GCUu4lrfxifGUqqrgMmMe2+Lk=
X-Received: by 2002:a37:7005:: with SMTP id l5mr512558qkc.334.1580953281088;
 Wed, 05 Feb 2020 17:41:21 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
 <09505ab3-a51f-e0aa-1610-1ea1f106eec7@niko.eu>
 <CAA=hcWQb-ok9u3Fa8ukBENE4peJaw=MEegT0-sMeXVWJrTinyA@mail.gmail.com>
In-Reply-To: <CAA=hcWQb-ok9u3Fa8ukBENE4peJaw=MEegT0-sMeXVWJrTinyA@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 5 Feb 2020 17:40:44 -0800
Message-ID: <CALLGbR+3e9ytEdePxy-1gRFcLH9W3=h1aP2KKDU8NZm4s9engQ@mail.gmail.com>
Subject: Re: Corruped NAND booting for all devices
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_174122_649082_7FD25733 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Jef Driesen <jef.driesen@niko.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 5, 2020 at 4:49 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi Jef,
>
> On 2/5/20, Jef Driesen <jef.driesen@niko.eu> wrote:
> >> [    6.782640] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> >> name "rootfs_data", R/O mode
> >>
> >> ...
> >>
> >> [FAILED] Failed to mount /var/volatile.
> >> See 'systemctl status var-volatile.mount' for details.
> >> [DEPEND] Dependency failed for Bind mount volatile /var/cache.
> >> [DEPEND] Dependency failed for Bind mount volatile /srv.
> >> [DEPEND] Dependency failed for Bind mount volatile /var/spool.
> >> [DEPEND] Dependency failed for Bind mount volatile /var/lib.
> >
> > At first sight, it looks you have a read-only ubifs filesystem, with an
> > overlay filesystem backed by another read-write ubifs filesystem? And
> > that read-write filesystem fails to mount after a power failure?
>
> I did notice the R/O mode, it was never in previous hardware revision,
> the MTD partition for UBI is always RW, I did not know where is that
> from, since the MTD partitions and installation was performed by our
> hardware contractor, I don't believe it could be my Yocto image to
> change it, but correct me, I could be wrong.
>

When UBIFS encounters an error, it switches the partition to R/O.
That's not a hardware thing necessarily.

Also, "MTD partitions and installation was performed by our hardware
contractor"?!?!  You've got to figure out the setup. Are you saying
that they're 100% responsible for everything below the level of
userspace? Or are you responsible for kernel, u-boot, etc... all the
software?  If so, this is a software thing and you've got to own it.
If they are truly responsible for everything lower than the userspace
software, it's time you stop wasting your time on it and get them to
debug it, this is way out of your realm.

> > In that case, this sounds very similar to the problem I reported last week:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2020-January/093542.html
>
> Interesting, good to know there is an issue here,
>

This is not necessarily your problem. Read and understand it, and run
some tests to check. But, t isn't likely the same thing.

> I guess the question here, firstly why we had the RO ubifs filesystem
> backed by an overlay RW ubifs filesystem in the first place, secondly
> is it an MTD bug or is it our fault to set up wrong RO and overlay RW
> ubifs?
>

Do you know you have this setup or not?  Based on what you're saying,
I don't think you have any idea. Boot a working device and check to
see if are running an overlayfs.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
