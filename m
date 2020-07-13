Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30565C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF892075B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcXC63/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="owjKOm2F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Nauv0QAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF892075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A5HCz4jCXH35Ta/ORsOeEJwzvay7i3Wkd8Nzu98wQp0=; b=qcXC63/BV8VLd3TmtHKabhLvW
	wBdM4IRIPf1CvfX69RMQH3WyhV3TZS4MLArxSjQ38sK2MizTQ4TDoSea7VztYjEEsCgrxg0rhw+EQ
	cH9eWJFKNpdham4cyn9RLwT7L64nFGDmxV1hoabMU9hkm73OtfTTO4mXqII1CwnZlBhv0TkEiP0+0
	IiX1WzdjIalNKkL+4PB3YM/yhOmiLTbfUzbASQR6uiGEwnghdch+9sI2US2PPjtSW60J8teDS6+AS
	D0I0v0kAxcVIRy4jsWvcA8bPTJVSvE+O01SLnXr2bdY+0m4kEvlMqaXe17YX4CnpU5WVrRUAZUnyV
	Rx1DQD4VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juuqA-0008Iw-QB; Mon, 13 Jul 2020 09:33:38 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juuq8-0008I4-9Q; Mon, 13 Jul 2020 09:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594632817; x=1626168817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tzrKYV0RnDHglnWsm4gldpC30T80bQPxTEiXyMr7Xvg=;
 b=owjKOm2F3veaerlWXmIuKwtABl+kCcBWJOZe5W2cnQwidabRGwzxFMtr
 is0ebY8QD9zW2vR1xQ0XLBalY4MmyCv7ZbtZ/or98JxENhmkZF7S0xMlr
 kLUueS7AAMTM5jQOZ10LhPa0+64m0tL7VUrZ3Iqwxdjjav+SWibi0zsav
 FhJHgL1orKzTNMSau4HXiSMIc3mWt8eHhcFikkj2xEz7bw+WkJ7R+xE7m
 pmR5hIwQMKohWGxVJgOVKMmWRd9bzj2gTEW7MfosZg3aT23PW+0WF6ObZ
 tJx0nShxT2zClpDMT913aD+nwADaJKBi7lcUy5PbXbC/9TLk+9zIKX7Wg g==;
IronPort-SDR: onRjiQwPJPWTq5PBeXFGckRfXmDnlwAKxM4weWGxUDI0isHUwOXwvFTfKMGE+bZlhrjdX7KUz7
 8iR5+vqCg+GzIymx6B5WKR2QPwe1i/qVczQAxjxWGbjDwkDnhdVmCvKyo51wLaWY9EQb/RAXUE
 FfCp3qaCM7oB24k3Z1Z8jAsVDs8beRGY7985rydP23YmuO1PY92xeC2xFxoWwaGVWtPiiOsKvn
 bT6f0vOEo7GHgs2OzmIj7kdZSNvveamdoNoBSPN0WhBQmV6bUutGl0rYJ1ONr+FZ3CEkIeUETx
 zRs=
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; d="scan'208";a="82872495"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2020 02:33:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 13 Jul 2020 02:33:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 13 Jul 2020 02:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJxU+lfmAc/1fyaq4B98DGwyohdtdocxKyPQqhLeWZJiP8+zbUyJ9twKh9/LAthtQfN058cf3BdQcUsqciIaI2NuBCy/LeCNJMyMYNT4mnrxvxgejK/FRwprKwTkNtm+hTl1x5RmZxkE27PrzfdcTT4LFfj17+WYVnghTvhVf3nxK6BjurLLWM45/iBFpJWzhVN0TtU4X8AWOc0Czu/DXJme6cw3A2XvgEp2Cqj7zHYzxKUlvfYBdcViwklrF/4pOCgZqD5bJuUpibuC+hqbeYkPvp5p04Rs5gm5167kpBkOWoQIcm2X7LcAIQg9zyTSoYYy8hUnfAtRFCHiZDXiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzrKYV0RnDHglnWsm4gldpC30T80bQPxTEiXyMr7Xvg=;
 b=aXRWlRKhwWWmG84EapTfqYeoxVrwReaQv5m1u27H2Fs2S8HyPB0H0oCY3cjxuWOP9epcW8vWOkBKkXfTydvsEA+t6jn0NoTd1LDG5DvzzHVc2T7JPb62nc00y/FCPr1C6KBmUJNxkJq8sGsHJ3yo3yjv/ewXuol5Uu+Gfv8ZSnarBcim75oYfR5nK99EnKMQkKJlQHijWuBViH/MzREhGu/fxrt4bSqnsW9lNS4cu+PXBelipBEv9XLyfhGphhfc6q/GXplFX9MUzEWkYVPSQWgTEui69p75FTSrPpJ0g8mUOq33FKJw6tMjaZDSCwrjPaP8jk35obyPdaglo4wjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzrKYV0RnDHglnWsm4gldpC30T80bQPxTEiXyMr7Xvg=;
 b=Nauv0QAO3fRSvI++fhuqde273zzS5UGFQu4GQK5NCIbTkqVIvQYR9A+s/d9enijT2NhqJ1U3k0jUH1w1kgY5RiCBlYvhVagHmfukx7tmHU5Q71O8jubKLhzA0b7ufBnj7gvRETiZy3TnXPXkKGAPklgn5B6GJptAkFyN4o7cccs=
Received: from DM6PR11MB2858.namprd11.prod.outlook.com (2603:10b6:5:bd::19) by
 DM6PR11MB3868.namprd11.prod.outlook.com (2603:10b6:5:19f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Mon, 13 Jul 2020 09:33:30 +0000
Received: from DM6PR11MB2858.namprd11.prod.outlook.com
 ([fe80::5103:7e0:4953:2aa0]) by DM6PR11MB2858.namprd11.prod.outlook.com
 ([fe80::5103:7e0:4953:2aa0%7]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 09:33:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 11/17] mtd: spi-nor: sfdp: do not make invalid quad
 enable fatal
Thread-Topic: [PATCH v10 11/17] mtd: spi-nor: sfdp: do not make invalid quad
 enable fatal
Thread-Index: AQHWWPirkap/N5S5zkOx47e9JB4BNQ==
Date: Mon, 13 Jul 2020 09:33:30 +0000
Message-ID: <33513a5d-fbf2-7321-e46b-2f2ba8b337de@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-12-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-12-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.120.242.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9685040-a473-4729-3280-08d8270fcddf
x-ms-traffictypediagnostic: DM6PR11MB3868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB38683FE6872058EE1C373E91F0600@DM6PR11MB3868.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZS0BlmH84NsPMeJ4xgXWllNN+5t8qUgTOOvH5D5uWH1QSP5nfENOSsMpkUcbUv9O9GV1/qzSKBSdN23mGCZFWA0U1TeFVfOz3gXGmMEt3RPbEaACkEgogGqGQI1Oi2DQ/wB6pYmn4BjGcRsEYrIdomT8UVIwy94l3xZlr9xKKGpqoEpwR6YrSQp45hxeJrKWz1mv1M4GgKMFrhyczcMxYX6OlObwdb0J5eEvx7XsfyjprwRPWqqw97jI0BpSL2mLwE0IgMS25LUKW/1CdhvLIMCFLkQHyEM5vYPqy7f6Gdb/ufYI8c4e3ot2vWWQ161LoBK17YOyEwD2CEufNnSFmXAlNu9dvwCoixwzmT3s6QnZ2cMxRSYoFoPxXFo5Q6rqGNqQ3h34TlEdODdtDtjl6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2858.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(366004)(396003)(39860400002)(53546011)(2616005)(186003)(26005)(6506007)(83380400001)(6512007)(4326008)(316002)(31696002)(6486002)(7416002)(86362001)(110136005)(54906003)(66946007)(66476007)(66556008)(64756008)(76116006)(91956017)(66446008)(36756003)(4744005)(31686004)(2906002)(5660300002)(8676002)(8936002)(478600001)(71200400001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WGBeH3vCn8M/MEUooKYSsILZdffasnZ2p+Tj3XB+rz5yfPAWzBJkXQ2EUCQNRIgCQP1lwDh0PsGX+HbJ5Xz803W7QrTF6fXg0MXdLUiFXqPm8b7zD0oUPsxPz+/o2r+5nYj11t8dBfEtHSSdP3EqkrirFiC/7rFR7s2yX+KQHwaLm10rCwrKsUJDgs9c4fQXq6VM/zzP5RNPMdSvlIjp0fuW3plFoLZK3azm/dcHyWyW5wPEuU4q3hOgj9I1T2LAH4nfc9Y/cK/alUAKKuqRfNbNq1iXbwTskMsUP6+NjnxcEWCkxw4UYJGXvf/RIHAi5E1T6h9Ag/K+x2U4b+cTQt8xexNW2AtpsRrxcQMcbQobPp/KwytqDsxE5vTxDpONXNliwWbOqtdoR+P18kkBQJNZiln/EHbsSEbjhnKVGyzDKut4oUQcPNMfOnJLM+7/zyQvEMXMUyjCcQ1Kpb+u9cr6pyJY7TeSm0c0t6QHtw+t/csphIz1iihrSyxrsRij
Content-ID: <FDB2BA490C737C46B6A72E3285091DB0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2858.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9685040-a473-4729-3280-08d8270fcddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 09:33:30.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClnI+K6aD5yrpqa/r5zWazCCxRb8r+2JS+dWNECsUWj1bcZIt8utoCWhtolLbLxP/Vp6gReUSoNO5Uyb2rrDzGd78KxA2wXn6sC9pJxUdzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_053336_595166_F45320B5 
X-CRM114-Status: GOOD (  10.90  )
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

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> The Micron MT35XU512ABA flash does not support the quad enable bit. But
> instead of programming the Quad Enable Require field to 000b ("Device
> does not have a QE bit"), it is programmed to 111b ("Reserved").
> 
> While this is technically incorrect, it is not reason enough to abort
> BFPT parsing. Instead, continue BFPT parsing and let flashes set it in
> their fixup hooks.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
