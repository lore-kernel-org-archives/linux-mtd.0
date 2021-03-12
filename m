Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09ECC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 10:19:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D16064FF3
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 10:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D16064FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EEUiIpjFF2mN716l64EUHshrgrAr9Xs6Xj3XOjw2Xwk=; b=H3yUSjoP5ekZThgvA7C+/IaqZ
	DiklEI/1YGsACiwQJdIjpxrb9E7gOKWxgEbtcdCFoeJZaSxY85hspJwXXwr/7i9SX6qYpkb+hfaIU
	QfntpsFHmM5MPcqCZRJ/74KrledbhEslPV1HLIOv66YRiTaqbK5lnem8GD+fp8A4lprUsVUl5Mwno
	LjM8ioXYOKcjT5gvABGKVFapJdM7O4jCKy1ev/0PMjL+Zd88xVewLuy1aQb8vdby6nL81M/2DyIoz
	Pliud0mPRE+6wceQT5VL+od093pSnf3NzyjT3YnHMBAaJSHK7xeKn0nqFECZdNGPzyjjtjNDnf4AM
	2ytRgZqmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKerz-00B8wM-0h; Fri, 12 Mar 2021 10:18:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKert-00B8vJ-Ji; Fri, 12 Mar 2021 10:18:08 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CAI0DD050060;
 Fri, 12 Mar 2021 04:18:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615544281;
 bh=MfHMI0fXR00zadLL4T1wsZcvbhBWRv7oQ2OBFrlNjNw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MXOcBS2aVAK1p98zHHFlckstB1IISDTdfsSWGLIlwWt7drpjXT+cJjlh4Ll4GY+2F
 bPTBW7zyv8AU8t3T/EnJg3Zscvo7XtLoCV/FcarOSY2n20oqPVIaC5yn297i5XdgWR
 BAbnrt0N6STmXSIJQLETiNiYX0y6PDq9PIMXSD8g=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CAI0CB033573
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Mar 2021 04:18:00 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 12
 Mar 2021 04:18:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 12 Mar 2021 04:18:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CAHxaA123485;
 Fri, 12 Mar 2021 04:18:00 -0600
Date: Fri, 12 Mar 2021 15:47:59 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh+dt@kernel.org>, <michael@walle.cc>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
Message-ID: <20210312101757.sqeyledbwjnpqdoy@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
 <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_101805_965252_E44399E1 
X-CRM114-Status: GOOD (  14.60  )
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

On 12/03/21 09:13AM, Tudor.Ambarus@microchip.com wrote:
> On 3/11/21 9:12 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Check if a read is eligible for PHY and if it is, enable PHY and DQS.
> 
> DQS as in data strobe? Shouldn't the upper layer inform the QSPI controller
> whether DS is required or not?

Yes, DQS as in data strobe. I need to check this again, but IIRC the 
controller cannot run in PHY mode unless DS is used. Ideally the upper 
layer should indeed inform the controller whether DS is supported/in-use 
or not. That can be used to decide whether PHY mode (and consequently 
the DS line) is to be used or not.

Currently there are only two flashes that use 8D-8D-8D mode (S28HS512T 
and MT35XU512ABA), and both of them drive the DS line.

> 
> > 
> > Since PHY reads only work at an address that is 16-byte aligned and of
> > size that is a multiple of 16 bytes, read the starting and ending
> > unaligned portions without PHY, and only enable PHY for the middle part.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/spi/spi-cadence-quadspi.c | 203 ++++++++++++++++++++++++++----
> >  1 file changed, 182 insertions(+), 21 deletions(-)
> > 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
