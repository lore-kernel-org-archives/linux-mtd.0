Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92075C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 11:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0749021534
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 11:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mOM0Pfmz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ze1mMIr8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OzjWZP9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0749021534
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ndm8tnhUnqH7H7xu8/uyYnx4VE4XlCQDdaSPdxEG48=; b=mOM0PfmzGGawziW+QqH7tE2bG1
	KAz3qju4v09/odb9oL4/cyf+wCvEWzVMbgB2B+dsrWeuy5yCK3VnC17UgT+fz8P27k11T+ERYp0IL
	Fv5nd95xcXFdM7cglXjbvnN8sRyxCJYKcBddyfIRLwq4q7NFJPb6mw3tGBalg6qegUFuuEF5JsZm+
	MvneC2rnTHyS2WZ2lp0wV/MuPbEibPmev93/HOM0SnELsgZgnFlzlhfRDyFcKfhQQjDL4AxgR/9y+
	5dQwr1h+cbY96FZHQ3sQxQxrHSFrEniC+Fkf0h52NbJiRwz33f/SR4YP7p0EM/t5cMH1emb69226y
	SEom64NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kixx2-0001Gf-Rv; Sat, 28 Nov 2020 10:59:37 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kixx0-0001Fw-DG
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2020 10:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606561174; x=1638097174;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XQ5Endbh612e6sTS1PflIxZ7qdtUzKpEnDu5/eHBP7k=;
 b=ze1mMIr8nFMx/zJRtJRuyraMhjg3UkZ/8Ilm/VmbYqFanYWOtS4RU2Mm
 T09+y5sXJgtyG8LskFxatXPhDtA0t9BSN2aimEz0vkcPMYXpgaVLiqLkJ
 yO6Rc7rmaKEo8dnGsVikMEDbZJ6313FX/a7CkJSc8WYJBWkLOmWJM6IGy
 sKq20JAsr0rY6NjU/x9e/mVmtz5/XUbXDRWr54UCQiaGUtz7TjNIJkRcn
 P+bhv2XfPwVl5y99XhnREr+XNFonXvSN7J/TU81mvnQ16yg1BpX7PypBo
 4TC5NiovibBPFkolCXZcUey8FKhNqfOsB9DEB5sWZf1v67Zm0HRJQqboY A==;
IronPort-SDR: wxQPCn+ATf9O9CprgmCKc4LUyOrQzVz4UIeQHPPlbglbO6dVgMpTgJZJFRX72alI+5QLN7t/Mx
 6OCOO3fXNmCwavw52oCy9GsSL3IxknWoeN58EnDkr1LBPbLaI4g+2mm8R+S66alG2qFttTClqJ
 coerG2JzxBakOV0uSMgOF64LECOSrKMEwb35gw66bGTmX6x4fgGdgdI7BQy2K54+vWrSA8Nzxw
 GfyRUozXLu0fTIxGOvrdP+1/iVN2tXaxJkmd0Lx8gs0wb/O8+wnLs99Br7mQiQLTB8l7Ev+dKj
 2NQ=
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; d="scan'208";a="35282272"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2020 03:59:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 28 Nov 2020 03:59:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 28 Nov 2020 03:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd+DULFjZubZO0EG9pFhtb1rP9YTYzIpt6i/U83tmmRrWNH+RBa2bkdOvySvx7LGI7UQsJqdZKInVAkQY2qCDo8ZBQboA4RXLp3CB6k2h7De5DpHg3ckhl9oUaFolQjxaaKcOrNtpgvKEbZpC0Pz0wqeauKyLP7zZdVxis5krMbmHQR2zq1ByVaNt+MBb1JFfbXYi4agZhmhUTu45XcUxx2adSYeZKAdmZjyU63hH/kOH+nHFP5nZW+hVLBrUGW/FaRS0PvZ3guodzL3BEUpUA0qwesRAxAPowGKmDZaZmNzsukRqFydnTLiltHgcAgX8gyt6prJG0pbzggWimSNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ5Endbh612e6sTS1PflIxZ7qdtUzKpEnDu5/eHBP7k=;
 b=ERPWS7phehmpWJDhTrrKE6HdY6MF+aEopGZIRQyJWsOdAvEVIBoAxM7cTE/0/qlv9nXroM/ryuOLN3C1lFJMv1rS/O5wN4V3bHAQ3P4G+K0EOjsfMct9NzjlUUbDhNIGOUCxPnveCJDYbWwbLhAbjhTOOT/2/RJ6LrPsF+eyRDC1YglOBbDiMgpvFH2Ullh9aE4OuOzZ1jH6iHtYo1wnyqY3QkCgRONazk0z+Kj48gLwP8tjGlHDTgeg9wdJJXlVi1A0NSWTBMASME5dWisWqJF9LFm0SFk/4eoCkYwgdt2RVwt8Pj9m2XJ70dLlArykLkOnGdUN3p/If1vgJYsmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ5Endbh612e6sTS1PflIxZ7qdtUzKpEnDu5/eHBP7k=;
 b=OzjWZP9kPhQI2U31qI2/On7CH5yJgY22ieJdFTx3Rvn+KyrOFKvhWh08Mle7+oYcG4NDeUzqBYi3UotuGaeeVa6+CtlfE+eFDv6il233m5NmApTTzVkXshzFftKoFgYOzlXIrGBV+NgVqIWiobIAN2J40i9beHE/YLjMMO/iX3g=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2832.namprd11.prod.outlook.com (2603:10b6:805:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Sat, 28 Nov
 2020 10:59:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.026; Sat, 28 Nov 2020
 10:59:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
Thread-Topic: [PATCH v2 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
Thread-Index: AQHWxXWLYEkUgBO3xkCZq/N6gX5vSA==
Date: Sat, 28 Nov 2020 10:59:30 +0000
Message-ID: <939dcad9-b556-ea3e-9eca-c008a86fd01b@microchip.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201118182459.18197-3-p.yadav@ti.com>
In-Reply-To: <20201118182459.18197-3-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ded96399-0819-4146-252e-08d8938caea5
x-ms-traffictypediagnostic: SN6PR11MB2832:
x-microsoft-antispam-prvs: <SN6PR11MB28326B985FDB7F380F938879F0F70@SN6PR11MB2832.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0OiGApRGHedECaq96YBhDUu2gD8HtKHR0QFHhFbLFJUykhzdKs0ltLQESx0e1vUukjpdVJUq+R7pngVJ1XZBHERSOA/QvapjC3QALXGL2HOEHj4vuaD+E00swItQhRZ4/bQio74JNQqRIJaJq/1XVCDbAlQ+GIpOvjj4S1HGXXLdP09YQIyA1k+45X4qaulpJZbVGl9tGw/1AlliyXB4PXK6pjxhb1NRMsk40z/qr3odV/ZySmKCWJ51HrdCHlzQ0iwhF5Uz2SMYj2T0x8UWCA+ne7mKndLpHp6FIJBdVuds+VHiii1drpMw/pYdB211GXqWYcOunbkIfmQFci5DX53DFV0Vz5QoGL3rpkEF3/TPQsKu4poEw+Js9D+Ozi6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(346002)(396003)(366004)(376002)(2616005)(83380400001)(6486002)(36756003)(31686004)(478600001)(86362001)(76116006)(316002)(6512007)(53546011)(71200400001)(64756008)(66946007)(66556008)(2906002)(66446008)(66476007)(110136005)(5660300002)(186003)(6506007)(26005)(31696002)(8676002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?c2RsTEcycHhXWFhBZCtlTVNFQVNzR2JCUHNwb3JjRExUdlFGSm1GcEZ2eEU5?=
 =?utf-8?B?aCt0V0dpYndXMERObHprU0FLS01aWko3M0R5dklrb0ZIdEVHYWxKcGRZMm1N?=
 =?utf-8?B?SDhsV2RmOWw1VDBDaVlpWVFDNWpxR01vZUc5ekhBTEFPNnBseDBaWFllNkVx?=
 =?utf-8?B?TkEzb3pqNnE4ZnN5WjRkWi92RlplOGdRRHdDK1JaNVdtTnNqbXFXQ2Jpc29h?=
 =?utf-8?B?UEx4MGlOM0RwS05tc1NEQlYxZlhJNXZ2cFBXeXhZcEZ0a3FiQlBrK0YwYXpF?=
 =?utf-8?B?RUlHaXNtd2FnOHVpbDQraWE1RTFWNmVYd0hwYmZ2YVdpY0JhMy9hTE0vdWpr?=
 =?utf-8?B?cForVHNadnFhRTkvS0RmYVV0b0wraFRHUngvYThOK280NHVlQkxGTzFvK25m?=
 =?utf-8?B?YVVRdkNCWFBGQVRtS3I3ZGtnUGVhUndEdzh0cXVBeVRDcGxQa3F3Ky9sWmlT?=
 =?utf-8?B?TzA0QllmM3VILytBZzlETGNsZy9NVmt3ZmUzTEdocXV3Z2hOeWNYUGxOS0RV?=
 =?utf-8?B?NzRpWiszenRYRUZWcU9ld2greTVOd1JNejMvaXdVQ2dOaURGei83MFVySEpl?=
 =?utf-8?B?SG5IUnBhT2pQVmpZK3BrQWhVeU9OdndhSUpNSFMrMmFjb1BKZ25zQ0c3bEZp?=
 =?utf-8?B?Tnh6UFNRS2FIWkN3ZXpReHFEWWplZmJjV1ErWUJmVlhqOXBwZXloQ1ZBVnNL?=
 =?utf-8?B?S0RVbldmRUxCWC8wYzF0eWNIYUlRTTV5ekJqYkp1S1pjNkgwYm5XM091S0xL?=
 =?utf-8?B?VEduQWZXUUhiTXNJVUxGOWxBRWhrK3BtZ3dpY1lMNnZnTlV4Y0pOUkNwK0FT?=
 =?utf-8?B?YkU5S3ovZEhFSXRlUHoyY1pGQjNNMFJudlVLdWYrWitLQWlLSytYTWltSjZF?=
 =?utf-8?B?YWVpVHhrWXhOUTVOSGZXVy9aUHFPbmhrT2V4T0VBSTlBRlFocHJQTk5PWkpB?=
 =?utf-8?B?QVRmUVc1L3NPRXNNR1BpQXFJZVV0SVRtdUgxQUJUYmpVYk90SjY3eXNRdmlq?=
 =?utf-8?B?SmdmYm9jMDN3YXlnM3poR1QvSzhGeFVKYm56U2dmcGRMTkJQQUw1cFROU0RB?=
 =?utf-8?B?U2ZsSmNGVEw0bVNCbGw0a0taQzI2aS9BNjZsSGtvS1R3MEhnWjFTQ2lscVJi?=
 =?utf-8?B?cjJiMExFNFY3VjRycmdiTWhsMHhpTGh2TytVdHY2a2RteEk2N3Z2djdqeUN6?=
 =?utf-8?B?V3R4d0tUaVdSMEdBQWkxZG9Pamw5QnI0UE1SUklZdHNmMnN3aU1tWlFzaUR2?=
 =?utf-8?B?Vk16SFN0dEdvNnpnRU9pK3ZJbXZ4V3NGVnQzRzJZT2V3UUU4NUNQYkFNbGhV?=
 =?utf-8?Q?oLwXAjg2pyHz8=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <5D9F1D6CC489434384B242E9823CE890@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded96399-0819-4146-252e-08d8938caea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 10:59:30.6413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbwxInlz3CD/ES+Uu09kKseb4EP4hJPyr5VUb+KXj8odBgDeQxt40G8+Fw8iv2LP64ayrXT0Y4wG4+ZGFDPmJnG478VbCyz0fCL2QUdg250=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_055934_656758_6BF02659 
X-CRM114-Status: GOOD (  25.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/18/20 8:24 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Some flashes like the Cypress S28 family use ECC. Under this ECC scheme,
> multi-pass writes to an ECC block is not allowed. In other words, once
> data is programmed to an ECC block, it can't be programmed again without
> erasing it first.
> 
> Upper layers like file systems need to be given this information so they
> do not cause error conditions on the flash by attempting multi-pass
> programming. This can be done by setting 'writesize' in 'struct
> mtd_info'.
> 
> Set the default to 1 but allow flashes to modify it in fixup hooks. If
> more flashes show up with this constraint in the future it might be
> worth it to add it to 'struct flash_info', but for now increasing its
> size is not worth it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> Notes:
>     New in v2.
> 
>  drivers/mtd/spi-nor/core.c | 4 +++-
>  drivers/mtd/spi-nor/core.h | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5bee7c8da4dc..80fbcb9c0828 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3054,6 +3054,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>         if (!nor->params)
>                 return -ENOMEM;
> 
> +       nor->params->writesize = 1;
> +

please do default inits in spi_nor_info_init_params(). A good place would be:

--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2885,6 +2885,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
        nor->flags |= SNOR_F_HAS_16BIT_SR;
 
        /* Set SPI NOR sizes. */
+       params->writesize = 1;
        params->size = (u64)info->sector_size * info->n_sectors;
        params->page_size = info->page_size;


>         spi_nor_info_init_params(nor);
> 
>         spi_nor_manufacturer_init_params(nor);
> @@ -3430,7 +3432,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 mtd->name = dev_name(dev);
>         mtd->priv = nor;
>         mtd->type = MTD_NORFLASH;
> -       mtd->writesize = 1;
> +       mtd->writesize = nor->params->writesize;
>         mtd->flags = MTD_CAP_NORFLASH;
>         mtd->size = nor->params->size;
>         mtd->_erase = spi_nor_erase;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 0a775a7b5606..413ea311e632 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -197,6 +197,8 @@ struct spi_nor_locking_ops {
>   * @rdsr_dummy:                dummy cycles needed for Read Status Register command.
>   * @rdsr_addr_nbytes:  dummy address bytes needed for Read Status Register
>   *                     command.
> + * @writesize          Minimal writable flash unit size. Defaults to 1. Set to
> + *                     ECC unit size for ECC-ed flashes.
>   * @hwcaps:            describes the read and page program hardware
>   *                     capabilities.
>   * @reads:             read capabilities ordered by priority: the higher index
> @@ -222,6 +224,7 @@ struct spi_nor_flash_parameter {
>         u32                             page_size;

I would put writesize before or after page_size, because they are related.
Also, it would probably avoid padding.

With these addressed, one can add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>         u8                              rdsr_dummy;
>         u8                              rdsr_addr_nbytes;
> +       u32                             writesize;
> 
>         struct spi_nor_hwcaps           hwcaps;
>         struct spi_nor_read_command     reads[SNOR_CMD_READ_MAX];
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
