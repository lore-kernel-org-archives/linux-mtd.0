Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E54FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD0420890
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5GSlgMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD0420890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHzzWQIi39hCy1B7bVRCUbc8Q3vhOpghBHCWm9iwyJY=; b=U5GSlgMdIOVk5Z
	qBDErQx+FqCy4JZ2qqafvuRG8zFj6kZD+wgxwqSYreHCIENyuK89Ak5XYaGBA0/8Yfs+GoVmcqS2U
	HhWyhmQGoyCTswVxyu9xodkqYP01yyfPLmFz5kcIb9yjOrouRQ6o78f91aIGt9ULTTVWfQPXTUrqT
	iw33BpXxgd95QxrKoANaop2r+JU4xNhqgIqa9fEY8Yl//aPKcr8I/pk1Mv/rBWmSURFdqMECDSqFI
	OrT1tSlYSK5+NgT7Q1i0n94BCVGFFoY0jTsLjOsyMZzi5K5kNCUmSqtyqHgzNwMZyi46w8gvJKMTv
	z5lBg7+crP+1wIF2+Xtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdsRR-0002OE-8I; Wed, 27 May 2020 09:33:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdsRO-0002NT-BB
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 09:33:40 +0000
X-Originating-IP: 157.36.30.198
Received: from localhost (unknown [157.36.30.198])
 (Authenticated sender: me@yadavpratyush.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 75CEB1BF207;
 Wed, 27 May 2020 09:33:29 +0000 (UTC)
Date: Wed, 27 May 2020 15:03:25 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare
 methods to avoid race condition
Message-ID: <20200527093325.247l6tnxaicsqdst@yadavpratyush.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
 <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
 <6a41fb13-e746-54f3-24ef-197384dde6ab@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a41fb13-e746-54f3-24ef-197384dde6ab@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_023338_654810_F280A1F0 
X-CRM114-Status: GOOD (  32.51  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 john.garry@huawei.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/05/20 04:18PM, Yicong Yang wrote:
> Hi Pratyush,
> 
> On 2020/5/26 0:14, Pratyush Yadav wrote:
> > Hi Yicong,
> >
> > On 21/05/20 07:23PM, Yicong Yang wrote:
> >> The controller can be shared with the firmware, which may cause race
> >> problems. As most read/write/erase/lock/unlock of spi-nor flash are
> >> composed of a set of operations, while the firmware may use the controller
> >> and start its own operation in the middle of the process started by the
> >> kernel driver, which may lead to the kernel driver's function broken.
> >>
> >> Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
> >> protect the controller from firmware access, which means the firmware
> >> cannot reach the controller if the driver set the bit. Add prepare/
> >> unprepare methods for the controller, we'll hold the lock in prepare
> >> method and release it in unprepare method, which will solve the race
> >> issue.
> > I'm trying to understand the need for this change. What's wrong with
> > performing the lock/unlock procedure in hisi_sfc_v3xx_exec_op()? You can 
> > probably do something like:
> >
> >   hisi_sfc_v3xx_lock();
> >   ret = hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
> >   hisi_sfc_v3xx_unlock();
> >   return ret;
> 
> if doing like this, suppose we perform a sequential operations like below:
> 
> lock()->exec_op(cmd1)->unlock()->lock()->exec_op(cmd2)->unlock()->lock()->exec_op(cmd3)->unlock()
>                        ^==========^is unlocked          ^==========^is unlocked
> 
> As shown above, we cannot lock the device continuously during the whole operations.

Correct. My argument is based on the assumption that lock() and unlock() 
are cheap/fast operations. If you spend very little time in lock() and 
unlock(), it doesn't make a big difference if you do all 3 operations in 
one go or one at a time.

In other words, since register write should be pretty fast, locking and 
unlocking should be pretty fast. If we don't spend a lot of time in 
lock() and unlock(), we don't gain a lot of performance by reducing 
those calls.

> But if we use upper layer method then it looks like
> 
> prepare()->exec_op(cmd1)->exec_op(cmd2)->exec_op(cmd3)->unprepare()
>         ^locked here                                              ^unlocked here
> 
> we can hold the lock during the all 3 operations' execution.

If you still think doing all operations in one go is a better idea, I  
like Boris's idea of batching operations and its worth considering.
 
> > What's the benefit of making upper layers do this? Acquiring the lock is 
> > a simple register write, so it should be relatively fast. Unless there 
> > is a lot of contention on the lock between the firmware and kernel, I 
> > would expect the performance impact to be minimal. Maybe you can run 
> > some benchmarks and see if there is a real difference.
> >
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >>  drivers/spi/spi-hisi-sfc-v3xx.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 40 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
> >> index e3b5725..13c161c 100644
> >> --- a/drivers/spi/spi-hisi-sfc-v3xx.c
> >> +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
> >> @@ -163,7 +192,15 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
> >>  					 u8 chip_select)
> >>  {
> >>  	int ret, len = op->data.nbytes;
> >> -	u32 config = 0;
> >> +	u32 config;
> >> +
> >> +	/*
> >> +	 * The lock bit is in the command register. Clear the command
> >> +	 * field with lock bit held if it has been set in
> >> +	 * .prepare().
> >> +	 */
> >> +	config = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
> >> +	config &= HISI_SFC_V3XX_CMD_CFG_LOCK;
> > This will unlock the controller _before_ the driver issues 
> > hisi_sfc_v3xx_read_databuf(). I'm not very familiar with the hardware, 
> > but to me it seems like it can lead to a race. What if the firmware 
> > issues a command that over-writes the databuf (I assume this is shared 
> > between the two) before the driver gets a chance to copy that data to 
> > the kernel buffer?
> 
> It won't unlock the controller if it has been locked in prepare(). It will clear
> the other bits in the register other than the lock bit. For single operations, as 
> prepare() method is not called, the bit is 0 and it won't change here.

Right. I misread the code. Sorry.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
