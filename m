Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB6DC4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 19:46:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A442220C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 19:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tuvB/GL/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="L2Wx7FlL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08A442220C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sutpsQgaCjenRsImuo8TOGbBZbtCahYYlqdrV56Vaxo=; b=tuvB/GL/4LdsyGlwdCRV464jU
	wiR8A/4G09xQ71tokNG05X7uoSNdw7CBQFsdMVx6a76B7YZtNVT9psddkWIprmqTxxnhlCx1UxWh1
	1/cChhsq9/l2GHifNK6+6N6TyGAWRnRSDjMPtCj4FFuZF+a+5/zh/RWfSU6rMx++TLlLu2FzNwBSt
	6j3pLMTjPnzT0s1dGDHT7xptvuxInJGjQ/fTSg5c8v0juu3ViYd6cd06OqZJEqJAGMnLNj5W8ylbo
	BUnXYzNIWelixDWQL/5kS+mCKfy3jL/lzumXM4zN6OFm0+BvsS/+LCGIml4GhgRlT5WWJTRKevfgp
	63ZXg02CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLXAu-0005Ss-Ji; Thu, 24 Sep 2020 19:45:04 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLXAs-0005R0-03
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 19:45:03 +0000
Received: by mail-pg1-x530.google.com with SMTP id f2so334908pgd.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ADwlTn9rnJzlHv/xfLefERCgTh/zOY3+dj+IP5LMhIo=;
 b=L2Wx7FlLw8QHVp62Ne3mt4GV7+MUCO/WLUazgDqXAmYbUX1Et5GwKUZRbOhKWcg1pJ
 h3F8YG2QH8T53HlhbxkOnKDq7rYr7VYQSpBZ/SrGKbAAN0q9gjlZztvIvkLYWYD2H5p5
 D5jWhUDJxNaNV9x10hDsgdYsv3+GqUJuih92RXGRYnyEyog4jlWpFA8o+B+sqtqEeysu
 zXsVFR5QGsEI7lJZ39JHqx1JjZyubGP7QEwNsybW+JHQWulohPcvjDgNlPxNi7sQOhp+
 YLXR3ph4QhgGStegDp9ue2849D7tWES5wOYPeY73GujeWcYMaP3DsMTgcgakPfQ8C4Iw
 pmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADwlTn9rnJzlHv/xfLefERCgTh/zOY3+dj+IP5LMhIo=;
 b=oCsfFq309LljFU5V7R8MLecQnGM0QmGHzqTCjDctpT+MK97XK7HfOEJ/l2KCKzZ2Xh
 I3Kx4A94kiL0D7OJ/t6AJPMO1K4+XicPDIwtDepz4vdat6bkrviE5xwZw2cn7dWym7n7
 e5cyFkL9k4ByoXCWo1z91eXDv66zZb+uEmp32Qv2EIeYsEcDZX9iQdHxWjIdcxrszWR+
 G8YcqZdY6CVROTkQ8r+RfRwmEMRflmD0iWHlhihTWEuheWfPRjBi2GlLW1YSa2reNtIo
 qtPDvH6AcRZXDu3PtQ+DOQyLXv0EfJwj3EWiilKvHNm9dEAY0bjVA+Zg/BmZ/6g0Ksca
 adkg==
X-Gm-Message-State: AOAM530NTLKjEdp1mOBpGa7ZbsMNRKaNPzQBBhiguxbXpD82+ytay6x7
 LdaRJ+Q6Q9jnz2+ZEndM6OAVDQ==
X-Google-Smtp-Source: ABdhPJyn7jUbiC3AGiO/dBfKmKGpcA3VV/JE4LzjEmCUjGJIbrcL8/kmgANM72e+JonEfnG9EJ77rg==
X-Received: by 2002:a17:902:854b:b029:d1:cbf4:bb43 with SMTP id
 d11-20020a170902854bb02900d1cbf4bb43mr778274plo.13.1600976697336; 
 Thu, 24 Sep 2020 12:44:57 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21d6::1911? ([2620:10d:c090:400::5:d63d])
 by smtp.gmail.com with ESMTPSA id u10sm267612pfn.122.2020.09.24.12.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 12:44:56 -0700 (PDT)
Subject: Re: bdi cleanups v7
To: Christoph Hellwig <hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a9235ba9-95a0-4251-ee7d-e4012775346e@kernel.dk>
Date: Thu, 24 Sep 2020 13:44:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_154502_096898_D5B5F01E 
X-CRM114-Status: GOOD (  14.06  )
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
 Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/24/20 12:51 AM, Christoph Hellwig wrote:
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
