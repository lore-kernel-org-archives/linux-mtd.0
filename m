Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD534C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 15:42:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A973320786
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 15:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxyLvJPL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="eOS9kCUG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A973320786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uz0vgQBq/V1K0FVZhmrhtu0zw4S/LuKnX9j/He7+F6Q=; b=oxyLvJPLrnH1mpjVOG2v6ic/2
	593cR3hGr99ZNFh9Kp5MtgCzZwSjkA8z5bFR0pv7pN6ApaQySJHzY4rIvBAcc8d8feclpW+XuXkYO
	17dzQJC2XUSLewspLJPXClxI1qjQ72pXoLdOyKjpRpQgnXWjVdU6kN5rjg5ju9ZFxVtUJKWdgvXhP
	KH2D2lxnnFz+esjJU2pnfCJFYjkHGumEyua4rdYAMTqfDAkC4kCuS+LNL+tpWDN+6k692Yuwxf6sc
	xQch84WWEMehiqR4JjcPi/xg38j3ktGD5BFGSmPwQLdbRkReHqa3fHw3vdS4VoQPZp6xcMCkeQkJU
	CahUli9Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0RjY-0004mG-8o; Tue, 28 Jul 2020 15:41:40 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0RjQ-0004kZ-7n
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 15:41:33 +0000
Received: by mail-il1-x130.google.com with SMTP id z3so6330019ilh.3
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2020 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vSWx1/Sr/gJvV92Fd2QuTQjvx6hegEt2EdSzZRTJZXM=;
 b=eOS9kCUGWozMEgHSZJcSVDFO0AHLhz5u13Hzr4euy1SfrsO3wctZ6YAEcFh81LUEFe
 qKEx883RdFNlnU/ciLWMOG+Vj2O3UtdPLRGu3wVgO4m2BQ37DnVzwEQRW6UlEXPC6X4+
 6qy3MKLhkiUeg2Gj1Hl5rFfX2WIKMSYf+TvHUXJLRYjJhA2RqWzGfAYi3i7oAIMDIOGN
 kWmCj7CoLh5z5B/OHRT7/QrMunwFyL57wmiHBTZtYJy1FwxdlHKoWKtw+zsNgVUo2ZHx
 EpjXSF+5KBb5kwwDmys2D0JqmY/qrmWuFn2WVlWcfsS5xNRgrwNQRXJP5bi8Bs1TigZW
 btwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vSWx1/Sr/gJvV92Fd2QuTQjvx6hegEt2EdSzZRTJZXM=;
 b=aTfFHgd2lzmIxVg0GOu0ZpT3/E4ZN8zbypl4iHgnFzGp3D3aSDOGcdukw9Y1+lkgNP
 8pOLUznvqDkfW6TiRtgt9J8o4XgxbH/HZ9MleWbZjpk88oQk8P2+E6uXorPZZb+OwYJj
 zaiV/SC+ewITJL1u7+KjUCviUZMe+5ARO2rohk9EF8EtkZ3efpr7ZD038vweDIYX+8kJ
 0GT29vq8WS3WtyXnrXKrfVvaATcOioHKvidarPEQ5Kbg8N+7lXlcziRM3aLDwgorc3AE
 +cdzy4s6K0df5FbaO7d0kn+NP1Ft0Aft2p/mIl1isKf6IjqPnUcmhQy/ulKj4dki2d44
 telg==
X-Gm-Message-State: AOAM530PT4m6mfGxGvSmRtZ/6aRLBLO8x5NMtwQvMXxbBnrBA+fp1Dau
 c4/aclfHnrmMzziayYNtTaSHAg==
X-Google-Smtp-Source: ABdhPJyDr3/VSL/Sd0AZTRTnDaDXbKtAPJuxtlG2XtO6yQjepAU3x+9xL+YVZgu/NKlxbtyZpuHMhw==
X-Received: by 2002:a05:6e02:c6b:: with SMTP id
 f11mr411495ilj.272.1595950890232; 
 Tue, 28 Jul 2020 08:41:30 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id u6sm2827959ilk.13.2020.07.28.08.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 08:41:29 -0700 (PDT)
Subject: Re: bdi cleanups v3
To: Christoph Hellwig <hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Date: Tue, 28 Jul 2020 09:41:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_114132_365708_62B258AC 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/24/20 1:32 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains a bunch of different BDI cleanups.  The biggest item
> is to isolate block drivers from the BDI in preparation of changing the
> lifetime of the block device BDI in a follow up series.

Applied, thanks.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
