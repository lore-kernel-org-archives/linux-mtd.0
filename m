Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DE5C43470
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 10:05:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A6861158
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 10:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A6861158
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9kpKKfcL8wJwyCgSHXcXec4eHc5KlczfcqlD+w++NLQ=; b=YiFFEI0u2chGluLDzD5iqYU/T
	gTmMybd88RvRh18l5AhZ9LdmBWnP6FueOD30PAqs3TqilVJ0esb8FLK2OXlIkUE4cZxnDNQcPFPwQ
	OqVjkg2Al81UrvDyhAHV8C6i8i4oIoUeQbESHhCYXGLFXBxeZFIdeaT5hGG6OPfTT8iQl58AjlGSl
	fWo3uHunf38EZ/SAuJe2FgksQAR63YmZPQmW5TmtyOERA5b8eAv35n+0r/6k9zRwLHvF+Ont3huQL
	xwK2QyDV5A32tykzsChBubwfSCgqDzbd1TmCAbc1ZKKukXZDskttoHqrJql7IbkigGGLDVJ3YED7o
	m5D+aFpug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURWG-007aVo-Ul; Thu, 08 Apr 2021 10:04:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURWB-007aUh-Vo
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 10:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617876248; x=1649412248;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uk413hRf5PximDwyPcnfj9cKs3c6EWJ7L9cRAi4JvZ8=;
 b=MzDso1ey04JJ7BT23h0qd1c30qxKXz/QTDvFvPPLCUPfkovIE9r2gt6c
 ihbbAKo6E8SSxrMAkQEiNUb+W235xW4avP3AKuuf2Oz6rGaRRasOPuWCu
 Mv3ZIl43llRozZSLxv72Q2zvm1S98JNFCMuHtsb9c4+Xx5cmGler/+NCb
 OnIPqMjLOgLrb8E3Ljkvtl3lENCH/cJdk4r0gny6kjEEOEIt0hcF0KEIO
 Zzq8n5ZFUzBT/6yOcair74IDiYY4+eJh8AVHFzT4r6pfSLzflEUJs0kiK
 YhmUWQ2jxdoYbG0yeuxECUAwFneOxWaFGT9EZ/QTSmWcfqdvV+xSw2V1b Q==;
IronPort-SDR: wZsDpQlFl+QFFBQAaRAFMck1NqoXGrXBvGAUS7ZlM5PFdLAO4YyZfvtu1f7lBCiz64BVKb7fSz
 TmBbfiltAjzWg7npqqTUQIh3rbM/dDbDvMtrpAnDe4/Q4A5PMWkd4o95+8jVBnYfNuPlC+nJai
 bPQIDdd8Vm/rHgekaAD6OJqa8DPOmYHWwf3veEy9tYkdDgUwRc1cLEXd0yQfOR+7dQFPaA5Y+Y
 ZwRvXNdTVMLORF544EVslUevJgvUqLUDKaSwkBCrIe0hD4+dM8m4sDhPtIEbg2UYGlwwdJlS6z
 Wi8=
X-IronPort-AV: E=Sophos;i="5.82,206,1613458800"; d="scan'208";a="112882770"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2021 03:04:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Apr 2021 03:04:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 8 Apr 2021 03:04:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWUZWk1Bc5UNyoFVMKvaAuTRmYc9f7V9E9DjRga9doNfIKN7HTxFFdYdMzVPMh2DHWEqKMxAUW5XxCmbRx42XGWW2mniiMBIpUXoiNwtXP12puP07ZOh8JiauJWMo/R+F3eU5IL5czkDp5Z3fG75ueTlofYbQ97MozTLItcEcRSskcnNhHUKtm9m/mhX26jnmPfTsldtu83TYHOHewVR8EQkgI1nwoSIkRkCtLWkcdOFNtiBXGlQD4fOD933Y3443VkB5P7gs/kpte8waUiayj7CH5WrCu2kPfMMqmYQhkQmM4naviL9HgLiYyJCp08Xzv3RLsH+3A/hpBAFr8s0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk413hRf5PximDwyPcnfj9cKs3c6EWJ7L9cRAi4JvZ8=;
 b=HnRm+0iY8z6eb/Ek4+YidG6nn9wTJsWJcz1VF/zyJfT0SgMh3FI26SEMJYvZOcBLy2lktBTLh9dFPTKe/6vHzxfVOcSI4eVtxJ3N4AJJh4p77BZxG8lv+Oz26WPmCNaYeastEIC+7DtMaL/2yngpNuKmR9aBsVvX/+Fkxy37iiJUcJRdARKKuVbXmvshfJmYRy87j52XOPu88Z7So+OY+yMTiSKFq0l2SEn0tR4qph3GxmYOQXm7EUlxWIYCnmeQGUa7VZDDONsw6+EpaDqG//Jzl4yA96UUEoFQvsOY/xv5rnw1ab1qWQuHwHd7i9ogaskWVYNmPraobW9vVUVL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk413hRf5PximDwyPcnfj9cKs3c6EWJ7L9cRAi4JvZ8=;
 b=nRWMliM8cu2MtaN7gf49YfJG4YjeEtKtOYG5fUxKJ9hZ8ypFToS+z388zMDsf4M9idix5MA+B+wZL+GeazxD9uFLav36Bcj/apJa9K10ckvfMV1WS3NCyy3rDGta0DMlNAEfXyTGsOqYhET7sSOd0W1OlQi/OhvsjxPngPfhvsw=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 10:04:00 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::4c:25f5:287a:e40d]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::4c:25f5:287a:e40d%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 10:04:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHXLDTjyN1Z1D6XYU2bt1eMIEhz7g==
Date: Thu, 8 Apr 2021 10:03:59 +0000
Message-ID: <ec9d4e56-8ace-f55d-a999-54a553b903ed@microchip.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
 <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
 <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
In-Reply-To: <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a0e6db4-c043-4898-996d-08d8fa75a18f
x-ms-traffictypediagnostic: CO1PR11MB5089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB50898051143AE1AB9E23D2C1F0749@CO1PR11MB5089.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wnyq/vGpKW6DegHKTzFPndYSdrD3d6eWlfsqPjASKHEoC+b7YxTg4IFoD332w75Ly8XYwpLjqSdCt7hvMCCY1+BtyqhVq96s53/pX7+HL/aZBjcWXz5jzJWv0SjjHLcNfZvHKjjNX0cszlCBqJbkhDQZoPFsvLEPBIZc8GEf2pwDMdrrzkoeUUaAQUec4y+jiOOjQllRlRf0ANKlACeu4s+t7pRJWGgFUjhjoEBoPGbO1q/mvywgY/PIaS1KZrvFFBwwa4EC/CtZP9GuQZRLQkLNoLnV87szlB+H+UhxLIrFlKh+1UQ08TYU1LIlnNk/OKqatx0vyFlXaAswwubesN3I9VRRoB02dfW1vUzCyBMbQUg1I9trt34XP27/gCh3Xzl73X4JYKvAZg0zWAkhneZqAibTtFY/wgmDy4weexZZqizutbxSzIEfdBQJ9p+753L48nvC9ALQ/ITCjlybOGq5+NFIuUKElYKKMIpAT5SyNsWFH2+1sNyfohM24P4oTDnTokhPrcpopqVhe09UIPprOE0amQq1ZVb/wEXMPDIobYsWHv7AcX4NlH57Q9hHWswgXvUBTx/Vo1ZpajPuDB0Het+s2AmZex2zVovuFPd7Ai42D+kidn+Hx6uUQQs1JuDl9UFmuBABU4vgZNv9FuoA4XZGtfExfXFuYKjIn4yU9IlwE/Ai8MxvsV6GdjIRyqrwxRBa673s+wokdDoSTwU0/zyHXHT5Ee9Gdkz5sjNDZulFoxBXFfxfJ1+GsFLNdrEFfLD2fTKCXKuoV+0xmIJv57w7x8EMddG7nE0oy8s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(366004)(376002)(39860400002)(316002)(6512007)(36756003)(53546011)(6506007)(966005)(478600001)(4326008)(6486002)(54906003)(110136005)(2906002)(66476007)(2616005)(26005)(186003)(8936002)(66556008)(66446008)(8676002)(66946007)(64756008)(31696002)(31686004)(91956017)(38100700001)(5660300002)(86362001)(76116006)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TnN3L2NsRjBHc05PSDcrNk44ck9OUTE4bzAzL0NmSXN1c0VNSnpKYVJFeGtY?=
 =?utf-8?B?dmtYZXFYZDN2WUllejNXNkpnRkZsaGk4aCs4eExjR0pGeVc4bmZrTGw4cm9P?=
 =?utf-8?B?Z0dXaWZzK0wyV3FnSXc0a3pGQXU4QXY5dTM0OC83RklsVlFGS1dvd1dvcjVP?=
 =?utf-8?B?R1RMRDhXU3dSWENKeDJMQmF3eU5KTy9ocmgwVEFFRFNlNUlQRndoQ045TU8z?=
 =?utf-8?B?MVZpREFOeGdxRm5WbFBybVNBSzc1WlJqWmwvQWZSQld0TG9ud1dTaFM0YjdK?=
 =?utf-8?B?bU1DZnBoTWd0ZHYzY1dEQlhrVUhYc292YjZTMzQwZ3R2dmx0SzZhVFk5T1lD?=
 =?utf-8?B?WEZHWUxZWkZQaytkMDFRR2p2Qy85ZWRJMnlzUkJ1QjFLWUhUOEhjTmg2aUli?=
 =?utf-8?B?WGI2a0FHUkd3YWZwYmViTTB2N1RVSlU2OVZpS1d6cWxRdy9ZN1VGdnNsWFJU?=
 =?utf-8?B?dTN2dlA3b05XWkdJS0k2RnNFVExMZkxJVmVDdVhacmprTjFxZHdubzVZd3cx?=
 =?utf-8?B?NFVTakc3NUh6MjVPUjU5QzhWN05DY0hTazNpYVYzRFZEaHBkdURjMlBxN1lZ?=
 =?utf-8?B?Wlh3MkZUQkFEZk96c2Y5WTJSeWJ2ekdvTVBSRDF0NzhLRms5VFFrZGU1YW9R?=
 =?utf-8?B?bC9PeUI0Y25zVVZFdHBnVlR0K2RrcVNpS3hkZTZBMDczR1NzZ0djTmI1SXh6?=
 =?utf-8?B?bVdnTHU0VFk2VmI0RGlndHR4ZFVnS2JLOHkyTC92Y1pPZTFjWk55bW82Tyty?=
 =?utf-8?B?aGtCK2MrL2VXbVh1bnhRSVJlUHBpNHZkTkFBVitTcG9JMlZMYWttMG5xSFVn?=
 =?utf-8?B?Q05EMjJPM2hiUVRVWEZIVDBmbGJRMW1XeThwRXFIS2VyZXZGMFE2R2tTQnkz?=
 =?utf-8?B?d2RXa2NnSG01QngyMFhtWitkQzJwS0ZydThCdFlhOXhZc3FGbFkwWnpkYTlE?=
 =?utf-8?B?b1NoUTJFekk0Q3VzaVJ0c2JmNU9iMVMxakVVTnJGT0Q1RkVsanRYU3p0Q2JH?=
 =?utf-8?B?a2MzU3dNMkFGUjgyQzVjK0JrbS9jYlArR2szeXFoMEgyNFdrem14dXo5RFIv?=
 =?utf-8?B?YjludWVKc1hoKzBRaXJUR29Ealp4cEdFOEU1Y1FMNStuK3lhQ1JRTVVQTmw4?=
 =?utf-8?B?Qjkwc0J5a1pvNHBqeFpTSjN4TlV4SVBCVnIxQnprQVA0eGx4VEhXcVJxR1ow?=
 =?utf-8?B?TEJVeEVsZEp1SVlGM3l4bGlCcTFDdy9jQUZwaDk1Q3NGVk5VMFY3b0hQRWlI?=
 =?utf-8?B?UjArMEtLd2RhOGR5R3B6Zm93cndnZURrU2JQM2FrVkN6c2ZzOG9CMVhLcEVX?=
 =?utf-8?B?UGRBekxDRmgvMTBlQjBaaDBvVTI3Wks0T1lnME5pWkpZRGpYOVR5THVMc1Qx?=
 =?utf-8?B?cWR0NmJ0TGU3UXl5UmVZTHZTQjQ0WGd1Y1JLUkk4YkdrbjgwRHFJWVJvMmN5?=
 =?utf-8?B?WjVScFpTaUVlR1h6RmxDTUVMTUJzZExodmJrNUNoMm1kRzlGdEY5dUdyekxu?=
 =?utf-8?B?bzFZWlpMOEg4NGtqZllYWTZBSnl3d25BODFTdzNLZHdWNGxUVitmdjg0d2l2?=
 =?utf-8?B?SFFqZllFbzhPYTF0UGlRLzVvSStrQVdCMyt6WTlBci91N0lvMUdVQ3JMd3FJ?=
 =?utf-8?B?dTA4SVE5QlJLVy9CQnZXSEJJVnhHN2FJWWQrQVdMMlkxYlVvTkRUQkt4MDRD?=
 =?utf-8?B?bnp6Y0dic0xZano2NDU2WXJ4TkpjZVBNUDQvaW43RVA0MlA3VGxVcVdtQ1I2?=
 =?utf-8?Q?vwHpM5r9zTIn4GmNxg=3D?=
Content-ID: <F77683E17D6FAA4F903D6B7914BBC94F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0e6db4-c043-4898-996d-08d8fa75a18f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 10:03:59.9922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7zTX74TLu04wVQNHMgIUStGm4QmBvSM2t+831FGblqYLR7Mqosz+TwarUMWoy6P5hp6N3KPs8fV4RicKDN+2yHEACt3dGWFdhMUm8OY6ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_110408_515332_4585A8F8 
X-CRM114-Status: GOOD (  14.92  )
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

On 4/8/21 11:21 AM, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 4/8/2021 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>> Hi,
>>
>> On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
>>> +static int
>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>> +                        const struct sfdp_bfpt *bfpt,
>>> +                        struct spi_nor_flash_parameter *params)
>>> +{
>>> +       int ret;
>>> +       u32 addr;
>>> +       u8 cfr3v;
>>> +
>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>> +       if (ret)
>>> +               return ret;
>>> +       nor->addr_width = 4;
>>
>> Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
>> will be called at set_4byte_addr_mode() time, resulting in an illegal op?
>>
> Since the spansion_post_sfdp_fixups() adds the SNOR_F_4B_OPCODES flag,
> spansion_set_4byte_addr_mode() is not called actually.

right. Do we have to undo this somewhere, i.e, call
spi_nor_set_4byte_addr_mode(nor, false); ?

> 
>> Are we safe to modify the core and do the spi_nor_set_addr_width() and
>> nor->params->set_4byte_addr_mode() before parsing SFDP?
>>
> It sounds not safe to me as there are some discussions about addr_width.

oh, yes, of course, because addr width and 4byte addr mode opcodes are
discovered when parsing SFDP. I need to drink my coffee before writing
emails :D.

> 
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1611740450-47975-2-git-send-email-yangyicong@hisilicon.com/
> 
> Best Regards,
> Takahiro
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
