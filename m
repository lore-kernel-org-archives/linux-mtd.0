Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710D1C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 11:08:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1888864FDD
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1888864FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SaEwZLMDmoaK0QxsAMM1A8WGfeHtqRmsVWJVuhcFfvg=; b=QkwOjALD0rnbdjUqfWMNYTUnl
	3eUUraZ6cqo0CIpGu8i1sSCd9BlWFdC//9LsV0ikU5NRnbvjAyumiCT/WSusysHX4rozq4Nm8Pcxt
	aGNtZtYu+Nxm6J6zphAQgKtoWjYtGaQRyXtNKiUjFesPDmn01c+DrtizJVxRYZAT+Wh6y1vOUG8yQ
	Knhe1meIK6HXsIq/jx4N4/lZ11khevKk+2Nnn2xL/AIGBcgcT4PRWjwplrJ0BAEXcJUiE8kLMHDds
	Dt7Un0ZX4DFdmls3tJemSoCgXR8MzrnUahClseCj5ub2DtzUwBRCugIJoP07ANYQQ/gqjg1uaTjkw
	Z2VcRXhrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKfdY-00BFgf-Cw; Fri, 12 Mar 2021 11:07:20 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKfdU-00BFfv-Gh; Fri, 12 Mar 2021 11:07:18 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CB7BTr067919;
 Fri, 12 Mar 2021 05:07:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615547231;
 bh=ppnSwE3fKaBg0neIztuqXvH2QrPjE/AfI+3qNHSV6wo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=REHTjEo5aenRX8Q/huU1uf1giLvZ2+sOJw6Sjd86J71wAnWEOLQjIIQ1hugv6hUTH
 A6vfQFIbG/Qf0QDysyt9s9uFku4WCBXc5gghZ0NdFjmKyuMfKhAAK1LvRyFo63fV9H
 8CE3A9RPz45iOuBmEJ8o0lK6flj9ZwI/qilojN7E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CB7BKD116117
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Mar 2021 05:07:11 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 12
 Mar 2021 05:07:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 12 Mar 2021 05:07:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CB7Apw023321;
 Fri, 12 Mar 2021 05:07:10 -0600
Date: Fri, 12 Mar 2021 16:37:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <Tudor.Ambarus@microchip.com>, <nm@ti.com>, <kristo@kernel.org>,
 <robh+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Message-ID: <20210312110707.lrabch4ketqyyepn@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <9c551f56-4c00-b41a-f051-8b7e197fbcdc@microchip.com>
 <20210312101036.jfz2733ssv4nhfey@ti.com>
 <676386736df5e5b22e34b0b5af91c894@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <676386736df5e5b22e34b0b5af91c894@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_110716_869500_C2690499 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/03/21 11:20AM, Michael Walle wrote:
> Am 2021-03-12 11:10, schrieb Pratyush Yadav:
> > There is usually a delay from when the flash drives the data line (IOW,
> > puts a data bit on it) and when the signal reaches the controller. This
> > delay can vary by the flash, board, silicon characteristics,
> > temperature, etc.
> =

> Temperature might change over time, but the calibration is only done
> once. I don't know how much influence the temperature actually has, but
> our boards are usually operating from -40=B0C to +85=B0C. So there might =
be
> a possible temperature difference of 125K between actual calibration and
> when the flash is accessed.

The algorithm supports a temperature range of -45 C to +130 C. The =

temperature is checked at calibration time and adjustments are made to =

make sure the reads work over the entire temperature range [0].

[0] The current implementation does not have a way to query the =

temperature from the sensor (see cqspi_get_temp()), so it always assumes =

the temperature at calibration time is 45 C. But that can be added later =

once the temperature sensor driver is implemented.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
