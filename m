Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31402C4332D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 18:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0857820777
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 18:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dj+JgskA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROF8fL4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0857820777
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLqOBx0fy9tzP95MPNP2elsL9Uxy3X4/d29ctvJT2rw=; b=dj+JgskAaTVLut
	eVP9tQXgCPIyJijWEOhQv2aaCUWjNy3aXrHJdM9b8zdAXbTy8tqXAWo3XUKKi7xhIRVaJeWNocxhL
	uyE1NKFi45tpneeXA8wHPffGwwJoyRgZ2MzFOKhGNkZ+dn0rpvhoWbJ2rpBiIWhWDLBhdA/6ddV23
	50TfMPZcal0VNbjPZ0xyEu1r5bFQMhVcfGWo5Z51s9tCia46ZyeQmcIWYZqwWfcnn9pzXibPS9trx
	2Juorh7YeHiNZIiUMTqKKZKoCXPx5K+CuAiVHTOwSMpIYrx5ZVwZoCiQIsfbF1tixG3Z2Vd+swmtW
	0Z7u9FhY3AlC7lUo3jFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFMFy-0004jj-4a; Fri, 20 Mar 2020 18:20:30 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFMFu-0004dB-62
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 18:20:28 +0000
Received: by mail-pj1-x1043.google.com with SMTP id hg10so2865311pjb.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2020 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RVSRfcV+K0pn1zszQCXh+F75MQYeICFTBaMdga96uY8=;
 b=ROF8fL4cRZOKjexdiQjvRriYL5aMB2v6UG48zv2w65UIZVXk7AuVFSi6y696oOXNgd
 OvVHFsVQNRrgCH99H9N1yvFIVrPS6ys9mIlNNMSdcv+QWT7LmYHbymhkONJJ4Iind7wU
 XawwvMxLzn/ahDIsk46CsBzOvZd50S7qX5rI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVSRfcV+K0pn1zszQCXh+F75MQYeICFTBaMdga96uY8=;
 b=tQQZk7bSml8jVdSlY3FMm9vO7xO1kNidDcK8z5QLgQ1I5nLPmOR6pkGktyBHQJ2C9e
 dqo0Xb4pgz+KYPxnE5mrqamaEhxT5d9ypQdhxT/8y5JzmH4K6zO+aDB5KDIhSgyMoFpa
 soSd/C90a4cVuBIdmWyDjv0suTXZAyARrSVWijdPchnGal6jTBBdMU5vyeXcOiSc7lOo
 8EPAS1Kjc/4W+nw6BMzo93DjvPkCKOfPplsWdLAWOVtJcx2dSMdLxd8Jhz/UcY9H7ZrQ
 dZcjl+bh5WGsnUbEYv8gLKIqctP5P4RfpX8DTbRnKe+SPEHTV+ueCQWRk1iQmb76Fi9S
 mdiA==
X-Gm-Message-State: ANhLgQ0QF+G8AokVYATNJmnql+BYSXx6Bzo8sBdDoEykglOMEPD672sX
 LPTnuFjkQrx7pil9TrP4hJ4M/A==
X-Google-Smtp-Source: ADFU+vvh9wNdOc6LXFIlkPM76qeYw8uzvfR7zvmRHA7t4NFIeMW1f7FJ0y8bVnB9QWXKTnZPYdAwPw==
X-Received: by 2002:a17:902:8348:: with SMTP id
 z8mr8998254pln.342.1584728424639; 
 Fri, 20 Mar 2020 11:20:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g9sm6093642pfi.37.2020.03.20.11.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 11:20:23 -0700 (PDT)
Date: Fri, 20 Mar 2020 11:20:22 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 01/11] pstore/blk: new support logger for block devices
Message-ID: <202003201111.BE5EAB9A@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-2-git-send-email-liaoweixiong@allwinnertech.com>
 <202002251626.63FE3E7C6@keescook>
 <5fd540be-6ed9-a1c7-4932-e67194dddca8@allwinnertech.com>
 <202003180944.3B36871@keescook>
 <dab67ab1-c03f-0507-3d56-4a9578e85f6b@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dab67ab1-c03f-0507-3d56-4a9578e85f6b@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_112026_275074_8FB72A76 
X-CRM114-Status: GOOD (  18.01  )
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

On Fri, Mar 20, 2020 at 09:50:36AM +0800, WeiXiong Liao wrote:
> On 2020/3/19 AM 1:23, Kees Cook wrote:
> > On Thu, Feb 27, 2020 at 04:21:51PM +0800, liaoweixiong wrote:
> >> On 2020/2/26 AM 8:52, Kees Cook wrote:
> >>> On Fri, Feb 07, 2020 at 08:25:45PM +0800, WeiXiong Liao wrote:
> >>>> +obj-$(CONFIG_PSTORE_BLK) += pstore_blk.o
> >>>> +pstore_blk-y += blkzone.o
> >>>
> >>> Why this dance with files? I would just expect:
> >>>
> >>> obj-$(CONFIG_PSTORE_BLK)     += blkzone.o
> >>>
> >>
> >> This makes the built module named blkzone.ko rather than
> >> pstore_blk.ko.
> > 
> > You can just do a regular build rule:
> > 
> > obj-$(CONFIG_PSTORE_BLK) += blkzone.o
> > 
> 
> I don't get it. If make it as your words, the built module will be
> blkzone.ko.
> The module is named pstore/blk, however it built out blkzone.ko. I think
> it's confusing.

I mean just pick whatever filename you want it to be named. The Makefile
case for ramoops was that ramoops got renamed but we wanted to keep the
old API name.

So, if you want it named pstore-blk.ko, just rename blkzone.c to
pstore-blk.c.

> >>> If you're expecting concurrent writers (use of atomic_set(), I would
> >>> expect the whole write to be locked instead. (i.e. what happens if
> >>> multiple callers call blkz_zone_write()?)
> >>>
> >>
> >> I don't agree with it. The datalen will be updated everywhere. It's useless
> >> to lock here.
> > 
> > But there could be multiple writers; locking should be needed.
> > 
> 
> All the recorders such as dmesg, pmsg, console and ftrace have been
> locked on
> pstore and upper layers. So, a recorder will not write in parallel and
> different
> recorders operate privately zone. They don't have any influence on each
> other.

Yes, sorry, I was confusing myself about pmsg, and I forgot it had a
global lock. Each are locked or split by CPU.

> The only parallel case I think is that recorder writes while dirty-flush
> thread is
> working. And the dirty-flusher will flush the whole zone rather than
> part of it, so,
> it is OK to call in parallel.

Okay, thanks for clarifying.

> Based on these reasons, I don't think locking should be needed.

Agreed.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
