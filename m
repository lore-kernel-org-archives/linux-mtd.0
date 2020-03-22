Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D759C4332B
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22FA20722
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 15:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZtjKS7Os";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="euo5bqfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22FA20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CxevehWr5PvHDEb4OnwzVCCa9qE/Si0Wwb6HRjyjcM=; b=ZtjKS7OsIw5Hyt
	YlYuGDWUyppCSkaz0WdG6xOCZ2Uev33FdEEegy0JM85oaZExH21DSmbZzcfFmOrDjBYofsEN8eUEA
	Py/fzOTvY6Qmd8l/qi/CxVlZCQVpHCyJNZlHajVeh6F+URygFb8+kyTrF8e8ZwFqvkbl/gcD11XBe
	3TGKFsTSuf0Q+1xDUwWtsft02IAe0ikEFQYoTu2KENJrgK0OwkvG19zrNA1ObUAXseh/0bS+DaBXN
	M8CnSw21I3u/enCJD2VKqEi/hjkhNxBipC44Cp1IhCYq2RcrZc1pDZe0RrztofGjYbQCY5M4Et0QQ
	8ckxH2Hz/GE0xSUKnxkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG2m9-0000bM-CF; Sun, 22 Mar 2020 15:44:33 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG2m3-0000b0-CC
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 15:44:28 +0000
Received: by mail-pf1-x441.google.com with SMTP id b72so6170506pfb.11
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YL+MR4SeE7ZMKyLj3pq91f9YbQ3vSzoJuwAbHw1Bf+c=;
 b=euo5bqfjl82QDaTCxgYHrwbwx1CZxogNrh71EorKsEz+of9psHTsKBi9jD+BVMF9/i
 la6IlwZiIeBLqJdotzhOopEAsYNyxuiIiKC2dHtrnbApYpn1uIZynco9BNDWDp53KcYi
 mm0N4OoucSO7VRIAfKI4scY1S3I6oOMPCgbzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YL+MR4SeE7ZMKyLj3pq91f9YbQ3vSzoJuwAbHw1Bf+c=;
 b=nDF9ZsRovZeiNNTmA32fPQay3+gXHJQkvMzHCO5zuGV/CRWrRn2sxqVfQ3N56j7fC+
 EVpGGEAMNsjF1pZzSsKxde2F34ajzP2xyR068Sa+q8vnrR1UONXmjRd4x8iVeHhS2/Uf
 PsMpqgEe9Z42jFx7+ZVXZTQKruuWVgnpsQ3QdFlwMu3L501MRakpIztMe7lTWeLiwRWJ
 b5TF+bSdQxJb31pb7dYcbhD1tRZ7ENOD7ZvD3UCCEUJ68N9ot22/5hV0dtqF4CuUQ8hv
 ytNsxWdlR3pcW+/ouLFxUNB5Vym+UuNWsfudJgrDnPFsGsjwAr+/84w3OVbjBLNwu9uc
 7e3g==
X-Gm-Message-State: ANhLgQ3KX8eHkWj2Dw6PDCDjO+KYDVJYd/i5COfXnTsoleJZ4M9GPduF
 JKltIe6Lqa1eMq4qdUhb+fqjGA==
X-Google-Smtp-Source: ADFU+vsOuZnbrkJ1+OlzMtqbAiGhhpTVn5FLmXciOuBCi3EqN698sLpsBrXbCZstEAjm/8Z8ZeWbNA==
X-Received: by 2002:a62:144c:: with SMTP id 73mr20002041pfu.265.1584891866727; 
 Sun, 22 Mar 2020 08:44:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 71sm11249418pfv.8.2020.03.22.08.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 08:44:25 -0700 (PDT)
Date: Sun, 22 Mar 2020 08:44:24 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 02/11] blkoops: add blkoops, a warpper for pstore/blk
Message-ID: <202003220816.C877AB41A4@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-3-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181025.20B6978@keescook>
 <11f3dcbf-dba5-8fdc-6b2c-43dbe4e478c8@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11f3dcbf-dba5-8fdc-6b2c-43dbe4e478c8@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_084427_442387_0577FCA4 
X-CRM114-Status: GOOD (  36.40  )
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

On Sun, Mar 22, 2020 at 06:00:34PM +0800, WeiXiong Liao wrote:
> On 2020/3/19 AM2:06, Kees Cook wrote:
> > On Fri, Feb 07, 2020 at 08:25:46PM +0800, WeiXiong Liao wrote:
> >> blkoops is a better wrapper for pstore/blk, which provides efficient
> >> configuration mothod. It divides all configurations of pstore/blk into
> > 
> > typo: method
> > 
> 
> I will fix it.
> 
> >> 2 parts, configurations for user and configurations for driver.
> >>
> >> Configurations for user detemine how pstore/blk work, such as
> >> dump_oops and dmesg_size. They can be set by Kconfig and module
> >> parameters.
> > 
> > I'd like to keep blkoops as close to ramoops as possible on the user
> > configuration side. Notes below...
> > 
> 
> Is your question why not use device-tree on the user configuration
> side? Here are my answer about it.
> 
> There is an important difference between blkoops and ramoops.
> The ramoops can be initialized at any time since ram already be
> ready. However, blkoops must waits for block_dev registering.

Right, that's true and looks fine as you have it. I meant I wondered if
there was a way to teach blkoops about mtd device naming (in the same
way that it already supports many ways to find matching block devices by
path, by UUID, etc). That way when blkoops see a matching MTD device,
it'll load the mtd module, etc. For now, let's leave this as-is, and
revisit this idea after v3.

> No, non-block here means devices such as MTD device which is not a block
> device and do not use generic block layer.

How are filesystems implemented on top of MTD devices? Are they
MTD-specific, or is there a block layer driver that goes on top of MTD?

> So, why not extract a common layer from ramoops and blkoops to allocate
> and manager storage sapce? That is what psotre/blk (blkzone.c) do. The
> ramoops and the blkoops do not care about the use of storage.
> 
> I don't know whether the common layer is good enough to ramoops and
> whether is good time to rename the common layer from pstore/blk to
> psotre/zone?

Yeah, I'm still looking through that. I'd love to be able to merge the
pstore/zone with much of ram.c. That way we could even get ECC support
on non-RAM storage devices. :)

But let's not worry about that for v3. I'd like to get our
configurations matched up, though. To that end, yes, let's keep your
"dmesg_size" (or should we maybe call this "oops_size" to distinguish
oops dmesg from console dmesg) and I will add an alias to ramoops to
support "oops_size". Then we can have a single place to configure
settings for the pstore/zone layer. I'll keep thinking about how to best
to that.

> How about Makefile and Kconfig as follow?
> 
> 	<Kconfig>
> 	config PSOTRE_ZONE
> 		# NOTE.
> 		# the configuration is hidden from users and selected by
> 		# pstore/blk.
> 		help
> 		  The common layer for pstore/blk (and pstore/ram in the future)
> 		  to manager storage as zones.
> 	config PSTORE_BLK
> 		tristate "Log panic/oops to a block device"
> 		select PSOTRE_ZONE
> 		help
> 		  ......
> 	config PSTORE_BLK_DMESG_SIZE
> 		......
> 
> 	<Makefile>
> 	#  Note: rename blkzone.c to pstore_zone.c
> 	obj-$(CONFIG_PSTORE_ZONE) += pstore_zone.c
> 
> 	# Note: rename blkoops.c to pstore_blk.c
> 	obj-$(CONFIG_PSTORE_BLK) += pstore_blk.c

Yeah, this works, though with the "psotre" typos fixed. ;) The comments
in the Makefile aren't needed, since there's no renaming actually
happening. They're just named that from the first time they appear
upstream.

> 
> >> +
> >> +	  NOTE that, both kconfig and module parameters can configure blkoops,
> >> +	  but module parameters have priority over kconfig.
> >> +
> >> +	  If unsure, say N.
> >> +
> >> +config PSTORE_BLKOOPS_DMESG_SIZE
> >> +	int "dmesg size in kbytes for blkoops"
> > 
> > How about "Size in Kbytes of dmesg to store"? (It will already show up
> > under the parent config, so no need to repeat "blkoops" here.
> 
> That's good idea.

Or, based on above, "Size if Kbytes of oops log to store"?

> >> +#ifdef CONFIG_PSTORE_BLKOOPS_DMESG_SIZE
> > 
> > This (and all the others below) will always be defined, so no need to
> > test it -- just use it as needed below.
> > 
> 
> It's fine to dmesg_size and dump_oops but not pmsg_size, ftrace_size
> and console_size, because they will be not available sometimes.

Yeah, this has bothered me for a while but mostly only ramoops cared
(almost all the other backends only support the oops frontend :P).
I have some ideas about this, but I'm not quite ready to implement it
(basically, the backend would tell the core what it could support,
and the core would examine available frontends and then report back to
the backend what it needed). But that's not something we need for v3.
I'll keep thinking about it.

> >> +	bzinfo->total_size = bo_dev->total_size;
> >> +	bzinfo->dump_oops = dump_oops;
> >> +	bzinfo->read = bo_dev->read;
> >> +	bzinfo->write = bo_dev->write;
> > 
> > Why copy these separate functions? Shouldn't bzinfo just keep a pointer
> > to bo_dev?
> > 
> 
> bo_dev is a structure defined in blkoops and not available to bzinfo.
> 
> At the very beginning of my design, the pstore/blk is a common layer
> for  blkoops and ramoops. So, it's not suitable for bzinfo to keep a
> pointer to structure of blkoops.

We may need to revisit this in the future in order to keep the module
loading sane: we can't have the function body get unloaded while
something holding a pointer to it is active. But this would be a small
change at a later time. Let's leave this as-is for v3.

> I will keep generic_file_read_iter() rather than vfs_iter_read().

Absolutely. :)

> >> +
> >> +	blkoops_bdev = bdev;
> >> +	blkdev_panic_write = panic_write;
> >> +
> >> +	/* only allow driver matching the @blkdev */
> >> +	if (!bdev->bd_dev || MAJOR(bdev->bd_dev) != major)
> > 
> > And add similar error reports here.
> > 
> 
> I'd  use pr_debug rather than pr_err. Because we allow mulitiple
> devices to attempt to register to blkoops. It's not an error.
> 
> pr_debug("invalid major %u (expect %u)\n", major, MAJOR(bdev->bd_dev));

Ah! Right. Then it should separate "non matching" with pr_debug() and
"the matching one failed" with pr_err() (i.e. it's the right device, but
something about it is bad: bad size, can't register, etc).

> > I don't see this function getting used anywhere. Can it be removed? I
> > see the notes in the Documentation. Could these values just be cached at
> > open time instead of reopening the device?
> > 
> 
> This function is reserved for block driver to get information about the
> using block device. So it can't be removed.
> 
> Sure, a new structrue is created to cached these values.

Okay.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
