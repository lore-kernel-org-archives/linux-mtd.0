Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70807C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:29:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66C5651B9
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66C5651B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2AMuOcaBKBbELigBjtXPCsOAOyg8LFlaga9QF4lF7ZA=; b=oVK5rjuimrnZ1CGKx+a5zhVhw
	3CLnQ4KhgD+vp9Hexh0gAvEliTipVOlT2d9NK1ap7sgW0klyEWen8+ZPQQfigdBA3Az6534PcDdAh
	KQY0WM5qmt+pLK9DHOZfpeRC7pIz6kIROuK83IVRPnTJ1KFThW5bVV2xcoXp0HaFcw5yYViCsYzIG
	IY+Cc5q7sRHgYOd7+y0mN5lNILdpGWTDTGxuGhHOSxE87FQrRWhgsDxBspllEZ53Ob8pRNOj9nmYZ
	b/aHL1RaYbbiiPaJRi+54jsdQ6B+b0vo0VyHHgZNRX6LPOQNCx0McAfA4NeRZXXlLJmtflz0hFGqa
	Om8815hZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCBi-00GBj3-J5; Mon, 08 Mar 2021 09:28:30 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCBd-00GBhR-9O
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:28:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1289SLvZ050081;
 Mon, 8 Mar 2021 03:28:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615195701;
 bh=0BgwOyXj46vN2xSUIzDn7AJEwtHYfiYNyoZA6nVxYlE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=XpyqItcZFs2eJ5uqzFPTOeal1CiLe2yY+dPZGdpkQKYExgMRYwhzuyVIT+SV82bt6
 Lq06JDWX0YrBdEfhzlA1bCpQVTGvDhJzYikmUYf58R4EtALH6U4fQ9RxnuHNsfHZLK
 XLNQYqosyqpSungJdn9ldXW1l2xwbv9EYc3qNuso=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1289SLwx077045
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 03:28:21 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 03:28:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 03:28:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1289SKh8028622;
 Mon, 8 Mar 2021 03:28:20 -0600
Date: Mon, 8 Mar 2021 14:58:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add Michael and Pratyush as designated
 reviewers for SPI NOR
Message-ID: <20210308092817.k2gtrz5xwxofynbk@ti.com>
References: <20210308092333.80521-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308092333.80521-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_092826_152282_87E6ED7C 
X-CRM114-Status: GOOD (  13.07  )
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

On 08/03/21 11:23AM, Tudor Ambarus wrote:
> It's already been the case for some time that Michael and Pratyush
> are reviewing SPI NOR patches. Update MAINTAINERS to reflect reality.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> ---
> Michael, Pratyush, please send your Acked-by tags if you agree.
> 
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..ba561e5bc6f0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16862,6 +16862,8 @@ F:	arch/arm/mach-spear/
>  
>  SPI NOR SUBSYSTEM
>  M:	Tudor Ambarus <tudor.ambarus@microchip.com>
> +R:	Michael Walle <michael@walle.cc>
> +R:	Pratyush Yadav <p.yadav@ti.com>
>  L:	linux-mtd@lists.infradead.org
>  S:	Maintained
>  W:	http://www.linux-mtd.infradead.org/
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
