Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC13C433E6
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:05:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C571865023
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C571865023
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I9hha6Qyc7Su8fFWJ052MhlBfCsIqTirnaRBngg30YU=; b=FBrVwCdIfxqfLWjjwiZ0Iv+J+
	fduYSp4aLJCAy8EFrxqo+WuBoQbClEAw4S/J7ABYNUTHs7IIRRzgVTBtFoBPU0Lf3favlWa49WOvD
	rqxEfW61URA+WCQE+bIt+b8nn0WF3hk9KEZgCqj2exASlO2d/yzlof8+Em4Hxkzh+5UU1s30Cl8i8
	4lnKEYryhN/dqlg3eEI1ptHura7/LSMkl2XYnEI2rJ+8/p/DTJIK7SHdbxm9GiwXoFtiLOpLiqeMf
	wXOOG/1e4rMDWRrtzwZ/jMrzA7dYUM9jZQqhVT7akifmwBtN5TyMlkrGMAqAFfmHMA4AMhPH3mp4+
	bskLlz+iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7Ui-000VsW-NX; Tue, 16 Mar 2021 11:04:12 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7Ue-000Vry-Dp
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 11:04:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GB441Z037915;
 Tue, 16 Mar 2021 06:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615892644;
 bh=1SDfT390py2AYSqNPPkU+Q1iDS07rdITWfy251DIhuw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MRC8R6pYHvdMD7FZyorZDxVNbm5tVOR0H6t9mQmmCVyPSuk937gULy/Ri+fKHYrxz
 ZDApKE0Nj6lMsjN8TXisD5NWmx7sEd2L/j3THYkllq0r1kzUPyAZZCQX40rx+d6dT+
 qo/yaKhu22e223mkmBwG9U0Sov/Yl4jumkHXA2o0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GB44qm078938
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Mar 2021 06:04:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 06:04:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 06:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GB431C114680;
 Tue, 16 Mar 2021 06:04:03 -0500
Date: Tue, 16 Mar 2021 16:34:02 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH 2/3] mtd: spi-nor: sfdp: fix spi_nor_read_sfdp()
Message-ID: <20210316110400.kepjn6b654lhq4dy@ti.com>
References: <20210312190548.6954-1-michael@walle.cc>
 <20210312190548.6954-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312190548.6954-3-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_110408_995746_B22D107C 
X-CRM114-Status: GOOD (  19.98  )
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

On 12/03/21 08:05PM, Michael Walle wrote:
> If spi_nor_read_sfdp() is used after probe, we have to set read_proto
> and the read dirmap.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b1814afefc33..47634ec9b899 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -179,19 +179,27 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  			     size_t len, void *buf)
>  {
>  	u8 addr_width, read_opcode, read_dummy;
> +	struct spi_mem_dirmap_desc *rdesc;
> +	enum spi_nor_protocol read_proto;
>  	int ret;
>  
>  	read_opcode = nor->read_opcode;
> +	read_proto = nor->read_proto;
> +	rdesc = nor->dirmap.rdesc;
>  	addr_width = nor->addr_width;
>  	read_dummy = nor->read_dummy;
>  
>  	nor->read_opcode = SPINOR_OP_RDSFDP;
> +	nor->read_proto = SNOR_PROTO_1_1_1;
> +	nor->dirmap.rdesc = NULL;
>  	nor->addr_width = 3;
>  	nor->read_dummy = 8;

NACK. You can't assume the device is still in 1S-1S-1S mode after probe. 
For example, the s28hs512t flash is switched to 8D-8D-8D mode by the 
time the probe finishes so this would be an invalid command. Same for 
any flash that goes into a stateful mode.

And you can't even keep using nor->read_proto to read SFDP because the 
Read SFDP command might not be supported in all modes. xSPI spec 
(JESD251) says that the Read SFDP command is optional in 8D-8D-8D mode. 

I think the best approach for this would be to cache the entire SFDP 
table at parse time. This obviously comes with a memory overhead but I 
don't think it would be too big. For example, the sfdp table on 
s28hs512t is 491 bytes and it has 6 tables. Anyway, if the memory usage 
is too much of a problem we can put the feature behind a config.

>  
>  	ret = spi_nor_read_raw(nor, addr, len, buf);
>  
>  	nor->read_opcode = read_opcode;
> +	nor->read_proto = read_proto;
> +	nor->dirmap.rdesc = rdesc;
>  	nor->addr_width = addr_width;
>  	nor->read_dummy = read_dummy;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
