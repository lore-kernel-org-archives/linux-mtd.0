Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B5C4361A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 08:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E360223D6
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 08:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E360223D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fDnTP9JxAL4+XiB1VC4g6qQj8n3v0VdNevYAnGIFkdY=; b=L9GIaAsIxiWu6Y5ZyEPTROnO+
	1gmC9Tapj7GqsabIG1FE3HyVg2WTGykGf0bVUT/UOUeYXagBinBT9UHCOPuhjoBeTzuKUTt2oCJpI
	oadyyG5oaFpfOuS+vz5Skfvr31ChLl29crjDiwkvFV52aRvbXa4C41cG+BvB+Erzy68sdrBmCSf8Z
	13J17+qfipFT4FIZsOw6rlSSTki9DzyFKkAbVJ+6Q8GFe8MOQGaVi36k4GFYbMwKBv3EhHkEo6aBS
	49OajTZ/K5iAKBMRfA58Z4AN4HwimHrCtm817j/APh+orsoMhA09x41fF8/EUo9HLZqhjuHf40MWX
	FiWj+tzDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6q1-0001q8-CM; Fri, 04 Dec 2020 08:53:13 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6pu-0001ow-Jx
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2020 08:53:07 +0000
Received: by mail-qt1-x841.google.com with SMTP id p12so3424535qtp.7
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2020 00:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ie25EXYGJygVSq1WCc3nxTESm5cgyIfQIT3ckwHo9Es=;
 b=nI0FiqTRD2Uc7pujsoo8JHuFJYFma9yUkqVRq8LWwnqTcUo5rxCgfAx05yc+PWUiJH
 OzP5V3COQ/H1HwDb5aa1TZvyTdFXUAVnGqDDZOIrG2cHX/zOvQaqPhabHoPphkzXiUQ2
 BIPWES+dlWXWdWzC4ZY69aTC041wbemwIxCL38PdrzphqzarVGYtlbhWJcZDiDzjldVc
 lFi47XJ1O7T/jSVoQ+rirQn+Tfqg4BiW3kyppNwiZ6OMVr0E0XSAAXpVvrme92mwrZi8
 wYBvpMGukkROYPtVUUUJy4BMDeMsbaUyfGvW59Y6AzaccMh2ZqcgCKLHOQo7OGn6/C0v
 HSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ie25EXYGJygVSq1WCc3nxTESm5cgyIfQIT3ckwHo9Es=;
 b=enfJD56gEGG1YkyR1VTYvrqjRoFbbDjP5DFt993C6hTXGj2YxRwx7IpphHgb+lQqnj
 aufXdfez87XrDsrQqsE27+ph+vywFndJhTqhf4A89YcZVyf7sgEobNBPNR/Ig2ot7Tbw
 WMR1/TmHf348a8p0wb+rwlEajqPtPqGtN7cX5wF3FJ9jmPb00dT96S3IolYXyy+je7fN
 fnos/mh6mFon9d8v5J6PqQas6F+CRbFtQGcuE6pcsc9UztfdKFAOOoqBUBQWwmMmr8Ll
 gIqh85juKVcpLFodcWpnN+tyaJ8uDt54qJj+dt0SuCQ4tky7WyCiFblL4/V8t6Tgqs+Q
 e8KA==
X-Gm-Message-State: AOAM5338c14Mdk2Q/vwFazhQkpJSUjglNQh/xMu2WDw/RScZy8yuT+8K
 I4viUHI6LiugDAI23BYecz5C2d9uRD9O8/3fw8YJv7hgNcY=
X-Google-Smtp-Source: ABdhPJzeojDScSBtppSAW7yMarKnc8Aa6DXfy/aKs60aX6n3wPYeQQQQ/xQJh3Yz18uPiJFsmwumDDZhj0hRntXMRPI=
X-Received: by 2002:a05:622a:24b:: with SMTP id
 c11mr7237941qtx.166.1607071983687; 
 Fri, 04 Dec 2020 00:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20201125071132.39988-1-zhongguohua1@huawei.com>
In-Reply-To: <20201125071132.39988-1-zhongguohua1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 4 Dec 2020 09:52:52 +0100
Message-ID: <CAFLxGvxSycd=6WE4=XnrXxuF2Bc6A6ULA8GfkT8QvgcX=2Gk8g@mail.gmail.com>
Subject: Re: [PATCH v2] phram: Allow the user to set the erase page size.
To: Guohua Zhong <zhongguohua1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035306_732867_904FC539 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Xiaoming Ni <nixiaoming@huawei.com>, wangle6@huawei.com,
 young.liuyang@huawei.com, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, patrick@baymotion.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 8:14 AM Guohua Zhong <zhongguohua1@huawei.com> wrote:
>
> Permit the user to specify the erase page size as a parameter.
> This solves two problems:
>
> - phram can access images made by mkfs.jffs2.  mkfs.jffs2 won't
> create images with erase sizes less than 8KiB; many architectures
> define PAGE_SIZE as 4KiB.
>
> - Allows more effective use of small capacity devices.  JFFS2
> needs somewhere between 2 and 5 empty pages for garbage collection;
> and for an NVRAM part with only 32KiB of space, a smaller erase page
> allows much better utilization in applications where garbage collection
> is important.
>
> Signed-off-by: Patrick O'Grady <patrick@baymotion.com>
> Reviewed-by: Joern Engel <joern@logfs.org>
> Link: https://lore.kernel.org/lkml/CAJ7m5OqYv_=JB9NhHsqBsa8YU0DFRoP7C+W10PY22wonAGJK=A@mail.gmail.com/
> [Guohua Zhong: fix token array index out of bounds and update patch for kernel master branch]
> Signed-off-by: Guohua Zhong <zhongguohua1@huawei.com>
> Reported-by: kernel test robot <lkp@intel.com>

Looks good to me, except the authorship.
If I understand correctly, you took this old patch and resend it.
Please make sure that the "From:"-Line contains the original author.
You can fix this up using git commit --amend --author=.
The git format-patch will create a correct patch.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
