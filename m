Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741FCC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:07:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0848965023
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0848965023
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w58hdSjBvTAPT/Ve8xIwbUn6eJ7BN5cytaUEsP9gL3U=; b=Ds/ilf/Pp0dEmPhimm8k4TWA1
	5SbZufIbmyXCUiIxo9I0fWNxTACo58TUdp+egQUj35p2TlRvzgQrqOFxLNKo3OvvY4LMF27oU+Ojs
	SLxrs1txJ6U1ln6vYMVy6E9kVzeijG7y+Nq4zFFU1nIHF4m8/j4QqJIW2JTZ5n72q+n4L2C5vvBax
	Z0Lj2zbxGi37CZ6VuOa19UPcX/v+q14BehHgeBDg9BlHjO8xUat3hmz+FC1lej7m64MvEk1/L5Dp+
	3PQY/OHFbcjVjP1uvnEuv1dv8UdsJcIrOaI8ur5xP+s8YBZuyNzGr6xhhD4ZelMzIrHdiR/50plZ+
	38/bFG4Sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7XL-000WBf-Ev; Tue, 16 Mar 2021 11:06:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7XG-000WAk-Q8
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 11:06:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GB6kJ1093387;
 Tue, 16 Mar 2021 06:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615892806;
 bh=h41udtu2aSd3w465ktDorM46ZUhdww0O4nRIWeF2b3I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tpwkdWhOdLD0wJPJDuHVmhLwuZdIbF7PeV+k0wR6qhy7uMbCDDNpxUtloiwm93BBL
 0lS62gV9nROaJltSmdULsNn4ywifN79xvySJEZn6/eWDfKwb7rS2aEQ9D1t70SoU3d
 0PuwjLu57EBjPSw4bE8rTAnSii8RFH4G7iFuwnWk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GB6krE002149
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Mar 2021 06:06:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 06:06:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 06:06:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GB6jDw069694;
 Tue, 16 Mar 2021 06:06:45 -0500
Date: Tue, 16 Mar 2021 16:36:44 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: sfdp: remember sfdp_size
Message-ID: <20210316110642.xvn4sohgkdq2ci7x@ti.com>
References: <20210312190548.6954-1-michael@walle.cc>
 <20210312190548.6954-2-michael@walle.cc>
 <20210316104223.42tdob3uwjxc5vdz@ti.com>
 <065642fa4d4282d3d16e1d4f4c176ce8@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <065642fa4d4282d3d16e1d4f4c176ce8@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_110651_154181_C19D1A84 
X-CRM114-Status: GOOD (  28.94  )
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

On 16/03/21 12:01PM, Michael Walle wrote:
> Hi Pratyush,
> 
> Am 2021-03-16 11:42, schrieb Pratyush Yadav:
> > On 12/03/21 08:05PM, Michael Walle wrote:
> > > Save the sftp_size in the spi_nor struct so we can use it to dump the
> > > SFDP table without parsing the headers again.
> > > 
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > >  drivers/mtd/spi-nor/sfdp.c  | 12 ++++++++++++
> > >  include/linux/mtd/spi-nor.h |  1 +
> > >  2 files changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > > index 25142ec4737b..b1814afefc33 100644
> > > --- a/drivers/mtd/spi-nor/sfdp.c
> > > +++ b/drivers/mtd/spi-nor/sfdp.c
> > > @@ -16,6 +16,7 @@
> > >  	(((p)->parameter_table_pointer[2] << 16) | \
> > >  	 ((p)->parameter_table_pointer[1] <<  8) | \
> > >  	 ((p)->parameter_table_pointer[0] <<  0))
> > > +#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
> > > 
> > >  #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
> > >  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
> > > @@ -1263,6 +1264,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
> > >  	struct sfdp_parameter_header *param_headers = NULL;
> > >  	struct sfdp_header header;
> > >  	struct device *dev = nor->dev;
> > > +	size_t param_max_offset;
> > >  	size_t psize;
> > >  	int i, err;
> > > 
> > > @@ -1285,6 +1287,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
> > >  	    bfpt_header->major != SFDP_JESD216_MAJOR)
> > >  		return -EINVAL;
> > > 
> > > +	nor->sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
> > > +			 SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
> > > +
> > >  	/*
> > >  	 * Allocate memory then read all parameter headers with a single
> > >  	 * Read SFDP command. These parameter headers will actually be
> > > parsed
> > > @@ -1311,6 +1316,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
> > >  		}
> > >  	}
> > > 
> > > +	for (i = 0; i < header.nph; i++) {
> > > +		param_header = &param_headers[i];
> > > +		param_max_offset = SFDP_PARAM_HEADER_PTP(param_header) +
> > > +				   SFDP_PARAM_HEADER_PARAM_LEN(param_header);
> > > +		nor->sfdp_size = max(nor->sfdp_size, param_max_offset);
> > > +	}
> > > +
> > 
> > I don't see any mention in the SFDP spec (JESD216D-01) that parameter
> > tables have to be contiguous.
> 
> ch. 6.1, fig.10 looks like all the headers come after the initial SFDP
> header. If that wasn't the case, how would you find the headers then?
> 
> Also ch. 6.3
> """All subsequent parameter headers need to be contiguous and may be
> specified..."""
> 
> > In fact, it says that "Parameter tables
> > may be located anywhere in the SFDP space. They do not need to
> > immediately follow the parameter headers".
> 
> The tables itself, yes, but not the headers for the tables.

Yes, I was talking about the tables and not the headers. There might be 
holes in the SFDP space but I don't think it would be a problem.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
