Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE988C4320A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 19:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20E360E77
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 19:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A20E360E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Di5w6MNxJoocZn+gTrrQkn2J/Mq89x0yQyCl4MrGtAc=; b=Au4TK5wsrOHwsV
	7AWTWthtV87LIlHe67OmUo5PDIsqtA6Vzecbkgvd0+Mw1aRCD437VDEMVQuRzSxsnbiq9DQKzIbEw
	YAlDDJ2XFur7fQnWZaTsQQ4MT8/xCG8zZPZUUDMD3sQdDLNGq+ZBbAHYWYClkQ/8OaNYQkBiNnsq2
	Vo8mkHyZeJQ1kij8peldoVbalGL9VMnaEBvpmLGxPkbylVik4yWYx+ZtrX2En4uqIqPKcZY5cfHFO
	sm4t+thbwoYZFa6oMynhNKXGJfshykEr0nwagHS6ec0AxAI/HB8DzoL9WcbIZpEMm09B/e2EiMA1w
	eQC6Q0hK+0SWToIB6NVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKmhx-000PvB-Ci; Mon, 30 Aug 2021 19:12:37 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKmhr-000PuY-5M
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 19:12:35 +0000
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DA682240003;
 Mon, 30 Aug 2021 19:12:25 +0000 (UTC)
Date: Mon, 30 Aug 2021 21:12:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, open list
 <linux-kernel@vger.kernel.org>, Phillip Lougher <phillip@squashfs.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, dm-devel@redhat.com, Kernelnewbies
 <kernelnewbies@kernelnewbies.org>, agk@redhat.com, snitzer@redhat.com, Sami
 Tolvanen <samitolvanen@google.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
Message-ID: <20210830211224.76391708@windsurf>
In-Reply-To: <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
 <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_121231_397959_816C1102 
X-CRM114-Status: GOOD (  11.39  )
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

Hello,

On Mon, 30 Aug 2021 23:48:40 +0530
Pintu Agarwal <pintu.ping@gmail.com> wrote:

> ohh that means we already have a working reference.
> If possible can you share the details, even 4.19 or higher will be
> also a good reference.
> 
> > > Or, another option is to use the new concept from 5.1 kernel that is:
> > > dm-mod.create = ?  
> > How are you doing it today without dm-mod.create ?  
> I think in 4.14 we don't have dm-mod.create right ?

No, but you can backport it easily. Back at
http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
kernels.

> Here is our kernel command line:
> 
> [    0.000000] Kernel command line: ro rootwait
> console=ttyMSM0,115200,n8 ....  verity="95384 11923
> 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3 12026
> " rootfstype=squashfs ubi.mtd=40,0,30 ubi.block=0,0 root=/dev/dm-0
> .... init=/sbin/init root=/dev/dm-0 dm="rootfs none ro,0 95384 verity
> 1 /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
> 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
> aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
> restart_on_corruption ignore_zero_blocks use_fec_from_device
> /dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026" ...

I don't see how this can work without the dm-mod.create feature. Are
you sure the verity= and dm= kernel arguments exist?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
