Return-Path: <SRS0=TNJo=XS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C6BC3A5A6
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 07:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C872064A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 07:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuSXQGox";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="BGJ3zFCp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ec08mQla"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C872064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIrcDZTbwWvbUgSD6hI3d44K16N6teAXfgwX0eZnN/k=; b=DuSXQGoxZzcUOh
	wWvwTcLAc+MzSvZKikz1PpW/VBdGbI1b2FkypvLaFd26cSc1918VFigW9TGTVmtqEPpmqwR/wn15I
	a7yP9TaK+KiFrTfHnFi6j4hr/NXkBHnHKR4s9igDobRKLnNaXBa2uteXQajRXBqi01npHWPq8deVZ
	OYeOsELVVyV/InTkIY/POjfNOwz68G3YTG4Zh85IosM9k8oivy2pPIdy1TK3EtthfWAAGG7qSmQZC
	bE5IlFsFDbUo4+O0NxmMnoG1VGw1Pk/tdhFoKcdobKwqsVoiEKVuGTYeDYPKtgfBohkJXoWFvJmxo
	Fh7x2qhCyM+LA11FFr4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCIYX-0001T9-Qm; Mon, 23 Sep 2019 07:14:45 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCIXo-0001Ez-L6
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 07:14:09 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 58F9522254;
 Mon, 23 Sep 2019 03:13:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 23 Sep 2019 03:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=RkRK996cL4srhgRQFGfrcbxHAR9
 z0ZXdF2rqtRnas6U=; b=BGJ3zFCpk2ml8YWsvqD6Hr6WVoecaEiJVphIyq1t6eG
 Fvya10WixfI7nxfGx2dOO9CZmnCJImT3MmQUxjNa8TyubWLq3LGZNmclyhgih5kn
 n1f2awyulS0bKvGh6FB+VTenLxLF32tSXtmqEfjuhPVsTcphGeK50XH6JBnyMwu+
 7ir/rcaxSsqcI2gwUNc6u5u93KdPv1ve+87UthLp/z/x2sbXouAXls9Nm5wvcYgA
 ArJ85iFHpsPGTSARv/TqkrK+ahhLLC+XD7Y+JkrjF0dRKUzu3eFErxLca6dtpSG1
 nwE0eFUFARUF8GBUrah9GFE6otmaPvHTkgKqbPiDMPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RkRK99
 6cL4srhgRQFGfrcbxHAR9z0ZXdF2rqtRnas6U=; b=ec08mQlaZuCVA1ec3MUX2Y
 sataQ6A14/dntZLgTEJBjCJG8x3vk8khw8/8vFcnQxLQPrVB1b90Y1emDjHD6Gvo
 cGRLoFnWZ3PlVhwufvakf6CCUL/HDzepcRtJjmF5W+rItKgUK2uYHednqp8khW+S
 dZLUFheKrocyTyvIVYQWuMAEEbYMCTm/7jaA7TsjWHzkJQSNAuBE6XcgczMIL/Pz
 e0IG4UqvuoWq0op9WFGwQ4TbW9aRYMpPzroFRwV3VLHTgXG8m51fbhMsv10P0zFc
 Jva8lSVkTMa7WiJGLl9IfcDHg3J9MJmuyJc+S6Oj63LAGAWi+fojk4A7qP/mceGg
 ==
X-ME-Sender: <xms:rHCIXbvy0xUaAgNCiDq4Et8L8tP_kN1HXHr_3mbjTK97co_vOZz54w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
 dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
 vehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:rHCIXWuUp0H43keclEzz19i_R_vT1Avwwy4uh68uorOHRgs1Ud89Qg>
 <xmx:rHCIXdv_mh2cjeKXFTO3mDnvBQwt6rXuFv-pWIsCSe44x89sPiX5og>
 <xmx:rHCIXR3RAMMi4IljKXhgb5wiUrx4bum9zbqWOFqtXML_NB4UZRNSPw>
 <xmx:rXCIXUNKOcE-3TQKB2DE27A1lWJCejGoSGUIbl_Rqf2esH6BHuN55w>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 020AE80059;
 Mon, 23 Sep 2019 03:13:47 -0400 (EDT)
Date: Mon, 23 Sep 2019 09:13:46 +0200
From: Greg KH <greg@kroah.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Subject: Re: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
Message-ID: <20190923071346.GD2746429@kroah.com>
References: <20190923023251.20180-1-ikegami.t@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923023251.20180-1-ikegami.t@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_001402_853941_9B6C4FCE 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 23, 2019 at 11:32:51AM +0900, Tokunori Ikegami wrote:
> As reported by the OpenWRT team, write requests sometimes fail on some
> platforms.
> Currently to check the state chip_ready() is used correctly as described by
> the flash memory S29GL256P11TFI01 datasheet.
> Also chip_good() is used to check if the write is succeeded and it was
> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
> checking").
> But actually the write failure is caused on some platforms and also it can
> be fixed by using chip_good() to check the state and retry instead.
> Also it seems that it is caused after repeated about 1,000 times to retry
> the write one word with the reset command.
> By using chip_good() to check the state to be done it can be reduced the
> retry with reset.
> It is depended on the actual flash chip behavior so the root cause is
> unknown.
> 
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> [vigneshr@ti.com: Fix a checkpatch warning]
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

What is the git commit id of this patch in Linus's tree?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
