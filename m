Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7396C2D0F1
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 21:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCB020936
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 21:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hg8OHIgy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxSDuSIA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCB020936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYvsBtIftox9pfio8N3Xo1OaZ9rK8MmjHH/tWWNnd/k=; b=Hg8OHIgyUqyDze
	6WivzznVbJnAlx78g6A1rt9HPI0PHf2ba5mxyGe3jC8hXXIj+5GqilLxL0xNCOdHzKSJ95W5LFu10
	F7izzg+lcSdz7Vm03dHKHxZtOm7mi9Xuk+sYovzbp3ZEMk8Xgeoax9mBPZy9qfcqP0+bbakFWwdHD
	EoG6q9dAzRj6YZrriY7lzWYSDOS0OHSQXUCuXEjPBnPLDVXqhD/D4Oe/yvbpsB/5klYmjv1NzFQ/O
	nfB0ryuBMEfBe0kj2v76ffYXySgzzeI6pUzcmg3Gvr/u3efTagycoI+MLS20X/2HMVBSNN4iMZ9eh
	2wCxS0UnglciqquYDHLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ22m-0003C6-OY; Mon, 30 Mar 2020 21:34:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ22l-0003Bn-1j
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 21:34:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id 31so23477296wrs.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2020 14:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZdCtUFMkibX8QzMl7Kg5pQ2hzBNfSqJgYCs96axJJA=;
 b=LxSDuSIAfsXMG+7yvqJpZ5DK+gGtvdzmG5CTtw+iG2iw9h+rPeVPr5ocfu0ot2B/UB
 bfjybkCHRBBJNzZXEtyLLrbWmGr2kBBjNEHRJk1XABqJDUGBjThi5wh1UozIoW0Wafg3
 B5kNE6aXzdgPurvCMTR7/6SqE34X0vvrjEgCaCMzEC97xJaS57rCWpy4lRo3Euw4DDB+
 A4m/b/jYxr0PlxWAdF85eET53OE5+uL8M594yg+br4oUyTKfizJ6W9wGRpMMUu8f22Bs
 TJcjI08sGKfhF/kBTLDgicn76xpwt9bT7do5lC7j8UQqHLEpIdEvKXyR5lnlyKXgaLXY
 b9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZdCtUFMkibX8QzMl7Kg5pQ2hzBNfSqJgYCs96axJJA=;
 b=jvFVFefOxq0Lr8yhAPL7xLiC1h0XjGqtd1wVZWQ4IZ5n4xFd5jjp9O77+Ilep5JeEx
 glQzvzLnsN2+3MOqt1me9oZFRttJG9G1DS+4O7mTWyphyl6Vg4Mu7qT+vL+eMucYIOFK
 a/F8fdHvE/Asu2ddLYKo7t5xGnU7VGBUEpBMQxaKF2lQmlTG4/v08s3TQQ3YpgBq0OeE
 OEeEmHM2lZ0ZWYlpJTQ5Gza5HqzOy98BREp45lzMfgfx7yT7WM400/qoaEorWV1bC69R
 gSIC5LxXa1KcORoIecg9419bXsjPStyTemPnRgeLQQ+KqqxL1XqnMRMXAUbNH6vcaGO1
 hwBg==
X-Gm-Message-State: ANhLgQ23pEjqG23iBV99F6xGak5PN/VITkzqmnuzLpzb92hZivxu3sI2
 PdSxZp/uCwiYA9T1n0jCc1+TNB8V5eGtWx1WcqM=
X-Google-Smtp-Source: ADFU+vt70i0I1BTXl6FwhSEYs90HM1zMvmV3vrCZrDokjWBO84zGRYH1gEZOOV6mMB2WPawY1b0AfnRomzuxYIteTqY=
X-Received: by 2002:adf:f68b:: with SMTP id v11mr16099908wrp.270.1585604041173; 
 Mon, 30 Mar 2020 14:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200210132635.50072-1-houtao1@huawei.com>
In-Reply-To: <20200210132635.50072-1-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 30 Mar 2020 23:33:49 +0200
Message-ID: <CAFLxGvy3rDnib-zw4RFGB2Bb-vaiSOkRr5MuUH2=0kcmB0Xb4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] UBI: Fastmap: free unused fastmap anchor peb
 during detach
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_143403_091546_394C9D30 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2020 at 2:20 PM Hou Tao <houtao1@huawei.com> wrote:
>
> When CONFIG_MTD_UBI_FASTMAP is enabled, fm_anchor will be assigned
> a free PEB during ubi_wl_init() or ubi_update_fastmap(). However
> if fastmap is not used or disabled on the MTD device, ubi_wl_entry
> related with the PEB will not be freed during detach.
>
> So Fix it by freeing the unused fastmap anchor during detach.
>
> Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
> Reported-by: syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/mtd/ubi/fastmap-wl.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> ---
> v2: patch splitting as suggested by Sascha

Both applied, thanks a lot!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
