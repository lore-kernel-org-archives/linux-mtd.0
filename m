Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09510C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FF120885
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VZb46adg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tS3NvI4K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MJWiHxPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FF120885
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=swA8PhCxbgAaWHuRbvHiKksTuSd5plp4z3NkGLkQb3o=; b=VZb46adgTygElvJWLg4jUpNFO
	ON8gaIG0g8WbetL8GB6KwoeGzF76oHBZoc1jiGBagtGL1U+l2gnVq5MWrBI8eanO3yJYQTHnH3z+G
	t4GJvNz+ebMAsLNYIPH+yVSbavcMO4iiAOOo+KqHtuHiwdhG/eG9Fd8AAaQXaWPgt0h4IVO6evFVl
	UbobSYE/xs3VWFyZaek86YYCZ/La/rz9sOVDqlamcUEPO8bZ8MlL2t0meCBPh79fwuj8YEY0t2QzQ
	Oo3gFHVbY9TOSCiP4j5jubIj9p53w+NXk9Xq5fzv6NhqOjaU6ENim1YAJ+cvTFJfd6z5agbUxa0JI
	EVDM/XdnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZjH-0003Yr-Dm; Fri, 27 Nov 2020 09:07:47 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZj9-0003Wr-Mx
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 09:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606468059; x=1638004059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KUnDNtMkhIej+pQvuCNNrp1cC5Fs77jO3/ywMb+JDkY=;
 b=tS3NvI4Kd4Nvj/lZ7F7k3zEB/1p0ri8QNPBjaOPPacsVr2n8R5FYUwgy
 W1rmGpzzie6TtVcuEmfhHmSsvgfd0jhchIS4ZK6vG8Xw1mfXH8AyndyIp
 7Z50VzIT6JbPkBNG5J3zUQjyQk7iY+URtZuUNSI0cjQQbi3/3dyHgdrwZ
 g6W/w8dvFKlL9heQIdafdzUGNkq65xXcc/zEnAbahbaQGxJLKIYOghRZr
 TuiLkmBbB8W+IsgTqyHjcGQw25aYLbWmYe2/JLGMlIIHVPBujvQ9rqjU6
 ZxVE1QvjlmbvzqlBerbH6NCSulmQRvO2c18BslkaqF0J6l2ew2wVI2ztC g==;
IronPort-SDR: qDXj8e4uI47FzfwrTZhYS0C5Hp/qG0xhSaEqOqPYm/vxds57HgCzBkdKODeKISj8bPyyNrhL1h
 LPF8SW/1Zw7EFg+NYyH9Ugmfob+vkBqEaUGSLFUri0i4Ycz8L7/W8YSTKDEgCgMbycBFjft/mo
 RZiwA3kH+wwbpQJi1J8NSsG1beOZXsQIgXS4w6ZxtidAoWSNM7wdBzvu6RrZ7puMfHDfbYS8bs
 OGjRKVFgi9dBA5ywnH3CECfD5i6Fgsk7VaT7RtNdSn1pVWEcJL86ElScmfk9nqBd0V8UPGONSh
 w+E=
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; d="scan'208";a="100577908"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Nov 2020 02:07:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 27 Nov 2020 02:07:36 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 27 Nov 2020 02:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCIYYSztmQSlTtbZbH6+u+41WOqqJWqWjMdlpjyIlypy3k1JbJl9TNOAPHhMJeFot0W3oP2xxdoK6859A0/l1QRoLyEG7cKZ+1BIOLInC1s7HJzu8vL4/Seat7wXwvHOHq3QcWe2+pzheInMndqAqRfvJldHul/8M3UiRM9gbw+B0Y1uUrO02wDZ3VWj2oHtJqahmWOV5u1GNeD8XfeicX4JjT4guJgBYtpZXcvc2az70ET9rEF0Y9yqkIa15DK8lu7qhkyD2cBgPK6R3kZxTIHHyUR53R1Gg/GRWi737kTebiB5ptRr4C7Wz3SYRoxodGfi7NJhvZJARt2uqkETXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUnDNtMkhIej+pQvuCNNrp1cC5Fs77jO3/ywMb+JDkY=;
 b=DsbxkhsYCYr+PJB5C8ypINajVeU+LqzRWmb9EIVmEsQu0gMmYgC57izLShsQRFM/WdjQEiTj2Zk2JDeSpf3bAm2kzS9kQsO8Cj+tcOYisLtPh91S1JsrYspbR7OHfWfay8QyLSBziGFAHO/9/qQoLhnIiI+fzviD+bRJ8Sxvz/jhLoLQ3z2V6S9+uxftH3mdOU3eILhNLHurTJinNMSw9FfRfiQCLkmydXiyTkCK2JJHr0aFbwB1NcW6NKvlEylg03gJXrgcDEiEUzpuDkmkeJbdICjsVDNfNazqvdf1V4FTkX8DG8R7sfqNwdJyUfctkoUTSUDVanWiHdBKF/7CMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUnDNtMkhIej+pQvuCNNrp1cC5Fs77jO3/ywMb+JDkY=;
 b=MJWiHxPzr8BBEZTRgWBJObJFzBYgGLOLbvSuwhXDrLXbz7iXY2wwVSzc7FcFHlJjsgj4ANfuUTDQUPsnErmxas7XxQ+4z5DG8HlKriaa0jUSd5iXjyZ8kpET+cQOaLhd4GG5tMQFGOTfLBC0bjxKi56yy/0btnhv4oIhkqG0fPU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2621.namprd11.prod.outlook.com (2603:10b6:805:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 27 Nov
 2020 09:07:35 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.021; Fri, 27 Nov 2020
 09:07:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] mtd: spi-nor: intel: remove global protection flag
Thread-Topic: [PATCH v6 3/5] mtd: spi-nor: intel: remove global protection flag
Thread-Index: AQHWxJy+3BSTSEli/0yZTXTsyojwLQ==
Date: Fri, 27 Nov 2020 09:07:35 +0000
Message-ID: <8c908200-9350-ec54-d301-e95c7eedeb0b@microchip.com>
References: <20201126202614.5710-1-michael@walle.cc>
 <20201126202614.5710-4-michael@walle.cc>
In-Reply-To: <20201126202614.5710-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50666787-cd63-44c7-901e-08d892b3e1ca
x-ms-traffictypediagnostic: SN6PR11MB2621:
x-microsoft-antispam-prvs: <SN6PR11MB2621798FA835BF6CEEE24983F0F80@SN6PR11MB2621.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QxQSCh6xLZg7JGOQ7Oh3wG3uI2FTHSx1A0Auv2gqi/RdInBntM5hOvJEhjW6jrxM835qOgHIYBVk5GCZJVWF3fQZDqkr5NNTZ4yuhEpFoa/3l4lRVvWVjfrErBL0JvOa7U8+h2R7T0ms9WteZyzCgPJvzx8A2J549SooUorJF0rwfRfufwijbQ4BhF/X/4eh31p1Nwur3jPBstnGXxlK1N9awu+sZhByh8ndysoiDhp3oPZFRWsoBRlp8DdwkrLvJW69WiXua75IqQyuG71BLAbrA3htxCqIwMfjd44tsNb595OqR8EdNkxntP8Y8zj3h/JovlqyLuvdkH1Ewj4EhBATejIEKeG5rePVMz/VSP5n7KtKfsT/CFN+FbLDVvw9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(376002)(396003)(346002)(4326008)(76116006)(2616005)(66446008)(64756008)(66556008)(66476007)(71200400001)(66946007)(186003)(36756003)(83380400001)(316002)(31686004)(478600001)(53546011)(8676002)(110136005)(54906003)(5660300002)(86362001)(6486002)(2906002)(6506007)(26005)(31696002)(6512007)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MTI2dFlkUGlYNkxESjN1N2RPQXp4Q0tyU2hZMWlMbGFZOTBaSklPR0xGN1Vp?=
 =?utf-8?B?bTFabUZ1djZnMWNUendZaFJZbjBzL0xsWmpselROMmlvSndGR3MyUTdySmpW?=
 =?utf-8?B?N1hwcEdERGdldlVLcUtxVDRxUGJlYWFrdnZqYndBWFVpSFhjOG9TT2kyb0N0?=
 =?utf-8?B?NnVjcUowK0xMOEVPZnB6czJxczJCMFVyY3ppajNWUHNCcnNxaTFmc01FWG9u?=
 =?utf-8?B?Z0llK1NZeWJsZ29xZVIrZmFMWUx4TFRwR2pzcm1CNHl4THhXdmpkT2RqdXNI?=
 =?utf-8?B?SjlVUHQ1VEZRa2R0REU0Qk01NEFQeGtGZ1J2dk5LdjlQdEphbnY3QUwyQ0NG?=
 =?utf-8?B?MW81UWxsdlFHYTZuMEh4ZnZHRXIxcDFaQkZUMW1tYnBNVWt2ZWI1dVVJL1Vh?=
 =?utf-8?B?UEJkSGhHYm1KN0JaZE1zdW5tMXpWdjY0UVZhQktkVjdkY09rU2hHbHkxVStM?=
 =?utf-8?B?ZlRDYnpuUnZJNDlUZC9MT3ZOTlZwYnpZaStFREcvNTk3U1BPcENTMzVtN1pU?=
 =?utf-8?B?WnlYWWhwQVNZcWJVV0E4RkIyUG5vSGIzNlFYdzhPUXVSc3hucXg3NnFtYkR0?=
 =?utf-8?B?S1QrUTlVOFZUU0RaZkRyaEwvd0JxUTBsQ2VYM3B4bm54bGNtU2hSb2gzUDlF?=
 =?utf-8?B?UGRuZDBTUktSdTc2R0o1VlkxRGVLVVJFeDB6WUJPZFYybWgwSWY4WElsU1p1?=
 =?utf-8?B?V2syQzZ5aVFuV0RwUkV5TU9idFp6UFZHdzl0UkhRQmNlL2xib3JQcDVMZEx0?=
 =?utf-8?B?NGFEVzMxTExvRU15RW03Y0E0R05GdGQwcTlWZFZMZ01PMkJ3dUtDaTEyUnNM?=
 =?utf-8?B?TkJTRlU0WHRUQTZoN2drSG1rTldpKzF4cVA3cUQ4bERqa282K2pRUE5QcEN6?=
 =?utf-8?B?N1BacjhJOUk1SjI0OXR3aVdjUitROEJZeThJaTV2RVhVbjhXWmo0NmQvdEFJ?=
 =?utf-8?B?bDU1S1lURFA5RlNiMEsvWXRzNkVqekhvMUpCRWplcjlhOXI5aXBLd2h2UERn?=
 =?utf-8?B?MzYvaWY0d1BTc29yQy8xd3BKT0RlcFdDcVVpa0FzeXRmbXE5cm5CK1RWQzha?=
 =?utf-8?B?d2doWG0vN1NySXNxZGduR1JQTXpqdThGYzJXeWlhUGNKTER6SWxDYktuTEQ1?=
 =?utf-8?B?czhsNFN5R0pkN0xKR25uTllLNjg0cC8rVDdVbG4xM1Jnb3IycmlnOWR6aThx?=
 =?utf-8?B?YldQcEwzYjJFWVVrOUV4SE85dllIdlpVZFlsdUY3MWVkWEJwSTJTTzdYVHVE?=
 =?utf-8?B?dks4SDhJZGo2Yi8vbXgrOVU0Vm93L29Dd05zdU41d0ZnN1hRUURQQVpXek9O?=
 =?utf-8?Q?vukjTpFYdStVI=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F3C66649618331459C31AD5E8009A487@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50666787-cd63-44c7-901e-08d892b3e1ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 09:07:35.6371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InDWsyhZknkBahBU1TS3g8LJUeUtSXEr2rBmheH/DJ7lMTwJg8e49TMZGC2VeUMvU6iC48JAg+rjr5BDjJuL5XmmrST0PqxffJobvUQzlEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_040740_323361_9904DE2E 
X-CRM114-Status: GOOD (  19.46  )
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

On 11/26/20 10:26 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> For the Atmel and SST parts this flag was already moved to individual
> flash parts because it is considered bad esp. because newer flash chips
> will automatically inherit the "has locking" support. While this won't
> likely be the case for the Intel parts, we do it for consistency
> reasons.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> changes since v5
>  - new patch
> 
>  drivers/mtd/spi-nor/intel.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
> index d8196f101368..6c31bef3fc60 100644
> --- a/drivers/mtd/spi-nor/intel.c
> +++ b/drivers/mtd/spi-nor/intel.c
> @@ -10,23 +10,13 @@
> 
>  static const struct flash_info intel_parts[] = {
>         /* Intel/Numonyx -- xxxs33b */
> -       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> -       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
> -       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
> -};
> -
> -static void intel_default_init(struct spi_nor *nor)
> -{
> -       nor->flags |= SNOR_F_HAS_LOCK;
> -}
> -
> -static const struct spi_nor_fixups intel_fixups = {
> -       .default_init = intel_default_init,
> +       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, SPI_NOR_HAS_LOCK) },
> +       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, SPI_NOR_HAS_LOCK) },
> +       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, SPI_NOR_HAS_LOCK) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_intel = {
>         .name = "intel",
>         .parts = intel_parts,
>         .nparts = ARRAY_SIZE(intel_parts),
> -       .fixups = &intel_fixups,
>  };
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
