Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD9FC04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 11:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C63121019
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 11:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWemw0Jp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="ST5Z/dIp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C63121019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQKRFHudEjkUfnAsHLaQRI/qSRUu0nWpuya6b0vb4+g=; b=tWemw0JpKDov79
	sTEEVDcJSjEKcLpw0W9KniF+LKgMn0Bo5DAAALazTjidQwW8+6y/Oir/V5wypd2qovysPR2t7gu1L
	8Il9uja+WdjetvO7WRb8cEGbf02Wbqqic0y+DMhHd99p5L5wZfdJT0lBp+zeORzOl3s/94EgGRNmG
	GY6LaVT3nwbeOgCy5J0QKjC1NerKfgQLq4AY9CsWCdO2k4X/lMldk0OCqTqN/W95sBGLB+LuyBssr
	5ZCiVOY+yXfK6fiBQZkBMDIffhVbueEZaWntrRBs7nWRfwwK4ILi+y5Om0waOkm11yr0W5EZMj3gY
	u5SZppC7Jj6q1ihHux/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOKrO-0007hw-Vm; Wed, 08 May 2019 11:35:42 +0000
Received: from mail-eopbgr740051.outbound.protection.outlook.com
 ([40.107.74.51] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOKnD-0001GV-OJ; Wed, 08 May 2019 11:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5znCPRPKBRTF+JsmgIj6aBz2AD2vefu9H7uU0wxS3Bk=;
 b=ST5Z/dIpKXaTMbKZaXyicKhHdXlzGRr2cvNr4QiUG7GY+t2c8tYrS8HUzZk7zoQX2Sqwe4wEAPF+A8JRA7yBnsNWwHplIEFbWx98uHp1nu1y/AQc7kTAAlpBLD/QdcBgnMXwfvYN222CXVA7LOxKe+AxnGT9uWSdnYuXbWlIovg=
Received: from BN3PR03CA0101.namprd03.prod.outlook.com (2603:10b6:400:4::19)
 by DM2PR03MB559.namprd03.prod.outlook.com (2a01:111:e400:241d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Wed, 8 May
 2019 11:31:18 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
 (104.47.38.57) by BN3PR03CA0101.outlook.office365.com (10.174.66.19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Wed, 8 May 2019 11:31:17 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:31:17 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BVHaS024094
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:31:17 -0700
Received: from NWD2MBX7.ad.analog.com ([fe80::190e:f9c1:9a22:9663]) by
 NWD2HUBCAS7.ad.analog.com ([fe80::595b:ced1:cc03:539d%12]) with mapi id
 14.03.0415.000; Wed, 8 May 2019 07:31:17 -0400
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "devel@driverdev.osuosl.org"
 <devel@driverdev.osuosl.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 01/16] lib: fix match_string() helper on -1 array size
Thread-Topic: [PATCH 01/16] lib: fix match_string() helper on -1 array size
Thread-Index: AQHVBZFHmipnRagpkkSQZ3QUXGEfCKZhWwOA
Date: Wed, 8 May 2019 11:31:15 +0000
Message-ID: <c8cfa5dbdfc0b0665d1b48f37ba57c3ec1233197.camel@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-2-alexandru.ardelean@analog.com>
In-Reply-To: <20190508112842.11654-2-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.244]
x-adiroutedonprem: True
Content-ID: <BE083E2328EDB84B98DBA67ED168014A@analog.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(199004)(189003)(316002)(476003)(118296001)(6116002)(446003)(11346002)(47776003)(86362001)(356004)(336012)(7736002)(54906003)(7696005)(426003)(436003)(23676004)(76176011)(2201001)(50466002)(106002)(8676002)(186003)(305945005)(7636002)(26005)(126002)(102836004)(2501003)(7416002)(110136005)(2486003)(2616005)(6246003)(486006)(229853002)(3846002)(8936002)(4326008)(36756003)(14444005)(14454004)(478600001)(2906002)(246002)(70586007)(70206006)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB559; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02c3a8a0-d0c1-4c80-7ddc-08d6d3a8afc4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328)(7193020);
 SRVR:DM2PR03MB559; 
X-MS-TrafficTypeDiagnostic: DM2PR03MB559:
X-Microsoft-Antispam-PRVS: <DM2PR03MB559A4A2108CED3746037F44F9320@DM2PR03MB559.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: i1sZYo6+MPS+6/7XgMeGmPbqVIlaaoyZKrXQV6LiPzw6/R3K/eQZlAf95MbvTFj8RMJWP0II8lSInFCoIulDFlCx/JsNMygVVJ8q/LRE3z17s0tpdivj0+b/UasOcUpBHIp3OQfHj2kaVyCS2BeUcnIF5LWbo+8vDRMk7TLK+H8tp8dbpETe3ScxHUYDc/wd8D9/9BbnuLxjBKjEY4u7N/823NDi/QpVZP4q5veHEW/X50PKJ719D70vsHOHlWnIvzgNsRQbuw/2iNQHJ6hMflZpi8FSBrssSpTJWXoBQ62jnwr7L3xJJTrS49pFG12Vg/fkREnj1kwJSBIkhC1aiEA+1Nhy/J5FlWq9cKCtZDZjNHFsY8zmnAX59M+MVqQAkGrEfd0btkJOD7ftl06mPopshHrrs1UdWTFfMEXIMS0=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:31:17.5189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c3a8a0-d0c1-4c80-7ddc-08d6d3a8afc4
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_043124_245123_F2CA809C 
X-CRM114-Status: GOOD (  19.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-05-08 at 14:28 +0300, Alexandru Ardelean wrote:
> The documentation the `_match_string()` helper mentions that `n`
> should be:
>  * @n: number of strings in the array or -1 for NULL terminated arrays
> 
> The behavior of the function is different, in the sense that it exits on
> the first NULL element in the array, regardless of whether `n` is -1 or a
> positive number.
> 
> This patch changes the behavior, to exit the loop when a NULL element is
> found and n == -1. Essentially, this aligns the behavior with the
> doc-string.
> 
> There are currently many users of `match_string()`, and so, in order to
> go
> through them, the next patches in the series will focus on doing some
> cosmetic changes, which are aimed at grouping the users of
> `match_string()`.
> 

This is the duplicate & should be dropped.
Sorry for this.

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  lib/string.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/string.c b/lib/string.c
> index 3ab861c1a857..76edb7bf76cb 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -648,8 +648,11 @@ int match_string(const char * const *array, size_t
> n, const char *string)
>  
>  	for (index = 0; index < n; index++) {
>  		item = array[index];
> -		if (!item)
> +		if (!item) {
> +			if (n != (size_t)-1)
> +				continue;
>  			break;
> +		}
>  		if (!strcmp(item, string))
>  			return index;
>  	}
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
