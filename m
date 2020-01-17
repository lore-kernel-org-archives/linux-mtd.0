Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330FCC33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087BA2072B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWbm03tV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="b/n+rnpA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087BA2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9Sja9IiBzv7ftcuCgNW8ZLj0W3F3k7gorgZiZaEezc=; b=PWbm03tVupiWgS
	/TjZX223Mr8Gqu9KA5dv/YHjcsaDox5d8Ua4y9L1BDt0czfVxzukXR4/MCExG8VXvu1DKKRE/O7G2
	wS7TVQ4NsM3/g4FVI3p492RJ4AM//JM95hbmIvN5DS+l41Vq9Z0G2W991gkm/LvQy8LSnuJrEw++m
	L2s1EZct6CFKS6q/3QpNhtAk6j5V5fqqG/2yDx9nZWrHK5UnkPJqtHvaAXUWrTrUJZU+QXkMkCIub
	sat9NJfufo4RtLtSoaM7c6oajv/mh39+1RhXMEZYMTLPOdQyPs7MKocCuFWcQd01C9jB88VIQMwno
	qZfTY4ghUVCupRaJzmVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isY2F-0006jI-Oj; Fri, 17 Jan 2020 20:16:03 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isY1z-0006ZE-Qe; Fri, 17 Jan 2020 20:15:52 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id 8A681AB7CF;
 Fri, 17 Jan 2020 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1579292096; bh=NyD2V5SZSfQVTYmJ6N+L70KBjajwnojRIy5BahhEoVQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To;
 b=b/n+rnpA3v2O8rwAeqUqPDB/3pEwDc8aT2Fzok20ORw+bUJDTkgOWQJHZ3Eb86Nia
 h98IRvImFLnZ3NQRetCb6D/15fc32Ni9LV793Q5O3DKiP92rHDevyMv5bwJLFN0Ta6
 ctOCLIZmzJBbNrwj5Z2qa7uSVgnhjj37BGjVLtTy5oUdnotiRsWizk+MAELt9JT9KH
 GFdOjdO64TpbS+k62YS0jqpEbH46IEswdqmK+kaLNugVhwRmefu4zDFGZCI48g0Lsf
 W4gUgVPD8KoWVI0J28kJEVZhPwjJMfaGqologNqBxhwXb0FMrHeMhgdOTg9/hJ2g9S
 as4l4hd/ssMvQ==
From: Esben Haabendal <esben@geanix.com>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 6/6] mtd: rawnand: gpmi: set the pinctrl state for
 suspend/reusme
References: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
 <1579038243-28550-7-git-send-email-han.xu@nxp.com>
Date: Fri, 17 Jan 2020 21:15:44 +0100
In-Reply-To: <1579038243-28550-7-git-send-email-han.xu@nxp.com> (Han Xu's
 message of "Wed, 15 Jan 2020 05:44:03 +0800")
Message-ID: <87wo9pvnyn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_121548_008315_90354A07 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: vigneshr@ti.com, richard@nod.at, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-imx@nxp.com, festevam@gmail.com,
 miquel.raynal@bootlin.com, dmaengine@vger.kernel.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Han Xu <han.xu@nxp.com> writes:

> set the correct pinctrl state in system pm suspend/resume ops
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 73644c96fa9b..de1e3dbb2eb1 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/dma/mxs-dma.h>
>  #include "gpmi-nand.h"
>  #include "gpmi-regs.h"
> @@ -2692,6 +2693,7 @@ static int gpmi_pm_suspend(struct device *dev)
>  {
>  	int ret;
>  
> +	pinctrl_pm_select_sleep_state(dev);
>  	ret = pm_runtime_force_suspend(dev);
>  
>  	return ret;
> @@ -2708,6 +2710,8 @@ static int gpmi_pm_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	pinctrl_pm_select_default_state(dev);
> +
>  	/* re-init the GPMI registers */
>  	ret = gpmi_init(this);
>  	if (ret) {

Acked-by: Esben Haabendal <esben@geanix.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
