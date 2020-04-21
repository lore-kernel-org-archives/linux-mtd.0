Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FFAC2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 05:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225412076C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 05:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hT2kPH1I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BVZIInV+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="b9w+T03y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225412076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdSef77ClcYnmu74oYM+gHGqWEYnPTLXNd23IYv6gJ4=; b=hT2kPH1ImusVQT
	f7j/3/0/1CwzO4oNM9zWNHH167fzDjNA2JvOatBSn0rOgp3JmRMVILill9cuOvvBHJfk9ZGV2/8HN
	B6lBhd3/kBl1j1hAhx4vLO8OlUP2/ygLHN+7J7tO09EYg+Qvh4BGzSvoydoDLBgPw2GHC3n4aDI1z
	OLIOiE64aS0ZRFOCpwmKUQrV3GSBBfitKv/sbQ1TX77EnPRfDCw9w8B0qSB+E8tqYzdxPqxPTJ58+
	gbQYNz33cTovJAXeDb94kJlCzQAr2y4ZEK40ztmi0WeMriClMjwgk/tOeNMkc6EdRBbjVtDw/Aven
	uEqPd4tgNdVq5pRG4f1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQlw6-0006X9-FF; Tue, 21 Apr 2020 05:59:10 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQlw2-0006Wc-H0
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 05:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587448746; x=1618984746;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=scyBy9HuMD/uwujIrZ8jwkMLpIhsDL92fANhUMX3R5c=;
 b=BVZIInV+1/as3wf7Nw1nTLIWolKtmJW1TG4Zc+UJYgauWIvdBBOe+4ux
 LdwsQwRm+hT+kA8X3slIVCg+8AsM+N9t9AL0FHq/+AQtjGaLOuANOHZah
 pwuics2FxuiUiS0f4D5797oqU+Qx5UGigEgU32CvI/SAhftbxpihlpxY+
 xq3LtwYSbH5Mf00op9hTZ1dzbYcRovJnDc3s3UYsRWJ38f73/Fg3PfvM+
 +qsmFkxOVSY2VHtydhjQHlWAy7gTj9sZw4zyHzko26xK7xrFhcydFATKs
 lFqGRkxjjrkOq+8t4s08SsayOc2RqR9yEjoYKvPyJgUQP+gRvM27Y3Il0 A==;
IronPort-SDR: iCHmPULFzOA9JDzQBecWZ4EE4Z1h5nd/T6pVd9AMAQq9EwRTyT/b4GTrvv1N6dsNoyKa78jELp
 C8PPokk/J69Re8lL/fjWNwqW2OpVvhtp3KyXTZtIhTa1YTPWuwnfwjgv07+ku/8YdxLc+7G5WE
 gnx/yxLI2CYXL6XEnBjMaxe4BnSkW1Z+bNMiB3St/QHZC8qPlQi4+jkwcgk1Fd6ISi7F70AJQp
 ev31vxm0CsuGJFpBLeR11JzUTN54g9RUvXtIZFP4+VXBcZzfHgGKo1xA4Vrzdma3vyIMFh5cY6
 wvg=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; d="scan'208";a="76663580"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 22:59:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 22:58:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 22:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYdy6mfwogR2QLPklW0zap6Ru6Iek8c7RFTKMU1lkqDiWu3jpOlyUcouKQrLt+OBNPM3peGB3YdzPc1e/FD3JPB0RVF7FpOxE+mdW1UzCZ9ksw3D+2iMD7ETThDRVBAv6mVetcTsV6jeiuFQ9UfxplL+SO2LiOCG2BQXtvS/NFH55VWNOJiGlx7FKONyyMJOgYhUkAEJ1QJjtQdIDU75KngLd+V0ki2wF8yIjUK6oVJfwWTPf78nKgHc2q9FG/at5bNIxML1uzVEZ4qzY0F0DF523VBVbBGLCwEeeb9yKfTJquG8B/pB10H+g42knc6IVJ8Pdg0ZadRmAFzTQIEJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l2XqV8Z8ZO8q55qQIUjbcQDeiwGP4yzo+iR36C7F7E=;
 b=e7kPsALz3NVhEevFSTfb+NJQJQIfs4Yt5TCMT2NuB2e+5dmNIByxPUzX39A0yxa/p0+TQ7rlmXEDFwxLzIQmut/XzdnH3t4iHjzh7BfoqENUR4N93lHCBJRJTvFmPruERBBX7eWs9XWUG53FNmj18ECAmfGsOfrzZJdaq+SRhbDxtLyeSid0qxVGH7VtUE/cS6cwQQAf3WFhulFVM9GDUCALvipeAYFsuR18fwl78rDCD8nmxcvkjLK1+1PEKVzsOw+6QKmAjBBOn4l1W8ZEf8aTUN6nkrAtU8t3n7Ye5YHwPOLTqQs4Fw2/IHsPoyCyML5W2i9kFPBQI1HA11FREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l2XqV8Z8ZO8q55qQIUjbcQDeiwGP4yzo+iR36C7F7E=;
 b=b9w+T03yvb+FUgxh9nR9Le8HTPw5nSk2dYtpJXTdByUQcUp2jH/TRAgQmHPD9jgmXEIusV9QfbMr/XztMHsmLuybYbFwvs6wX0KXYJP6nz9zDRzAMrZLp/EMWvClOmNOPJLMvQcxQGtv1HVuFY+WT0SzUGp0fLsooLH+FejAITo=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4225.namprd11.prod.outlook.com (2603:10b6:a03:1ba::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 05:59:01 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 05:59:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <chenxiang66@hisilicon.com>, <shreyasjoshi15@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Enable locking for n25q128a11
Thread-Topic: [PATCH v2] mtd: spi-nor: Enable locking for n25q128a11
Thread-Index: AQHWF6H0k2YwF8f3jUSj/e6PFDlAPg==
Date: Tue, 21 Apr 2020 05:59:01 +0000
Message-ID: <11176639.PLISSiUltO@192.168.0.120>
References: <1587103677-244754-1-git-send-email-chenxiang66@hisilicon.com>
In-Reply-To: <1587103677-244754-1-git-send-email-chenxiang66@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec40338c-5086-4861-5012-08d7e5b91728
x-ms-traffictypediagnostic: BY5PR11MB4225:
x-microsoft-antispam-prvs: <BY5PR11MB42259CE8DC33E5D71E94829AF0D50@BY5PR11MB4225.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:415;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(136003)(396003)(366004)(376002)(39860400002)(346002)(66946007)(76116006)(2906002)(91956017)(5660300002)(66476007)(66556008)(4326008)(64756008)(66446008)(71200400001)(4744005)(86362001)(54906003)(9686003)(316002)(6512007)(14286002)(186003)(110136005)(26005)(8676002)(8936002)(53546011)(6506007)(478600001)(81156014)(6486002)(138113003)(98903001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U9EosLuQ1HKUJgM+YvHO8c00iyYzIFQO+XX1JRKDsC8zGHC/hBfuJznmov/xMhuODKX8m5xhfqcT3577RrvX2ZbZmVQJa3VB3p+hsIWeTs4HeI7w8+9/R+HoV7Sxn1IXIs/6xz3XIAsfbUIcpj00IRszWrFNemThIO2MD0GB8f4n0lUctNHQSOCgOaLga9SBa3OWGg2BxlwUi7IfE58QLxKXOaeqoBh1DYJSvEGRAK+yDAnVAcMUJ9QOH+CfpveLu2jIRo4omSkHvMg5YZcM6+1UMCuikl8a/V7cyebjNVQ2lSZq2Pl6EHzcLe4Lwr4ZWOKyXN/KT+WigKWK7n9exhVhrXa3d2nGIkRcvQLnQ+i098kOA+EXwFQzTGygSM3IDDu7mOhh3czwElwvphZYqArpSUrUJjNuf06s6OQ8vXjP01yxcdkS0XOcNa0vU+geUqod1NymAjCQFAImTGZ4UUI8zOHlDle4/Di68g7+M7D+RMCU0kbMqVeQmkp6ZJONDE+BTuq9VqDGN1DBfw41/Q==
x-ms-exchange-antispam-messagedata: Ibm65uM2JOOMbNd6J5jrT8rBxK3SLdQigaKzrmZVgX4SuN+NeNdsX79sRweC/KlqQzxSF/p2iy08l8jKeiAzzTQu2Y85LqkAzel6TxoZ0WTdFVftFUxvd0A38Vyt2MLm2usp5eW5A9LXTtUXukWUXg==
x-ms-exchange-transport-forked: True
Content-ID: <C188A85931AAEA47A2FC2F849F5FE392@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec40338c-5086-4861-5012-08d7e5b91728
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 05:59:01.4414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/dEzV3tWjfmUE9p2eyfM453Xir/D830Q3DEhSmqQncrHUZK9JxDyX+QTstq8hYbUmrIQy7mEpIA46WAvCsI75kMDeZrYa16oS4I+NVphJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_225906_811628_CC934874 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, john.garry@huawei.com, linuxarm@huawei.com,
 michael@walle.cc, linux-mtd@lists.infradead.org, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, April 17, 2020 9:07:57 AM EEST chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> As 4bit block protection patchset for some micron models are merged,
> n25q128a11 also uses 4 bit Block Protection scheme, so enable locking
> for it. Tested it on n25q128a11, the locking functions work well.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> Reviewed-by: Jungseung Lee <js07.lee@samsung.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Added Shreyas' T-b tag and applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
