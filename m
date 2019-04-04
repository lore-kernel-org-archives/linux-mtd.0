Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53699C4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 19:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225162082E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 19:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIr4niTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225162082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pv19COPLGhs907UVDAyRVPaQCIrrL6l9uuNWzSZ1roY=; b=LIr4niTr42UU70
	a2Un+/YsMoTJo9Zjnx+q2nn5S16Pagx3SCrsZJLX7oZ4xwMcgGDEfkZUalu8bgbIt+F6zetvpDDY4
	JDYEwEhTnnLBZ48A0WuAwAKd4FuEcBYfnDCbOIG0xEvgeHf2HJqFDW9VM4c+HFmBqdfHc4rW64I8T
	qYBHkfopGo12Erv3oAJrnm2D8mYbE6aznFtQNr0EToqVH5fQ95xgCbpCWR80WA+pZrUccH3TUJxRU
	rqRMHZLPqO0jwFygGMS47JCJR76e35kxILA0KGaD4srZim63tf4fPDsFC6EojK6LCXBO4qLD3496F
	p7jdbKB06TOf/EJ0WIxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC8Gg-0001sS-HT; Thu, 04 Apr 2019 19:43:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC8Gd-0001sB-Pj
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 19:43:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F21C1608A394;
 Thu,  4 Apr 2019 21:37:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0gortqsqvFJn; Thu,  4 Apr 2019 21:37:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A3BA8608A3BD;
 Thu,  4 Apr 2019 21:37:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id K7qpVi4yLYTJ; Thu,  4 Apr 2019 21:37:29 +0200 (CEST)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 6BC42608A394;
 Thu,  4 Apr 2019 21:37:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Patrick Doyle <wpdster@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
Date: Thu, 04 Apr 2019 21:37:28 +0200
Message-ID: <23922253.ayd0uQntjt@blindfold>
In-Reply-To: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_124319_984999_D682EA46 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 4. April 2019, 17:29:16 CEST schrieb Patrick Doyle:
> Add support for CONFIG_MTD_UBI_BLOCK_BY_NAME, which enables ubi block
> devices to be named by their volume name: /dev/ubiblock%d_%s rather than
> their volume ID /dev/ubiblock%d_%d, so that one can mount e.g. a root
> filesystem by UBI name instead of volume ID.  UBI volumes can be renamed
> on-the-fly in user space. This allows the root file system to be swapped
> from an "A" volume to a "B" volume without having to change the mount
> options.

Isn't this why we have udev, to create fancy by-id/by-path/... naming conventions?

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
