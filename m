Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47AEC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 16:07:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86C3E60E0B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 16:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86C3E60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p0bRXzELCqPntQNUAj4gEEGjBJ6zgSeyz0jqanUQthE=; b=Tt5YW1ZJsQCvMcq/DRlRgGleU
	mqZ8+RWofVC1FJz7Kpz9pgg23khB8LtCnR3oxWFlwiEAe4lq2bu3+Yz4G/CSXkPLcsPKFt6M9IQHT
	RVrs2N1RAYJjFNfv5plMOi4wo97J8OR+WQXAQkAd4du4ksV/l3TvroFQslvR+93dvGTVt1U1FsTQ9
	Ol/BIB0waIJ7cxZgbMM7+HLvgsW4jibt9IUZcYL7lXhBVt1jGqMCECTbYmk/IjIaNqxxnoxzjmyoW
	+wJ3jz9xNpe5CeKZsJ+0rMiub+cSlPvrlz5DW9IoxX2Oir0IWRPySu6WxpXSqiJ/pMx24OBjx4dei
	BUn50lc+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liflT-00FVuR-7G; Mon, 17 May 2021 16:06:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liflQ-00FVuA-QP
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 16:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DmBKGotDmWCU/i+6kalj9zUloINRPVqINr28c/Ac90o=; b=0V0drYEBgkv2b+u5WfJyJaU58O
 cCAAvcV+mZsdvAsR94DO9nayYYSzUFMO/RtwlyOv71vkrSPgQ/QZucSqmk3d/ZeGb2WxZ8AYOdRaB
 9I0uOT6zlbgIGrLtJGAx32N29g8gOw9Dn2rbBXu9c8IjL1DYGxhWvepA3oM/AxM0PLGid91jPRiqN
 0cZ51tzA5uPgrDbewTrX5CvT8wpHMef8ZdP+D42ajGOuE3roWiFgVqUpjOWlGwQpsjlP31BnmeOms
 l2jP5djhCj+wzlnGDTUenbCY+uGHHpO6QBcI+53UOAI6Vr36PzPJiAA2dylhBP2U2xIiusmqBB2xC
 iOQpMyLA==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liflO-00Dxlp-7Y
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 16:06:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14HG6WVT073174;
 Mon, 17 May 2021 11:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621267592;
 bh=DmBKGotDmWCU/i+6kalj9zUloINRPVqINr28c/Ac90o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pGO7Ph6rJ/FuhPomk916FCgcwH+ASdmS863TMLtr+8ifLydzl0OTwpBNcrKncZdYY
 +p2UJFbzlrvNh8xcN69H0gYxqaqy7yZ1e2BJyU9yY4iIf0duBJJEQQ4GZQYZvglMKx
 D1NkCmN7L5Nh6lhE9KbfOHnWIfczOxHX+r73zd+Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14HG6Wmq031483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 May 2021 11:06:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 11:06:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 17 May 2021 11:06:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14HG6UOj000929;
 Mon, 17 May 2021 11:06:31 -0500
Date: Mon, 17 May 2021 21:36:30 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Zhengxun Li <zhengxunli@mxic.com.tw>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <broonie@kernel.org>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v5 2/2] spi: mxic: patch for octal DTR mode support
Message-ID: <20210517160628.s65h6prjt5mw6bud@ti.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-3-git-send-email-zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621232088-12567-3-git-send-email-zhengxunli@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_090638_379014_160F2993 
X-CRM114-Status: GOOD (  12.50  )
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

On 17/05/21 02:14PM, Zhengxun Li wrote:
> Driver patch for octal DTR mode support.
> 
> Owing to the spi_mem_default_supports_op() is not support dtr
> operation. Based on Pratyush patch "spi: spi-mem: add spi_mem_dtr

I don't like the "Based on Pratyush patch". Please mention the commit 
hash so it is much easier to find later. For example, saying based on 
commit 539cf68cd51b (spi: spi-mem: add spi_mem_dtr_supports_op(), 
2021-02-04) is much better.

But while we are on this topic, I don't think it is needed all that 
much. People use pre-existing APIs all the time. I don't see any need to 
specifically point it out.  So I think saying "Call 
spi_mem_dtr_supports_op() to ..." is better.

> _supports_op()" add spi_mem_dtr_supports_op() to support dtr and
> keep checking the buswidth and command bytes.
> 
> Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> ---

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
