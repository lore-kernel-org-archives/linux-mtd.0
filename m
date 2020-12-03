Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36916C19437
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:47:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47FA21741
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47FA21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxpeXJrRlBXJozRSqQmi6/ZIjIDlkLHSG+pCYNMc03Q=; b=BRKKMMUVU+6v7cu1luC9dbE+J
	bPPbvfl53KEeaIE+2kB7FkxgEuenBdJgGtepFgbGR6wmsvcdtMYsy4tIQLGSiiUap4mIzXNoir+OM
	b2v08mIHH3Ci/b64EqL3N+JL9UhILfoGNoDTSbI1H+hM4PIjN3o3WvKkxKaJpGz78L4CRPIpTtJnQ
	haBqinbDdXypM6+1gfV3qvL3MYEph+thzEUrrgOCNYx1ROs66PpAnk2vNVF6Uf3LjCqG/tV2HgFrx
	3kIIp2lwUzFST5hmgq9HZunwjqATxdQDD9Hnl4dZnmzZ8y6kaFH1tDPpctZDm5ktJyGbgcm0XY5sI
	9q8ZC8cgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpie-0001J1-UA; Thu, 03 Dec 2020 14:36:28 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpia-0001BB-U2
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607006184; x=1638542184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EjjriIpz/9t1vKbSIhlb73dg0+Ywv/2T7HJ1tHKcJro=;
 b=Vna2zNCQSKi8Vw0wwR/gKAk3tVVqQrNIAGe3xLsr7NdY6Oft+O37ky11
 GB6uJdQIf6DUD+vDw5fBVbRpL8Bpix7qGRCJJW8MJompv4oB2aHy/Y0tl
 btUgVbCSgnqJYtGCUENiebP1od9Ok6Okz8KW3mQ2AppD5TJTUx8wyZPjI
 g24IMOtEsSYLqMGm6diKODgCIfMKn+J6gBCQRxjxH1DwGPryeMCoI7rID
 iI2QVDDWXMHvSSiQ+eYgawSCvG9gRWf9CwvXYuRDUoqjijaUSaOixesRq
 KxCej3UNKvn7ugmJnt9c/B0chVH7+O6fipVbs1dA/PVpsu+FFd2Ffp62l Q==;
IronPort-SDR: eqtjMG8c9vFtwnwqdYC/6Wc2vaPX4igwva7bXS3Ay0ndGkp9AvYqLfWGJIo9shquNVfOzc3fY8
 LTWUnIxUmp3YjNfOFSCjlJW69xRgls8nv53dcfE9ct/5OhmQaF4NkgEVlVKm8lI1Hu5qW7fADo
 d7mGXHpI6/3S0BMDDiuq2eu3Jy0coUZqnNYLZcUUx0FiC/ll9BilQA8z1kHtM3boF7yRO0D5Os
 xUW4XzFMxwyhOWRj1pu0fPLFW3G2lPp+xt9aic5aXDUraCUTsoLQ2LtAyVzmRklOfLS3yoP1I3
 G2M=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="106011962"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 07:36:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 07:36:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 07:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPO1VfiesUKOM1a6l3qiAGm3HdqgRo4I1blW0oLbDsI5dDR1q7MeuyVpzXo5ay5GsaopRETYIRMbOLdgxFQIOeauY08S/wsLEWHJ32RXFGVjSC2rb522nCtaMA/0zMgvhm3Lj++stuPVMCyUwQQGolUQQCFBKqulnTLtgPhxJk6mnnVZv8euptA7ZZ2cPJXeBICzfzCQ+eEMkoz03yAPmUBsivn7LmNhMis61HxDxO/GFT6k4sISlXKMntQU4n94G+ds1whM4MXSWanm9SOySMpyL6D28M0rNCvuw61TBglw2DZEi9hOLsX9wYTwd6Oe+h0t3MUkv2ZLYkL/XuwO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjjriIpz/9t1vKbSIhlb73dg0+Ywv/2T7HJ1tHKcJro=;
 b=jkldp1jsWXkWzax5Eo+cnJBezeOplKg5FHr/M+6p/N2OB9o4+YtvxL5zR0nxG/GH6A2ec3MKy2p6v5VlE4OqVgFFShbydF9Lw2eoQ8mu7UNpDgO7pz/qPfvBDhk2B9REdKHoSDsHn/z0HFt9K/q23uTJ5cNZaDf8fh19hMZQ+nyI9RzOZ8qxvizIm15y9PhVxEeO/0NKOA3rzo1S9x3vQKpSGa4M27gJqbA9/mqYW5/3NRgW4UklLRpJsx2axD9dWDqauD08rI1PsXPQlxv1hMXexafSLfXxnw+DyleodonOG++dhRXl6f7xR+5ngXceUZughsUsJH0gzDzG4SeOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjjriIpz/9t1vKbSIhlb73dg0+Ywv/2T7HJ1tHKcJro=;
 b=LFAmG3eZ4bDdJVdYBcWMOpYEue7n+54+i18TyGmpiwBPjE01i40WCegD9Dq7tO13VXqEnwmgtMuNDVRVUB4pO+bpxYyBtAKQShZQNTs689eASXK7NcREbQKRSJb9bYQjxkqnayOXzmiPW0csnTtoCqFBlvX6d/4B3pQsQfNGzZo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 14:36:19 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 14:36:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/7] mtd: spi-nor: ignore errors in spi_nor_unlock_all()
Thread-Topic: [PATCH v7 2/7] mtd: spi-nor: ignore errors in
 spi_nor_unlock_all()
Thread-Index: AQHWyYGpH7wscYLT9UyjYlIzinWO/A==
Date: Thu, 3 Dec 2020 14:36:19 +0000
Message-ID: <00e79a8f-17f5-d954-5d1a-20acf9dda4ff@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-3-michael@walle.cc>
In-Reply-To: <20201202230040.14009-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8a9de43-2814-41f7-673a-08d89798cc5e
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-microsoft-antispam-prvs: <SA0PR11MB4687E04514891AFDADDFD3BFF0F20@SA0PR11MB4687.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: La2Di8uY1P44R7PRvymQuvBzjpQKzNtv2nuAENm1BLSWa/sC9YX4jbcWpEBfnKDCgi3nLEkpThiukMovxlI3EsNlQKFupB+rHsKwXX8M+3ixAqlZszzHqa1Jz4InQOgNy0nkzpxA8lQP2hdJJ1xIh5iEvvfPJ1irt2eKoXZ8MmZhsoAuaIK1GiD3TzXyhI/3C7oEYmBNqmodaIHSexmKipQWGDikwTsqs8gOPP21bjzWylTHDGzHEe3xPrhiGX57fz8uT3rbiCiAZ0GVmVfmIP+G6MifNAuDaB6SVWbYK+Tq/Gr6rRcOHE/iCQ6jZoHLCYhMaYCAsiEDnax1+twRnTuekL/qAZWbJGRRNIZjCH+wfn8rieTOcczHLjDFep1CY2mm/gVuwoUNXKJeo3XKWSj/bzu2M1lsz7idhprqAzg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(36756003)(54906003)(86362001)(71200400001)(64756008)(8676002)(66946007)(316002)(66476007)(2906002)(4326008)(31696002)(110136005)(76116006)(66446008)(66556008)(2616005)(8936002)(31686004)(186003)(6512007)(26005)(83380400001)(53546011)(5660300002)(6506007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?STRjcWYyZy91enkvNXNTUGhPZWoyN2Z6cjJwUCtXVk5WZUUrM1BxM2IxNGNW?=
 =?utf-8?B?SnB6bE1reER6RjZ4WHBjNHBvRytaN2dtUlpUVzc0bFQ3VFUvQnpEOFJWR0Jp?=
 =?utf-8?B?b1l5NlFCQUp3c3hIM1VMM2QzRjFSLzcrRW5uRENRS0huQUZZbmgzRW15ZWZ4?=
 =?utf-8?B?MnpwZCtWcldhNHR6aHJmMGMzK3E3YTVUc3NoL2NBK3d0M2d2SUx0RzRaN1N2?=
 =?utf-8?B?RjhRcEZlUkI3U3NqUU1sYzBnVm9oQkF3TXo0RnhqU2tMVklIZWJnUEFLaUZ0?=
 =?utf-8?B?ZERGQ1JtRStmWVRGQkxiZnpKUjJvdEZHTkx2SlEvSVJmdmtkQmJUb3p0Y0Vx?=
 =?utf-8?B?L3luQWw5eVRtcXVJOFlKYUlzQXNqM0d5NWV6UzNYOWU3a3VCcExsQXRDY01E?=
 =?utf-8?B?U1lBVmIwbGYvdzhCMXNnT05BN3B0b0Z6TzRKNE1HZHoxL1NEOEEvQVN5RGJn?=
 =?utf-8?B?TG5ab1lsOTI0QXM3YW9KUXBJeWRvcXNOQzk3eWZ1ZS93akJMWTR4ZEJGeG1B?=
 =?utf-8?B?K0NTSXRxVnRIdlJ4cEh3K0hQRG04eEp4ckFoeTNTRzJxdUZQc3Mzb1hCanMy?=
 =?utf-8?B?VkV6NGMzWklWcmNFRm9kTVNYUUM4dGp5SlgyVVB6Zk9vV01NWk1ra1JwWHhK?=
 =?utf-8?B?M1ZhRmlrczVCT2dnQUF0L1NINzcwQXdPdTFVZGVsL281T2VQcEwvTWgxNisr?=
 =?utf-8?B?bFRzZ0pGa0hDOXo1c3dvaWViMEZPNDE1TGkrNWQ3WnJhejVIUUozcTRLSzdD?=
 =?utf-8?B?WC9MOUxMZjFIdmdMUGZmOENyWEkraEg3R2RNUFlQNDhwZVhPeURNV1BtSUhk?=
 =?utf-8?B?Slp5SnF3YjdDeHlqRjFxdFU2Mkg3YjJYdG0vSzNFY3Q3WTY5Mk5uaXQ0Qytx?=
 =?utf-8?B?QlZDWloxR0FnWmF5N1BDWDhkcWFGM04zTHJwemYyZjhTdVF2MXorV3dsN0Vp?=
 =?utf-8?B?YjhiZnJ4cmd4L2pSWUdjNDFVVmx3Tk1hNThBeUtLVWhSd3h4Z1JUUWlVVFJx?=
 =?utf-8?B?TVd2TEZOOFY3RnhCYXFqMUhzc2huZGY4S1JQMC8rUUtTanBvdksrZk1USndy?=
 =?utf-8?B?ZDVhYnBKNGxIbTYwOHJQR2h2TEhlQUtRcnVvMm5nNW10N3BFaFlkMXAzLysr?=
 =?utf-8?B?Ukw4MFRKR2hNWUt6bWxCODhWZVNDMFk2N2RxVTlHVXZENXBqTy84ZG1kVWpl?=
 =?utf-8?B?cVdqSXJBeEJHUFRBZ045VkF1aVkyY3Y0YkF1bG5NVHdBci9McVVNaEVUVnhu?=
 =?utf-8?B?c0QxUjV4UjROc2c5TDdrdXZaRUZHUDhoTkZuYUx5amJVZTY0NW9jTmg2eCtP?=
 =?utf-8?Q?fM9G1QyB+kWMk=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <FC612DA40BE3A546A46DD790B4EECCB9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a9de43-2814-41f7-673a-08d89798cc5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 14:36:19.1073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuViZ30k7g4PgKQvXMmIe0zVKzEBLgHtg7nA75J02SecGOE5rswiTU+NLyMy0l0CTQaj/bxpa1MTCtZJG3ymA2CtPEUJ5bI7obXlMcgA6RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_093625_251868_4D7EFA6B 
X-CRM114-Status: GOOD (  28.97  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/3/20 1:00 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Just try to unlock the whole SPI-NOR flash array. Don't abort the
> probing in case of an error. Justifications:
>  (1) For some boards, this just works because
>      spi_nor_write_16bit_sr_and_check() is broken and just checks the
>      second half of the 16bit. Once that will be fixed, SPI probe will
>      fail for boards which has hardware-write protected SPI-NOR flashes.
>  (2) Until now, hardware write-protection was the only viable solution
>      to use the block protection bits. This is because this very
>      function spi_nor_unlock_all() will be called unconditionally on
>      every linux boot. Therefore, this bits only makes sense in
>      combination with the hardware write-protection. If we would fail
>      the SPI probe on an error in spi_nor_unlock_all() we'd break
>      virtually all users of the block protection bits.
>  (3) We should try hard to keep the MTD working even if the flash might
>      not be writable/erasable.
> 
> Fixes: 3e0930f109e7 ("mtd: spi-nor: Rework the disabling of block write protection")
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> changes since v6:
>  - new patch
> 
>  drivers/mtd/spi-nor/core.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5bee7c8da4dc..013198abe929 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3121,20 +3121,27 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>  }
> 
>  /**
> - * spi_nor_unlock_all() - Unlocks the entire flash memory array.
> + * spi_nor_try_unlock_all() - Tries to unlock the entire flash memory array.
>   * @nor:       pointer to a 'struct spi_nor'.
>   *
>   * Some SPI NOR flashes are write protected by default after a power-on reset
>   * cycle, in order to avoid inadvertent writes during power-up. Backward
>   * compatibility imposes to unlock the entire flash memory array at power-up
>   * by default.
> + *
> + * Unprotecting the entire flash array will fail for boards which are hardware
> + * write-protected. Thus any errors are ignored.
>   */
> -static int spi_nor_unlock_all(struct spi_nor *nor)
> +static void spi_nor_try_unlock_all(struct spi_nor *nor)
>  {
> -       if (nor->flags & SNOR_F_HAS_LOCK)
> -               return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> +       int ret;
> 
> -       return 0;
> +       if (!(nor->flags & SNOR_F_HAS_LOCK))
> +               return;
> +
> +       ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> +       if (ret)
> +               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
>  }
> 
>  static int spi_nor_init(struct spi_nor *nor)
> @@ -3153,11 +3160,7 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       err = spi_nor_unlock_all(nor);
> -       if (err) {
> -               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
> -               return err;
> -       }
> +       spi_nor_try_unlock_all(nor);
> 
>         if (nor->addr_width == 4 &&
>             nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
