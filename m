Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5515C63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD73206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tvftWnUh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ/2SdU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD73206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9tz74zQV4YnBvBe0OMrAIaTB1WyjGAZ0OPGjk39PRMs=; b=tvftWnUh39vE6UD1mPEWvN/fI
	PAfbFctHIwW4LbGM+qrOjDAqsCQN86cpjH4QrFfQ3/oo2OOysbX5KomS2iBrSkN+5fVcjQ28A3FOM
	vW+h1iRsMNTAcGmtUvQ0pay2g+pupap05qNk6eXx2/adslLrFOc5O/4Azclgcv23nj1YwUtVWolnw
	laotk1EK6iRCgsx46uczSiJTmjqh4XZQKZpz/CvNSgZZrRA7JVPvY7egzSr/f6PipnRLNfRBpDyiC
	4vQKnPYHQIpUcj1gW0yKYgcU6Yga5ZmQrO4oqwLmiFmNU0HL9fb15EScyN5GgCB8D/+5j7Il2SKKq
	RCuulGfPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcGp-0003Ju-DR; Tue, 24 Nov 2020 17:38:27 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcGm-0003IH-EI
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:38:25 +0000
Received: by mail-qk1-x741.google.com with SMTP id d9so21474239qke.8
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m2ZvAloMQE/4x6qZGlu4klEd6I1OFmrdg9L02bbThZY=;
 b=mQ/2SdU+idAG7rNq1qMaVxb9CR+RcWt1BHKTZWsDVy8fWCHqwJhHCvkgRkFmG5gG6l
 63dI7pIc19199ylq2PWs338wpUAaIlVHv4bO05m/1Tk1mu08D8CqxB2E3PYFAkryMgfE
 H/1POZOqIABmkG6petf6pD/3aOMnkDRssdWhk0UsaRx2ckUhxiT3bRltu9ZmDeO6w6xs
 euBOjZvBw84KJ31lUkNXglzMy/nzFsEPPBt7GRVCqAEkecyLnn3pxEkW/JpPGKSWAdFb
 ar0JpCcxfg2HCjARPmkDqdzRoKlh3PeHrwbTzFIOvsccSM84XNZBR0TOpFWESYxO6GeG
 MgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=m2ZvAloMQE/4x6qZGlu4klEd6I1OFmrdg9L02bbThZY=;
 b=Ou/cnKcKfds3kv4stxXwpVIW7goZB2Z4ZD/nPukFrClc2GlsXMWNbWP9kqk1eCOeAd
 HCbcHdiSV6vohpRSHFYJSv+h8U7JtAPkPiM2u4Xf4+I6HPGo5UpoSpivMmtMB50t4GMg
 YLcoqtXtRlnWe0FGIexKiiODvzK+pf/2HdpdWgtjCD/GUUabTzKI7NwGp/Tufsrj/+2J
 q7gMB6rYqg18p7lcSChaKgp3/TRnHJF8W16gQ2NrZAA9HphIJLuB3o7g/43LMPdJ6dih
 0GGHUdgibGJ9ROpqzeSfHP3hz0FAlH9x8VVn7od2j8c7xLPnGFAQMmbN/eIewfd1Mzfe
 /a4g==
X-Gm-Message-State: AOAM530s1JPJRr41xdVb3cUaNSXLxZn8z1rpISke4tSdM87xOX97Tf3q
 h1LB3Z3PM8xT0YelWEKrTJE=
X-Google-Smtp-Source: ABdhPJydGVRMFQ1+r3+Z46PpDtXJ8+bSnv4nPK+7aFRRl1d4ZdhaX+JqGpjWBGRDvXsi5fkaK49s7A==
X-Received: by 2002:ae9:e80d:: with SMTP id a13mr6004436qkg.140.1606239502291; 
 Tue, 24 Nov 2020 09:38:22 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id x21sm13062842qkx.31.2020.11.24.09.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:21 -0800 (PST)
Date: Tue, 24 Nov 2020 12:37:58 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/45] block: use put_device in put_disk
Message-ID: <X71E9mG4sw2WiIEj@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-16-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-16-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123824_549946_6ED9B00A 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:21PM +0100, Christoph Hellwig wrote:
> Use put_device to put the device instead of poking into the internals
> and using kobject_put.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
