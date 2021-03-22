Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14C5C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:43:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37ADD6199E
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37ADD6199E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bz3AqDRdpEDky05um6FBwYUqTP7Gs9lvt+0BhCUJ9F4=; b=JM9iwZ2Pyn/TBmd4YnlPQrA+a
	jKAW9IvxKzjBpS/XUa/l00M+6Y1HVyd5tz/6ruEIm++QmGGUWjiJnIpCbsGdGtB07elBcC3WQPiH9
	/D0wE4gnD6n5CDF8s+6l7u14jvBH1yziz4eUjIPfb8wxRSK9EZZsGf7ZBExNWuinsrltcclRzX8Mx
	o8qtF84SCXA3HqJsFlMHXb9E0g/ShchWCDWPY4poE1AolXDtDLeH5gSJRFQsLer5NxpWn3edrApbS
	a8cosk6U/ffT8KlN9GaYSKo7Df+EN9d0nz+178YKiGVnbh3Ydt1zJ6YN8n5BkFVVRHk5JJw1D2bJZ
	B0wijUWEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPVV-00CHmB-I7; Mon, 22 Mar 2021 18:42:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPVO-00CHka-6m
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:42:26 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12MIgHHK038156;
 Mon, 22 Mar 2021 13:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616438537;
 bh=KcTRNsBEF0sAAUUv5u7KkbkyDpmWregXhg4o/rObyd0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BsDmzNV6+8oYFlPk2L7jr//madH1MPzzbetZn9uocXZLwCFwq5bLnXvfL/ax2vf+p
 rK69wjBv/TAcDHdibbkieVRKEo50jWI0O0GuynODsLF07Jr78qqJOUwRkv/Mp65W4t
 oqLTzai03fvTFc4LpgNVEMRMYQ5UdHTX8n9MP87Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12MIgHGi088249
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Mar 2021 13:42:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 13:42:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 13:42:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12MIgGL0065661;
 Mon, 22 Mar 2021 13:42:17 -0500
Date: Tue, 23 Mar 2021 00:12:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Message-ID: <20210322184214.ernzjfwfle6dfhpv@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
 <20210322142141.pd7ondg6l76idz7d@ti.com>
 <0efba47de8737059b4f3c593c26297bf@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0efba47de8737059b4f3c593c26297bf@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_184222_755983_83E945A6 
X-CRM114-Status: GOOD (  41.53  )
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

On 22/03/21 04:32PM, Michael Walle wrote:
> Am 2021-03-22 15:21, schrieb Pratyush Yadav:
> > On 18/03/21 10:24AM, Michael Walle wrote:
[...]
> > > @@ -1311,6 +1317,49 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
> > >  		}
> > >  	}
> > > 
> > > +	/*
> > > +	 * Cache the complete SFDP data. It is not (easily) possible to
> > > fetch
> > > +	 * SFDP after probe time and we need it for the sysfs access.
> > > +	 */
> > > +	for (i = 0; i < header.nph; i++) {
> > > +		param_header = &param_headers[i];
> > > +		sfdp_size = max_t(size_t, sfdp_size,
> > > +				  SFDP_PARAM_HEADER_PTP(param_header) +
> > > +				  SFDP_PARAM_HEADER_PARAM_LEN(param_header));
> > 
> > *sigh* If BFPT header was not made a part of the main SFDP header, two
> > "sfdp_size = ..." would not be needed, and we could do it all in one
> > place.
> > 
> > You can do that refactor if you're feeling like it, but I won't insist
> > on it.
> 
> I think that could be refactored when we also use the SFDP cache for
> the remaining parsing.

Ok.

[...]
> > 
> > > +
> > > +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));
> > 
> > The SFDP spec says that Parameter Table Pointer should be DWORD aligned
> > and Parameter Table length is specified in number of DWORDs. So,
> > sfdp_size should always be a multiple of 4. Any SFDP table where this is
> > not true is an invalid one.
> > 
> > Also, the spec says "Device behavior when the Read SFDP command crosses
> > the SFDP structure boundary is not defined".
> > 
> > So I think this should be a check for alignment instead of a round-up.
> 
> Well, that woundn't help for debugging. I.e. you also want the SFDP data
> in cases like this. IMHO we should try hard enough to actually get a
> reasonable dump.
> 
> OTOH we also rely on the header and the pointers in the header. Any
> other ideas, but just to chicken out?

Honestly, I don't think reading past the SFDP boundary would be too bad. 
It probably will just be some garbage data. But if you want to avoid 
that, you can always round down instead of up. This way you will only 
miss the last DWORD at most. In either case, a warning should be printed 
so this problem can be brought to the user's attention.

> 
> > > +	sfdp->dwords = devm_kcalloc(dev, sfdp->num_dwords,
> > > +				    sizeof(*sfdp->dwords), GFP_KERNEL);
> > > +	if (!sfdp->dwords) {
> > > +		err = -ENOMEM;
> > 
> > Free sfdp here since it won't be used any longer.
> 
> I see, spi_nor_parse_sfdp() is optional and won't fail the probe.
> Nice catch.
> 
> > 
> > > +		goto exit;
> > > +	}
> > > +
> > > +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sfdp_size, sfdp->dwords);
> > > +	if (err < 0) {
> > > +		dev_dbg(dev, "failed to read SFDP data\n");
> > > +		goto exit;
> > 
> > Free sfdp and sfdp->dwords here since they won't be used any longer.
> > 
> > > +	}
> > > +
> > > +	nor->sfdp = sfdp;
> > > +
> > >  	/*
> > >  	 * Check other parameter headers to get the latest revision of
> > >  	 * the basic flash parameter table.
> > > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > > index a0d572855444..55c550208949 100644
> > > --- a/include/linux/mtd/spi-nor.h
> > > +++ b/include/linux/mtd/spi-nor.h
> > > @@ -351,6 +351,7 @@ enum spi_nor_cmd_ext {
> > >  struct flash_info;
> > >  struct spi_nor_manufacturer;
> > >  struct spi_nor_flash_parameter;
> > > +struct sfdp;
> > 
> > nor->sfdp is a pointer. This should not be needed.
> > 
> > > 
> > >  /**
> > >   * struct spi_nor - Structure for defining the SPI NOR layer
> > > @@ -375,6 +376,7 @@ struct spi_nor_flash_parameter;
> > >   * @read_proto:		the SPI protocol for read operations
> > >   * @write_proto:	the SPI protocol for write operations
> > >   * @reg_proto:		the SPI protocol for read_reg/write_reg/erase
> > > operations
> > > + * @sfdp:		the SFDP data of the flash
> > >   * @controller_ops:	SPI NOR controller driver specific operations.
> > >   * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
> > >   *                      The structure includes legacy flash
> > > parameters and
> > > @@ -404,6 +406,7 @@ struct spi_nor {
> > >  	bool			sst_write_second;
> > >  	u32			flags;
> > >  	enum spi_nor_cmd_ext	cmd_ext_type;
> > > +	struct sfdp		*sfdp;
> > > 
> > >  	const struct spi_nor_controller_ops *controller_ops;
> > > 
> > > --
> > > 2.20.1
> > > 
> 
> -- 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
