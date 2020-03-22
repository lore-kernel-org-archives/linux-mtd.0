Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D66C4332B
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:59:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FCB20724
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i0Gfg++a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jlRqkmR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06FCB20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8mlbsB87/Zt8LQvIoQKkw+cKZxkpnvsDhGjXBxe7vo=; b=i0Gfg++a8r/hvI
	+CcYc93VWDE2gtImtRBrbGamE2tHUrth+eJZeUv4oDa/LZ/UopPU6/Vpx4eVTOb5j/ctsR2ynRig+
	72GGG3njf/OxeCZGuHC3nxabHKzfczh5wLExfUSp1eC/efAMU6PnNrXJFjzn+5dwMFAcxb2Nh9dsh
	AlteoAT5cvO7w8HqUAQFbvx+G5ny5U7yvlan28NNK3aXjcHoHPFckWgnjGieLUk4t1rLLCbsUo/fM
	Iv20DCCDS/IV5BMvftgbxl2Ji+XCnhFBc+QCnxtXFy6haoMDLOE2za6RTyo2kA7Bz4W8/+uBQKL1a
	BMUTrFPcAn8ms3zNCjnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG30P-0005Z5-1C; Sun, 22 Mar 2020 15:59:17 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG30L-0005YM-Q2
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 15:59:15 +0000
Received: by mail-pj1-x1042.google.com with SMTP id np9so4929658pjb.4
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PluEgB5CGHn5zIpx8WT7vUDABEi6WP6504DCfOquj6o=;
 b=jlRqkmR/q0VZPRBfaUHIyYnR4OYoJj1t9u9gSVkszMQKDXNKOtA4tGMcr+N8oj4kQJ
 v+CHKQK6pd49ksBYnkX9J7l4rBRVy+ulNiDZg9qE7SKA077y1LZ+WISoir5WfFF+gHdZ
 KDrLrafv7vYCdtP+vRPho318LyXdizai8mqwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PluEgB5CGHn5zIpx8WT7vUDABEi6WP6504DCfOquj6o=;
 b=LQsAkljfCm6Iet/enqkRQpwnzEB4EyhpbcqVHKbHQM9PmuO3gDRkvLf1Uxk3xOIkt5
 QWK1C0865qzanFlvyCVyIIEmZYGkwpMq3w7EosJ5abPZAw5Zj2Oet6mB05ZDNWBSR2nP
 EOyJtwmg4MM9DGNuVLEoblK3feO9rOU20FIULBFdV9YZVWFADolcGG9uPVnVuDwGZ+Ce
 gDJRDJIUkoWf9DgiDWOR3ou5aBRGHms6hPxJpR6g1TEjONnn5x/o6vtMnGbRFlZllIGt
 bYaionQK7oFspwLHtzMbThad0FLe55MZcIhbGmYXZ38WZBhKqPWjuga/OJ/3If51APPV
 B/zA==
X-Gm-Message-State: ANhLgQ178ExaWmAK6pjrySAj9s8WT/KwGz7roQS4uLYZyXH0EQP2/NqY
 AKIvyZiC1DgRYIKzZyA4IBctzw==
X-Google-Smtp-Source: ADFU+vvhqzwqYD5/diSgghDIEd9lyztkeS8kSQVvuUtRaNA6/tp+betHbMLKqpDQy6uKuylJ/6pnJw==
X-Received: by 2002:a17:902:d898:: with SMTP id
 b24mr14591699plz.0.1584892751838; 
 Sun, 22 Mar 2020 08:59:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b9sm9852106pgi.75.2020.03.22.08.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 08:59:11 -0700 (PDT)
Date: Sun, 22 Mar 2020 08:59:10 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 03/11] pstore/blk: blkoops: support pmsg recorder
Message-ID: <202003220846.978F969@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-4-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181107.6B776F0E5F@keescook>
 <4ddb742f-7819-25e9-7bf4-49a80823d2aa@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ddb742f-7819-25e9-7bf4-49a80823d2aa@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_085913_869901_E3E86460 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Mar 22, 2020 at 07:14:37PM +0800, WeiXiong Liao wrote:
> hi Kees Cook,
> 
> On 2020/3/19 AM 2:13, Kees Cook wrote:
> > On Fri, Feb 07, 2020 at 08:25:47PM +0800, WeiXiong Liao wrote:
> >> +config PSTORE_BLKOOPS_PMSG_SIZE
> >> +	int "pmsg size in kbytes for blkoops"
> >> +	depends on PSTORE_BLKOOPS
> >> +	depends on PSTORE_PMSG
> >> +	default 64
> > 
> > Instead of "depends on PSTORE_PMSG", you can do:
> > 
> > 	default 64 if PSTORE_PMSG
> > 	default 0
> > 
> 
> What happens if PSTORE_BLKOOPS_PMSG_SIZE is non-zero while
> PSTORE_PMSG is disabled? The pmsg recorder do not work but pstore/blk
> will always allocate zone for pmsg recorder since pmsg_size is non-zero.
> It waste storage space.

Yeah, true. This gets back to my wanting to have this be more dynamic in
the pstore core. But, yes, for now, you're right.

You can still do this for initialization:

static long pmsg_size = IS_ENABLED(CONFIG_PSTORE_PMSG)
				?  CONFIG_PSTORE_BLKOOPS_PMSG_SIZE
				: -1;

But that'll require logic changes to verify_size(). We can revisit this
after v3.

> >> @@ -611,7 +776,8 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
> >>  		char *buf = kasprintf(GFP_KERNEL,
> >>  				"%s: Total %d times\n",
> >>  				record->reason == KMSG_DUMP_OOPS ? "Oops" :
> >> -				"Panic", record->count);
> >> +				record->reason == KMSG_DUMP_PANIC ? "Panic" :
> >> +				"Unknown", record->count);
> > 
> > Please use get_reason_str() here.
> > 
> 
> get_reason_str() is marked 'static' on platform.c and pstore/blk only
> support oops
> and panic, it's no need to check more reason number.

I'd still rather identical strings not be scattered around pstore. :) Go
ahead and make get_reason_str() non-static and rename it
pstore_get_reason_str(), EXPORT_SYMBOL(), add to pstore.h etc.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
