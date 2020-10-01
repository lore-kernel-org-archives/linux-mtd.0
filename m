Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655F6C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA3C20739
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1cvT0F7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="D0+aHZdk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LvOGKbQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA3C20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GPggFQWYTAb3yyvFEL7oXaEbYVY2mKYmFYhm6vizyfE=; b=Y1cvT0F7noLRLBSi0bM6XYPwx
	lE51Owc2s6CeUs1sc5X6Ha5BlrSw1DZKaKgWTBRbS5rll2DQWQQw7dREuglpMiIrt7BuFhJThnWcV
	zOO0KGNGl8VsqI2OMskruZBQy2sUsLlodxk3rEUKkVeXVP1Qqoxjy29zC+YKNefCJ+ND4ZGMv7Wfo
	QWP+ZITw2tP+bb8JEjFipty6XcznNmgpEQ/Dl+vmHtLHDGj3Qg2pVkGaVCgf2+Lyu3dEVolVbL4SR
	QxX2ITB7wkWGk1M0jJw2ihtVMqq+4iyW/8RmZS6Tqcqh/ysiXAa+R2KFeWaSZwuLFbxIv00uzlVER
	PGzHvjDQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtvB-0002JO-9z; Thu, 01 Oct 2020 08:26:37 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtv8-0002IT-Bj
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601540794; x=1633076794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dKhm5Jq3RjfBobsY9x8yph06SCWNGKiKuD9sEJFSc/U=;
 b=D0+aHZdk3Hgtk/VrBvw73dQWI2190IRzcygw4iZQjJ+GL89dfMaz/tcB
 zB2jgo8FPz81ke0Npu28xogSWMpi/b64KkPbKSrJKAvUiJpgeVwL5Pe8T
 TY507F8kxVfqHHb6jQ7gPR1GRcV1k7rIbmsLBAQ0ArZtKtN1Pzkm6clYQ
 ePA2fRMHd/N2tBZ5HZu4qvWcACshnpvPsaSAjVfLJhpOyJm6JN4oZGfyA
 yrF/rqVBaVOgFMDEUdto63YOagorm/XZ4c7W5HECo/oKCJlyfSSV/eMgD
 b4IDPINWE+JuiFTMRaJ45xUS5bF9xjO7SD2rqqNQgVop6HJhTnBSzUhPb A==;
IronPort-SDR: sxQxMN/EgScWb5fTl8NAZQqjvOUFzos+DGRcUErUnzkVUbFhLFY7ck0N6mBjC38RA9toOk1llH
 ttGTG5OBMfIXvwc623Bl52t8qd955wNQ9kiu+iWfeKxDJEMi/ZOAq4gc7N7E0YhHmB6baM8s0L
 gVxI0Dz/RpnZCEmYM9MeYHxJ7u1YzestUh24/NqIs1HexAgViI2ur0ZSyor78Kt6irt2Ii5GDt
 QgyNkQk9ca/fD1ybxnpKdm5etXQ6UXUifkhR5Q6IGfffKx4qEYn4+7pq0BFtAjL3ZRbRiglzjN
 TPk=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="97881143"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:26:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:26:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/WnlIF/+af10rZISmfti5aswktv1MJjXliD7dKcKVfd1wews541SkX1hQa/UQhaxdZpleeLr+a18ieY2m+GQbafm4QscSZp6g3Ts4PeulgOXI5bhmZQBEvF9oPmC/USn93oTg/2MFgeXJNFzGBauvntnxM15yBGPkVEscHGsyq5NEeP/eLddbl7UN0okPZQjRiSaa9ZuAHuudB4x+RBgYWwoIc5JPeV5UWMcE1ADO2l9f9wXFWcK2U9zynAqB4+vKmVYkaP+uikwFJGzWGXZLXlTlPt0STXRF8BkWpzXWmmbJPBREbLIDzYwIzkU3jobdWVvKjOsdUbrT1y6DTFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKhm5Jq3RjfBobsY9x8yph06SCWNGKiKuD9sEJFSc/U=;
 b=f1Wx3Rt2LJ5+MF3TICTnZ5vSVCNQx1bW/zwv4000pRpN9YF5+rIm6BgzW0/Sx6eLj4ycDMfy1OmXz8gkKYVvlP1jkEj7d3E76bG7xMM5FnEuxjSoTQ1wCjUcju5bwmZS6A/GDJV5fKOP+P66iDBZ1fSuNsYYnAWR6DN+GFATCem0VNSse6n3vQrl2x5ul/hnm9JBXTZFBVLL9fUEjVNpnR6F2F0Ff4FNO2wqFHsnQ7NBbqjkPdpbNNFEvu8ghSJjY2Wbb/rjCWlbwUXcUfWpEjs9JyOrIQ2SomtdmDbr1lCV8w6V+GZbqHQ3meBj/ozC3zZP8ssUaPHlwuro3l5+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKhm5Jq3RjfBobsY9x8yph06SCWNGKiKuD9sEJFSc/U=;
 b=LvOGKbQOkCF8+KAYzZ4tL+15OqWuc8CAn8T0iFg71JAHmH+jnzI+5XYsJqzT+EmrelMlmnFPGCJJXraPjc6zGWV+MYWOKrVnxSx8jwlQakqVzWBUGm1s49God54CqIZT6jvr/BuHwjuI0UetKVAAA6aJW2TLfSR62TBUvRZcRy0=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1947.namprd11.prod.outlook.com (2603:10b6:3:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 08:26:30 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:26:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 13/15] mtd: spi-nor: core: disable Octal DTR mode on
 suspend.
Thread-Topic: [PATCH v14 13/15] mtd: spi-nor: core: disable Octal DTR mode on
 suspend.
Thread-Index: AQHWl8yPvqdpa5efVkG93RkAcVFpGw==
Date: Thu, 1 Oct 2020 08:26:30 +0000
Message-ID: <cd70d1bb-b2c6-0645-7534-b54ddade9117@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-14-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-14-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 792f83dd-4ba0-49ff-a493-08d865e3b2d6
x-ms-traffictypediagnostic: DM5PR11MB1947:
x-microsoft-antispam-prvs: <DM5PR11MB194719E60A1F6934D5441462F0300@DM5PR11MB1947.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HL7lpUM5vRogI8koHFX9MVbZ6lEztRw7gOKm8wEKDZ/g9QQpYWyhoSrTp+tZqddfTrvyjS2BmcvncPXw6RH92sI6sWfcBYMuKjEGA3jZML7AEw5Jwi4j1Dad2J1O2GHrRT63kaasE1O5qtafL0EzYNZI3zJ89NC1foOxeHJt7dCXElLwQ4P5+aecf8B1supSyuJ4HSGCyIBqmci/J5iUZzznwXyjhriGLwLKVqZT4Pf1qqbftHPHnvpWWXNLaxgFpdTyCbhX5MZqFr/alQXlGk0KNzWI69KXhrjPAXzkzGK9LVU+6S5AhoXwzBmX5qFTBZfpZp7xW4ZJGkVZRq3+cacq0lSDZi+cnlXA03bfCFLWqtU+i4Y5FGwMll9mf/BF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(66946007)(478600001)(64756008)(66556008)(316002)(66476007)(71200400001)(91956017)(186003)(110136005)(2906002)(76116006)(86362001)(66446008)(36756003)(26005)(2616005)(6506007)(15650500001)(5660300002)(53546011)(31696002)(8936002)(31686004)(83380400001)(6512007)(6486002)(8676002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8H6OsnVMuTNqu1H7EiauuZNR8rUPalaRWl28lUWLmezy3zKKnZYehcuYwxI3gmLyaP8Z2TdnKb4nhlwwdfWfRZ0qYztOqa1fa0g9Q8hH9o+ScK/mFgS+xXxWxphg4ItQKhTvwmelu0s1sDjELKH5lAPy86rIDk74dCFASrcCPzHGGBxvg2SPzPGB0/LLq/l0JyH82SrgVRkrTR5Xi6agGseETDxMSWXF81WoMrldrfQnueJD1038MLHJjv/xJEtNgnV2C6qufqQICFPHicHWkXBeAExGv7mLcsq0ouuxpa+aAUMmBkqPnARzvHsjAQHn0vUjrz4Y88QYg62EerKVu74wVXtHN4A8eljxN5QKzv6MJBjUvdFSP2PlLp0hBC7fJmnsKg8y341h37tSP+t4XPIfH+nT+6sPi6uH6c/DO1L9TxEt6uBmkB4vhkEhOC+Dy41iGmVUg0Yj0i1nVQpPlsWQpEP7qgR5XZUm5wihyIRk27ZO3Mf2FQP92jn1KT1wHF358iLOEUjukKbuczwAxj8mYE8CVF6I6NzemDeQj/CNgJtT4y9OYmG7GWvOtWjU+Z2yQHcJag8EkjBWyWk26cNPJapfU4gY8RrLsF3gDFK2V9PCb8srvU5Wu1fMWgUMCGcOm+U5g1uF/vMVJY7Eog==
x-ms-exchange-transport-forked: True
Content-ID: <9FDB0FA3BB6D7E469E7AD6E858AE1B1E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792f83dd-4ba0-49ff-a493-08d865e3b2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:26:30.3708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNGW1yGLSNjF7XfSPYhQADsue3OQnwEd5Fuy8/dt4uY7FnDYOmXbVR/slC4atrTHyiHvwEmDFGSl6wUI/FBviFX6o2n8if6u4PMDup+l8HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_042634_536074_CC1FE267 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On resume, the init procedure will be run that will re-enable it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9de811b33125..17b6f833e920 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3217,6 +3217,20 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>         usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
>  }
> 
> +/* mtd suspend handler */
> +static int spi_nor_suspend(struct mtd_info *mtd)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       int ret;
> +
> +       /* Disable octal DTR mode if we enabled it. */
> +       ret = spi_nor_octal_dtr_enable(nor, false);
> +       if (ret)
> +               dev_err(nor->dev, "suspend() failed\n");
> +
> +       return ret;
> +}
> +
>  /* mtd resume handler */
>  static void spi_nor_resume(struct mtd_info *mtd)
>  {
> @@ -3420,6 +3434,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         mtd->size = nor->params->size;
>         mtd->_erase = spi_nor_erase;
>         mtd->_read = spi_nor_read;
> +       mtd->_suspend = spi_nor_suspend;
>         mtd->_resume = spi_nor_resume;
> 
>         if (nor->params->locking_ops) {
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
