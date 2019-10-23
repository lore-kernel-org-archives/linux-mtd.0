Return-Path: <SRS0=W5Gy=YQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42010CA9EB9
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 19:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1EA21872
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 19:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rve4VKIH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgxmBA9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1EA21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT3MrnlIW1Y9H6XS5M+nJxokFjN7vN9kQ3rsGBy8JrM=; b=rve4VKIHWr7DK6
	dhxtdYL+ldL+No/LC5v1Osn5Ax87ALDpS2fNrB+AunLz8VqFmqo0CYopLKZ+3xcMQA2F9APpSA/qk
	cNRCJWNCnSeLSNvnJyJ2b44eJVgZBwF/ZbiuFa5ZGkndVLeK42whv54shrs0LbOzNueNonc1cK7f0
	acQATpZHFxXMTqXaqc3AcrUKZo7liI/bxc8cjTDkuSImxmDa1ifgRaonWJbMvLbLBugJXGKAFqC0L
	GEDenXBIb9L86RSCLlsIccc4CpgcBuVCPkBOEMDi/ORSzoniNSwNb17DcFRq+Nk0NUFaH6nScAr0r
	ll/yInqfSKEWhSQxMu3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNMK0-0003bo-0n; Wed, 23 Oct 2019 19:29:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNMJx-0003bH-0i
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2019 19:29:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id n15so12557445wrw.13
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2019 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emPhrbSykco3KmRTGIoG7kDIQdPujcHr9TYwBXit4iI=;
 b=QgxmBA9wFS9WJDblOxgX1g3h14yZlPekloLEVOAgz2X3bFunE+ZOzonE6BSGWc8QnK
 7Cgd306LxuI9WyYSvCUu1pniQbcDXgeD5DN8X42f/fF3GwxPNe/lX8vPAfYsK/6nIwcn
 rx0Pu82/AYdmkEw1N+NTHmytiNxMCvMQ3ATQvTw5U1zO+d9AWG+XBk7eXO68NQCa8SMo
 0/lSm1Ccc4YNknwCmWLhN0kx7HXZxuXnI9CDb2/dx5IqqKPODDX6fxKM4NC/H60t6+DI
 yiagA4VmKQDZg6bcZsUQtnmDupn/6XNiDIA5SAy+YPwggiYSkmpgHvXrbbN5ot/hrrsi
 m8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emPhrbSykco3KmRTGIoG7kDIQdPujcHr9TYwBXit4iI=;
 b=XT+w2/De1KTNXdUxr6ZGnpq+2u3bcBPqOQRU3XpzvqSenW9EG8fkrA0y48GJJIVHg+
 NGIh8sHjnSSvoGIVjWDYc72BdNOGx5EVYh+kJCHAAcfRqXFDH6bIcdZISgdsSHbMMwJu
 HUkvp6EXfPU+104/6ZlHDuDJTQIQn8LYK71RMhoGxSbVDPryGieGgW80ok6ig6ycxJav
 FHMqq/r8GFMJka2rbeS6i2vRa1cz4An3ttF+UtGRlmRXPk9S0K60p/JqPDrXHFgwN5CD
 TAKIK9lBKyjun3cRYBJz3s449KYHSRsdQJWhhGvgUpYilWi9cyMZuCyV+37mn5sWoB+i
 i0+A==
X-Gm-Message-State: APjAAAWFk3ktuHL7jjwtnMyv6yZohO2BlU23N3H2PuX1NawuOgVcIn7X
 /vjByIyes/oNaZc9CUJ360MaGaut9WD0B9EpkCxiIA==
X-Google-Smtp-Source: APXvYqxCUrOzcmVHs7lI90ckNnfRiAe1rdweYuOBl3xn7Yuy4HpHX3Ct+k6vRHyHs4GoIx+6sZ73AsLm+U+PcK2ya5c=
X-Received: by 2002:a5d:4588:: with SMTP id p8mr320542wrq.180.1571858962602;
 Wed, 23 Oct 2019 12:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <1571842016-30323-1-git-send-email-rdlee.upstream@gmail.com>
In-Reply-To: <1571842016-30323-1-git-send-email-rdlee.upstream@gmail.com>
From: Rob Lee <rdlee.upstream@gmail.com>
Date: Wed, 23 Oct 2019 14:29:10 -0500
Message-ID: <CAH593dCTJAibCj2bQwXfNadSqX70xwChEXn+0K9rhP2frmDHBw@mail.gmail.com>
Subject: Re: [PATCH] ubi: Add mean_ec sysfs node and accounting
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_122925_081716_351A4BA1 
X-CRM114-Status: GOOD (  22.34  )
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
Cc: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I just noticed a few non-optimal and invalid things I'm doing here:

- I should not add a new ec+count variable.  I should be using
good_peb_count instead.
- The current implementation uses a ec_sum that doesn't get
recalculated when blocks go bad.  The sum should be recalculated each
time as previously good blocks that contributed to the sum may go bad.
This recalculation could occur once on attachment and then adjusted
each time a block goes bad, or, on each ec change which allows not
adding a new variable.

Given these problem, I will make and send a v2 shortly.


On Wed, Oct 23, 2019 at 9:48 AM Rob Lee <rdlee.upstream@gmail.com> wrote:
>
> This patch adds the necessary runtime accounting to keep mean_ec
> up to date as well as code to export mean_ec to sysfs. While
> mean_ec already existed as part of the ubi attach structure, it
> was currently not exported to sysfs nor is its value update after
> device attachment.
>
> From a production device point of view, tracking the overall wear
> rate is critical to determine wear lifetime and catching abusive
> write behavior to the storage device that may lead to excessive
> wear.  The currently available sysfs information, max_ec, has a
> rate of change that is somewhat erratic and thus isn't a sufficient
> for this purpose.
>
> Signed-off-by: Rob Lee <rdlee.upstream@gmail.com>
> ---
>  drivers/mtd/ubi/attach.c | 2 ++
>  drivers/mtd/ubi/build.c  | 5 +++++
>  drivers/mtd/ubi/ubi.h    | 2 ++
>  drivers/mtd/ubi/wl.c     | 6 ++++++
>  4 files changed, 15 insertions(+)
>
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index 10b2459..a5af3be 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -1596,6 +1596,8 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
>         ubi->corr_peb_count = ai->corr_peb_count;
>         ubi->max_ec = ai->max_ec;
>         ubi->mean_ec = ai->mean_ec;
> +       ubi->ec_count = ai->ec_count;
> +       ubi->ec_sum = ai->ec_sum;
>         dbg_gen("max. sequence number:       %llu", ai->max_sqnum);
>
>         err = ubi_read_volume_table(ubi, ai);
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index d636bbe..24d48bf 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -126,6 +126,8 @@ static struct device_attribute dev_volumes_count =
>         __ATTR(volumes_count, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_max_ec =
>         __ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
> +static struct device_attribute dev_mean_ec =
> +       __ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_reserved_for_bad =
>         __ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
>  static struct device_attribute dev_bad_peb_count =
> @@ -364,6 +366,8 @@ static ssize_t dev_attribute_show(struct device *dev,
>                 ret = sprintf(buf, "%d\n", ubi->vol_count - UBI_INT_VOL_COUNT);
>         else if (attr == &dev_max_ec)
>                 ret = sprintf(buf, "%d\n", ubi->max_ec);
> +       else if (attr == &dev_mean_ec)
> +               ret = sprintf(buf, "%d\n", ubi->mean_ec);
>         else if (attr == &dev_reserved_for_bad)
>                 ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
>         else if (attr == &dev_bad_peb_count)
> @@ -391,6 +395,7 @@ static struct attribute *ubi_dev_attrs[] = {
>         &dev_total_eraseblocks.attr,
>         &dev_volumes_count.attr,
>         &dev_max_ec.attr,
> +       &dev_mean_ec.attr,
>         &dev_reserved_for_bad.attr,
>         &dev_bad_peb_count.attr,
>         &dev_max_vol_count.attr,
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 721b6aa..e188ace 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -580,6 +580,8 @@ struct ubi_device {
>         int max_ec;
>         /* Note, mean_ec is not updated run-time - should be fixed */
>         int mean_ec;
> +       unsigned int ec_count;
> +       uint64_t ec_sum;
>
>         /* EBA sub-system's stuff */
>         unsigned long long global_sqnum;
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 3fcdefe..a8641a1 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -449,6 +449,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
>         int err;
>         struct ubi_ec_hdr *ec_hdr;
>         unsigned long long ec = e->ec;
> +       int ec_incr;
>
>         dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
>
> @@ -465,6 +466,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
>                 goto out_free;
>
>         ec += err;
> +       ec_incr = err;
>         if (ec > UBI_MAX_ERASECOUNTER) {
>                 /*
>                  * Erase counter overflow. Upgrade UBI and use 64-bit
> @@ -486,6 +488,10 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
>
>         e->ec = ec;
>         spin_lock(&ubi->wl_lock);
> +       ubi->ec_sum += ec_incr;
> +       if (likely(ubi->ec_count))
> +               ubi->mean_ec = div_u64(ubi->ec_sum, ubi->ec_count);
> +
>         if (e->ec > ubi->max_ec)
>                 ubi->max_ec = e->ec;
>         spin_unlock(&ubi->wl_lock);
> --
> 2.7.4
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
