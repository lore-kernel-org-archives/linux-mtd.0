Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F8EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:40:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E429520C09
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yo+LmzU4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tWFJQB/I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="e+VR2Qs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E429520C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vKkmrhS+B9hXlkulG9h3FQ1yVlrJA0DMT0MyFJRJ0NI=; b=yo+LmzU44Qjpq+z7opswwowXs
	s2Qd8t6sIkKQmoVxGbIeDVe+7JdO00XxVp0T9C//th1w7wXaHI8+bZJTNQuHFRyKCdCC3z1He0ZM/
	kxRZB90iydgnZ6FRdOu8S5/RjjKhIHSN6KMhRB3NUqsuDpp/J4L9r5FX+4/g8obQq0U4JxqL6oLOr
	x/9a7FkagrEK+atTIAoBQHWDKR1LHHxzfC2grR56EFao15AmtELxc2+6S3LbRG3EcQRsOjYwD8XUX
	M004L+5mKHutLQDVthltpfNwkuYPXbFW8i/9iYSJNF00dSsIClB/PesUxMsHgIdduU+eC4hY73iCN
	whgKFfTYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolkg-0000Mw-1G; Fri, 26 Jun 2020 10:38:34 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joljI-0007un-7O
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 10:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593167829; x=1624703829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5Uah1vh4vth8II7sa/2k5Wk8Me5C+LVa++nqobbebDw=;
 b=tWFJQB/I6kz3dYYWuRF3mLsgPXA9IcStqz9annGhX7yToDKacivAdYBu
 h/nD4WnrvEGMYxjhzmet4ATzll+ZGb2JDAXWhgVLzqJ00wRt8e/CVRG/f
 Kt4YCUw+u4b7+M0T2x7ta+2sKtwT3GHIT9E13eXzy3OAWt9IbyYumFAxn
 vrVlW+nvOQ0lSZ4JSMHd7Z/57VzCtQ5dXaT7HHGsnCl1A0iGyRLALt7N1
 tAsKTqia+mEMW7RqT8D8PT4yKex364DzTX67ZFibN3+VDWmMXxWANTSzW
 630ZRmjC0pAYa0+42lWZekAu5jOLGbY9SnrGkTpKddnsWl+JoZIA8cxsb w==;
IronPort-SDR: 3bB87EEtrv+/iee75XolhalQ1JMsSl/yEv3JsqEcsmvSXRsnK3wCFYtr6kf7TbC/xXG0IXX24D
 EVnxHh8ZlYaSM1I7xQgD3C4SdZ35t/j4uNKN7Mnp5H9nDZp2w6ZOwhvlPPnMEMq6IasKwODbMz
 lqk3BwewH416IaJkKAnI4w7Prthb3JcyG88Qf33gLTJCatrjkJShqsGqmlwiGV+Z+8CIkfcNev
 Q/R0lsOjJ/ebTQS3AAKafAVGVdb298Id9o3O8dqlkmNSP9VOOcsl+iYZTmdAFDOshTE1BhF0Sh
 rkk=
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="81000672"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2020 03:37:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 26 Jun 2020 03:37:07 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 26 Jun 2020 03:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSVnr7n8HuYHMU2cgGuRxO4kUIDQTKjYQMg4U0snEvYTpRZriM95xsqK7seLQ2SyVNDSb1w7DY+BqUJBr8HzQjBw4mH5WXNPAoT9uzl2rxQfcQZgHTtgDi6LZN8jYrUzsaxeW6JKk0NxyN0mi5+WD6/Pxpik0XGGa121bD7aGy1oaGJggztjEzpGKxcol7/a1dlFE2MJlcxjbHasHWq2WNbl/rIK6Ztk7uG1xKiKPmxoq2tLTYWMoJBGYrjS2k58giYjAfdTUQ/tS67JxW7m4bL1Gt4QxMp61Xf2JBZRzQUJC/lWfxXpKwG3PyDN6Yr7RgqiBTkcO8wwmeQPf5oqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Uah1vh4vth8II7sa/2k5Wk8Me5C+LVa++nqobbebDw=;
 b=nwm0CPRpdjTFeXpn4uNeDgdtFnKhNB5afQdMcMVUHrwKagurZDoqANjqnX+SJJK3uLy5I4mRhBdA1DBIHZMOerbMRbuOfeKYjacQqvFiewW0mpJX9lqfVnnpGkZxPOCj/405lxbYOXUxKGixHF1mdOu6sKBeU7AOf1L/2bCZvM4eZovcLajdzd50iXPVS5B137vWm/1wN9UXu16uJjPm9fhkmotFbz94HVjX5WjHu4QPRUjW0BjrDfkMPMdEYNZJAiL4r4LL01/rCMcEeWogG1YL1k08QCU9BbbLnWwkqkJOhDas3QO4SjVBW4YxY1DQSxahiZat/Y5SqUUmVRl/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Uah1vh4vth8II7sa/2k5Wk8Me5C+LVa++nqobbebDw=;
 b=e+VR2Qs5+KKKFSDtZrNmQZ+ey4jTN28pQg3AlGu/Dzb8bJSdnWEGn5VuKnS1Yft8FPDeXKKnh1adyaFK2waeIvjbnOO+5FDl552e66C6HTPT+NRgs7yYSmA5BdWpSPr5J+oXCw+mOltykOx1YIMKdz+yFr/IaK7Tzxqo0078wNA=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3752.namprd11.prod.outlook.com (2603:10b6:a03:fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 10:37:04 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 10:37:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Tiger
 Lake-H SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Tiger
 Lake-H SPI serial flash
Thread-Index: AQHWS6W77p1AFp6Pe0SUdxGSw2Kj/w==
Date: Fri, 26 Jun 2020 10:37:04 +0000
Message-ID: <881e83f9-e9ce-be29-e17f-9cac96809848@microchip.com>
References: <20200624192103.78770-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200624192103.78770-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 058468c9-fb8b-42f4-6339-08d819bcde4e
x-ms-traffictypediagnostic: BYAPR11MB3752:
x-microsoft-antispam-prvs: <BYAPR11MB37524DCB85C6402568B15C80F0930@BYAPR11MB3752.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Osf9sbAvtsreppqGn+KEBikSiL8aRpTdNcG6xsEUqIRJqvQmoh7/F5z3on3tpWqXI5Z9jsGeKtI9CzdkWUhCTJcsbcX8eiPLyVbr8Em03qI5K/wTOtxXg20lKIS45UogL0eQfurNDgbUuAFbkhA/Wb5jUdCc+U9jU/lCnkyBAlhin+OzaKroQQ6p9731zBDmWZ+/4o/SF06vZ5s/no86OgzkbA7tPMwq6jFFQiQJ91V/70/bWPT/XQLCMPHSpEmqjkwKg/QtuAUUEz6qbMcySGLTzmDncq03hjQtYJ2hcYfq/LCmzv7HSqb//WrDBkBG25KasiiDHsLC0TrD+iYsALHOQkwNY94tcU29dCB+uwtjDhhDzgQ49+pQYrbpA9Tg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(4326008)(2906002)(71200400001)(478600001)(6512007)(53546011)(66946007)(26005)(66556008)(66446008)(4744005)(86362001)(91956017)(66476007)(64756008)(6506007)(76116006)(31696002)(31686004)(5660300002)(186003)(316002)(8676002)(36756003)(2616005)(6486002)(8936002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SVOpzSXmdyqc/2HG1EAmUc4M5IYkeExe3JmjIQW1YfENbH22DJ4XGBo0NoeCzr/XcO0/oTeIPl2BJjVVxXRVheeMAlniDtBNsnwS7zElh5c7bwoLmXv0smAxvuNL7gWE90qLprJKjy8eOxxnfEmIFVGHygpSJ6Q/5wl/vIf21J6HJM+npG5ILyAaRkjmG0eBLOIPnfZCykAtMLAG5y1CvxNtVUrqgrLH8nwrqL4KIcutBlOOH4D8R4EYB8QvIis+4bJF+rAbdt3inpc/89vKTN1B/OjDu2OlLUu7NkpKAW46OjBsn7Ac8q5FEkauQ5DxVSYcAKJrz/Bw3kvjJ2uwMf8Eo1tcuTgjfi7DYY2Jn6OUfiBcK2Ntds8yFcRmFbh/titblFeTcPybaGDwvnZ4E7nu3BWRJigyM8XYgfFdXnhKdQLeeyFgx8C+hvC5LtlhLOo6J1c++hQc0aEMbKTOdx9TWg/ItDH1Q8a1g0c8NAQ=
x-ms-exchange-transport-forked: True
Content-ID: <14EE7028A3271544A6CB8B0239A57899@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058468c9-fb8b-42f4-6339-08d819bcde4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 10:37:04.6140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u45np5c76iamx8lnJFPBri/ou934UsBNI1xY54y/JRaLIn8rJAh8OPkAhR9cqqquK2KyauXInyjTs7zNlIkGrYqljr47EhARp11PwbCsaxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3752
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/24/20 10:21 PM, Mika Westerberg wrote:
> Intel Tiger Lake-H has the same SPI serial flash controller as Cannon
> Lake. Add Tiger Lake-H PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
