Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB2EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pKsuFVPq/+KzVPM7SC8DHi+0qx3F2FquZO4cie87kA=; b=OsBp7J49WJs+kY
	uJWkoXrzv8TwicGnYweRUeN34mUgu8ogPo6fQWQj43wwnNOYbOYSLwFI1C2s9PZlQZpYEEzUV8y8d
	ym1gzf62APPZAxSVCrCr8OE9V51YEK0JfOTvJYbVrSI0IX/9HqARjCg4fkloErc10hzSIL9+YIsfm
	qBnly1FhSiubT9pSUyM+GO0nanJ3GWUjoRV4/PVsFuZFgtNbC5/kfuoMFj6XaPEv0JnNrdSCP54Br
	arZdx2ywu0j2Kgs+gWSN/19/hG61nrtv4Z8R+tebyL4MJCixzIM1jr4ja+CtFTIVgg5hVYX06JHeD
	kE5gqtJZ6BUNdGWPLx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWaB7-00ATiU-CJ; Tue, 22 Mar 2022 08:47:45 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWaB1-00ATey-30
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 08:47:43 +0000
Received: from skn-laptop.hadsten (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id F3229E44825;
 Tue, 22 Mar 2022 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1647938853; bh=iPPnFxlC9oSUFGhsR1kHV0zD+GTZbBI5UKS8frFrZZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Cv1oAncaq8IqsdAs9yCLUtTda1zIsNYqhzEylKzwSdS478qo3UHXd7I0um/wNbNVl
 aXMZnAldFBJwKgfSxcqtvDPwFuVxkrgfGHg/jvLZDWIByOFai9ei5hREBv00NoCkez
 FHu9pmL4tZ+w3EfDwfjO0CUzeWPxufKlROZh8GK1AUaGG1fg1Gg++5tHfvSlUF7Vb9
 cchfvcq11keiWVy0xD6tGLL+ef5iuPULW2r9tlDq8J+slZ8OCP4KADVV1iBCRHBfVm
 fx+S/sluSFNZnDaYhz38LYplcsCV2Zsvsei/MXofAQHjCaA76/SPm68N478wvNfui6
 V2b46t6j+3LNg==
Date: Tue, 22 Mar 2022 09:47:32 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Han Xu <han.xu@nxp.com>
Cc: sbabic@denx.de, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, u-boot@lists.denx.de,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, uboot-imx@nxp.com
Subject: Re: [PATCH] mtd: gpmi: fix the gpmi bch setting unalignment issue
Message-ID: <20220322084732.u6bfvjqcclmq6pyi@skn-laptop.hadsten>
References: <20220321201834.28546-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321201834.28546-1-han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_014739_464704_C91DAD2E 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Hi Han,

On Mon, Mar 21, 2022 at 03:18:34PM -0500, Han Xu wrote:
> The code change fixed the kernel gpmi bch setting not aligned with
> u-boot settings issue. It still uses the legacy bch geometry as the

AFAIK there is no merged changes in the kernel regarding this.
The breaking change was done in u-boot.

> default option. If users need to choose the minimum ecc strength that
> NAND chips required, it can be enabled by either adding DT flag
> "fsl,use-minimum-ecc" or CONFIG_NAND_MXS_USE_MINIMUM_ECC in configs.

Cool, then remember to remove the non used "fsl,legacy-bch-geometry"
option.

> 
> Fixes: 51cdf83eea mtd: gpmi: provide the option to use legacy bch geometry
> Signed-off-by: Han Xu <han.xu@nxp.com>

I will have time to test this on thursday...

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
