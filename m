Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CD5C3ABBF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 May 2025 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTj587sTObOmg6H9gUoivYF62FE3oPw4qmcIjobBKSQ=; b=A41+KGNMb/3q2W
	HWu2ipqDNZiq6jzGUFRjs056Bc/uTqRPPTIwqHYt2GWcXnG8jhpZoRzNXvT3aSI1wKNwcwxuyHEOy
	ZnaMvPJWOaN+hByx9T8dd8qPiAslP/p5DQbvW0OEvymxR3NZiIiG5jbvuMINSZ9MTNTFR8a7KJPb6
	b7aXOG/DWaJV85wqbFUDc1VIssv1uha5+6MbKf0HZl4NZ9P7sxBwWlNi1/JsxOw1A1t/Rrdp7o/JL
	DoG9L0socPdWIbL7w8FuP7Mud4H96jNmhWwc/rvcvTUp5eK90+8XRp4h2dJCVbMcJcZ5rLaxM3N9U
	jsOmZ+fKuCOuv3WDR/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCba1-0000000F39v-2FUC;
	Wed, 07 May 2025 10:00:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbJJ-0000000F0H0-2TLB
	for linux-mtd@lists.infradead.org;
	Wed, 07 May 2025 09:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0927F629D4;
	Wed,  7 May 2025 09:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907A3C4CEE7;
	Wed,  7 May 2025 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746611008;
	bh=cKqQhS2D19JGhYS3+mIKpASOerLVt7H+njZLr92IpxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n6M49gvsoUJ7UWEi5D9zdmmXvaTPb6G63b/qCGLDz2fhh+WBuoWHZA89OoUByMK9t
	 nbMRV1AVtoCYzUX3RLVrozZ2WSGGdPjk8Bwohx82LzStIX6FWjej2HR/8ul2doND/D
	 7GWjpJ+vKJ/1cQq6H82y5NS6Zi2LH7w2pk4Bos5ipVcY8rRkNcCMBb6ijPfjTf1Mxu
	 sn+tX54AAmnwq+lf9Z9YZbx24ORUKgdAiyIS8FBsFeBhMjzVQvPSE6/WohgfAgnIcx
	 cYwVSRgex6Mqs86C96u8cIVWdplAvsf9TijdbQOT0AaPPq188q881f+r7cnVtPFqUl
	 SNZX9X/lBqT7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Luke Wang <ziniu.wang_1@nxp.com>,  "pratyush@kernel.org"
 <pratyush@kernel.org>,  "broonie@kernel.org" <broonie@kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "michael@walle.cc" <michael@walle.cc>,  "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>,  "p.yadav@ti.com" <p.yadav@ti.com>,
  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  Bough Chen <haibo.chen@nxp.com>,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <10b40148-b949-442d-9d43-0db09517269a@linaro.org>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
Date: Wed, 07 May 2025 09:43:25 +0000
Message-ID: <mafs0zffo3gea.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi Luke,

On Tue, Apr 29 2025, Tudor Ambarus wrote:

> On 4/29/25 10:03 AM, Luke Wang wrote:
>> Hi Pratyush,
>> 
>> I'm following up on this patch series [1] Avoid odd length/address read/
>> writes in 8D-8D-8D mode. While some of the series has been merged, the
>> patch 4-6 remains unmerged.
>> 
>> In fact, we also encountered similar read/write issue of odd address/
>> length with NXP FSPI controller (spi-nxp-fspi.c). Currently, we handled
>> the odd address/length in the controller driver, but I think this should
>> be a common issue in the octal dtr mode. Was there a technical reason
>> for not merging the core layer solution?
>
> I guess I stumbled on those small comments and did not consider the
> greater benefit of taking the patches. No one cared and we forgot about
> it. Please address the comments and resubmit.

Yes, it should have been a simple next revision from me but apparently
it fell through the cracks. I do strongly agree that this should be done
in SPI NOR, and not in controller drivers. So it would be great if you
can respin the remaining patches of the series.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
