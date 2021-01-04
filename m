Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F331C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 08:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29917207AE
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29917207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/E4elh1a2magSlx2V+zFQ+xr2T3GYevs1DXpnLbaQmk=; b=OXDCjUHw5/dlJLfvY/oZUwj0e
	ED9kLBcAYZD3+66q2XaCr36TQXdjxZTOZGT9exsoe6EjBtx8imo3UPhuowpiUU3wUTCEw9pXf1Nhm
	CcVaJmhKJdUXUDq5cDbEeYd9CDWRtMpPAAV3pz5BKRbWtdbngZ/6QsaeEoGIv57xZCCYad5+AlRI9
	bDkNqPwsNl57LFOY0u0ltgJnA4bV11otHZejjif57QyVfRbgqyW6dODV4koQCVoja3w9ba8jhkcGc
	PQOX/utICX9UHtY92y/AJpE+/JouyqkT6Bo7fdvJW4R7ZjbT4VG0sQNWL7g2jpjBVvMAhLbHSfTWu
	saMDtfD+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwLhI-0007pr-54; Mon, 04 Jan 2021 08:58:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwLhC-0007ok-8y
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 08:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1609750714; x=1641286714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x0AERHHhwN9faRAvzNiJ452mrWq9xcth9YQI/p8sL8c=;
 b=pUJoalX6yY5icbqK+Od5vHuagI7yIzh9WbUZFnkO5akTmhmI+1xEpGXz
 sLLf0m/+vapC2r0QSez9euw9rq6VxFRYm9iFxfqBT5XLasg61kyEylXyC
 /v87D2Akv54ksKDiThJZnCGodMQrZCGgR+PeF+57xgZjmfgr3hS9lotxO
 kbN4WR5KWvWumFFOo1azA4UKkd/QNrpfihZuEpFKmfmEYMOK3fHip7vl0
 p8Sf31tmA44Jv6Bs4B48YowKn44rVXsIbp1YjQupFP8Tvd1e47LYWl/eu
 gsC8Y6E4Lsu1rPpacffH55vdL+DjwNM7m9AUi/dk5RMh8SM31mQnbGBte w==;
IronPort-SDR: FBipawBEFtWpb+mtMaCR/KSODq63DG/xmMeyUhf43sy/PYud1E1FDtupAuaZIbkpKakqFvn2Bb
 Jtd9IN00Uszhnisqd7p7el1paHspvFSczSE39LBGaH7GXnXKT5xCbfi+SMBoFheJCJJltcVBX1
 U6Ruw5umnp79wHcJfwd3JLqe3XwBc+2Uh6XgMv77Evuu79imUYqBITCbR9IEYuZ4vQcuGPpmuN
 lgIxklFk0XpEK/QYtLq0v6IVp4j2r7MMsOyhObgkEKr6KFJDX4sXYSXRMb/R0AWDwJT7iNTXJh
 uKQ=
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; d="scan'208";a="104694961"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Jan 2021 01:58:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 4 Jan 2021 01:58:29 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 4 Jan 2021 01:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXZ1yvBcnDkUbiA7qz9IyUIL6E8Mszsv/KLSG9Pr4nxB6dl50g4W+v2mGYeFbkbg7x8tB/yI+vwwvp//VLHiaCo8IHtWqS8jOGG0VgT99TDcEFyNf6Czf/OswvL+Aq891GX1GHbcGR5HH5AnpevnB8zwzuSvKglIDHUm5V4str9Ju0yyVz9HVeisjFCITKJjKA2BZtBzD2H8X1qxhz6cxmewc5Vew4RHN5XJHyeIbuthr/wUYm/zwc8zEx6+fSc/oXc1NxLVgXJscRZbMyJX8vLf2jU+Dp93jGx8GWt1LAJaqVoTCdbOH2KKJAvUVin71NjKkGeiveDvDwjl2zy6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0AERHHhwN9faRAvzNiJ452mrWq9xcth9YQI/p8sL8c=;
 b=AgDjryYS2XVvxQAcx7nKwHhHhPB7Ruvkj72jGo4Cr9fzkAYJ8ZAHR39COeYEN7dwRD+oZ/fbkPapBroEj86+UMSFIatziVti5mDJljCX1Xe0imjfLImUAEUD1+UUk+loi52nKmj04MAJmnwKxt+L+EFetX+QMNBcOnCTQRe58v7oFEiWXp8wD054N8l7rtgANSyWuLhw14Gw5i6P/xpNOF2vh/rG9VqSCyOPcFheW0radxOiiUryk5VIUTdxZBm6gGRkWEMe1+JV9XTu5strp4wgAggDQazO8CX7wE07AW3XFt2QurCOEtjUZNX4t8CUM9JFp4u/P6Yfx0nSvpgjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0AERHHhwN9faRAvzNiJ452mrWq9xcth9YQI/p8sL8c=;
 b=JaQWmK/gjf6dR8buGbOKVwE1ELj5iXs4u/vDXD+mSnElalirobxQud2jdtJ9vS/BnG6Gu91Qkbg5CezIt/REBy8GmkqsMJV+7WkOrZYyA/g7E/ZbFJFUA050KEA4glrmE7O0BnQCC5MKlT8DuuvCwjgVs2m5nbnlxcZ+8iPKz/s=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2879.namprd11.prod.outlook.com (2603:10b6:805:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 08:58:27 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 08:58:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <shuhao.mai.1990@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25q512jv
Thread-Topic: [PATCH] mtd: spi-nor: winbond: Add support for w25q512jv
Thread-Index: AQHW4nfDfALMdqq+RU+TfKMGImMTYA==
Date: Mon, 4 Jan 2021 08:58:26 +0000
Message-ID: <6e59d200-f4a6-459e-8cba-86782413ae8b@microchip.com>
References: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
In-Reply-To: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57345f22-cd96-4862-7d40-08d8b08ee672
x-ms-traffictypediagnostic: SN6PR11MB2879:
x-microsoft-antispam-prvs: <SN6PR11MB2879D967E7681E9109B5B74BF0D20@SN6PR11MB2879.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uhjKX6JivlBSuGTrOlP7IlGmijReT+eQraA/oQNr49WzQSDSyhytBJ1QVbQkCdMcB/CGvN/D4zRPL5x/tf3rYIiPOnQjP+rC48Asmj5Muwi3qtj0LVnS/vXT+kH2S0IEC+i5Wue+SD4KVlLKuegV+3UWUhI8Cg2tgDPPq90jr9ofL8BNg2b4THeB2HlEIDseIb1VKyNci5VCsGVLuWtUJnALw7ZDpnVtJzyr0sxDcCmKP33F9dlbfTHK935O3I8VYxwRyoocapbTVuS6HXmO5KgLAjofpV/veH96c8GZIMg+5rZezRTGjFQ08KXHT7l+XRP0emA1pZqURAqCsD6q5W50zNlBuMrIVhrlDxyWJZCXbbiGa+Ty9nj+DeU/RRi5zsW8jrbvhIpyN/ujOrUOO+v8qgy2X0yWyERbEU7GeY/sMGDChWAEY6JJY0vLmxCkILJZErqGziehWOhaPiYw32AyJmTAmURB1qA0JssS1YsPeUo7a4L6Bq2Qs0MoxEMwuC+ktmsuQ7nzX3MIxAPnY9J82ch1RFZGfH9J0bMRL0FD5FI1IkuhyD4pEhmBTVG/zwjkM6m5YeXyafmWDMqoBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(39860400002)(346002)(136003)(8676002)(5660300002)(478600001)(26005)(66556008)(6512007)(186003)(36756003)(66946007)(4326008)(76116006)(91956017)(31696002)(110136005)(66476007)(54906003)(86362001)(64756008)(66446008)(8936002)(6506007)(83380400001)(966005)(53546011)(71200400001)(316002)(2616005)(6486002)(31686004)(2906002)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXhmM2l5YUJvc01VYnMxTkxrdG9PM1dqMDdJY3Rwb2tGaHBsSUhSSm1xaHZ2?=
 =?utf-8?B?dHBvL3dWUlpQQjBRS1Yzdzl2dzM0K3lGUGpZRDNJK2RQS0RlQXVGa09KbGN6?=
 =?utf-8?B?VUUxNWJ1SHJFTlM4MGRLb1lNbC8rbllidzJtanBsY21DWEFDTERoNkdPUHJi?=
 =?utf-8?B?aGMwMXVMR2FZN1lEckQ2SkdHdEQ1RVBuZXBVZktpRVQ1eFFOTTBoMVJtaDZt?=
 =?utf-8?B?REppc3FEdFhET1lRUi93SWdZSm9GSkVFRWdveG84UmprS3RjZGRDamRHWUlU?=
 =?utf-8?B?WExOanRYeklIRUVuYVVPbWdoUkhIZkpVY1VvZnVuS2c3TXE0aUF3ZndzZDBN?=
 =?utf-8?B?NEJUd3dGUU1XYjIrVU5MRlVISklGcnFrdFREVHYvYmVjRDl5TFJPNXBHaERr?=
 =?utf-8?B?bmJuWk9BZmdiWWpoUW92V0xlVHYwKzVIeTdVeUpKTWg4VTdob0hjVldVa1ox?=
 =?utf-8?B?QlI1L1BYSExpVG80WHNCUmVLdUxvNjVmQVg5ZWd5amNmSjVBb0w2bVlHMUNQ?=
 =?utf-8?B?TUR3K3ZqbWx4bDBZQjFRSWR0U2t5Y3RNcEtXODh6UlJYSFhmSnB6UWV5N1F5?=
 =?utf-8?B?aFF1b3VWM0VCNWlMTnlGVm40V1ZpR1orVWZ4NmlVTnVJdXZabi80SWhld3Z6?=
 =?utf-8?B?VHd6dkdHc2llajNLUm4vaFZPTmtUNXJNNXg4Zzd5b0pMb0dHcEg5Q1VYalNp?=
 =?utf-8?B?NXVGL3BITU5GYXhFcW8vaXJSRXp3Z3hzN1ZzN3h6ZnBqa1E3VGYrc05UeDdO?=
 =?utf-8?B?ZXovOUsxOXYwbHR2c05FNG41MG8wQkgxVVBGbnN0aER6T05aaEtRSkJhTElo?=
 =?utf-8?B?VExQa0lxRTFXL1phRW9NTE55dHJwaFZocFZmaG0wUlZxNUtuaHhwUFJBWkhh?=
 =?utf-8?B?VE55WmZocFpyWndTQStnejRPdjJnN3JIY1FDanl3dEZDWnhDVXo2MWVjdTRI?=
 =?utf-8?B?bThaWUljTWtTMWk0QldRWlBneXVRdmU2aDZySXl5ZTgrRGRycEJvOUY5dHlt?=
 =?utf-8?B?T0VsRXdNVU82blRrc05oWHBxeEdFM1QwUWdEZFQ5YndJdE9Ea0VBNjJKZ0ZF?=
 =?utf-8?B?bkZPL3ovR0JlQkFhMW9WaUVydkVybW5IVU5zcWgyQ3ZyL3pVRzBqRUdYeXlM?=
 =?utf-8?B?MzlFOWJNbWtFZFUwbEhFdFZ5aHJKQUJFREJJVm9aczRjZTRDSGN2eDk5Z202?=
 =?utf-8?B?SGR2clhWY21rZHF0dWRFRjh2MmkxdnBWZDNZM3JhL3BQeWhtSy9tSEwxM0Nx?=
 =?utf-8?B?NGNHbHdDdUk0TFh3cy95K21WNXlxbC9pcmVlYmlkNzFSUW92NGlGWDVlYzJl?=
 =?utf-8?Q?y9ijVzLXkeTB8=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <24ECFCC22852EB4289D61915E0260611@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57345f22-cd96-4862-7d40-08d8b08ee672
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 08:58:26.9598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Judq+RCM3hGYIThXjWErVcCgq0oKMlEhLGAzvU1DEY9Tn19V+rzNn3r5FvTJkC/CO5kHwXIUPGV1DIRU/HJRuFddgZuAei3dSBUa+tK4NdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_035834_602158_488C73E3 
X-CRM114-Status: GOOD (  19.44  )
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

Hi, Shuhao,

On 11/11/20 3:45 AM, Shuhao Mai wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for w25q512jv. This is of the same series chip with
> w25q256jv, which is already supported, but with size doubled and
> different JEDEC ID.

Where and how was this tested? Please add this info in the commit
message.

> 
> Signed-off-by: Shuhao Mai <shuhao.mai.1990@gmail.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index e5dfa786f190..beaa6389e2dc 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -97,6 +97,8 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +       { "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,

We should name it "w25q512jvq" in order to differentiate it to the
"M" version: https://www.winbond.com/resource-files/W25Q512JV%20DTR%20RevD%2006292020%20133.pdf

The flash supports BP locking and we can enable it if you can test 
the locking with mtd-utils. Not mandatory though.

Cheers,
ta
> +                           SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  };
> 
>  /**
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
