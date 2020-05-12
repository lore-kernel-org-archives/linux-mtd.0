Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44EEC54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 05:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A197820733
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 05:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tbhVL3nV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxeO0LEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A197820733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eqhqxSTnDa1VmSRnBwJme+ZpNFqgccEDUe1iczqDSU=; b=tbhVL3nVx/Mp0/
	TKB9CewjTJW7RoRdl+4SaYr6YHUFNOz4n/Xn2jJOfN2rED2uAoOkhR3HN0YGLXRsRmS7Fl1SKNNWA
	wNTwX0D4xIRGqch5Bq5mU4/qJOe4vLyxynCytSobpWVHlUtULSjizXAnCexFEaqFSSp/UY7PCFCtt
	CDMNvvFXrRWZOjAtVIbvFp5ApFxUEjZBgdMTrsf6WQocBDtOxdznHfvgw8xrVuqpnWQya4SZAnfBD
	2crvPQkZmjkYoMZ63dfQ5P79VdBLsqoL7svbzf3SkWEVTGFsXfbJ9GaH9SdJUNeponFYJBLvBx3/+
	e1lzTKdwRjnFuyu1oEAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYNG7-00009Q-T7; Tue, 12 May 2020 05:15:15 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNG4-00008w-Pe
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 05:15:14 +0000
Received: by mail-pg1-x544.google.com with SMTP id u35so2627156pgk.6
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 22:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hkw/Z63xQHG8uMp0IH/cCnzDA8TYdvaGr2m+4SY43mQ=;
 b=NxeO0LEOxjSFPTHG2C8P6nGRpFSnOQS4nM0rEMQT5Qmce3eP8ATPEFQ5t6N0YnCvl8
 uXPC4uUm7iPJ23kuR7NeQ4LaqrZf6uLqsdv01pHYCOWKmjyZkdJs4+ayMsSqDgwMW4Al
 okZIIW6hD7YscBdv3SDXPH1XadUmgOOLWh5As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkw/Z63xQHG8uMp0IH/cCnzDA8TYdvaGr2m+4SY43mQ=;
 b=V28IWllTOMKx6nqTvOKUr9upRVkcgsOTrdNNdZzd6mfFkVp4tjsuB20MlOWBj5fmVU
 HvlAYi72PRvcdWVcM8QdyQ44c0b8X+GtMrQC1Ifx7zhfEXENOBOigJtsFlSKkjJ9mqeU
 uUACj7khOWCT3i8/GALNiAwt+0Z6hIhJElaKHTyNiyH/igMF1It93SsGZrYlxrNujisr
 mCkoYfXJf0QujuQiP+ygiRVPJlo76+NeXBAZm3UplJi9gTYRaozTgTBVyZdIXK8WPL4t
 R7JViepxlDmUlCWT5QlbWvCFO3uV1QjxdDtRWeKNJyeDpaMTfnVNpu5iQYCkVO2Otc2n
 CDyA==
X-Gm-Message-State: AGi0PuZrLCXU3ase7J0Up7tZG+Zo9rIcJKX8RbWMblXdXaupB9/Yf+wp
 3F64o/KMDt1NtYTIlaUEqQstCQ==
X-Google-Smtp-Source: APiQypLHR8TY4hZJxKV8zGV9lZbtbRZMhdgZf2g/71c4CVlnO4S4AhYYCUHD5RLGcmuTYmodJ37Qhw==
X-Received: by 2002:a63:4665:: with SMTP id v37mr17003825pgk.297.1589260512040; 
 Mon, 11 May 2020 22:15:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t188sm10768564pfb.185.2020.05.11.22.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 22:15:11 -0700 (PDT)
Date: Mon, 11 May 2020 22:15:10 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v8 01/11] pstore/zone: Introduce common layer to manage
 storage zones
Message-ID: <202005112212.2E75B83@keescook>
References: <20200511233229.27745-1-keescook@chromium.org>
 <20200511233229.27745-2-keescook@chromium.org>
 <a9d47bf1-7498-1d07-a943-29dd0b0ef2e1@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9d47bf1-7498-1d07-a943-29dd0b0ef2e1@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_221512_833688_0AB79BE1 
X-CRM114-Status: GOOD (  16.92  )
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 11:55:20AM +0800, WeiXiong Liao wrote:
> On 2020/5/12 AM 7:32, Kees Cook wrote:
> > [...]
> > +struct psz_context {
> > +	struct pstore_zone **kpszs;
> > +	unsigned int kmsg_max_cnt;
> > +	unsigned int kmsg_read_cnt;
> > +	unsigned int kmsg_write_cnt;
> > +	/*
> > +	 * These counters should be calculated during recovery.
> > +	 * It records the oops/panic times after crashes rather than boots.
> > +	 */
> > +	unsigned int oops_counter;
> > +	unsigned int panic_counter;
> 
> oops/panic_counter is designed to count the crash times since the
> linux kernel was installed. pstore/zone lookup the max counter from all
> valid kmsg zones when recovery and saves them to oops/panic_counter.
> However, they are unable to get real number if we remove files. It's
> not serious, we can fix it after this series.

Since the kernel was installed? I don't see a kernel version check in
here? Or do you mean "since ever", in that it's a rolling count?

> And since pstore supports "max_reason", should pstore/zone count for
> other reason?

For now, no. I opted to try to keep this as simple as possible a port
from dump_oops to max_reason for now.

> > +static inline int psz_kmsg_erase(struct psz_context *cxt,
> > +		struct pstore_zone *zone, struct pstore_record *record)
> > +{
> > +	struct psz_buffer *buffer = zone->buffer;
> > +	struct psz_kmsg_header *hdr =
> > +		(struct psz_kmsg_header *)buffer->data;
> > +
> > +	if (unlikely(!psz_ok(zone)))
> > +		return 0;
> > +	/* this zone is already updated, no need to erase */
> > +	if (record->count != hdr->counter)
> > +		return 0;
> 
> These codes is to fix bug that user remove files on pstore filesystem
> but kmsg zone is already updated and pstore/zone should not erase
> zone. It work for oops and panic because the count number is increasing.
> However, it's useless for other reason of kmsg. We can fix it after this
> series.

Okay, sounds good.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
