Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA18C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 08:18:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE48206E3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 08:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zgYNHb0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE48206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwMqHVpPrz+OwG+JJF6MQTiKPSlY+Uye+UhoPSkHMsI=; b=zgYNHb0hKnstJL6dvG2BteSpB8
	MreZqWqmb+uRw/rBPpx0biiUbVWpCywPDXsul1MzcQXhaO6G490kfNmp8zLJtFyq5OYwXfJJD9ZRa
	H4ZkmNLoC6GVIqTQNEXt2VrghfVwJlQhIdB65C2ckVfHaBZJKQThk+vwuNsDekAFJglgcHsU6FnDe
	3Ea5jdUwDZWyvpCC1GNl6uLgTvdLnjVWpQ8mG82pDICwLq17rNLp5QynVW5cs0ECUiQa+FUXgJXEl
	v60kMM+YRYZ+puym5ttQeWmIf1Jv1HUI5Rt1+uabD1qB9nU0iqam0zs64rIMwe21y31MR7a4k18HQ
	/KmADWqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrUR-0000Ng-VS; Tue, 03 Nov 2020 08:16:28 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrUI-0000KG-5O
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 08:16:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 477CA357F
 for <linux-mtd@lists.infradead.org>; Tue,  3 Nov 2020 09:16:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mVALJ1DJ2pi for <linux-mtd@lists.infradead.org>;
 Tue,  3 Nov 2020 09:16:13 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id E005F4701; Tue,  3 Nov 2020 09:16:12 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Install Yocto image and backup
Date: Tue, 03 Nov 2020 09:16:07 +0100
Message-ID: <3029789.gPz3SqCoUO@ada>
In-Reply-To: <CAA=hcWSAsKEcFaR1dCpCey_m2Z2zOxYT1N8NNjL6bNQxSrHj1A@mail.gmail.com>
References: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
 <2234110.ZDGxJVC3CD@ada>
 <CAA=hcWSAsKEcFaR1dCpCey_m2Z2zOxYT1N8NNjL6bNQxSrHj1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_031623_116753_054927C4 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 Jupiter <jupiter.hce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

Am Montag, 2. November 2020, 10:16:58 CET schrieb Jupiter:
> Hi Alexander,
> 
> Thanks for your advice.
> 
> > In my opinion two things are common practice:
> > 
> > 1) Using a layer on top of raw NAND, like UBI/UBIFS nowadays, so bad
> > blocks
> > can be handled properly in a layer below your rootfs.
> 
> Yes, the UBI/UBIFS is used in NAND partitions, I guess you alluded
> there is no need use the backup, right?

If your kernel and rootfs partition is just one UBIFS in a bigger UBI volume, 
then no. Single bad blocks affecting the UBIFS partitions would be handled by 
the underlying UBI. You should however consider using ubihealthd or something 
similar to become aware of badblocks over time and handle them before it's too 
late and you can not boot from the rootfs anymore, especially if it is read 
only and not touched for writing in normal operation.

> > 2) Using an A/B scheme for updating and using a well tested framework for
> > that  (instead of self written shell scripts).  You don't need another
> > NAND chip for that, just multiple partitions.  You can still have your
> > kernel/rootfs read-only at runtime.
> If I do need to use a backup, it won't need another NAND chip, it will
> be another UBI/UBIFS partition. But I would like as simple as possible
> if no backup is a common practice.

I don't think backup is the right term here. Backup would be something you 
make based on a running system.

I just looked briefly over the documentation of RAUC [1]. This is no explicit 
recommendation, there are other update frameworks, but you can find a lot of 
ideas and concepts in there frequently used in the embedded world for updates.

Your original question implied you want some kind of redundancy, but never 
update kernel and root filesystem, right? That's rather unusual at least if 
your device is somehow connected to a network. So what I suggested was having 
two rootfs partitions. One is active and the device boots from it (A), and the 
other one acts as inactive (B). When you update, write the new rootfs to the 
inactive partition and then just switch over and boot B instead. You might add 
a third partition for recovery or factory reset. Only the active partition 
would be used in the running system and can still be readonly there.

Alex

[1] https://rauc.readthedocs.io/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
