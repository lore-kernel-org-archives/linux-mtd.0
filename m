Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4EEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684E36136F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 684E36136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Z6dlCQaC74mBJ9y6g7c6nlxUZu3V2/PSGnaX425tuQ=; b=He0u9dehyY+80O
	3TrD7BjB1yboBAdTQfv2Wz14VTINbDDWmQCswBnhsyEi8NAQKLp58lt31ClkUNUI4t4T6mqmjJ9nY
	VWTQMC8TkxjYeCIXmxmKmpM9yMLaItqt6BE2V3DsIGWqaE/sn03M8y8PY47JZ16wdrv3ax7CFM8Mb
	+MlosfSBFU7M5h+OxoL1NulLVR6buh118Pbq8r826BAYim1p8Gn4xN6ZwEx7CECtJnDSD8r/bEbc8
	aBvsrpScS3AlUjIvQQElt5oHISoWhxNC/SyiYlB+vlRKqoD0JHVEnvlqvcXfqDfGuJ7o9ifyrUo2t
	bXbNHKS5pMMI+HVqZJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXg8x-009ZqI-Vw; Tue, 05 Oct 2021 08:49:48 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXg8t-009Zo9-Si
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 08:49:46 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 7570EC24F2;
 Tue,  5 Oct 2021 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633423779; bh=AUnXTubOTobfFxzBcRJ9H6QzFIiTxSYi3vnBtn38bE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ca4ypouvW1ZLkNzvJktUrFio8Kx3ez/L0TDZ04MxVnDZWsLpZps1HPPgy92L88FD3
 DOE+KYItMLf/YMYSsIKOsH6R3nAWf+dKcp60WubGprP6x3zGMiwxUPmqs8f+QYE2QP
 IOi9tSbHpqTHBm7zeiRbnZsE9VHEwCA0edl5jLc2v9NzXpd+U4f86DBtuVoh2fd1IB
 8BaXbDg8F2chpFewkSHSWA2Gk78MQNh8kDaZ9uvZwPbxWScL/EH6DMGHqaoNJYHZSX
 RDMFRTti1Fp7WVOUcEu6Safg+xRcPCOS66HlhBc4ZIblKCvWSTJm10iyteW4B3kl2g
 PkOX+oxqbq+Kw==
Date: Tue, 5 Oct 2021 10:49:38 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: use mutex to protect access while in
 suspend
Message-ID: <20211005084938.jcbw24umhehoiirs@skn-laptop>
References: <20211004065608.3190348-1-sean@geanix.com>
 <20211004104147.579f3b01@collabora.com>
 <20211004085509.iikxtdvxpt6bri5c@skn-laptop>
 <20211004115817.18739936@collabora.com>
 <20211004101246.kagtezizympxupat@skn-laptop>
 <20211004134700.26327f6f@collabora.com>
 <20211005070930.epgxb5qzumk4awxq@skn-laptop>
 <20211005102300.5da6d480@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211005102300.5da6d480@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_014944_103460_EE2518F4 
X-CRM114-Status: GOOD (  24.77  )
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

On Tue, Oct 05, 2021 at 10:23:00AM +0200, Boris Brezillon wrote:
> On Tue, 5 Oct 2021 09:09:30 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:

[ ... ]

> > 
> > Have you seen the reproducer script?
> 
> How would I know about this script or your previous attempt (mentioned
> at the end of this email) given I was not Cc-ed on the previous
> discussion, and nothing mentions it in this RFC...
> 

That's why I shared it here ;)
Initially I thought this was a bug introduced by exec_op.

> > ---
> > root@iwg26-v1:/data/root# cat /data/crash.sh
> > #!/bin/sh -x
> > 
> > echo enabled > /sys/devices/platform/soc/2100000.bus/21f4000.serial/tty/ttymxc4/power/wakeup
> > 
> > rm /data/test50M
> > dd if=/dev/urandom of=/tmp/test50M bs=1M count=50
> > cp /tmp/test50M /data/ &
> > sleep 1
> > echo mem > /sys/power/state
> > ---
> > 
> > As seen in the log above disk is synced before suspend.
> > cp is continuing to copy data to ubifs.
> > And then user space processes are frozen.
> > At this point the kernel thread would have unwritten data.
> > 
> > We tried to solve this with:
> > https://lkml.org/lkml/2021/9/1/280
> 
> I see. It's still unclear to me when the write happens. Is it in the
> suspend path (before the system is actually suspended), or in the
> resume path (when the system is being resumed).
> 
> Anyway, let's admit writing to a storage device while it's suspended is
> a valid use case and requires the storage layer to put this request on
> old. This wait should not, IMHO, be handled at the NAND level, but at
> the MTD level (using a waitqueue, and an atomic to make
> suspended/resumed transitions safe). And abusing a mutex to implement
> that is certainly not a good idea.

I did't say this was the right solution ;) I actually asked in the RFC:
"Should we introduce a new mutex? Or maybe a spin_lock?"

What are you proposing, a waitqueue in mtd_info? That gets checked in
mtd_write()/mtd_read()?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
