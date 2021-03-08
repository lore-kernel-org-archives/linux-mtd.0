Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A54C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:09:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89922650E6
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89922650E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dbRiy9ME5L7Hhy4IBlAR57OTgF5wwOC+6E3nGjAalTc=; b=k8I1NeLevKNKeLgmz7dFmadSM
	MR7rd365ix9tgIJOrlr7wzljsSi0PNgVq4wDiHc4V43TT/kYUdohI/kZUanbER/xCrPViazdSpyGU
	E7arKdkHNSzKyW0X20NG/cP7NYiuUzspiHjc+wv/mr+GLWnZwWncq7dauBPlQdD65lZpeYw/H1TOL
	q6nATPMQHP/T0IMRpnUjJzWpukvpegOAwGAi4tG3CB8f6xxCfPPfgMHnxT4coRH5XtSjNwzSTa945
	v5xM56TBdUDYvUmrTXNf2qOE9UWInXjOMMXZRdpQosP1Tla6LUhZPUc+nYv5OzIGf4NBbeEIZyiOz
	AQvbp+IDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCoU-00GLtA-Cj; Mon, 08 Mar 2021 10:08:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCoS-00GLsc-KD
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 10:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=BWvL4Cr1ZKgQ/f6q2AUSU2PkTWuHi0CFrxYQThL4B4A=; b=KMusEZQLLHQ3jqUhq/sv1yXNZE
 ffMcyVkOHC1dDkLPqQAX4iLzUIwuWSD8bmHYSCM2Y+0q7X2JXJyjgknkqMd12/vrMU7OGC2JPRoME
 61s/geqqzcLKWga0HRK/K87pczaapFaeCvviluWIdd1EoO5iIzzhncmW2OOFmVuKkfO2VVCJEs7wm
 kQxSG5n6FZ87nb3pOmm9iAkllZ8rfIhL+0Jk59q1U4J4BU+sPeAsinKrlD1svHQ0SirsIbc6YhEUQ
 hR9uDbv1NFdBlS9Ig+hCNI9idYmbaDOdF0m1LXpI+WNax/wFTPSJQtMZhFwaTkPdmyKUIgobP8LOp
 +xMra67Q==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCo8-00FJvA-Vv
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 10:08:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 128A3UkX009810;
 Mon, 8 Mar 2021 04:03:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615197810;
 bh=BWvL4Cr1ZKgQ/f6q2AUSU2PkTWuHi0CFrxYQThL4B4A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uaHO7COVhsb9ICQ48tIBfw7xDW3+k+lMvZaS6O++l9Ort07xG0JluNI65/8DK87AJ
 hBp3vQ9YrVtVsAeYCrmlzRZfSctIVesFwk/zmWyZFKsynB3UP6nFM19InGLpnToiu0
 bkgby75EZUyT/Z/k9RZ4JM5/04ltFy8uFh5r+cps=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 128A3Uod097615
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 04:03:30 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 04:03:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 04:03:30 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 128A3RQq093760;
 Mon, 8 Mar 2021 04:03:28 -0600
Subject: Re: [PATCH] MAINTAINERS: Add Michael and Pratyush as designated
 reviewers for SPI NOR
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
References: <20210308092333.80521-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a4369f1c-fb59-ae96-42a9-9b6f1a02060a@ti.com>
Date: Mon, 8 Mar 2021 15:33:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308092333.80521-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_100816_138506_01B30FAF 
X-CRM114-Status: GOOD (  13.65  )
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



On 3/8/21 2:53 PM, Tudor Ambarus wrote:
> It's already been the case for some time that Michael and Pratyush
> are reviewing SPI NOR patches. Update MAINTAINERS to reflect reality.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

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
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
