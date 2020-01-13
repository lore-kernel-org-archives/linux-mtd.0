Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC02C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8BF214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C7lBV1CT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQY/wmDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8BF214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ/DCRhULYLIcaEdMI+YWUWkbLwCT3pVAvh9lu7mpRQ=; b=C7lBV1CT+4XYpl
	tL3lk8sd4dfWB57yDb6wpqmQbDeigXyZSf/D7fRnrbuB5P6k+/yeMwFo6PrTowYZYTB814qNkG++3
	Bw/Eff4i5mbUIZncuJtzCQcWKZYBBr2itMbV1/i7PmQQRwDNRNiFos6SPw5KxZzv/5gGPj2J9jv59
	KbpcxfUn/NtbOBm0NNA2su6702vKq2r14G5eKCtOihZJHLhu6+ZETJRllws17t7BqoxIKXUh0d7is
	fySwz1I9sGTyaGME/zQ6jc0sm5DUjMHs4Q7DxcjpH/XEuogkRS04nUUxL1Lzm9ulAcYU4dpej4/cy
	8UoY8f+GWdcEkjcl8d+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqzAj-0004Pt-TQ; Mon, 13 Jan 2020 12:50:21 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqzAf-0004P9-2M
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 12:50:20 +0000
Received: by mail-il1-x144.google.com with SMTP id f5so8033701ilq.5
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qZOJ4jFyoLiTAMikt4zZzCf/VncThZPPP1of3+CvJM=;
 b=CQY/wmDkFI1Rv17izRfRa5q3Aa8ZL0bJG9uHARkU6Dmc2YLM0XYeVpm2wLzZzKYfFJ
 H9njyke/pAuvge6CxPN4rYwsbDrBCrdWujFmlZPPdrzUy/t/Qw8fXi0MHO7D8SvgWXWK
 w7LNqUSPOtozUsc6PLEmebzmpKcJ1RdIhxN/gyIYxJhGK6dGrkDyiLCZdggjjg1H1r6+
 Ky9zveCNxwiLkrq4D/FdJsOfnBJfdkJlIEkDArV5FmOhNick3ei/8Ro6r0QbmayP4KvG
 vJUdSx3yWEBGYhVrQ/T+3/DI/vDIca7ISgU6WVTpjoVze+/odI/nL006Eq6NtIL3jTQv
 sfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qZOJ4jFyoLiTAMikt4zZzCf/VncThZPPP1of3+CvJM=;
 b=i8V3CDiuo9lku7u7kg3B8q8kAHYixycNTO+IMb1DTIw0cKtEhDUHANYP9Vn0qtTzSq
 WIhqPE30DYzr6yOte4dt0YhOFAFIYz4O0AQZOVzG48+FWMkhjymH3iJdQFUwzp2UH+Zy
 5zW12GgE6mtt0FvtB3fD3FLjo/GqHp+WYxdZLcTKKxV8AJTPYc+q28XflW8qzLL2vAps
 YLx9rq9+t9TxYf5fWxd5UBPW8QOLrSPTpAk5gYBkXkssjJMqsyWhSL9LwOc7XEk12152
 fEtbddaiNfkhFfKs1dbue6DNGNLpuBRqtNCbtBEjj+1GaD6TLZ+kZZbtx5Qd4Zz7TFdR
 kpgg==
X-Gm-Message-State: APjAAAUNQE0LVE0nx6mTCr7Cn8VEUe+J7OOFln6pl+szsOOVbiZEBDUQ
 JqueRzHR41vvq4JikyRcAMSVQwxbUGAUPF2pEOU=
X-Google-Smtp-Source: APXvYqxCrrpuyt2ZiTbHCEOISXEIG3AOS2Fmf3z74vprU/Fszw++1ri+nOVxccp5ZRrv5v7RjusE7g3vfH2jcctQpaA=
X-Received: by 2002:a92:d7c6:: with SMTP id g6mr12767046ilq.37.1578919815500; 
 Mon, 13 Jan 2020 04:50:15 -0800 (PST)
MIME-Version: 1.0
References: <1577968140-11528-1-git-send-email-paul.henrysd@gmail.com>
 <CAFLxGvy__AusGQd-AZ5Xq5kReHQ3h+feZ4XuqwinnLJn1-7hkA@mail.gmail.com>
In-Reply-To: <CAFLxGvy__AusGQd-AZ5Xq5kReHQ3h+feZ4XuqwinnLJn1-7hkA@mail.gmail.com>
From: "Paul HENRYS d'AUBIGNY" <paul.henrysd@gmail.com>
Date: Mon, 13 Jan 2020 13:50:04 +0100
Message-ID: <CAOTsJ7rgwMVdaD7U4S==cydoXPzEnvpFHvFMp1cvTc7exqXGyA@mail.gmail.com>
Subject: Re: [PATCH] ubi: Update mean Erase Counter calculation at run-time
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_045019_161005_7034EBFD 
X-CRM114-Status: GOOD (  26.38  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 12:06 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Jan 2, 2020 at 1:29 PM Paul HENRYS <paul.henrysd@gmail.com> wrote:
> >
> > The mean EC value was only calculated when attaching a UBI device
> > but not updated afterwards. A new parameter is added to the struct
> > ubi_device to keep track of the sum of the erase counters of all
> > eraseblocks for a UBI device while they are erased and potentially
> > become bad. The mean EC is then calculated on request when reading
> > the "mean_ec" sysfs file of a UBI device.
> >
> > Signed-off-by: Paul HENRYS <paul.henrysd@gmail.com>
> > ---
> >  drivers/mtd/ubi/build.c | 10 ++++++++++
> >  drivers/mtd/ubi/ubi.h   |  3 ++-
> >  drivers/mtd/ubi/wl.c    |  5 +++++
>
> Please update Documentation/ABI/stable/sysfs-class-ubi too.
I will do that.
>
> >  3 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index d636bbe..3291fa4 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -126,6 +126,8 @@ static struct device_attribute dev_volumes_count =
> >         __ATTR(volumes_count, S_IRUGO, dev_attribute_show, NULL);
> >  static struct device_attribute dev_max_ec =
> >         __ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
> > +static struct device_attribute dev_mean_ec =
> > +       __ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
> >  static struct device_attribute dev_reserved_for_bad =
> >         __ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
> >  static struct device_attribute dev_bad_peb_count =
> > @@ -364,6 +366,13 @@ static ssize_t dev_attribute_show(struct device *dev,
> >                 ret = sprintf(buf, "%d\n", ubi->vol_count - UBI_INT_VOL_COUNT);
> >         else if (attr == &dev_max_ec)
> >                 ret = sprintf(buf, "%d\n", ubi->max_ec);
> > +       else if (attr == &dev_mean_ec) {
> > +               /* Calculate mean erase counter */
> > +               if (ubi->good_peb_count)
> > +                       ubi->mean_ec = div_u64(ubi->ec_sum,
> > +                                               ubi->good_peb_count);
>
> Is there a reason why you don't the math in sync_erase()?
I was thinking to only calculate the mean_ec, which implies a
division, when required. Hence when reading the sysfs file in the
current implementation. The aim being not to waste CPU cycles for
something not required.
Let me know what is preferred and I will adapt the patch.
>
> > +               ret = sprintf(buf, "%d\n", ubi->mean_ec);
> > +       }
> >         else if (attr == &dev_reserved_for_bad)
> >                 ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
> >         else if (attr == &dev_bad_peb_count)
> > @@ -391,6 +400,7 @@ static struct attribute *ubi_dev_attrs[] = {
> >         &dev_total_eraseblocks.attr,
> >         &dev_volumes_count.attr,
> >         &dev_max_ec.attr,
> > +       &dev_mean_ec.attr,
> >         &dev_reserved_for_bad.attr,
> >         &dev_bad_peb_count.attr,
> >         &dev_max_vol_count.attr,
> > diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> > index 9688b41..d796217 100644
> > --- a/drivers/mtd/ubi/ubi.h
> > +++ b/drivers/mtd/ubi/ubi.h
> > @@ -472,6 +472,7 @@ struct ubi_debug_info {
> >   *
> >   * @max_ec: current highest erase counter value
> >   * @mean_ec: current mean erase counter value
> > + * @ec_sum: a temporary variable used when calculating @mean_ec
> >   *
> >   * @global_sqnum: global sequence number
> >   * @ltree_lock: protects the lock tree and @global_sqnum
> > @@ -580,8 +581,8 @@ struct ubi_device {
> >         struct mutex device_mutex;
> >
> >         int max_ec;
> > -       /* Note, mean_ec is not updated run-time - should be fixed */
>
> Thanks for addressing this. :-)
>
> >         int mean_ec;
> > +       uint64_t ec_sum;
> >
> >         /* EBA sub-system's stuff */
> >         unsigned long long global_sqnum;
> > diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> > index 5d77a38..24c47ce 100644
> > --- a/drivers/mtd/ubi/wl.c
> > +++ b/drivers/mtd/ubi/wl.c
> > @@ -442,6 +442,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
> >         int err;
> >         struct ubi_ec_hdr *ec_hdr;
> >         unsigned long long ec = e->ec;
> > +       unsigned long long erasecycle;
>
> Why do you need a new variable?
> We already have everything we need.
Except if I miss something, no. We loose the value assigned to err
later on when calling ubi_io_write_ec_hdr() and the value returned by
ubi_io_sync_erase() is required after the call to
ubi_io_write_ec_hdr().
>
> --
> Thanks,
> //richard
>
Cheers,
Paul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
