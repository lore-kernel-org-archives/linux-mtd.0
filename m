Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D4CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:22:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7804651B7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7804651B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xa5QNcI/G/6BNjGQJHKe3g949K3DymT4hC3L3+dx4kg=; b=p+crm4P/mvv9S6TbD3Ff9pnBp
	e6ElX610VYWbOhuGtONS4rHfwmoJ7ykADPtlzACOrE3F1kF+OglWbJdFUKWMcQ+gIebJV/SU/J0P8
	xceaFkV6D2M0ttJeYHINAQXdQgpBQPtgyIuaZx6LllTdp3MT7hZKdrh3RZqqlLEh2D2UrVDq/RCrj
	I98cjdjhYLqtjoMoumJ5a54n6Fz5M8UCdVLA3P0tNYUt3qGqr+G1GefNYh5SxTTL2TN2lMGbM2/2K
	9OtR7yBkee+3xehzyvdRLMn/qaq2MRiSL0tVUti05CpQv4ZFPpcl0hJC5zPry4LcI4z/wBJWg97c5
	SD8o5GsZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9H6-00FSrH-Gf; Mon, 08 Mar 2021 06:21:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Gy-00FSos-1w
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:21:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1286LcVH104367;
 Mon, 8 Mar 2021 00:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615184498;
 bh=3YivBEiBFMsnIaxDC1OW9wmRCl7kuhqwo1WQbmBUmvk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=X/s7HgJCIqGKxhB4SsWqVznksB1BZ5ePK2rilZU/35ipm1xeUZwzWqBzxvizG4Ws3
 OIWqhZSZi4yE2GNtnu8Q9dqjsx8Xo6SwyiygomDovOGcQ0vU6keBi1GMe0xEZ06rCN
 nwm4J1VK20A85lN7/Y6t+pDmgTLhceseFBHGCeOU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1286LcM5056966
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 00:21:38 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 00:21:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 00:21:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1286Lbdp070808;
 Mon, 8 Mar 2021 00:21:38 -0600
Date: Mon, 8 Mar 2021 11:51:37 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <vigneshr@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] mtd: spi-nor: core: Add vdbg msg for
 spi_nor_erase_multi_sectors()
Message-ID: <20210308062135.g3y5hv6fcnruw7li@ti.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210306095002.22983-3-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062144_521992_936F45AE 
X-CRM114-Status: GOOD (  14.57  )
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

On 06/03/21 11:49AM, Tudor Ambarus wrote:
> Useful when debugging non-uniform erase.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v2: 
> - s/dev_dbg/dev_vdb
> - move vdbg message the first thing in the while
> 
>  drivers/mtd/spi-nor/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bcaa161bc7db..498da1ec3a89 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1610,6 +1610,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>  	list_for_each_entry_safe(cmd, next, &erase_list, list) {
>  		nor->erase_opcode = cmd->opcode;
>  		while (cmd->count) {
> +			dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %d\n",

erase_cmd->count is an unsigned value (u32) so it should be %u instead 
of %d.

Other than this,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> +				 cmd->size, cmd->opcode, cmd->count);
> +
>  			ret = spi_nor_write_enable(nor);
>  			if (ret)
>  				goto destroy_erase_cmd_list;
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
