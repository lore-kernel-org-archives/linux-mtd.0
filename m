Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D68EC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 17:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5364820753
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 17:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ihRRQico";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="StJGpa7X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5364820753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kyFqTQku79Xzys4V1pMg7elUImUVP8xB6LwPRlDh4E=; b=ihRRQicoe3C38+
	FLNQEwTGmHqaWADWGGkgJ4d30UM8EXeqU6VESg9Pl2hhyI9s6/5YaVeKtyJeSBav7u8yJGiHfj2kd
	BXRgR+Ml5o6wveFhHfqjWVW3iYx05Klc5l9hVLSmlngqbKj8caQWkijpTE59S+QScTC74VL4k5l0/
	ZY1qcym1X899h9BJGKAcYwYhQC4XYX2eJ2s4i2MC+bzzY3CQBsf799mJ0TgX5DBxTkmvObOe/XRwe
	/gbnjOZNVIgoXC9FFYtWCk9dckzZ8lHLoY/YVjmkavEXqoDTfST61uaEawLDdVbrqtw0f2KIqLLi+
	RRvrkOtahBpCEDjs6p/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEcQD-0005og-JW; Wed, 18 Mar 2020 17:24:01 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEcQ9-0005o0-WC
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 17:23:59 +0000
Received: by mail-pl1-x643.google.com with SMTP id t3so11460643plz.9
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5lZ1QU2FiFM13mpL/1LqV4PfZUlqUvmQr/hvDd3BQGQ=;
 b=StJGpa7X9j349/Ka4aTMwiWNnGwdyfD0gMlTqoa+GisQnaXFbZ/RQcqbALgC4QicTu
 kzwOuj51JOzHmGkT4YXyHkw275RLPDETMsKJPSzN6ba1GUUYmHWTnk1+7ddddvBsJqmo
 1OY0XUffqBgdgPAYeeunnU0zbXtrnvfOQndS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5lZ1QU2FiFM13mpL/1LqV4PfZUlqUvmQr/hvDd3BQGQ=;
 b=d919FybGUr6EzzDiH69wpj7HRc5hrTQLLRjY9Mpf9LKpM0eZi9ozpLW+2JjvCAkAIs
 FTERWRAOERowUWFuqUnCzBGxTK+kCiyRBELW3cipFdm4juCwOn1BD6hWGHf6SEdPkHdJ
 fAX5qcUpkXJnOilkABxGwNQnQ98gE7e4CNjpF+WHsEOqS3TkDGk9D5BZdb22CVSX3MOs
 rLiGwMyX8WlKCEacCA4Y1dITxIoUZnJceBKLlj1QugDEhR9eDQKhYZ156USapy6bxRBp
 nW+Lromq72guDpraHJS+gLx0TGHbj78WF8IbXf+pOmQv/xMddSbCOuZ3rY2RSE7gmeLV
 aO6g==
X-Gm-Message-State: ANhLgQ1uz30OMWpTnFk9dK+c1tRSn1qM/gw+LROQhqgoSPUpIB6t5nt9
 fqYRRo7fyOYVYNI6AulOVrN1ow==
X-Google-Smtp-Source: ADFU+vuY5ynlbZILs/Hp7bMDvzaH2hLDfKwtDf1FS/pi7nzyIJJX2IjC+XKLfrRkLst7Wkf6xPdaJQ==
X-Received: by 2002:a17:902:8505:: with SMTP id
 bj5mr1150596plb.235.1584552237151; 
 Wed, 18 Mar 2020 10:23:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b20sm6161330pff.51.2020.03.18.10.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:23:56 -0700 (PDT)
Date: Wed, 18 Mar 2020 10:23:55 -0700
From: Kees Cook <keescook@chromium.org>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 01/11] pstore/blk: new support logger for block devices
Message-ID: <202003180944.3B36871@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-2-git-send-email-liaoweixiong@allwinnertech.com>
 <202002251626.63FE3E7C6@keescook>
 <5fd540be-6ed9-a1c7-4932-e67194dddca8@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fd540be-6ed9-a1c7-4932-e67194dddca8@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_102358_066806_BF439088 
X-CRM114-Status: GOOD (  33.10  )
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

On Thu, Feb 27, 2020 at 04:21:51PM +0800, liaoweixiong wrote:
> On 2020/2/26 AM 8:52, Kees Cook wrote:
> > On Fri, Feb 07, 2020 at 08:25:45PM +0800, WeiXiong Liao wrote:
> >> +obj-$(CONFIG_PSTORE_BLK) += pstore_blk.o
> >> +pstore_blk-y += blkzone.o
> > 
> > Why this dance with files? I would just expect:
> > 
> > obj-$(CONFIG_PSTORE_BLK)     += blkzone.o
> > 
> 
> This makes the built module named blkzone.ko rather than
> pstore_blk.ko.

You can just do a regular build rule:

obj-$(CONFIG_PSTORE_BLK) += blkzone.o

> >> +#define BLK_SIG (0x43474244) /* DBGC */
> > 
> > I was going to suggest extracting PERSISTENT_RAM_SIG, renaming it and
> > using it in here and in ram_core.c, but then I realize they're not
> > marking the same structure. How about choosing a new magic sig for the
> > blkzone data header?
> > 
> 
> That's OK to me. I don't know if there is a rule to get a new magic?
> In addition, all members of this structure are the same as
> struct persistent_ram_buffer after patch 2. Maybe it's a good idea to
> extract it
> if you want to merge ramoops and pstore/blk.

Okay, let's leave it as-is for now.

> >> +	uint32_t sig;
> >> +	atomic_t datalen;
> >> +	uint8_t data[];
> >> +};
> >> +
> >> +/**
> >> + * struct blkz_dmesg_header: dmesg information
> > 
> > This is the on-disk structure also?
> > 
> Yes. The structure blkz_buffer is a generic header for all recorder
> zone, and the
> structure blkz_dmesg_header is a header for dmesg, saved in
> blkz_buffer->data.
> The dmesg recorder use it to save it's specific attributes.

Okay, can you add comments to distinguish the on-disk structures from
the in-memory, etc?

> >> +#define DMESG_HEADER_MAGIC 0x4dfc3ae5
> > 
> > How was this magic chosen?
> 
> It's a random number. Maybe should I chose a meaningful magic?

That's fine; just add a comment to say so.

> >> + * @dirty:
> >> + *	mark whether the data in @buffer are dirty (not flush to storage yet)
> >> + */
> > 
> > Thank you for the kerndoc! :) Is it linked to from any .rst files?
> > 
> 
> I don't get your words. There is a document on the 6th patch. I don't know
> whether it is what you want?

Patch 6 is excellent; I think you might want to add references back to
these kern-doc structures using the ".. kernel-doc::
fs/pstore/blkzone.c" syntax:
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#including-kernel-doc-comments

> >> +static int blkz_zone_write(struct blkz_zone *zone,
> >> +		enum blkz_flush_mode flush_mode, const char *buf,
> >> +		size_t len, unsigned long off)
> >> +{
> >> +	struct blkz_info *info = blkz_cxt.bzinfo;
> >> +	ssize_t wcnt = 0;
> >> +	ssize_t (*writeop)(const char *buf, size_t bytes, loff_t pos);
> >> +	size_t wlen;
> >> +
> >> +	if (off > zone->buffer_size)
> >> +		return -EINVAL;
> >> +	wlen = min_t(size_t, len, zone->buffer_size - off);
> >> +	if (buf && wlen) {
> >> +		memcpy(zone->buffer->data + off, buf, wlen);
> >> +		atomic_set(&zone->buffer->datalen, wlen + off);
> >> +	}
> > 
> > If you're expecting concurrent writers (use of atomic_set(), I would
> > expect the whole write to be locked instead. (i.e. what happens if
> > multiple callers call blkz_zone_write()?)
> > 
> 
> I don't agree with it. The datalen will be updated everywhere. It's useless
> to lock here.

But there could be multiple writers; locking should be needed.

> One more things. During the analysis, I found another problem.
> Removing old files will cause new logs to be lost. Take console recorder as
> am example. After new rebooting, new logs are saved to buf while old
> logs are
> saved to old_buf. If we remove old file at that time, not only old_buf
> is freed, but
> also length of buf for new data is reset to zero. The ramoops may also
> has this
> problem.

Hmm. I'll need to double-check this. It's possible the call to
persistent_ram_zap() in ramoops_pstore_erase() is not needed.

> >> +static int blkz_recover_dmesg_data(struct blkz_context *cxt)
> > 
> > What does "recover" mean in this context? Is this "read from storage"?
> 
> Yes. "recover" means reading data back from storage.

Okay. Please add some comments here. I would think of it more as "read"
or "load". When I think of "recover" I think of "finding something that
was lost". But the name isn't important as long as there is a comment
somewhere about what it's doing.

-Kees

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
