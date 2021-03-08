Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE243C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:26:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29221651EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29221651EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZtdhKqo2pEIrd6mDpjCMFdthIwv8aVaGgaeu3EbI5I=; b=dnnu8eKBRhOvjSIMXctUaVvH2
	WxKL6+YTUeqv5gTQ9mkMs/LVfIRz5WjOEjndQlakTMwAT7mtpadWv0n0XlW7vKlpZdAF/P0DBDsQl
	T3UGNSOC+wCRN7cwgKLKPA/owk3Dv4mD56EZAa8M9FfLeS/Zwa7qs0UJc7qBhxhaYXD8v5jwXXQf8
	Nd3a+IZvznWz9ISk1r+KoUt68iKCxEB3u+emjkFtDIUqCEnOrpj2u/yBrXz96HSc4MVx8jeYvrI/Y
	+rbOZHeRQ/EQ0wCdu2QXu/TdV/TTJqe5ud2tM+eNk317qSKdg6oS+wfF9hIjWtuY0YabQULwI65yu
	rGxJk8blA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9LM-00FTwi-St; Mon, 08 Mar 2021 06:26:17 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9LI-00FTvf-2j
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:26:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1286Q9SR106009;
 Mon, 8 Mar 2021 00:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615184769;
 bh=lZ7Y2XiNHDB3FL0GES4LA9h6PYit7d/C34EZjsEKeu4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=c3zkEl97P40E8Kb4CUCGDtAk1PfhP4aFIG1jheEPSV5E9DBqTOvbs24eKugyxHAFt
 MGp68oiVWsto/BjO+B+McT0SMz+tOE6fEbsKemUNRpY6zvAgC/5NZ/Z1E07lzqM1+k
 Psb59hyMU1kAvxryMcC53Vw/wsA7CcZHSzyVUlVg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1286Q8uc031423
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 00:26:09 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 00:26:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 00:26:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1286Q71D024277;
 Mon, 8 Mar 2021 00:26:08 -0600
Date: Mon, 8 Mar 2021 11:56:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <vigneshr@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] mtd: spi-nor: Get rid of duplicated argument in
 spi_nor_parse_sfdp()
Message-ID: <20210308062605.tz5d22dyxrrd4hwe@ti.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210306095002.22983-4-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062612_466653_493D95AB 
X-CRM114-Status: UNSURE (   8.08  )
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

On 06/03/21 11:50AM, Tudor Ambarus wrote:
> spi_nor_parse_sfdp(nor, nor->params);
> passes for the second argument a member within the first argument.
> Drop the second argument and obtain it directly from the first,
> and do it across all the children functions. This is a follow up for
> 'commit 69a8eed58cc0 ("mtd: spi-nor: Don't copy self-pointing struct around")'
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
