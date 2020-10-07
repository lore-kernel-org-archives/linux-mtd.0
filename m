Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4006DC4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 19:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B012076B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 19:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbKv94q8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SZhSXd1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B012076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5AakN4OBb2upyEgvAr/Ey1RXA3H3CVCi/n4HP5hGtc0=; b=AbKv94q8Oynfk6xV5+UKc1ybK
	i+IAlUU4cvG4M5upuK/CibCY4qmdgCiAUzZsvpZ8dkyn5Nirg8z5XnMB90RgPa8pQ/2Il79iGxlnp
	8QjmmBPTEtZZDKLGkrs+zGdCUNNHMgfwJxiDLR4yKaaNZ9Reatr1/vFVEDSsuPEe1oaLd/9tLxUkz
	yEpWlGfppPiVjap8+KMSoQdkzysGiiAlRNM9byFsAj/0u4k1hcgXwlN5TvmrnKBlOCJ/EvghiYTcB
	TehwG+I3l+Tq4nYkuGZaB45vTCMEKolRd01vEz8/VTsseLFeemfUUrRCsuC1EG9nzL0fbLPhz+KS1
	JHrHjh78Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQEwQ-0002Xt-CK; Wed, 07 Oct 2020 19:17:34 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQEwM-0002XK-Fv
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 19:17:31 +0000
Received: by mail-pg1-x543.google.com with SMTP id x16so2085567pgj.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2020 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EZMSE/xQ7AzIngGK3w5Ap7k+DggxMKKSrbX6SyQ019g=;
 b=SZhSXd1ccYKVdiga/5hBcXZZesYb5d1PFbu+8OjMa7Mlg62ELjJTkWVlu8RJqyaUJm
 J1+UqS1KPJp4raeG40fQt2RPcpJLxhr9wg0GV/IACJMhk76suxw/EvWPFEmgxUJGaoDU
 nMm7F6eeMgAWfcYXP0d9yLsUAaSkJWomMGHs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EZMSE/xQ7AzIngGK3w5Ap7k+DggxMKKSrbX6SyQ019g=;
 b=JfASqxdMwcHsIx7wrgxUvRF9GZE5Ilkw7yQNdZ2wjxDT88QVbMZFNM1ihZzY3VYmiZ
 0tf8msemuuR652EGZhG9gOXMQVnXIiIt+KLgCZmdWC2qaJBKJSHMgkommloZjlRJyeGD
 mYTvGMSrsDC/pxe1j50hjBSrDsJcx1bqVKiblLNrfBRzPHF758X3btYc3gIRLR98Yd9c
 Mk6Sxn7z3Ppt2nmVIh57ZfOWkydBrtgvhQRWC6dWq6N8STv7/ArrJw3U3iOYu04KuVTz
 Mcz3/c97tCNm/zaOk4E4qpYQS41fHihWt5WOE/UrXo98PXxGMnD/XrV2ZWxi4D3eLyCd
 fJFg==
X-Gm-Message-State: AOAM53276X5Orz9iILw5+Y5J+SpLrHYdGLIonlYuOb3pzDBd8sQtgRSr
 OpbDAKxNet1sah3KccByT+cZHw==
X-Google-Smtp-Source: ABdhPJxSZ58HQ14M6xAuImI7StMZrCjyYHvJE0/IhXi3VSO+yGRJkNFLSJFofW7GUBPqBFMkujTJog==
X-Received: by 2002:a05:6a00:1585:b029:142:2501:35ed with SMTP id
 u5-20020a056a001585b0290142250135edmr4439365pfk.77.1602098247651; 
 Wed, 07 Oct 2020 12:17:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e19sm4428262pfl.135.2020.10.07.12.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 12:17:26 -0700 (PDT)
Date: Wed, 7 Oct 2020 12:17:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: use case for register_pstore_blk?
Message-ID: <202010071147.F6E57A32@keescook>
References: <20201006155220.GA11668@lst.de> <202010070007.8FF59EC42@keescook>
 <20201007075537.GA12531@lst.de> <20201007083715.GA15695@lst.de>
 <202010071130.7EA00291@keescook> <20201007184258.GA6157@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007184258.GA6157@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_151730_567408_9575611B 
X-CRM114-Status: GOOD (  22.24  )
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
 linux-kernel@vger.kernel.org, WeiXiong Liao <gmpy.liaowx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 07, 2020 at 08:42:58PM +0200, Christoph Hellwig wrote:
> The problem with the block code is that it is completely broken.

This seems like hyperbole.

> It uses on-stack structures where it can't,

Do you mean the ones in pstore_blk_init() and pstore_blk_exit()? Those
are fine -- they're what provide the "driverless" module-param loaded
"best_effort" target. Do you seem something unsafe about it?

> it pokes into internals of the block device read/write path for
> absolutely no reason,

Do you mean psblk_generic_blk_read() and psblk_generic_blk_write()?
These are for writing to the block device... I'm happy to adjust this
if you can show me the better API. (This was being developed in the
middle of the iov_iter changes, so perhaps I missed a more appropriate
way to do things.)

> and it uses name_to_dev_t which must not be used in new code.

What?

include/linux/mount.h:
extern dev_t name_to_dev_t(const char *name);

init/do_mounts.c:
/*
 *      Convert a name into device number.  We accept the following
 *      variants:
 ...
 *      If name doesn't have fall into the categories above, we return
 *      (0,0).
 *      block_class is used to check if something is a disk name. If the
 *      disk
 *      name contains slashes, the device name has them replaced with
 *      bangs.
 */
dev_t name_to_dev_t(const char *name)

There are no comments about it being deprecated.

And even I had guessed to double-check, there isn't even a hit
on lkml about it that I can easily find:
https://lore.kernel.org/lkml/?q=name_to_dev_t+%22new+code%22
https://lore.kernel.org/lkml/?q=name_to_dev_t+deprecated

Where did this happen, where was it documented, and what should be used
instead?

> Or in other words: it is a complete piece of crap full of layering
> violations that should never have been merged in that form.

Gee thanks. I obviously don't agree with you.

> It also does not happen to share code with the mtd case.

What? Yes it does: it explicitly uses the pstore/blk configuration
callback to get the details configured at boot to identify and configure
the backing device. This is specifically designed this way to avoid
repeating the mistake of having per-backing-device configuration that is
essentially only actually used by the pstore storage layer. i.e. the very
thing I'm trying to get away from in ramoops, efi-pstore, etc: storage
configuration is tied to the pstore storage layer (i.e. pstore/blk and
pstore/zone), not the specific backing device (i.e. MTD, blk, RAM, NVRAM,
EFI variables, etc).

So, yes, I think it'd be fine to drop the unused EXPORTs, and I welcome
corrections to the generic read/write routines, I very specifically do
not want to rip out having a block device as a backing device, nor do I
want to revert the configuration management to being backing device
specific.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
