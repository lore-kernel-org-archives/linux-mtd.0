Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7D2C388F9
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495FB20756
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 08:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uf7fBHWs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495FB20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41JyoQZ6NeX7OLqFwnKOhLh1dlX+sQz2aoO3jxg7wCM=; b=uf7fBHWswwWdaLD5ammmvhhaW6
	d6EaVmk7U7kgWXSw2k6MD9jVRbJ9RUFzqnVYmn2+Fc1P1bW1sXFOAprOmYgjhrHjz3CIVDLYHjW2J
	HbdVZFV+oCBdHF8Ma9SQE96rLYIwpxRh1IW/dgg5mJAMtDjdWotOvcbYjBcBNPaulJx9QrmDI3Wqt
	2Cx1yKZ4z4/cjC7VVxz/OoNcWefNAO/CQ7qsd7ZMJpGU4mLEJR7hRWCZVTFo2hwRWAh9pBWtEkD9v
	KVQ4ZUSqeD+gkIcvgGLw5Bqh3XN7IC8xqR0qSv+q9KhUxFDd/+IlkDVEmDXTb56I96TWjoMepm4sR
	E1hvfZtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZVOY-0007nR-Ck; Mon, 02 Nov 2020 08:40:54 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZVOV-0007mM-BJ
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 08:40:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 42496F55
 for <linux-mtd@lists.infradead.org>; Mon,  2 Nov 2020 09:40:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoXRUJzAcUZ8 for <linux-mtd@lists.infradead.org>;
 Mon,  2 Nov 2020 09:40:47 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 1BB264727; Mon,  2 Nov 2020 09:40:47 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Install Yocto image and backup
Date: Mon, 02 Nov 2020 09:40:43 +0100
Message-ID: <2234110.ZDGxJVC3CD@ada>
In-Reply-To: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
References: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_034051_526525_239EC332 
X-CRM114-Status: GOOD (  12.83  )
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

Am Montag, 2. November 2020, 02:02:09 CET schrieb Jupiter:
> I built Yocto Linux kernel and installed Yocto image to MTD NAND
> storage in an iMAX6 device, because we designed RO for the kernel and
> root file system, RW for applications, we can update applications OTA
> but we cannot update kernel and root file system OTA. My supervisor
> asked if we need to have a dual NAND storage to backup the kernel and
> root file image, if the NAND bad sector occurred in the primary image,
> it can be booted from the secondary backup image. I understand where
> the concerns come from, but I am not clear if it is necessary or if it
> is a common practice to perform NAND backup storage, appreciate your
> insight advice.

In my opinion two things are common practice: 

1) Using a layer on top of raw NAND, like UBI/UBIFS nowadays, so bad blocks 
can be handled properly in a layer below your rootfs.

2) Using an A/B scheme for updating and using a well tested framework for that 
(instead of self written shell scripts).  You don't need another NAND chip for 
that, just multiple partitions.  You can still have your kernel/rootfs read-
only at runtime.

Greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
