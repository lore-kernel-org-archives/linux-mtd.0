Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C533C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 12:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8FA23CD4
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 12:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qIfj+JRm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="TrW6A2+O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gI2joURC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8FA23CD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MVsYz0Er6m5wQMHMlcgzj8qGhb/6ZTamCx3K6255cO4=; b=qIfj+JRmn79p0rIiIq9wu/tpH
	sYE4HgUNe0xgzgNzIFgh+hDvRUV7Ac2MU8HKmdKynN93DENNRZA1zjlFrao8jDEma+0XUja9FivqP
	nG0MIslo/dIkpdMw0vaWaur2oFaxO7GHkY7ClwQtu0mLKIfofzggCbd1ihBX6s46Y/pWBW18Vc2lT
	fz6HVg5JVRq8tUAk+NMMr+jUPmDAe8sl4VTqhldk62885LRJzaX3dAJANkvZ2HJU5t+16p67YsGmJ
	5jPOrE7ewWLkYhJMIwrgeoXUrUfNTsNvWJTkrEmgWtvDbMpjerYCXh2fn0qvE0cajTjxFziinrbsP
	9tHa1ze3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptEq-0002mL-Tc; Mon, 29 Jun 2020 12:50:20 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptEm-0002k3-Jz
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 12:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593435018; x=1624971018;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GnVIoudxxpPUAy/Qggd3q7WYEmNb7juB0T+9hb4bZfg=;
 b=TrW6A2+OtrkVi0/t6kdzIo4rV4D3L08Z6lw1+iIEdNeZNvjf7zjoJ0bQ
 Xk9F6IyoBnrlDpZpCSOpaoKBNaJzzRWQfal6o8zZZ1za51yi1FRTo7MA/
 LlU5Iq4X9l0X6p2eazPTCHgiEL88YsmBKeiJ91Ux0VKtsFfb5V3hND/d5
 kxvwyYl5n6+nHyh2M4exGROB7SrLEVpLWzr5J5KyplIT/UGyd4KKwdZfh
 DIlQ5bB4BST+CLO4o0okIIOzrRmqUB1qOkVi35Phx+7g/cX1uyaWTPsjm
 wvberVFV+D0J7vACy6GPBAXoI7Sr98zpB2pBzoMATxE0YQXRxkQQfuXv7 Q==;
IronPort-SDR: 5/uzyBTK3q7CPhrquWh9tBV+vuFV6W1Ut+U1TlzHQtmaSFwc4VK8xIdlPmrtfwHtF/RCuhJ8Fk
 xjmLSzzbbvnXG46Jb2o9FRKQ6Em8worEhSdEl7j+01YvjSDUbClQ+IIR6Z0cDFbUMBQw8LISFQ
 eQhbpLUypdBuBnrPot8O8reqSV+UdKmSnBR0m0k2wOM7jV5HYb6svzTBkCx3Wr9GnqMXsgS44X
 FMozOce1Kij282XIOVk2Zz69/oP3EC2rGfd6EogOb9m0h4O3L8zjp4p6lCga8rLe5QbedagHea
 fHI=
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="81218094"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Jun 2020 05:50:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 29 Jun 2020 05:50:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 29 Jun 2020 05:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knaCBreFspZkMWfcSsdhM0+zUFPa+64jFROECdRuDQy7Wrm94HMqTEl26Db3ot5v0clvyl6psgQHEVowZF+eH8w0mLJWvltIQp9v5p3Qdy53kF2zhbYwEwjFbKrbJc57MlWL3T0f37G9dPBgdN1YiDMGlGxGt1KnUCYp4bjQgGZyYytToi4pLNCGT30KfeIgh4211/tUqDjW1kkGFtYz9+1KofpVG8RpBR7ZV5+wElNBrkXANIrMFQibjkbekRtcQuoJTiQ8lWb6qBcQvmmpgqDNwULTbAnnjKkOtuu4tCC0OHENZn83x/nkNrs9jHMZEhxrO1TaFEYdDnL57ghPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnVIoudxxpPUAy/Qggd3q7WYEmNb7juB0T+9hb4bZfg=;
 b=XlcnbQEhs/iqIvg6d4lmvtgkAPjp0GV+uIAppLKrWr+o2AkVFCUoLRrJALo8p/rMZTQPI0JUagc6qXOOgfxzspMYMIx3ImRI9fBIA+/dv+JkUDmijBAOGRHbBJrw7tU9NNTUO5hPYhcAXjsY43S7jHz15fBlo5tb0gfW1cyBnYl+KavwVz6QkgzaZWIFTy21XcgEjuKD8U4eVFHPEFaMkGsIiv/T/umHwC9zhzuVDlFMC1blrjfrPM/Lcffnx7ahGS4lNSlUsR1iSd4x8zk6KmwEaD+5lFONuAAe2wP+50x1Zu99Wt1WaXIOEH3EpANj5FnoB3mbdebRhXkHaVnNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnVIoudxxpPUAy/Qggd3q7WYEmNb7juB0T+9hb4bZfg=;
 b=gI2joURCAVI5ilk9BydaN/sUY1aJmcqJJTI0KoZfHUkkNTXJknAX7hJKTp11U8dS9gpxYTzsI+IuLkFSJfmY50P8kYRE9KvP//dd3w2r6gsmGbe0FLZ+CQDfHKwsQpelqW5GxlfNFu/y9UklfP3lU4i52zlB4M+6/x1rIkYpEYY=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3333.namprd11.prod.outlook.com (2603:10b6:a03:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Mon, 29 Jun
 2020 12:50:11 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 12:50:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <thesven73@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for Winbond w25q64jv spi
 flash
Thread-Topic: [PATCH v1] mtd: spi-nor: Add support for Winbond w25q64jv spi
 flash
Thread-Index: AQHWThPSolCxrzN8IU2HXo+YK1EHpg==
Date: Mon, 29 Jun 2020 12:50:11 +0000
Message-ID: <4b0f2a2d-66be-4cdd-8384-a80f6b729d74@microchip.com>
References: <20200613235331.24678-1-TheSven73@gmail.com>
In-Reply-To: <20200613235331.24678-1-TheSven73@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baf87540-f74c-467d-3f96-08d81c2af5f4
x-ms-traffictypediagnostic: BYAPR11MB3333:
x-microsoft-antispam-prvs: <BYAPR11MB33333FF21A72D7CAC083A177F06E0@BYAPR11MB3333.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S88ckQ9j26WOaT9YGOTg3C6jYH35+/Zl615LZZpKrWTQXcBby2P+8sYQPmAbnNIogLb7yBJCMOIzY1kspbrhDqIDORqH5lUC/F28obtbk8D6Ldq6KbxFsdXSgUm8omz+s3CrJU5myUav/LNGXVH26WpVaKt/lYVa/R5TC7e3D2BgP1WSKD7IzsupLXaL6i7jdcc5FLx0xblX7cN0FCl0JT8W8WqHbQA2a8tlfZl4NhROsgazKXMrSUxWtLYSWn2LP7q6QZNZkErOZOkuQ0YW5Mf4dsP4adM5c9/x2Da5sfGGXAWZaOxhcGgK7P9yAiRhSYQFBNm1DeOBZ3HbD/QjVJ45eKZ9gnJPuX7eW8NYaPU+s1gYwFvsVe3v/BSG6eyrqLLu7U7wbZ8+wg2a8X+02r67sKc0CLs9j/ZHcbUT8dpWu54+zXPYw6qYYK0tpK1xvwgbtuOOFFsSjP28SZiFxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(5660300002)(8936002)(26005)(53546011)(91956017)(6506007)(31696002)(2906002)(76116006)(4326008)(6486002)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(71200400001)(31686004)(83380400001)(2616005)(966005)(6512007)(86362001)(8676002)(316002)(110136005)(478600001)(36756003)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4ohRnFnYRNbffe5NN2DQxWJecNtJ1tfqG3b6f+6QRlcv+1+a+PDBdQCZgjbzKe5+zfh7Gf7VrGlD41xgj/ZQhGGKVPXzMF9q+5QUwzYEAVXsRve1285g8jn4/UeXml0HJM7b3eUOiY+51MpW3GtMDGtUeYKuqrdALukznTEMEYSypyjzd/M79/+qsWeHD3NXvjM3o5hgkroDqk4vXe18a2eyr7jsJPN4CpXRwVirjGHfwfrcMFnn20Xp6mIdmblweGqSg9CVDoKBLHH2wvnlZHfesrZyS47W++ZNL6n6NlWUUHMJDfzm48WzJNGqidzx1p7TanCAoJhijUgAbdmkyPQRbXb7G929A0q5GWO0cMG+QFAbYpVz3Ahw5td7QKKqFpePhhSef/mku0t0kBw3+57AvuvZTWBgel3vRzf2tezVBoMwPU8jZ+SHuQ1dQngbLTHY+ILIdwjBPLpU93890z0srM5nk9IsrGZ0SmdHXX4=
x-ms-exchange-transport-forked: True
Content-ID: <1766E21CF4042D488B1214C520A4B3B4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf87540-f74c-467d-3f96-08d81c2af5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 12:50:11.0915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHCMXnVUfwWpkYM1+LtKZpmkDzqUOu40hurXgJFHN2a5H3U0GqEQj4ynirU11d5QhowzEldydu0n0/tPqkE1dQHRvVH9pz3WzfZjv+lGoGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3333
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sven,

On 6/14/20 2:53 AM, Sven Van Asbroeck wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This chip is (nearly) identical to the Winbond w25q64 which is
> already supported by Linux. Compared to the w25q64, the 'jv'
> does not support Quad SPI mode, and has a different JEDEC ID.

I'm reading the following datasheet:
https://www.winbond.com/resource-files/w25q64jv%20revj%2003272018%20plus.pdf

w25q64jvm (0xef7017) comes with QE bit set to a 0 state, but can be
set to 1, so Quad mode can be supported. Would you please set SPI_NOR_DUAL_READ
and SPI_NOR_QUAD_READ flags and test and see if Quad works? If all good,
please specify in the commit message with which controller you did the tests.

> 
> To: Tudor Ambarus <tudor.ambarus@microchip.com>
> To: Miquel Raynal <miquel.raynal@bootlin.com>
> To: Richard Weinberger <richard@nod.at>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Are these tags really necessary? Would you drop them?

> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
> 
> Tree: next-20200613
> 
>  drivers/mtd/spi-nor/winbond.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 5062af10f138..18bdff02f57f 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -65,6 +65,7 @@ static const struct flash_info winbond_parts[] = {
>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>         { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "w25q64jv", INFO(0xef7017, 0, 64 * 1024, 128, SECT_4K) },

I would name it "w25q64jvm". Check "11.ORDERING INFORMATION". Although the
datasheet refers to these flashes as "W25Q64JV-IQ/JQ" and "W25Q64JV-IM/JM",
I find that the temperature range is not a differentiator in the flash ID,
so I would drop it.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
