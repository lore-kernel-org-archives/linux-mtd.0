Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D68CC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 08:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E9562192C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 08:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YpAaS4ka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E9562192C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK8NFm+JRiEqJ03fojiJKztvD+miTwTPuVGFkKYp35o=; b=YpAaS4kale9M7G
	JeFermMNTGklyiCrR42kyx9NI/I6mHCfHSwt6NutZv6DyjqLjC02OEecVLv/vd3jypZS8OgShXf4U
	YozN7cSDf+dY1FCNeIys1TGddw4qoa3ar7epmJtvYK6dCXYoPi2ZGyGLD2/uqy8vlKmEKgkb10/aZ
	f4ZsVac1SGSuOkbQNoRkZRJYv3169yfTuNs09baTzHk+Tc2DGOeUsvQqIIHOIVe1uk57qeSqar/8M
	MJ/jwJjr77RUiDW5CnbFHT2RnDtCJU9pSZBo7kezg6Cz+Ei1ZMvzNpKbIazulyf1KAXHkeRrScqe9
	/Py85D6kvFr0cB2GdKaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmwVx-00041I-AN; Fri, 25 Jan 2019 08:07:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmwVt-00040P-N7
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 08:06:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AD9B0608A387;
 Fri, 25 Jan 2019 09:06:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RIOgzsQDoCHo; Fri, 25 Jan 2019 09:06:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6DC88608A388;
 Fri, 25 Jan 2019 09:06:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id osh2LiV0KPPR; Fri, 25 Jan 2019 09:06:46 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 2FE0F608A387;
 Fri, 25 Jan 2019 09:06:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Yufen Yu <yuyufen@huawei.com>
Subject: Re: [PATCH] mtd-utils: avoid to create two UBI_LAYOUT_VOLUME_ID volume
Date: Fri, 25 Jan 2019 09:06:45 +0100
Message-ID: <2590396.W4XxvPTK3g@blindfold>
In-Reply-To: <20190125070124.58260-1-yuyufen@huawei.com>
References: <20190125070124.58260-1-yuyufen@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_000657_901601_28F84CFB 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 25. Januar 2019, 08:01:24 CET schrieb Yufen Yu:
> When we create a ubi image by ubinize, a UBI_LAYOUT_VOLUME_ID
> volume will be created by ubigen_write_layout_vol().
> However, after the commit 4c00cf2c5816 (ubiformat: remove
> no-volume-table option), ubiformat remove novtbl args in format().
> As a result, it will also create a layout volume.
> 
> When we attempt to do ubiattach, it will fail for ubi_compare_lebs error:
> ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
> ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22

Oh shit! Thanks alot for identifying this regression.
David, can you please check which relases need a backport,
such that distros can pick it up?

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
