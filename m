Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1AEC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5451C2071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="goT36JVQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WAgaX7zy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5451C2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J9BKtJqKpTbR4o7PDjjjT263uo2mTNrVqokGWKVwbKc=; b=goT36JVQd46zzS4BOfwyLjes9
	clyGxhj+wsVPT7qBk5hmIZDc5ZTqmr51Rh6GOM+lIxxzS0qdcSSpY7X3537d+rkY8iG4P97470ubt
	TWG747E70CzFDyJG6Jq+jA6TOcFfc54UE/Ji5BJ6yZavOFpFXZ7wG0FtsipgVKSNA0rbfrWWG9lLz
	drCowHqa59CQbndo60FWAUjUV30qypPE15Wv+znhZuChAKtr4n7n5mvw+3TUhnn/8Sa11Nm6pP8HB
	e3cyN5VJwPGvdE40tPwkEeBDSrUbxwaWpB0FU1+b+hdm9flUY+sfRnGsVi40k9kL21sijgugHEzCC
	B9Db1stgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWnP-0004Ic-0R; Wed, 30 Sep 2020 07:45:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWnL-0004Hc-Ft
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:45:02 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U7is5E129606;
 Wed, 30 Sep 2020 02:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601451894;
 bh=YQoym++Sx485ijHB6h7Qf7noUsG0wxw/BtlAQa7xaZI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=WAgaX7zyEUTrUm190dhZFg4fgSdm9GuQ96HDPiY56QqH+UyZc9PRfvGZ3L7UEHTsp
 EMy68wGwmlocNUZcCGAqsMAmuCBG9lEK5BnY/ezd86vDDkYjFoRf1Czi5RQNbm9SoV
 Ooj4pXbxjdvwEJWlC4zYpKkUaD2w6w3gMEjNo1I0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U7isfW092457
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 02:44:54 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 02:44:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 02:44:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U7irPY078049;
 Wed, 30 Sep 2020 02:44:54 -0500
Date: Wed, 30 Sep 2020 13:14:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 12/15] mtd: spi-nor: core: disable Octal DTR mode on
 suspend.
Message-ID: <20200930074451.exudmq4p7isdwhwd@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-13-p.yadav@ti.com>
 <83e9675b-e60b-6fe4-619d-9e81b26632ec@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83e9675b-e60b-6fe4-619d-9e81b26632ec@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_034459_609523_D21E662C 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 30/09/20 07:40AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On resume, the init procedure will be run that will re-enable it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> > ---
> >  drivers/mtd/spi-nor/core.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 853dfa02f0de..d5c92c9c7307 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3212,6 +3212,23 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
> >         usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> >  }
> > 
> > +/* mtd suspend handler */
> > +static int spi_nor_suspend(struct mtd_info *mtd)
> > +{
> > +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> > +       struct device *dev = nor->dev;
> > +       int ret;
> > +
> > +       /* Disable octal DTR mode if we enabled it. */
> > +       ret = spi_nor_octal_dtr_enable(nor, false);
> > +       if (ret) {
> > +               dev_err(dev, "suspend() failed\n");
> 
> we can get rid of dev local variable as it is used only once. you can use
> nor->dev directly

Ok.
 
> > +               return ret;
> > +       }
> 
> and maybe just return ret; directly. spi_nor_octal_dtr_enable() returns 0 on
> success.

Ok.
 
> Looks good.
>  

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
