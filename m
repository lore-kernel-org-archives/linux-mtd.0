Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BD2C388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:06:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C4C206F4
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjH3g4bp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jl/88X5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C4C206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vngJGRFbvnTVG861BOtd6dHpQBaqjy/o0Uf85RIZtVM=; b=jjH3g4bpyIW4AIafkyPQZ/OfT
	XKTi1tqsDifY1itJWX/CHNLv2SBpoHwMycWL5AVdDpZUvwdOyVJiaB4wAr7tYRgVC1/35deF1q9L0
	Nvmo4w1PPt5bzYJG59GoB0i0mMqeydsl77PEJDtlEvYhUtmGglejmWgJMvKqy2zPbPeQYnQu96nQ/
	isz9oO9cTWuhZ002aWKIEUpCt1u+Y5EdfM0CpyOllB1MKpZXlYARus9N6MwC0L/QZ+jsKEd3OfxUL
	vcSNqUVIoHTHfLdgVvuXNEJV6zVqz4ZkTeQIsrzTuAx0MUUJc0SWPbg4dl0lGCaWkok4wl6GkpuUO
	6UcUJoTVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kblK3-0000gN-Fu; Sun, 08 Nov 2020 14:05:35 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kblJx-0000f7-67
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 14:05:29 +0000
Received: by mail-io1-xd43.google.com with SMTP id p7so7186460ioo.6
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3s9iUnuvzMr0jTxtP7UBZvtqnmf/dn3a+7ZhpOxSMBg=;
 b=jl/88X5Tm/SCl72iV4CXU3VFZxsPW/YJjetxZG8Eluyh6AttyomUmF5MBxdQWUSYuc
 CbPp6NraHhMHHl3ZKL7ucZZxZGt/JMt76jD6Pfe4OAyBviar1cshn0JBQcFUoz1VrhGz
 hEm2nqcvU3tdilLOPQ6KyE39QJQP7mi1zVMir8Elrt1GEgy6opE+H/EjzOWVL6GWXwJt
 thEEAx9JKJa44Dp9r+JhPi9UzyGzcIvdPYkSRvAgJPQu7wnWYnfCzLT1THAI9j/hxavh
 pG4QlX5QTHk2t4+0wV/snB68LPu6rl4o5AoDN+68Ee2Qx7DrKYEPjcwBA7TGeEtplCAD
 Alkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3s9iUnuvzMr0jTxtP7UBZvtqnmf/dn3a+7ZhpOxSMBg=;
 b=QHB9k4xk92dPiNlMoX4m8PvynX4dODy0/oDwWX8ChWeEwiKCudvFv0vcYPT8kj3ufq
 o/yav5GYU8no8dV3jYmwIO43N8vFncqU9pKQ9nla9bI3TdFpeTcXUZ34laxrbk7y0CWk
 iK5f7VGd2ZfuQgB+BtIwx5viZH5RRcV85XOJEVjDm/AYC8Sy2L9C/OK1/JJ33I3JI9eI
 dMm1OWm05pwS8I1NPAkmEP3hNP9M2UHqZa0qjoNQ71YdHy3aUqxD5mWW7RjXeR9EkPDN
 3H/7/Xg8rEbU1hNy0NoZXvJZtgX7gg8BH4PwHcerwCe+LAwfLFN0XcMxA+3M2cxndBKG
 SyPA==
X-Gm-Message-State: AOAM532dNn9yp2kBCu/ZMyXBEkefLceCVFfGYXb0ajC1o/GklA+EGi5A
 Fs3csJ4VL7JtzlZrIXJU+oa0E+7LDs7g+YVdrsk=
X-Google-Smtp-Source: ABdhPJwQVLHeWujannU7dCZFejWHeD7gmYjCsahqcgYQ9VqkTjI42ESskbno3vxCqdSgfBp8sC+c8v9ZRIrVLa5ourg=
X-Received: by 2002:a6b:4401:: with SMTP id r1mr6978212ioa.78.1604844327200;
 Sun, 08 Nov 2020 06:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-2-hch@lst.de>
In-Reply-To: <20201016132047.3068029-2-hch@lst.de>
From: =?UTF-8?B?5buW5aiB6ZuE?= <gmpy.liaowx@gmail.com>
Date: Sun, 8 Nov 2020 22:05:16 +0800
Message-ID: <CAL3PxMr+Y2Jn1KabmqATWqq+EUJf1YN0_rKU+rQydbu9FiAvAQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] pstore/zone: cap the maximum device size
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_090529_240008_1B2A264F 
X-CRM114-Status: GOOD (  16.65  )
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
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>, linux-mtd@lists.infradead.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 9:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Introduce an abritrary 128MiB cap to avoid malloc failures when using
> a larger block device.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/pstore/zone.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index 3ce89216670c9b..5266ccbec007f3 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -1299,6 +1299,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
>                 pr_warn("total_size must be >= 4096\n");
>                 return -EINVAL;
>         }
> +       if (info->total_size > SZ_128M) {
> +               pr_warn("capping size to 128MiB\n");
> +               info->total_size = SZ_128M;
> +       }
>

Reviewed-by: WeiXiong Liao <gmpy.liaowx@gmail.com>


>         if (!info->kmsg_size && !info->pmsg_size && !info->console_size &&
>             !info->ftrace_size) {
> --
> 2.28.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
