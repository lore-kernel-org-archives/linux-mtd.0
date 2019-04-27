Return-Path: <SRS0=qSHN=S5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36366C43219
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 20:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F202F2067C
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 20:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyKuh8VC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="G6ptwH5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F202F2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S72KsJMniuGxJdUsqhbj4SWs/SxoNwlTVRbyo6GR+x0=; b=PyKuh8VC+CWlpA
	q8FUYF+QAjzVMU4LeIUPnZ8BUAW47io1SrAhS/G3Y+fQnjtFsCXmYGZQfkwiPHP3r31Oa++Pnhc8A
	7gYLxvAxDrAFmkVsCmJYs6GXO3OW2XSWk7JOX3ISykoP4Ys/NXduSj+SjrjTZVZASV67JASmfwdVv
	JBy2on0xwi6kKlNW8K83ueNlWf5mA9421oI2kjEwM3QB+lU4jtZ9Aeq0xLXjesvDuxT1HYNs9bhG2
	/rU/zvKQWpuBtuWqzlekrPwa8StFYnJ4qBslGCp/27vp1xbE/f9m38M9OUWU5jN8IA61PF42yWTcs
	dApQ5vFpQwvTKL4ittvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTzS-0006dj-TA; Sat, 27 Apr 2019 20:32:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTzL-0006WK-1K
 for linux-mtd@lists.infradead.org; Sat, 27 Apr 2019 20:32:00 +0000
Received: by mail-lj1-x242.google.com with SMTP id l6so5956409ljb.3
 for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2019 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O8Yn7rSqSWzJGEK90Lsepo7xnz0psLgDKoYMEPt0f+I=;
 b=G6ptwH5cQK8gyQQBjLAO0A6t3tRHNZHtJBq+mPC2leXHWTWzfGvtomGLjo9OtR1gc5
 HPYHPaXTkXSvthv9H3mdSFhLI8CJV0iyu3nxYn89okYEcynAqAEDx1Qfyi0mgEIFS3cB
 dklbElANUeUmlyNoyU/yLxIkreWZnvPkwOC3/lw7YHdYgDhNihRmjxAHlYaUWuR975dj
 3IF5XMjXqAcshY+h+fGHisvx6GHk5xtzqyvmNXM3uJ9iTXk8KzNv2sdzECymZBxlC8hD
 mSERJt6kTdFr9KXkpn0IIZcTW8G7y489yZETvy6py90/C9wQXf/lxdYMbZU0WB6Z9KkG
 V/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O8Yn7rSqSWzJGEK90Lsepo7xnz0psLgDKoYMEPt0f+I=;
 b=lILFnU8HF2SXI3V7jpi0Gj5wwsDotis1Y2X4ZpqGCUbcif/rr8q/dGuAvsiYyp0lnq
 JHAZArtun9363UmoBfD1z9PGv6lVKxR/beFWy1t3PWrARwBJjL0s9NnfzhVIcVDsncDp
 XHA+kevexsEQxfxFzVWmILpiIco2TSP6YWpuZiw/9RW0fpQd6SJTyjwOwon+NlaC6voH
 KBPtiIOvvArfz3OQcqXmizwiT6wVTaYzfdBVHb5zQIIVTgz8S2tNq/Bgkxo5z/Y6BSz+
 ob/gQq3kHzigPFBiMy7Q+YQKu5ChLSxB52GR9/K+VPusCdOuPEuZ1cGOYzgbdztImxKQ
 VHKQ==
X-Gm-Message-State: APjAAAW2Ni2ExagiLD/AjecaFJnI8uQrOKB2VfnkgE9FlINfwbN4v8o+
 du3goTLwfycoZHmqNUpoo0b4dA==
X-Google-Smtp-Source: APXvYqzh1bdAD38MjP/J5rMLGVKNYbnVhRbsJX0POxHShzdSlQUCNYildYReq2IzntSwcVh964tq3w==
X-Received: by 2002:a2e:99d2:: with SMTP id l18mr14141923ljj.27.1556397117063; 
 Sat, 27 Apr 2019 13:31:57 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.81.185])
 by smtp.gmail.com with ESMTPSA id o3sm6498817lfn.41.2019.04.27.13.31.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 13:31:56 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] mtd: hyperbus: Add driver for TI's HyperBus memory
 controller
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-6-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <281a479d-3cfb-b9e1-23ee-c8e3acc37abe@cogentembedded.com>
Date: Sat, 27 Apr 2019 23:31:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190423104814.5762-6-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_133159_261014_182A3B23 
X-CRM114-Status: GOOD (  18.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/23/2019 01:48 PM, Vignesh Raghavendra wrote:

> Add driver for HyperBus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second chipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
> new file mode 100644
> index 000000000000..f458d7226df9
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/types.h>
> +
> +struct am654_hbmc_priv {
> +	struct hyperbus_ctlr ctlr;
> +	struct hyperbus_device hbdev;
> +	void __iomem	*regbase;

   You don't seem to use this field.

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
