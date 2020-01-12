Return-Path: <SRS0=jxJ8=3B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03827C33CA9
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 23:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C1F21556
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 23:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejHGTrbo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heYOuyBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C1F21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oq6QZ0QjDmkzypj5YOrnxn64qpl7w1J6wmbBYADe+f8=; b=ejHGTrbo6TLtqR
	sC1HgIwexEFeGq9b7cI083/gOGGx/lzWEcDVRNZc/doQ4a81V9QkKLXw0caG0ludWbd94zHiWM0G8
	064yffDJpbDEPB/cA4jU9vuLhlH5uzdsKfFrpl8NexhEK3wGMVsAH7Sw7y4cjZP24Czn2AW5VjKns
	61mHnbUtExPD/OzyGLEKaRjSw/lyllcBVWrqTxdnvEDdB+DOBExXpAxIIOVi7J2XX3SDFsPsLDRf3
	dDSA3He/xyUEihlxR/3H+sNra2GdRZyrGNc3Oh65osB0UdRHspj6u3lp3yM/LEpMDHL/YoGIQ/fxW
	AU20zBdGgaw9QJLT/yBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqmJ4-0005X7-G8; Sun, 12 Jan 2020 23:06:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqmIx-0005OX-0J
 for linux-mtd@lists.infradead.org; Sun, 12 Jan 2020 23:06:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so6802256wrn.7
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2020 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7uJTeaVPmePofk0atebdAp13i3hi2KWJZ4wopPxW/k=;
 b=heYOuyBYZIsI4eG3tBUaSjM05N5HQVmMYzIYabTNUjrcC9dg7hYIr5hG7FQRMGijwi
 EIhuS+CHr0JPV55IZzLLO3n5TzNKsezyUSwtEhMqJ7HEMuDMgkm3skqxZaE199Ooo9hC
 ue0OrwwypWIBU13ojgbRQJb5eKcaJ9uhqGgwYiDq+30pqGy0rZkCECqwc+6GSD4aMpP6
 wAOBMaoOB56vyprkapS68t2y2xQFrqAAH7BJPsKiIGTrHKhsJHM1bYaJALa1Qvsq4s89
 aFS1M5Eyb7CnJ0LEMpSrimHY7AhKRDobbQN3RdNjd0OAFn4o3c+4I/6iNtmfm6BhI+U8
 3IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7uJTeaVPmePofk0atebdAp13i3hi2KWJZ4wopPxW/k=;
 b=Kigibg4ZtnJSOSnZbO+AUvOkauJMdqF3bKtEIuQgeMCMNuoYQkpqw2ei4P+CK41L91
 8s/im2X92/iBOOZugaKwKT5Z5uGa3pXGpma+2pYOL1Kcn9Gx4GEvSZV1lvXOeupAa8Za
 mHBNmcivXkv31hM2s+X9IUW90f6gzSgXz4ixrRTmYlQLuAPA1HMcbYUaFw13SNX9YYhd
 I/1beR67Gl1Pp5FEqSputdisGNXi8xzwvthjraE/FjyuWiadKnweEwSiw72jxekcHmcu
 VrcN+Q0cRVVMFKlb/0lPS2ABletod9/mtXo2ehU0riR5Jego9eHmxAGAfirTlpAL2U2Z
 Ztbw==
X-Gm-Message-State: APjAAAXHSQvujxxiSXSQ/v8tpy6LHyrQcUPZOhfKmBSzRr1r7ki6YlpT
 eSdkvcJkbv6Ek0yI5QIKbr/iMwlIQUfrIz3H5eM=
X-Google-Smtp-Source: APXvYqwiMiYYfMt/fgVF1n+7spge2w6GkqGzvH/gV0WJAWW/rYLR92Qi7eCV6yaBgKxCKMA3TMvQmVC619jThc1fZoE=
X-Received: by 2002:a05:6000:1052:: with SMTP id
 c18mr14983446wrx.268.1578870357745; 
 Sun, 12 Jan 2020 15:05:57 -0800 (PST)
MIME-Version: 1.0
References: <1577968140-11528-1-git-send-email-paul.henrysd@gmail.com>
In-Reply-To: <1577968140-11528-1-git-send-email-paul.henrysd@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 13 Jan 2020 00:05:46 +0100
Message-ID: <CAFLxGvy__AusGQd-AZ5Xq5kReHQ3h+feZ4XuqwinnLJn1-7hkA@mail.gmail.com>
Subject: Re: [PATCH] ubi: Update mean Erase Counter calculation at run-time
To: Paul HENRYS <paul.henrysd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_150559_068991_11246898 
X-CRM114-Status: GOOD (  21.41  )
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

On Thu, Jan 2, 2020 at 1:29 PM Paul HENRYS <paul.henrysd@gmail.com> wrote:
>
> The mean EC value was only calculated when attaching a UBI device
> but not updated afterwards. A new parameter is added to the struct
> ubi_device to keep track of the sum of the erase counters of all
> eraseblocks for a UBI device while they are erased and potentially
> become bad. The mean EC is then calculated on request when reading
> the "mean_ec" sysfs file of a UBI device.
>
> Signed-off-by: Paul HENRYS <paul.henrysd@gmail.com>
> ---
>  drivers/mtd/ubi/build.c | 10 ++++++++++
>  drivers/mtd/ubi/ubi.h   |  3 ++-
>  drivers/mtd/ubi/wl.c    |  5 +++++

Please update Documentation/ABI/stable/sysfs-class-ubi too.

>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index d636bbe..3291fa4 100644
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
> @@ -364,6 +366,13 @@ static ssize_t dev_attribute_show(struct device *dev,
>                 ret = sprintf(buf, "%d\n", ubi->vol_count - UBI_INT_VOL_COUNT);
>         else if (attr == &dev_max_ec)
>                 ret = sprintf(buf, "%d\n", ubi->max_ec);
> +       else if (attr == &dev_mean_ec) {
> +               /* Calculate mean erase counter */
> +               if (ubi->good_peb_count)
> +                       ubi->mean_ec = div_u64(ubi->ec_sum,
> +                                               ubi->good_peb_count);

Is there a reason why you don't the math in sync_erase()?

> +               ret = sprintf(buf, "%d\n", ubi->mean_ec);
> +       }
>         else if (attr == &dev_reserved_for_bad)
>                 ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
>         else if (attr == &dev_bad_peb_count)
> @@ -391,6 +400,7 @@ static struct attribute *ubi_dev_attrs[] = {
>         &dev_total_eraseblocks.attr,
>         &dev_volumes_count.attr,
>         &dev_max_ec.attr,
> +       &dev_mean_ec.attr,
>         &dev_reserved_for_bad.attr,
>         &dev_bad_peb_count.attr,
>         &dev_max_vol_count.attr,
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 9688b41..d796217 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -472,6 +472,7 @@ struct ubi_debug_info {
>   *
>   * @max_ec: current highest erase counter value
>   * @mean_ec: current mean erase counter value
> + * @ec_sum: a temporary variable used when calculating @mean_ec
>   *
>   * @global_sqnum: global sequence number
>   * @ltree_lock: protects the lock tree and @global_sqnum
> @@ -580,8 +581,8 @@ struct ubi_device {
>         struct mutex device_mutex;
>
>         int max_ec;
> -       /* Note, mean_ec is not updated run-time - should be fixed */

Thanks for addressing this. :-)

>         int mean_ec;
> +       uint64_t ec_sum;
>
>         /* EBA sub-system's stuff */
>         unsigned long long global_sqnum;
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 5d77a38..24c47ce 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -442,6 +442,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
>         int err;
>         struct ubi_ec_hdr *ec_hdr;
>         unsigned long long ec = e->ec;
> +       unsigned long long erasecycle;

Why do you need a new variable?
We already have everything we need.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
