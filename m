Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rjLEBx00UO8T+RNqCCCkDBLh7DKc1O+eKmnzuzCyX0=; b=OA4JSDGmwLK20S
	AuUf1bhYjOzY9s3S7GdZ+ymqOYb1H2dhp/qXbLx9/6Y17KO+9sgZr+LXoUVdxNSiSiPnEGT7Yzj65
	oA6gQkasB2GIf3ooI7wWfLAfCOuur2TQAYYxTiiqQxs1HxTGKiofQIWINExAgEojn3u2896FJWrX0
	z5+YtkvncHF85NCgIE7sMWRQfZUiKEVPoxFQlknEIFOdxWX2tNle6KzVVDoYDbzLZvGrPzZY3LZgL
	3JvOnGl5iQ8ky1xscBEyCjj2rnD1A/OaSgGE48emVg2l3EiMymNQtT2Zj9UiRRqTQEFIXb6cHPXnM
	USV1Xl/WKxT/BAGlqwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU18P-0082bL-5U; Tue, 15 Mar 2022 06:58:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU18L-0082aq-U5
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 06:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1647327497; x=1678863497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8d/amvquNbj35HY2jiQHUM33wcQiUdbojn5Ahjw3qC0=;
 b=jc6zTMVIXKK6jlE9ii9Q6xVPYZGWwhP6bO9KeBV40xmf3DIJovqqinDI
 UFyrj90C3GWUl5N6L1zGJesuoN+9dO2REAPl2wvGIMJvXPEXnqvwm6pYX
 YnjYx8yRxme4hC15nhc2X7OOirY9YoKN7X/cV5BVJQjUI1KblZyNuKSiI
 CZ5Urywz0ebNXnK9wpmvzuyoS4iB4iTKRIR7e0sPOSGlxh/1tzic8RzMk
 Tx6+zY1hFDBUQFqiNEuLYXs2/AVRBWyJS6ztnoD3SVPkKKt3T3I5fC+rG
 IVyOceG+9vR6gttTOWxQwBsRnHDYVmKxDWhc1BhHWScPYc0cgGDC1Yl/W Q==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643698800"; d="scan'208";a="88942561"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Mar 2022 23:58:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Mar 2022 23:58:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 14 Mar 2022 23:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFBhbhEh5uboLlvUJjogn9MYTjosDE78pAVbin0iT/gswtp7L4NYbCl1GX0ejkHpvyBSWbkfgbHFtGCc5km/DyaqfH2WSjmrNuCfUUUplbkM/0R1Kl5gYv3WnHla1BvmiH6ufof4uSJdq7vLoij1P4EcD9tzVQoWdNGEvJsN84zBbmh9ut0q2T8xp408/7t5ybylTig8IoEVe+LcnTp+mOkjz2+w8KnQt1KiE4oU5Tl2ohuD/BtSrrwkQbqQsKGyrCuDbClL/bkZ0+U8WQdG/ocxeXqeLSfLXD7cqOXOZfWgvYhVALF5V0yUKVcAjlVze8c17G34paQd+Kg+QrRX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d/amvquNbj35HY2jiQHUM33wcQiUdbojn5Ahjw3qC0=;
 b=Almri+4HqFFNZhYWKW20ekmlaVdlSpGXno7l8ilPzCTbSzFwHhrQk9P0zx9By4FKHEIc/XondpqFfUiSjxW4VVNEO2TPHd4BFMN7800XUJzBxv53207y7aMGidmkRofp1jT0KxusG+VszgFfYyi0K4OcYyok9Z0Ip1A52I0YkpVupTihBZeeBqwG8BMnjV/kjpH6wdHbbG7cPvruKAs0gDt/9dDqx18Kj4PP2tck9+Ucor2Gyy7GkVZKOzkEu/h4ddrMi3xWqyuzFZgUH9fuz/jl2gnUNgOtCbPJcRLEaPeem9oSrp1xTdh/AjqZXB1prE+MiKcR0hv4RKMD16JB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d/amvquNbj35HY2jiQHUM33wcQiUdbojn5Ahjw3qC0=;
 b=mM5yofiWrfpqrJOduSH/8/lD81pq4YU9lCGEDN2bMnNUvFfX/7CW5YWjfyzx3qDvQHRvwmIaQcBjh+jvU1qEsnoaxgMefx+9UPt50tlfc8khZ9fa6jwaWe+YsAhQTlYpHjlb+bpKnYPNMb5pY1/Wxx5hzP0hIyyJUyiyKHPp3Hk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Tue, 15 Mar
 2022 06:58:10 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 06:58:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>,
 <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <andreasilvagni@macronix.com>
Subject: Re: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Topic: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Index: AQHYODoHoecUsXbOo0Oqo0422amT1Q==
Date: Tue, 15 Mar 2022 06:58:09 +0000
Message-ID: <9e0b6bde-838d-b8a4-9fe7-75c4f916fb27@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
In-Reply-To: <76eb13b6-9263-975f-3196-312259634301@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 176b2402-ae66-4159-b90a-08da06512a74
x-ms-traffictypediagnostic: SJ0PR11MB5600:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB560097C8DD2EFD612A525DE3F0109@SJ0PR11MB5600.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BhVlg/lnrtCFrGupW+4qQDeXCZzSkN2aFQ5hqw5/4mQHElWzqMnD2DradiEJ45q569M9lLd/fPx4IokFXfjCPRzMJO4NgwBwn3kQOnTu3sY1AZJDwEfuKLhUFNMW6vBqEcKwrKcrG2z8pU9qv1tcopBPFG+JU+Ls2+6z1zyG16tMOrHyh609BptSqeXwuv6QqP16Yt+WMYR6Qdf91IMogXCuwExY5GfGAyyXptBQjSLUdOk533CFqwb3oMPmsLG5NrW9EiqfEDGKmRV+0/hIAxgbp909btdSJ+zv0PgL4qaDRJG710vXGAqyI2cznYmZiS2JlxuNNfzBLESE8M+JfjL4xORfvsKT3Ak1/zIG63+wpRtd4ZVGNoBS+C/HxXva0QpAFwgYmoAaPtOIzCEYzur/QWrlCNVdvhIoSNMkIzDx8wnyLFc4h7Oqdx/y5QHVzJArTBPpJdhpzLNqLGrzy7O5vEwt3nClryU4PJnMUnVf/miZixBTR5rNRJKYlx+Svi89c+8ok4g1xTyKr0UXUenofGpDJSIa1F8p5FwREnSkrwJm+nSPvp4nMn3Qhwmg00GboVORaofc+HEglbH8tIW392wlHFK6KSHT934FKotc3j6VAFsx9gcv1aO/6WlWxRdgpMKSQheNneEwQOqe5CP7lwKzcrQeuO4fxQKiuIMbC8qXLUVfSQVCHeqkiBC5R+GCdHG2bdxVCMS42vu1ag1uQWxSmt47K0/Gzw9DBQosIdV306tpURkjgNM74UN2TiqwOihiR9xVrcLhV8gXyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(91956017)(4326008)(316002)(2906002)(31696002)(86362001)(8676002)(38070700005)(76116006)(66556008)(64756008)(66446008)(6506007)(53546011)(508600001)(66476007)(66946007)(8936002)(2616005)(38100700002)(71200400001)(36756003)(31686004)(6512007)(110136005)(54906003)(122000001)(6486002)(26005)(186003)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHJnUng3SE5iY3NJRHVoS05UTEZSdEhQNkF1dTVlblpsZ2tQYlQwQlY3TzNt?=
 =?utf-8?B?Tno1K3VadmttWGcrb2lMWlErNEVsQ1ZHcTMvdFlmSnhjc1ZYa0oxQ0FxOGtv?=
 =?utf-8?B?OVA3YnN5eEZpVTNZV2pIdnNFcnI2K2JrY1FOVU5iVEl1THZDSGFJTjN3T2t5?=
 =?utf-8?B?eWxEbmNhYzArMGNGZFRyRExIdUtIaGtMdUJacHVnYjU2bnZSOWx6c09JZXd0?=
 =?utf-8?B?a3VCcFZVTDVJQytGbExIV1dVc3QvbnYxWjVpMVhKMWp6K0FyUStGbkoySGta?=
 =?utf-8?B?dnFmSHlZZDFWQlU4WURNWW5XbURwZ2xvQ2VaTVlKQTltZFlkMU5ncy9GU2Vx?=
 =?utf-8?B?MDhnVkxJbmVtV2dGelp1SzBQYU9ySmQwN2tlbjE5RE1WQ094NDROSDF6Y0dH?=
 =?utf-8?B?VngrV0lScTRuS2EzSmtsUjFXcHJLNFY2emNpTXhTeEhWTEs2SVo4TmZEZmpQ?=
 =?utf-8?B?Y3czYlNPMkhRQlBZQ25aVGhadUtWU1NWelBzSC9Ic3lxSEppZU9rZGtOMkx3?=
 =?utf-8?B?QUM0cW9zMWNlVUhhTU1RR0tSUUpNRmR1OEJjUHZaTFBWZUtHMENuTXlqRTlR?=
 =?utf-8?B?SEIyTzF0NWQ5VnIvdGs4cFNGNWNlNU1obUJIZVlOWW1DbXMxRHAvekRDQXQ4?=
 =?utf-8?B?SkZvbXBUZmhveWtkaU1CSjdrRk1URE9CdEF3dFRpZ0hDU0J2R09JbjltR1Fa?=
 =?utf-8?B?QmZhdUVGZ0ljQlpaMmp3emt3cU1DZTdkUmM3YjB2a083TERxRVpCdkpyTWwv?=
 =?utf-8?B?YWgvOUo1bW5FVUw0b0xoa0YyV2hCUi9LQ1VDQnliQjVha1QxcmRpU09ManJl?=
 =?utf-8?B?amFhWDV4UmU2NVVSV25kNWxGZWUvUjFZajBXUlB2NG42YjRsSVp3VEhtZDV3?=
 =?utf-8?B?RitpNGFJSC9PeU9jWUhLSkl2a1hmT1FqdXpzVkxqV3AxMlNPZHYrY2tKSit3?=
 =?utf-8?B?ZEdXdTlISkp6c1NOMTEvWER6enhtNERWTnBQOC80Qm5FQXVhd3pJREs2TDRj?=
 =?utf-8?B?dWJJRDR6UjMvdUJrY2xLSllWSDlncitabWUrTkJLVnBXQ3ZFU2lBeFUwMXJZ?=
 =?utf-8?B?dTk3a2ZMWVZNTlVVcXg4SVZQR0tyNnRvN01BZFpkUjZEcXlxNnMyamtjc29w?=
 =?utf-8?B?d0xkaEVob2xzc2hHUjVNRW90eDVUcndsbDI0Tk1CTW9QYVo4UERUOU9qTXJG?=
 =?utf-8?B?b0dEMzdFY1NIZ3NlKzJ1ZTdnc0UvY3V3bGd4TEY1cXFNK2RReHp0b1BZQ0g1?=
 =?utf-8?B?clBjbURaS3ZETUFIUEh3cnlLRE1KeXFOSEhVZzBUVlQ2cjZXYnZQa3g3c05w?=
 =?utf-8?B?SWFTSnA3TmtqaWQrRWJ0WXE1NDB0QzRlNzhFbnRIT0w3L0tHa0VaTnczZlZR?=
 =?utf-8?B?OE9GUytkeEZwcDhNdWpDcXd6dFlCazBab29HZ3NjaEV3M2U3Ulp5WUN6R29q?=
 =?utf-8?B?ckxrUnp2blc1N01zK09kR1Q4V0tVTDQ3SmVMUWJhU1dUQTJ5RnRjVisvZmFh?=
 =?utf-8?B?MUxSN3FlZzlRV3BZcGV2RU5ONEpScDM4cWZRQmRRajhWVmVINWFWVHZodVg5?=
 =?utf-8?B?UVNRNEdTMnhIbEFmaDlDU3NEd00zRGVtaFdwSVJpNGpoYmNiVG9Makh3K25Y?=
 =?utf-8?B?bkQrREx6REtOekF4ZGIvc0JSZzdMaXYrY1BReURxZXNySmVTbFFudXgwMFN2?=
 =?utf-8?B?K3YvYVZLaVNTK0d0RGtaSWgxZ3djWlpUSkMxTk9mUXJ0WEhIMjgvTjZqWVN5?=
 =?utf-8?B?Nkt3VEwya3MzUUVLVTlCZWJWdEFtUk0wVWo1UVJRNlhIV3BVWTVHSWlzWjJQ?=
 =?utf-8?B?UWhtVHdhL3dtSHFWUDl3NEdYRmhwVjk0Z0JDWjNnM1dISFpLZW92VEJwSmVG?=
 =?utf-8?B?R2ZJc2pCYXJjYjdnenp5ZWhRNHJORFArZTNwZ1pLbEUrOXM1UEdVL1ZGQ0lP?=
 =?utf-8?B?YmQ4cFIweWVYczAzMTdBQUtKaDNyZDRvcXZkS1JudW8vRW40N2JoN0xoa3Qr?=
 =?utf-8?B?NTFlTTQyWDVRPT0=?=
Content-ID: <C88F1971BA3B7C47A007C2CB95E4AF5F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176b2402-ae66-4159-b90a-08da06512a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 06:58:09.9651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbG+ZAqCQbRiiCwpZ9hLUp0+lVRX2ZZD7GsT9HjQzlVY7OQx90qioOr5pbSbaW+NaAiIlPVLtyrzmNz08I4HgF6DlOjXkC4N8dqGqQgtuI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_235818_189298_319D678F 
X-CRM114-Status: GOOD (  30.24  )
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

On 3/15/22 08:08, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,

Hi,

> 
> On 11/03/22 1:31 pm, Tudor Ambarus wrote:
>> There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
>> when configured in Octal DTR mode. The byte order of 16-bit words is
>> swapped when read or written in Octal Double Transfer Rate (DTR) mode
>> compared to Single Transfer Rate (STR) modes. If one writes D0 D1 D2 D3
>> bytes using 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will
>> read back D1 D0 D3 D2. Swapping the bytes is a bad design decision because
>> it may introduce some endianness problems. It can affect the boot sequence
>> if the entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1
>> mode. So we must swap the bytes back to have the same byte order as in STR
>> modes. Fortunately there are controllers that can swap the bytes back at
>> runtime, addressing the flash's endiannesses requirements.
>> If the controllers are not capable of swapping the bytes, the protocol is
>> downgraded via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
>> of the bytes is always done regardless if it's a data or register access,
>> so that we comply with the JESD216 requirements: "Byte order of 16-bit
>> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
>>
> 
> Sorry, bit late to the thread. But, dropping 8D-8D-8D mode support is

no worries

> quite restrictive IMO.
> 
> AFAIK, SFDP standard does not dictate how data should be stored in flash
> or how SW should interpret after reading data from flash. It merely
> indicates endian-ness compared to 1-1-1 mode.
> 
> So, its up to various system SWs like bootloader/Linux to work according
> to pre-aligned layout as there is no rule that data needs to be stored
> in byte order.
> 
> We have two types of controllers:
> 
> 1. SPI controllers supporting swapping endian-ness on the fly:
> -> For such flashes, better choice is to have SWAP option always
> enabled. So that data written in 8D-8D-8D mode can be read correctly in
> 1-1-1 mode and vice-versa.
> ( I am assuming SWAP option of controller is only effective in 8D-8D-8D
> mode and is NOP in 1-1-1 or other modes)
> 
> But, its possible that "ROM" or other non-upgradable SWs may choose not
> make to use of this SWAP option of HW to keep things simple in which
> case, they cannot boot from 8D-8D-8D mode with above setting. Such SW
> don't always have knowledge of flash and cannot be forced to have a
> constraint to enable byte swap on read.
> 
> So, IMO, its best left to system integrators to specify whether or not
> SWAP option needs to be enabled (perhaps via DT as its per flash
> specific property?)

we can't use DT for configuration, maybe a Kconfig instead. Are there any
other options?

> 
> 2.  SPI controllers don't support endian-ness SWAP on the fly:
> It is still possible to reliably read and write data as long as its
> written and read back in same mode.
> 
> De-rating speeds because of absence of this support would mean reduction
> of speed by **16 times** (maybe even higher as 8D mode tends to support
> higher bus freqs). Swapping bytes in Linux before writing or after
> reading is not an option either as it negatively impacts performance.
> 
> Asking ROM/bootloaders to swap bytes based on SFDP indication is
> restrictive too as it involves boot time penalty and most systems with
> OSPI flashes are using them to achieve super fast boot times.
> 
> One more case to consider is flashes that dont have SFDP table to
> indicate byte order but follow Macronix's convention. In such cases, its
> better for SPI NOR layer to be as dumb as possible and not really do any
> byte swapping, leaving it up to user space to handle/interpret data
> appropriately.
> 
> Also, Macronix is probably in violation of xSPI spec (JESD251A 6.9.5.2
> 8D-8D-8D Profile 1.0) where diagrams clearly show data output should be
> D0 D1 D2 D3... So ROMs following xSPI spec (which is the only spec
> providing flash agnostic way of switching to 8D mode and reading data in
> 8D mode) would not care about SFDP bit indicating byteorder and its up
> to flasher programs to take care of the same

This is a bit in contradiction, because if the ROMs follow xSPI, thus little
endian byte order, they should swap the bytes.

> 
> IMO, kernel device drivers should just provide access to underlying HW
> and not have too much intelligence to interpret data/take decisions
> 
> So, simpler constraint to put is:
> Flasher programs should program data in the same mode in which
> ROM/bootloder/Linux is expected to read the data on that system.

No, this constraint doesn't cover all possible cases: take a 1-1-1 ROMcode,
8D-8D-8D for other bootloaders and kernel. You need to dynamically change modes
in the flasher program in order to address this use case, which is a no go.
 
> 
> For Macronix like flashes, if one has a ROM/bootloader that only
> supports 1-1-1 mode and flashing data in 8D-8D-8D mode with Linux, then
> please generate a byte-swapped image offline and flash it. Don't impose

we can't do that, see the example from above.

> penalty on systems that do best to handle this messy situation.
> I see this as the only option with least performance penalty.
> 

I take from this that we should let the byte swap be user-configurable,
thus a Kconfig. Which I'm not against it, but it will give users
headaches to sync all the software components. Making such a decision
implies that users know SPI NOR internal details, which also is a bit
stretched. Let's sync so that we move forward with this. Opinions? 

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
