Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AB5F53D9B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRuTNbMX9Q8Xy+nK15XwawUJtws+l+iRTygMvoR+VEk=; b=jczgvxLmR7rvlv
	zPfgr3XdNmOUIRektIY5vhz4VELjvS0Fm6ltQs1jYvxEes3iRpt5BukzQeiSYCFENGTWK9fvy9zJU
	2STgibZCWyW/zNAgJGRk9Rvt4Z/d73hzb6VjrcrNET9j2NdmYMNhiH3+z54jeoIlLghzivjsylfDK
	GoYE+E9BjlAoOUpbQjQuBj/MKKb54McGnUBGbW7fsFACxB6L0AYGOo5xM9CTqoy5QGFRkpO3lRnXA
	fx2pSD6uSeEyHdnlIIABvrugU9ukIuZ4Wu+JWzEhS0gLe5jZqstonK9+D7CoDJFLH/ZtTuCm7ulsI
	MTqoVHf/DVxj64ZW5H8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2G9Q-00000004you-1t8a;
	Mon, 16 Mar 2026 22:11:04 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2G9M-00000004yoD-2bKa;
	Mon, 16 Mar 2026 22:11:02 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 96E81138028E;
	Mon, 16 Mar 2026 18:10:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 16 Mar 2026 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773699056;
	 x=1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=
	eyO5nsRGgscBaSPTlSrjx8D8qsmxFZTD+YBT90C8JLtkSU+JG9otBsGP68/aDjfq
	Ip8/CY7pDqj8uLfl6tk9PaoCLmHFx9BmC+OLDsgQIKz5wruWwvglBIFTzX8Bgo1G
	D7tyDhfcq/yYvbxAZYbPlVlov+W1BUQwVVZx34myYfSzzczy+o0TvO2AJR+dEy1d
	h9Fy4zA0IHy3AyAu2lJw7cTPeRVsoH7Q9DZJUhPGVmEq8IZ5byXvr46eUf3RwYLV
	Pd21rN+O2sxo21UD0KoApMpHYwnhY5vI1CKlHqs6nb1Q0ON5mjBcz18/WvPyI4M2
	g7ed/wORmv3aHNEvlM9NEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773699056; x=
	1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=g
	uCypQjfxr+Zi7JxdTC/p3wGQ4VV0q/Wv3rf4QuOSSvRwPZ4hwWoKXSQwRlJppx/A
	eTD/kX8ytMBkqeeAHXi8QojGoDJPwhemKEl1A5BQyy+VTfQ0kjCklEhRU0D9TNU6
	QzoouUhJdY7Fi24kVLMS4vkfF5Xif+sxcGuZ+ZH9bmNOAZhg/6jHFnuxjrIUYo4Y
	sJAjmQ/c58h+MsTVokuL8c2t4xBbVGwnTgXIvKplEwnaY81NNzKXbPGa+zPU58N/
	vwQ/zZfUYT5zYdyXfBWrfC5sZSkqzhpuD1WACxXIM/TD7Jh2N1ZXy8qS+O1DtSBY
	h24uS6YuZ9c79L+rKNYRA==
X-ME-Sender: <xms:73-4aYdtUUIQC679P0YPl8k6UZ10Tz8-qTD319yDZEtXusdBhZuXRA>
    <xme:73-4aTUav9FvduIIOmc0jldmINr5W_MhUsWQFGzP1fBm1dpf8ggOxSMvCMHniLmCu
    LbRPk360ujIo39hLA6fsP95YlnCLki5WcrUsiuRyEwh6NcxWlxF>
X-ME-Received: <xmr:73-4aSY56rJyFtQwMFw-H9dfM29zbbMWxWkWrpi3kYaZ1kbqDyXdf5bHU5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleelheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesthejre
    dtredtvdenucfhrhhomheptehlvgigucghihhllhhirghmshhonhcuoegrlhgvgiesshhh
    rgiisghothdrohhrgheqnecuggftrfgrthhtvghrnhepvdekfeejkedvudfhudfhteekud
    fgudeiteetvdeukedvheetvdekgfdugeevueeunecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhgpdhnsg
    gprhgtphhtthhopeehhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhhrghh
    nhdqohhsshesrghvmhdruggvpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfh
    hrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrphhprghrmhhorheslhhishht
    shdruhgsuhhnthhurdgtohhmpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopegtvghphhdquggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegtohgttghisehinhhrihgrrdhfrhdprhgtphhtthhopegumh
    dquggvvhgvlheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqdgu
    vghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepgh
    hfshdvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:73-4aQltNdDVIdEqvCmz7Mlt0qW50NA4CHgJQUMNlacMN4MGiVKHfA>
    <xmx:73-4acHdFw15OLpR73_B1AdIXJMG-pYssiD_C0T2dj2N-8ux7fVHFg>
    <xmx:73-4aU6P6J2BtdvPwSPzfrUNjz9-qYacHOOWBucSAMlha23fXDTcIg>
    <xmx:73-4aaO5YEqAXlnOLRO88GZx1RbxPW8QtXAeqZQNaqmxlgOL7PgFkQ>
    <xmx:8H-4abIvs_QYur641c9BpnDuFQ6ssCC-7-o-rPLEHWyRxStBDxJEr6SL>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 18:10:52 -0400 (EDT)
Date: Mon, 16 Mar 2026 16:10:50 -0600
From: Alex Williamson <alex@shazbot.org>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
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
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
 alex@shazbot.org
Subject: Re: [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over manual NULL
 check
Message-ID: <20260316161050.01c82973@shazbot.org>
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
	<20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_151101_180900_7360ED0A 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, 10 Mar 2026 12:49:12 +0100
Philipp Hahn <phahn-oss@avm.de> wrote:

> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct vfio_device *device,
>  
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device, mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
>  
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 

As others have expressed in general, this doesn't seem to be cleaner
and tends to mask that we consider IS_ERR() and NULL as separate cases
in the goto.  This code looks like it could use some refactoring, and
likely that refactoring should handle the IS_ERR() and NULL cases
separately, but conflating them here is not an improvement.  Thanks,

Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
