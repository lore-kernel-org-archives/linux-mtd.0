Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF573C43458
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jul 2026 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaYRwBO292iu+57mVkVZt5q/E4VPMd4EFMFDUaGcQTs=; b=i8jkUjhET3dMiQ
	h9MrDLpQqDO3BZrZ7EtXBophkImNY8trHFsjh8nApXQ360N/Etz0SygNnwLL1XlG2jngoKz/qIUcG
	nl2Y1WfT7T/9Jg3ALdwWxHdhwkfkVZEnH+14hjVG3JhZa/uv6PQ8jO4rlhIfIBfkUpABJGaJyw/V8
	yQSGjjWq/PvKfHeGicqK0B/xMFzBhs9J6ueanUbwNglQIbBEYIcjbzs0Kk2flSDWcDfSq8OZzKKeu
	ih3sIAzG8s15VJjBdbqNyLm0bUjTcEtRMtV8v8uQVCnVK0QNNO5MQWPB/MKXyUx5nYkm3l3tx4CBN
	lUccDJwCNVFo0uj3u9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSWQ-00000009cx6-2p0z;
	Sun, 05 Jul 2026 19:28:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSWK-00000009cwj-3M23
	for linux-mtd@lists.infradead.org;
	Sun, 05 Jul 2026 19:28:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso3831210a12.0
        for <linux-mtd@lists.infradead.org>; Sun, 05 Jul 2026 12:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783279730; cv=none;
        d=google.com; s=arc-20260327;
        b=Gsix098QWZJRCaJ7qB+LH1czkorqXK5Fs7HjNqxdkeKfZXpIobSp6VEOdEEGk+/twU
         j6FtzP/A9MhUyFEWVazYCm4aVLrq3FlIqq9pbwNBn/rqtOPI3wvld099m5s1t0HVcA8L
         BlbIoZ/ljX1TUgRj4GhqyJAvCr0fB2SO76sb6GysI7QAzgtdeRCP13adWKOFM6/ieEWU
         eseKBU4rgmKsnDE7tkGLDMZbsgNtxXmK1tRUzP7QizjgVYZi6GJGDNEExS7QDEU1QrTl
         E5K60we8o5Ex/jSyDNiUlsYI6ww5Ie63489JXXDPwk730sFWnVDTlW4ycTxf8tQf2Uln
         JpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6JUnRCM2Qxk6xap+InmsyC5JjApM9odZFBQkppiWmYI=;
        fh=/ABpP/kJe1Hq2aIS4S+FrCjVJkIUMxrFwIDNDNhYJu4=;
        b=AXTRyVOREAJJXNGmhp8QAGyOAtn/GhXO+FFLKb4mLqDMD0oOm+a8PO1AMex7bvDNtk
         RSB3k0fbZUzeEIADrwkIFEbnv6YXQkN3nWp2bwTHkQfofFdXl9knaoGqwKy42LA+W5zW
         8/vFOfVkw0AybN8dwlcHLOS2iIXrbMKSthgyScGXoqAaKhdxrQRpLiYWNYs0+4oYmsI5
         P2oQuK5OshRukbOOo4l4yGFlW43XvfIzvtCsIejDNqdxldae+ZoWpPyIDnJ2tmr59dJg
         6TOHdUE3drGSbmEATbu42CUYi8y18U3kwAffa1CdgdPqvMjhqm8V64E4dcSTOY4RUx2N
         pm0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783279730; x=1783884530; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JUnRCM2Qxk6xap+InmsyC5JjApM9odZFBQkppiWmYI=;
        b=Kd5tJBuhYBXXwvTLBkrrEWntC7pgi+6RYp9uaj0zdmhUf92VLJ3iX07uJGxux59izF
         4OG2cd0EoOt0/ODz1GFMc9lguez45Cmnw/BROcjDsMLvijrK+v/MPfWP6VJdZ4APvqDx
         fPq9gv0iUUA9YOgUDJnYgepmdsPFjcggbHPbecds0JfeMxU/wK7lnaovxIkXYRgaof5e
         yej2XmOywmozWQb9mKqDmf6Gzc8oVjaoz6zLcJafDUZnVj5VaK/VRY8VRnFYpMhFyACq
         rw1IibTQHDdZOV9JUGQRcTELc69XCCnljc+w9QBa1Ta7sTb2eVR1D66U759IFF3FGCZu
         rvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783279730; x=1783884530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6JUnRCM2Qxk6xap+InmsyC5JjApM9odZFBQkppiWmYI=;
        b=XXQ3j7o/zk68gxjeNDp7vKHYFFPm280srz7fuTnW+s3nTxz35szQxfpX1gZZx5bQLI
         YywuJI8qxmcxL11uyRE8KrRvfBMAA+Y+N34SMUqnlK7sxb4yMWaTmbkzxFbKV0tKjgjh
         wcQRl9mY23iG3HyfJupw7/Aecs8cqJV9EznnF9FwqhfyI7e0f1Ta3DTIsaxV+udmyPXc
         qaPNmzYUr+FJXF0x+75l3+kZTafYzOypzuGv6e+MwOE/19RTsBFwR9LVYXfZlg2G9UrM
         ZezKSmk1JNRsBrlncizlGH2ucswr+2rUMkflHlYMg9erdFvSzvQGRQSywECp/JMDT++v
         SHWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqA/F00L0GCjxSeegEOWPzacscdKL8bQSTRpUTY06kiRYugDV7OS43teyEd/YKkDVVlLV666V/FrZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjJeXszlZ8mCTXBabYsO2gqxHf+I9xC1EcbfQuBSJvVL4nlfpb
	alSTyGolOnqhukgRbBMBvkvVp9Kb+XJRjgdt2nyCkgmNbn9cZZKqUcIWIVP5WIEZdm4x9ClLirH
	32OFyX+luAjhDmH4IGT3jmZHvugT8qO0=
X-Gm-Gg: AfdE7cnDn2MFJpt719/6WAiqy+aM41qduqEhUq4cllsa4VBv1y63fc50aKxhSHKceNK
	n6z3BnSbs3idpiLg4TDj+yAx8Anex8sBpGIQg3czrMGcjVlTi0kDTgGe1DhLi4XLCarD1cZIfNa
	A50NuE2B+MJxgkH9VTX6izuvfNjsfM4htyAoP3dKigIn1rJUxQSVIelyEwNG5eLcL3i6ZYU5O6w
	mDRCo8PAWNlNEtNb4Y02X75mppbC/jgqDJBnERpYedsMPCQbReswf/FwermQs3T4FBWZcaRR4fB
	C+gO6s7TTXGeEw3zHbTTwv3DvZLex24j02WDeEyYtXfzT5dXEWAmHnk=
X-Received: by 2002:a05:6402:1911:b0:697:5140:a146 with SMTP id
 4fb4d7f45d1cf-69a1a24e2b0mr2111550a12.5.1783279730260; Sun, 05 Jul 2026
 12:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com> <20260703-b4-maple-cleanup-v1-25-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-25-41e424964da5@gmail.com>
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Sun, 5 Jul 2026 20:28:39 +0100
X-Gm-Features: AVVi8Cd4RsxuBCDMTegUym6Q-WwoYX7kLkcoRLuTn30KplUiorM2f_4ETnTctuU
Message-ID: <CACwZE5RfhwhOoVSPqibM9+XaPJCf-TdnJxi_UT7Dgv71OJPsFQ@mail.gmail.com>
Subject: Re: [PATCH 25/26] Input: maplecontrol - fix style issues
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Florian Fuchs <fuchsfl@gmail.com>, linux-kernel@vger.kernel.org, 
	Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_122852_873740_B732DE9B 
X-CRM114-Status: GOOD (  13.53  )
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

On Sat, 4 Jul 2026 at 06:58, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Fix coding style and formatting issues reported by checkpatch.pl and
> switch to using BIT(). When reporting D-PAD events avoid conditionals.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/joystick/maplecontrol.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
> index 3ef6652d40cb..457a73d91239 100644
> --- a/drivers/input/joystick/maplecontrol.c
> +++ b/drivers/input/joystick/maplecontrol.c
> @@ -35,22 +35,22 @@ static void dc_pad_callback(struct mapleq *mq)
>         buttons = ~le16_to_cpup((__le16 *)(res + 8));
>
>         input_report_abs(dev, ABS_HAT0Y,
> -               (buttons & 0x0010 ? -1 : 0) + (buttons & 0x0020 ? 1 : 0));
> +                        !!(buttons & BIT(5)) - !!(buttons & BIT(4)));
>         input_report_abs(dev, ABS_HAT0X,
> -               (buttons & 0x0040 ? -1 : 0) + (buttons & 0x0080 ? 1 : 0));
> +                        !!(buttons & BIT(7)) - !!(buttons & BIT(6)));


Maybe I have missed something but what is this !! operator?

Adrian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
