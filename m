Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3383C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqqD50Wi43GH1E3DP5OL4yQlPmZG6gk2DYhRZECOytc=; b=GOeLrDw0zk3yO6
	bLnIgjlTCR6aqrUEaPvI6zavmLMRHkK292v7wclirpGc1wOL9MGvjxoBHTd8ea4fCbf5lCBDKDD56
	U3iSY4uPmgonSBpUhb+3SP/H4vcZ+n/a8Z8HR7oDYlPIbofNORPOb/SYIAMcW3T2fykvXM6Ia+NSt
	t6/4MKdez2VzBvPWQX2Nin3C8+qpIFtyyy+sFdxtEcD+wg1BLNaip4BmoQOJQOw1ouoXQA57cDnQj
	ZkzTcEkHwNgnuX5ABtJEtbGu39ZpD5DSjODSxEfMRWrxr53BYymXs18Z1Xmnm+mtT3lugR5s9UTHQ
	5D98NQzXXr9+uHgGj7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWT9-006f21-G2; Tue, 07 Jun 2022 10:29:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWOa-006d0k-UQ
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 10:25:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 67-20020a1c1946000000b00397382b44f4so9292836wmz.2
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jn0EHNfnW+j1MiRaoiifQn0/z4QTwceqDn9P9T64iwQ=;
        b=uqhMyEocxEWlapBw4E6UOxzNuzO983FvPAcwdxo1nGvTqJkD5JmLMyUVNmMKQkDC7U
         +Lwa5lFsgL9NZDhjc7QixV0Ok5G6Fwx9zVO2PmKv3gPhQKaxVZXwmczZSFw3AwqN1SG7
         jDXB8YLO6BaBVtziqpI+foGNSL8u9mhaH7eYYrFMMlpmMC/gClvZ5FFBlr1xW4tfwPms
         ryENPneNB3lXSlVXMxE4fHvOvlr9Y9tJ2dfitj/A40Lr4KuXvJT3xiXi8crog6Mn1cPj
         O4Ebs2XO44VxnDzwAhBR3DJO6Gp5KknkFHPeqvTozFDwzwZTRyZBzGxs9u4dJc5rgfts
         JAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jn0EHNfnW+j1MiRaoiifQn0/z4QTwceqDn9P9T64iwQ=;
        b=rZUtsveZ++/XgbmseqZGSZN8m4DLgSpXZUFsHQF8Wwv3QuyMCafsErSlFE365W3jkn
         kSVaZFxCLKeXG53We95H8xfOo5KG7VVh//blUY5H+XGaq3/TZrX8Wi+YhXpo/EOgEyxf
         rEAJzB74WqQ6dni3nK7fX4wzxHaSpkEMZ1x3vvmECrDcFn6Yt2E89gt77SwFsYevThoN
         o8lWqjavJIq4vxOtwNHETbvcwjV0dV9YkHsysA7XqvW5/0lHyiQ+OdbwQ4rbOKTUUVOB
         dgNrzi6N6xgTN9TKtxJOTa04sFFMeZKuy01DIQdBBM80Zf6zFX4Ud11bT3mu8MiB9hQU
         ECfQ==
X-Gm-Message-State: AOAM531FOlf1whMdWBQP0q4kf3MDNz/bH2FC3wOxpUzs+ekJLEp3XnzB
	kBQS8Hh2/KWrx7AfraF6iUaHCOaToWrLQMe8
X-Google-Smtp-Source: ABdhPJyzgrVt1X0JsGbdSXIMkWI5Sw9Ff7ZZTKZe7Vp3ZgnjCyAt/AGRVS3Ld09OKm/TFFd5hJ4Ieg==
X-Received: by 2002:a1c:5444:0:b0:39c:3761:ac37 with SMTP id p4-20020a1c5444000000b0039c3761ac37mr24918987wmi.144.1654597501012;
        Tue, 07 Jun 2022 03:25:01 -0700 (PDT)
Received: from ntb.petris.klfree.czf ([193.86.118.65])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b0039aef592ca0sm19759738wmk.35.2022.06.07.03.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:25:00 -0700 (PDT)
Date: Tue, 7 Jun 2022 12:24:52 +0200
From: Petr Malat <oss@malat.biz>
To: David Laight <David.Laight@aculab.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Joern Engel <joern@lazybastard.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Message-ID: <Yp8ndNcYbkIKjZmI@ntb.petris.klfree.czf>
References: <20220523142825.3144904-1-oss@malat.biz>
 <3cab9a7f4ed34ca0b742a62c2bdc3bce@AcuMS.aculab.com>
 <Youn9AmqY6/EExDw@ntb.petris.klfree.czf>
 <e33f91a3eacc4aa3a08e6465fef9265c@AcuMS.aculab.com>
 <YoyFpbhLB1E+8ilr@ntb.petris.klfree.czf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YoyFpbhLB1E+8ilr@ntb.petris.klfree.czf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_032509_253945_CACAD941 
X-CRM114-Status: GOOD (  11.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Mon, May 23, 2022 at 04:09:20PM +0000, David Laight wrote:
> On x86 (which I know a lot more about) memcpy() has a nasty
> habit of getting implemented as 'rep movsb' relying on the
> cpu to speed it up.
> But that doesn't happen for uncached addresses - so you get
> very slow byte copies.

I have measured the performance with (patched) and without my
change (orig). My change improves the performance on X8664 and
arm. On Mips64 it stays the same:

Tests
=====
All runtimes are in milliseconds, average real-time of 3 runs, time
measured with bash time built-in. Measured process run in SCHED_FIFO
with priority 99. Page cache was flushed before every run, but all
involved program images were in tmpfs (no swap).
 - dd r512
   dd if=/dev/TESTDEV of=/dev/null  bs=512
 - dd r1MB
   dd if=/dev/TESTDEV of=/dev/null  bs=1M
 - dd r512
   dd of=/dev/TESTDEV if=/tmpfs/img bs=512
 - dd r1MB
   dd of=/dev/TESTDEV if=/tmpfs/img bs=1M
 - flashcp
   flashcp /tmpfs/img /dev/TESTDEV
 - flasherase
   flash_eraseall -q /dev/TESTDEV

Results
=======
All times are in ms

ARCH       |     MIPS64      |       ARM       |     X8664
CPU        |   CN6335p2.2    |    v7 TI K2     |  Xeon D-1548
Dev. size  |      32MB       |      128MB      |     256MB
-----------+-------+---------+-------+---------+-------+---------
     in ms |  Orig | Patched |  Orig | Patched |  Orig | Patched
dd r512    |   131 |     130 |  1101 |     543 | 22906 |     281
dd r1MB    |    65 |      65 |   655 |     122 | 22715 |      70
dd w512    |  1150 |    1150 |  1136 |    1042 | 28067 |     412
dd w1MB    |   104 |     104 |   396 |     244 | 27761 |     122
flashcp    |   100 |      99 |  1438 |     568 | 78455 |     270
flasherase |    21 |      21 |   208 |      77 | 27707 |      57

BR,
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
