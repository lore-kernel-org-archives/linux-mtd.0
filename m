Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428FBC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 15:26:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD46264E20
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 15:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD46264E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4I65TpJIL63wU+GIM8XJVmMeuKIX19LADXeP6X43QTw=; b=drDDPpJmMQIf+fbL/nO6aqhBO
	Uqr0arwulxm1v0jfQ4uQroCYgJ12MZ+J0Xs4/kJOcunsQH5Phd8CLYy9QNO+yCFZ4eC5O1RsGGzP2
	noNqCXC5KhrS+D647+Iq3hxEm96gVlHDZyuNom8KKXVo6+2Pahq3JxzLH/EOuSAgu9Oe4PlKn5uRy
	zBBFBxDAnC9EUb3YUXf2efwHt6Wn0qhTfuZBMQFJslOgk7zJmbCB5KjOqeY5CHtsj/+koIgIdCKGb
	SebjCB/GCHor4zoYNAJlYSivpG6ykHxYzx2dSm+v7jhiERVX01QXOWT31P2fY1dPYJ3NIIOTtHjAX
	U5aURg36Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEZYr-0000u0-UG; Tue, 23 Feb 2021 15:25:17 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEZYo-0000tO-Rk
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 15:25:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11NFP8Qp114773;
 Tue, 23 Feb 2021 09:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614093908;
 bh=vJH/8KaeieGBdQA2joYS5Fbf1bvQAgysVSFnFpGe35k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=NMn1cKpxh8UIir/6S8Zf1tBXMgsTJCFMRZ4oSsRPgZHtjU4TeW/5ioIz6jXRGxi1A
 UPaqxC3qEQbCNcxf+blvgtADBEhn+3ogQ9SDX8Br4ap8yG7/QOpYm+7INj9rPs7qgC
 ZnhLLHCowmnmhpo6G384DeluDzY9GcXUYRlXF27E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11NFP89T083036
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Feb 2021 09:25:08 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Feb 2021 09:25:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Feb 2021 09:25:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11NFP7n0061432;
 Tue, 23 Feb 2021 09:25:08 -0600
Date: Tue, 23 Feb 2021 20:55:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210223152504.jtq4uxfepz7bdxhl@ti.com>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210205104736.2771074c@xps13>
 <20210205133404.esqqeokhlp4askpq@ti.com>
 <20210223141344.7ad25831@xps13>
 <20210223133649.GD5116@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223133649.GD5116@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_102515_857503_DED36373 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, zhengxunli <zhengxunli@mxic.com.tw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23/02/21 01:36PM, Mark Brown wrote:
> On Tue, Feb 23, 2021 at 02:13:44PM +0100, Miquel Raynal wrote:
> > Pratyush Yadav <p.yadav@ti.com> wrote on Fri, 5 Feb 2021 19:04:04 +0530:
> 
> > > [0] Since SPI NOR has no way of knowing what speed the controller is 
> > > running at, assume the fastest speed the flash can run at.
> 
> > Ok, I am not entirely clear about what is available/not available from
> > the SPI core.
> 
> > If this is true then I guess we can't do better with the current code
> > base and this can be improved in the future if needed. So I'm fine with
> > the current implementation.
> 
> For normal SPI operations you can set the speed (really, top speed) on a
> per transfer basis.

To select the optimal number of dummy cycles we need to know what speed 
the controller is running at, not the other way around. The flash would 
always set the top speed to its maximum (say 200 MHz). But if the 
controller is only capable of running at 50 MHz, you will end up wasting 
dummy cycles. I don't see any API to communicate speed from controller 
to flash.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
