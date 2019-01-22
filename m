Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66566C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F362084A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piM3yEDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F362084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTWrYkyxDtRNqSi0/DVkO8RNg4UazswuopbCVmLW/Aw=; b=piM3yEDFTldP47
	0LFgSRGQOAsTHZeCe5nupSQ0YoY+ZlBFKfq1L7EzGYiuZCeQFv5r/3t3jlHCCSUUntNfh2BUgQAcq
	3c4/aRWatTxGjOLiQldA0aCJFhSz958HV35SN2c0+i1e3m8hZlLszqjwRDXBl9EaD6qrIAPLAVS/V
	Bqbdl4YnlliIELa20fFUyxyW7vtngUXztEage/08kDatOL67IZ39xW1W+8vT7mh0eGRwS0EyFbQDt
	UDeoWHkt4qhia0yhDLYMB8NJludrwF96GgR/vpAg2ZxMwZCimWj+QApnMfyPsg2iPNGwRMLjlf1OM
	a5dWaSSjFnv4BOARFD6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glu7U-0002Mh-Ac; Tue, 22 Jan 2019 11:21:28 +0000
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glu7Q-0001zX-Se
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:21:26 +0000
Received: by mail-ua1-f68.google.com with SMTP id p9so7914791uaa.5
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2019 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66efsHAy15acs45ZD+4CXYf/tgIoeLj3paDfnh51qoo=;
 b=D0b6BSmeCZmQj5L1w3I9YClOq+s8dcX/ib9i/owznvsjJ8p5POoD6cmI/kx/PN58Qv
 Fdmisi+otps6/16H4J6ac6MO7Rb+HmCSbne11vqVE80CE4KkomQuRTRLrBWQawhSsb6N
 HXFVVnryyZutuXi57qTPe94S/mGpsI78V0ln17xy0z6uT99lhjqq2a1nTivuyI+tK+9S
 GALSuffikPsKSs7swEVP2sNHHcVZwhnyAE9XHGPYO7G0pToAthammK6g0peiaWn+QfIo
 b0WvoUNNHwyipcwyrwxjGjCGgA8B1fuA7JF08IQaPCeE64ozvo1haHhUUhoEGlevJK7Z
 jM8A==
X-Gm-Message-State: AJcUukcaAm2J0Sm91cBBlPC+sGTuZ6NKOXZsDL9Qrxyl8idRBac86l9I
 Du4JLqsWh383S1ZZGX4HospFyPoISnh1DWS6vYw=
X-Google-Smtp-Source: ALg8bN54YRTpyYiWU+d87GmnQAhYqpeFm7g9sjLhnCOP2hLiI4QnXskqshKml0SxYU3Q+C4HQvPS9qaZqh5Z/8HfqPM=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr13761325uap.0.1548156083249; 
 Tue, 22 Jan 2019 03:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
In-Reply-To: <20190102143654.24362-2-bbrezillon@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Jan 2019 12:21:11 +0100
Message-ID: <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_032124_951306_2E899513 
X-CRM114-Status: GOOD (  15.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> add_mtd_device() can fail. We should always check its return value
> and gracefully handle the failure case. Fix the call sites where this
> not done (in mtdpart.c) and add a __must_check attribute to the
> prototype to avoid this kind of mistakes.
>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> ---
> No Fixes or Cc-stable tag here, as this seems to have worked just fine
> without checking add_mtd_device() ret code until we started to expose
> MTD devices as NVMEM providers (queued for 4.21).

Oh yes ;-)

https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/

Your patch is very similar to mine, so the crash is gone.
However, the warning is still there:

    m25p80 spi0.0: s25sl032p (4096 Kbytes)
    3 fixed-partitions partitions found on MTD device spi0.0
    Creating 3 MTD partitions on "spi0.0":
    0x000000000000-0x000000080000 : "loader"
    0x000000080000-0x000000600000 : "user"
    mtd: partition "user" extends beyond the end of device "spi0.0" --
size truncated to 0x380000
    0x000000600000-0x000004000000 : "flash"
    mtd: partition "flash" is out of reach -- disabled
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
add_mtd_device+0x90/0x3b0

Interestingly, only one partition is created, covering the full size of the
device:

    # cat /proc/partitions
    major minor  #blocks  name

      31        0       4096 mtdblock0

While I would expect two partitions, "loader" and truncated "user":

      31        0        512 mtdblock0
      31        1       3584 mtdblock1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
