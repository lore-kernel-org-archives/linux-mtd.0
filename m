Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FDEC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59BE20818
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gnI8IEMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59BE20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Erm+EFOCZ/FtTR3m+NHPRTTL4u3sKy3fojewchItK0g=; b=gnI8IEMKDQznEY
	kewcklRu7gRBXP0F6eRqOA1moyWFCtKVZGyM7P702FyFN/K51+NjiXzv0J0LK5KpVpgoBJXkepbPX
	K5w0axwfzDLS0h+AEYR5i5DI8PbUUw6EMfX3of8TaNEW596Mama4t15hYh5lMscwPkEHX1Muc5fzG
	crrf6ZKNOGlHzeomFlrN2Vgzxh0PQeJ4uidgFdkOSFANUuj8jPO8td6e51M8RTPyOd0ofHinWHkqJ
	o7U7Y5Zf44uiV/jrhO+KanySURPmxDpilXYfgM8HFp8NIzGCdRDyXQnp/MNJllwXO8nPKA++Ms1s4
	wJsHYfWzvJ/sze2pKKFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlGd-0003nO-2G; Fri, 01 Mar 2019 16:44:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlGZ-0003my-T3
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 16:44:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2372F608A382;
 Fri,  1 Mar 2019 17:44:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZpI8H04Kj5Sz; Fri,  1 Mar 2019 17:44:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CAC6A608A385;
 Fri,  1 Mar 2019 17:44:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sVrCD5prW0ml; Fri,  1 Mar 2019 17:44:02 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 84759608A382;
 Fri,  1 Mar 2019 17:44:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tim Harvey <tharvey@gateworks.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
Date: Fri, 01 Mar 2019 17:44:02 +0100
Message-ID: <3595506.DBTOofq0ZL@blindfold>
In-Reply-To: <CAJ+vNU12C4va7-cCKzxHgVftZ-omODefsnzmMMjFnQtR-+ZWbQ@mail.gmail.com>
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CALLGbRL6m1P8uoWVrAzfKzqem-pL6q5bbwhEWyHS0iCiuSLyQQ@mail.gmail.com>
 <CAJ+vNU12C4va7-cCKzxHgVftZ-omODefsnzmMMjFnQtR-+ZWbQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_084408_089250_668D5973 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Steve deRosier <derosier@gmail.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 1. M=E4rz 2019, 17:41:06 CET schrieb Tim Harvey:
> Steve,
> =

> I've compared erase/read/write speeds for both flashes and the Cypress
> flash is 2x slower than the Micron on a 'per-byte-size' basis (which
> is what I would expect as the datasheets have pretty much the same
> timings per 'block' but the micron has 2x larger blocks and the chips
> are the same overall size meaning the cypress would have 2x as many
> 'block' operations across the same size).
> =

> So, at a raw erase/read/write level the Cypress is 2x slower than
> Micron, but ubi-scan is 7x slower (4s to 28s), and ubifs-space-fixup
> is 100x slower (0.5s to 50s).
> =

> I guess i've made a mess of the description of the issue. I can dig in
> and find the basic flash timings the kernel is using 'but' when I test
> using flash_erase and dd for erase/read/write over say 60M I find the
> expected 2x slower performance. I just don't understand why I see a
> much slower performance at the ubi and ubifs layers.

Can we please start with decent numbers?
Is UBI really slower than expected? Or only UBIFS file read/write?

I'm still totally confused by your allegations.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
