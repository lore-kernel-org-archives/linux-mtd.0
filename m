Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE4F506D1
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7G9cya09FgrsZzM2oiPo+4G8dNxsbkLqS8+RRFVBvq8=; b=jmLug/cF7K9Oa5
	ZldprxabE1XiLdc4+Jdt8xWgB2Dnjz0fuEu6J8Seu0mgrhomo1IBzmnPGbDpy+MbH3hCql7TrNouc
	w1wG/8x1sbeTWC4SGYONuqeRRUobq+PlSFPUkpTP72Niv48ThksdDguFKj/rXvEnFML1UCabH4byP
	fZ0WVfUoyFP/TqHsgfbJXL4klabTCG8Y1ZDLkBg2pgDQjxzIiM0TU5C2Hd40Oe4WJdtrPmuM43ZEB
	Rm+g36bBjxjPmx7ZEv11BxXUDL2Ae2n/ZkGwVJyizbu2n9NjfNoBQZa5DF9qfn9NOL4ORJcJXI01n
	XhPieM3wzHfkwMeLRL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w281k-000000044u0-0QvN;
	Mon, 16 Mar 2026 13:30:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w281g-000000044tA-3ETH;
	Mon, 16 Mar 2026 13:30:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 357291477;
	Mon, 16 Mar 2026 06:30:25 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4953F778;
	Mon, 16 Mar 2026 06:30:22 -0700 (PDT)
Message-ID: <2c7466f5-d952-4356-9b55-9d2ebb3471f2@arm.com>
Date: Mon, 16 Mar 2026 13:30:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 50/61] iommu: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org,
 cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-50-bd63b656022d@avm.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260310-b4-is_err_or_null-v1-50-bd63b656022d@avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_063032_935602_1FDCD49F 
X-CRM114-Status: GOOD (  16.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2026-03-10 11:49 am, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.

AFAICS it doesn't look possible for the argument to be anything other 
than valid at both callsites, so *both* conditions here seem in fact to 
be entirely redundant.

> Change generated with coccinelle.

Please use coccinelle responsibly. Mechanical changes are great for 
scripted API updates, but for cleanup, whilst it's ideal for *finding* 
areas of code that are worth looking at, the code then wants actually 
looking at, in its whole context, because meaningful cleanup often goes 
deeper than trivial replacement.

In particular, anywhere IS_ERR_OR_NULL() is genuinely relevant is 
usually a sign of bad interface design, so if you're looking at this 
then you really should be looking first and foremost to remove any 
checks that are already unnecessary, and for the remainder, to see if 
the thing being checked can be improved to not mix the two different 
styles. That would be constructive and (usually) welcome cleanup. Simply 
churning a bunch of code with this ugly macro that's arguably less 
readable than what it replaces, not so much.

Thanks,
Robin.

> To: Joerg Roedel <joro@8bytes.org>
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> Cc: iommu@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>   drivers/iommu/omap-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 8231d7d6bb6a9202025643639a6b28e6faa84659..500a42b57a997696ff37c76f028a717ab71d01f9 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -881,7 +881,7 @@ static int omap_iommu_attach(struct omap_iommu *obj, u32 *iopgd)
>    **/
>   static void omap_iommu_detach(struct omap_iommu *obj)
>   {
> -	if (!obj || IS_ERR(obj))
> +	if (IS_ERR_OR_NULL(obj))
>   		return;
>   
>   	spin_lock(&obj->iommu_lock);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
