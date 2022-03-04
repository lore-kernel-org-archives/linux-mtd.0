Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B292C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 00:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TR1HA4Y1wOKUPLm1rlySpCIjVrf+kKnUYQ3GEweGn1I=; b=TcguQ+tFat5KOY
	61jEpVvvi0Pp5up+hI+bImLtdhyrM5Y0kKD+JdQPe3JpcROjH1ogLGKgenVNs/JS4raI11r1Mv64Z
	J6zpHtVCxOejcpaM0VT896ofU9YZQ87ZGX7iEFjNb6sPo28b7FuSXJjOvF4qq3EGWb9YH8di8sXXD
	TJVEw+dOmRlmzU7AyO5qA0vZQqLSALTKyEttvz+tPNrXS/qhwhv/9IONC/gHNAZ3hh6YHwBK6UhTR
	z49SLrb10vfnWhRG4qHfa6PU9lWKIFvgXzA7Yhm1F1UVZCN6yERNe6M6fVQqWv3RuN59tn0BdYkcl
	6/ovIi8pYyNkhs6+I9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPvw7-008ACl-QF; Fri, 04 Mar 2022 00:36:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPvw2-008ACK-Go; Fri, 04 Mar 2022 00:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646354202; x=1677890202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Fsob3VAbrEz8ySfieJRNrqFjs8pZsST3ZSCAEhTuXAM=;
 b=rPpvxxyuyv4wK/x1SkLbjHME3OIaTxlU00layRdq+A05bPudn9P5QnW6
 jdifkI9pUoR67Vk8fU4hClysM6q/jja4dCd8uwASFxRfZEoCrTJkpGVVF
 oktozlasWwfIzT333u7Ery4nhPt+q/OvjYzdMrVq4I2Oon/VBqRxUXdh0
 PioKHYFcyq2vhrgkMbslw3Z9qGuLYCJqCKSQLgvfy1r2kvpMyVmw6yvEf
 +es0lWFxOhp7smYfMwaBawYHafLySdlKUCXZ5xCJ462+3IbXo9TYnJ8w6
 TEgeHlwySnM3DYDXtx3c7yYFh84DqWd6Xe1FarPdQr5haiP0aw7D1h7De g==;
X-IronPort-AV: E=Sophos;i="5.90,153,1643698800"; d="scan'208";a="87769786"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 17:36:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 17:36:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 3 Mar 2022 17:36:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jplNLxhb9Jva0AqW1XFyB/ZFTbYpZxDSD1+vvuhzpTDUf65Y1S1E8jJ7103LqZYX8anUZiB8hZzhjRHvFq3hjoylvA1OQ6mptFm7ojA6RBADFqEpp0jry0dPXaroB0GXunyo2MN49rPzSOOc0MARhwTQu9KccCqHGSeCc+WBtP8rlAX6H0QiRUHUoQcuQ86YFgOWn1IM6W/p+rH9H+NT0lTdu9i7RH7ny+56ocLkQGFeA5/zNcc90wanil7kNjXXGFVFN0nTt5I2rNOVegCe4N5GLXaouK12HOiCqTRhSPsw/9dYl0QEwnPmMjY4TUcB2NzVFcJicSJ+/FGXE/A0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsob3VAbrEz8ySfieJRNrqFjs8pZsST3ZSCAEhTuXAM=;
 b=JcgsAzdWXITRAlpz7GRvmA3G/A5S5yLxpEix+uroapQST6MUybH9U0J1CmiyMdVi/C95JlbiK9Us3/EWrsg5uH4a2UKUGdsMjJ9nv+kkVMs2dDHMK5P1dUr8wgbQrq0Zbc/xeJmJNlgPu72jGkZg0lz6YdMbx2vpX1FrM4+g/MHW9LYY4hv7787RCFqOotDrcqoQrtgwbVAh5m/mDrg6QmhRF1vZvUSXfPOKlXeDljUNrJ2ZOXGFOYeAVdEJXHvdmDmfIKRWLs159UKc1OSglu08Mfx/t8iZ6S+tR4qOtTYY+cYVdDbNlW5uVDGzP0YHrwhfOLBFn4J4PdNLSKrUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fsob3VAbrEz8ySfieJRNrqFjs8pZsST3ZSCAEhTuXAM=;
 b=iyl/oiZu6Ufr+tdk7wS/3OJxsoA1GUgT53EjUO9+ejId+ypebH/q2fg+KwpGqg3hK7HKLcbU23NUxCHtfGDz67cnS/RW3e0cIICdAbHGJ3C2fFKflbeT/vc/MrtLr0PPRpzLfS44e3o9VtqjeCUgCPuTSamcK8lbU1GwgO0mlfM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2591.namprd11.prod.outlook.com (2603:10b6:805:60::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 00:36:35 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 00:36:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <heiko.thiery@gmail.com>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Topic: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Index: AQHYLxNMl8kMKtyI+kCoNw9FsSFeXg==
Date: Fri, 4 Mar 2022 00:36:35 +0000
Message-ID: <58af5b61-83a6-38bf-05d1-f1ded5299f30@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
 <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
 <6bb1aafe7e156db8dfcf77f04a9d100e@walle.cc>
 <CAEyMn7aN+wJnYkTJU_nWA9bPzF1sezA9_=E5YG5rnPBLMAmabA@mail.gmail.com>
 <b533feb1c69ddae69dd88a44a902eb47@walle.cc>
In-Reply-To: <b533feb1c69ddae69dd88a44a902eb47@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ce4741b-9c0f-4e66-7670-08d9fd7709a5
x-ms-traffictypediagnostic: SN6PR11MB2591:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2591294992FB11F24C1890F2F0059@SN6PR11MB2591.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w0xCETndmeYOoQKZKPEO8GVo1w5OOJc2VUFXnr3i9tVUD/XMLYCysG0VofnFeb0rpxHU+daX+k0/22ZI9TF5cKkjhSwpB+l7ssGcOnymZYUElfNg5N6BJpB86WtF2uoxnYe+vDfjpA0LN0e/CarBptBv5DhEAblzsvtqezvpfTZHlfaD1WjgQjlchkznHXl5emulxW5Lv4bW5PsF+lJrFPOIc5urpxttyMvxlg2fv91t4Ay+Ia8SldGa3+yRYoAJz5eXuzKO4AO9jGQug8FI50nlgoFXL9gFNsn4x2N6rWKDca2+x28u58oGEpEY0uEPtUIoUb8Ud7a3wBuA5Oj8xjyEJ+pHrmPP9YCdyWr1CfNhjs+B1hwUY2vJqidhTOtc0i+Kt38OdY7bNaofSryC+0751v93QIAG0oLA2YB9zOloFSrm9PKHctIzWHI36T0ixr18OAiVST9LA/X0bY0adMor0o/bblBxoAFUc5t/+RTt5KMG8fYoyrbgm6vI+mdTZ+AhVnW2ygEZPugtb64SRyX9a6paZUAUeZqi9o5+1eK8ohDtF+hxPu7frrL2Xh+1e58j5UTH8WZwoOCD2H53DUQ2xNp/5aEO0eLk3EXZdZybGBqlNfv8JyPO6VkHeMyW/XMoKnut48e7gr5axdgWXHKYQ6LyohpPW3WmIedUnvL2BQ87vZZQWXNcp2/aUB9g4/3UCwqgWUw0Tl1dTLk55roxYTo79yxylJuvsU6IsB+dYDbb4tF6fKwnvwOm4Wbw64IXFP464q45Firi/UEBdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(38070700005)(316002)(66476007)(76116006)(66556008)(122000001)(66446008)(66946007)(31696002)(91956017)(64756008)(38100700002)(86362001)(4326008)(8676002)(53546011)(110136005)(71200400001)(54906003)(6506007)(107886003)(2906002)(7416002)(5660300002)(31686004)(83380400001)(36756003)(2616005)(6512007)(8936002)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDBtZ005QUtKajJncmw1ejJUWmJGQXd3SW9PTStzUW5YNjUzL21SWHpjUzA5?=
 =?utf-8?B?MHJyR3F2TVpENmpiZGF6WGZOM21pNUlsUE1JZzBSTmhGeVA3Vi9pZS81NFJJ?=
 =?utf-8?B?ZHVWdVo5MW80ejlnSmViZEZPa20vT2hEWW1hZWJkQmxzc3c2QzVJR3JtTDNZ?=
 =?utf-8?B?OTE4cGxFcDZFMVNHVSt6YWpBZFZFNERVRW1zUlZyRFkveE9ZY09Tc3hUWEg4?=
 =?utf-8?B?TWNmY3JETVM5UGJJRjhMYVd2dGJ0VmJSTWVOdmtDZGJiTkJzZzdwTFFDVkZm?=
 =?utf-8?B?b3U4L1ZXMnJvaWwzbE1TZW5Ba0JMc2kwVWFYODdSRmFwOXY1Q0F4MDlaNGwy?=
 =?utf-8?B?ODBSMWdKbHh0WFlBV2sraUpTM2xLMDJhOXdVUWdrMEptWnlLVzZaZDk5SWFR?=
 =?utf-8?B?TDlxL0dvU2tIVGNUTTVtc014WXZwTmVseGRESGxMd0tjSitiL3NkMnN6MnYx?=
 =?utf-8?B?dmtEVnJNOURLWjBReEMwQ0F2SG5ybkJTOU8yWXJQWjQwdk9KSEV1dVV0dW95?=
 =?utf-8?B?eUQ1OGRxai9iZjM0SGlsZTlwS2lVWUIzR1QycWkwOTJjRURUMDB6bHc3eHpZ?=
 =?utf-8?B?RkdoZjkvb0VKVU9haFJmQ1VWeXg1REJJbjJISVkvNStJWThnVWoxeGJWalZ0?=
 =?utf-8?B?OTIrTENESUE2V1QxTkl5S3NZWDhxa2dqQkJlSkpIOUtIVDlFYm1zdUsvaFdN?=
 =?utf-8?B?TUF6UDlwa1l1OENOT09mbkcrdDU5RGwvSUlkNUhTWUtjc2ZKN2FVd3I4UkpL?=
 =?utf-8?B?SXFycklBdWw1RjV2VHpUREVqbjY1YUp6T0ROTDk0TFZCelpYMVVoV3h5dGk0?=
 =?utf-8?B?UWo1NllIRWdjSjVKdVR6akJidyt4WmZ2RVY3U1MyN0ZNUlhuTG5INVZMUWlS?=
 =?utf-8?B?MkYza0VRVjdublNaMmJNd0pFYlBMaU1wWlVJVFBEbXBzWW9FQm1ydE5LQThM?=
 =?utf-8?B?anQ1bXlnVXh2dU56eEg4NEdUZnJkbWRWczhzQ0hYRTdxK2p4WHlqZUNZS3M5?=
 =?utf-8?B?VFJTRVNoTW45T3lWYW96a2Zjci9meGg2R2FVMEJDejhlalVQSTdSVDFvSHFN?=
 =?utf-8?B?a0h1K2pwaVl6cTdCbUdFazFGYjdKYXpQMnppZ2FMTDZTUEZmZDFaQ2dRYmNI?=
 =?utf-8?B?M1VCWVpRZXpBTmZWR2E5MUdRejlYTnl0Ry9sbWZHUHRMOGptUE1sdnVGVmtM?=
 =?utf-8?B?czlTdTkvZWswVGh0YXRRR0laZUg1K2tJbTVzRDRuaUMrczdhU0NLZnpHZkla?=
 =?utf-8?B?akdpNFhielFSSGwvVXVwNkJZN2E0RXhJc2cxckZ1VSsxM3BwczJ4N1hFeXRP?=
 =?utf-8?B?eUc2d3RUNnFCb2lGcVloSlhwZ0JUV3VHQlp5ZDlPQlVuQVdqa0F2K0tPWHNX?=
 =?utf-8?B?RnhxS0pZRzYxQ0NGb3E3dDVCRy9vL2RTcTRlRjBkSTJDV2NjVktBdVJmN011?=
 =?utf-8?B?WDhDVEFxVWhGZUdjOU9CNkpmNlBiMlh3SG8zQU5rK01pWDh2NzN6SkhjVklS?=
 =?utf-8?B?UDlLVnllUUdpR044ME1Hdm52TGZhN2VCSTlOQVg0TzVMZmlOa0hmQzdkTDg3?=
 =?utf-8?B?VktWbUtWUUtMUllSN01lR3d0bklJRzlJeGU3d3hoMWRLMVdYN3Vra004YzZN?=
 =?utf-8?B?eEpLZ0Jyd3Q2L1dZSGg2cUdVaGpQdk9HN2pEbzk1MExUaXo4UUo2Rjk2SWtC?=
 =?utf-8?B?YTBCVDZsSnBtL3ptNExLRFNjUm1MNGdHNlM4VXpKRXp2Y2U0QWxlblZjUVVx?=
 =?utf-8?B?Uk1YWmZ2NEtpamQ1V1FWQnZac0Z0T25DaTZjSk1TRndncHVTb2FkZmRFVEFu?=
 =?utf-8?B?Z2ZIVUNRbWtUTzlTTEVnLzBHMUtKRkhyL0NWVmc1V3pJL0VsZUVoUjBQOFp0?=
 =?utf-8?B?ZU95TjE4ZkQ4K3d0MzliRVZCaU5yVkd6VmZVUFpDYUR5M2V3L254bW81Z2dm?=
 =?utf-8?B?TCticzJ3Q3owZkhHY0lHRWEzOUwrSzFwRVhJNGgvV3Q0OEhEY2RMV2lIR3JH?=
 =?utf-8?B?Nm84OFNQT3AzaVNMamhzWHNlbGRBTW5HZ2lBTlFHbDdUdjVyb2gxL0pxWk9n?=
 =?utf-8?B?Mnp6a0RGRHVxZ3VURlhnNm43VEdJUFNNbk5CSm9DaVBUcGVlRVd0alp4VjM5?=
 =?utf-8?B?aHQrdEFZajU0QStPL3FwVDlzUEFYR3FYUDdhbjc1b1pETTJlcVNBS01KMkxr?=
 =?utf-8?B?SGlaUVkyVzBDaHlHNE5YS3Q5UWdMb21TVS85ZytzaC9scXQvdnhtZDRMVjNp?=
 =?utf-8?B?UmNtZnc0L1p0MWNrWGlIUEJKcSt3PT0=?=
Content-ID: <104BB2F50FFA1443AF53EB6A18289760@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce4741b-9c0f-4e66-7670-08d9fd7709a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 00:36:35.3629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWj3ogDiQk4rK7bYsME8+MRIzvVPFKDl6XLtELBl3Unxxprexf0nXT5oROcVXUR9aD25gLnFTIYf8JTStBwsqyX4f0cC4sRWOHTwR4twVqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_163642_656414_99DAB618 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw, p.yadav@ti.com,
 mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/3/22 18:45, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-03-03 17:31, schrieb Heiko Thiery:
> ..
> 
>>>>>> # xxd -p mx25l3233f-sfdp
>>>>>> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
>>>>>> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
>>>>>> 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
>>>>>> ffffffffffff003650269cf97764fecfffffffffffff
>>>>>
>>>>> Is quad enable working or has this the same problem as
>>>>> the macronix flash in patch 4? Judging by the length of the SFDP
>>>>> this also lacks the required information to select an
>>>>> appropriate enable method. I haven't had closer look though.
>>>>
>>>> it worked, yes. As I specified in the commit message, I tested it
>>> and
>>>> it used
>>>> SPINOR_OP_READ_1_4_4 0xeb opcode for reads.
>>>
>>> I'm confused, why is Heiko reporting that the CR/SR writing isn't
>>> working because a wrong quad_enable method is chosen, but here it
>>> will work. What am I missing?
>>
>> I suppose that the flash that supports the RSSFDP is JEDES216B
>> compatible including DWORD[15]. The flash that I have is only JEDES216
>> compatible and has not the DWORD[15] defined.
> 
> That was why I wrote "Judging by the length of the SFDP". I've
> converted both the mx25l12835f and mx25l3233f to binary and both
> are 112 bytes long. Both seem to have the short BFPT table, ie.
> no DWORD(15). Both seem to have a second table at offset 60h.
> 

I've just redone the test, I see:
root@sama5d2-xplained:~# mtd_debug read /dev/mtd1 0 65536 read
atmel_qspi f0020000.spi: op->cmd.opcode = 00eb, so SPINOR_OP_READ_1_4_4 as I said.

Michael, you have the eyes of an eagle, only the first 9 BFPT dwords are defined:
spi-nor spi1.0: bfpt_header->length = 9
spi-nor spi1.0: BFPT[DWORD(1)] = fff120e5
spi-nor spi1.0: BFPT[DWORD(2)] = 01ffffff
spi-nor spi1.0: BFPT[DWORD(3)] = 6b08eb44
spi-nor spi1.0: BFPT[DWORD(4)] = bb043b08
spi-nor spi1.0: BFPT[DWORD(5)] = ffffffee
spi-nor spi1.0: BFPT[DWORD(6)] = ff00ffff
spi-nor spi1.0: BFPT[DWORD(7)] = ff00ffff
spi-nor spi1.0: BFPT[DWORD(8)] = 520f200c
spi-nor spi1.0: BFPT[DWORD(9)] = ff00d810

What happens is that the QE bit is non volatile and it's already set.

spi-nor spi1.0: spi_nor_quad_enable
spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable
atmel_qspi f0020000.spi: op->cmd.opcode = 0035
spi-nor spi1.0: spi_nor_sr2_bit1_quad_enable cr = ff
atmel_qspi f0020000.spi: op->cmd.opcode = 0005
spi-nor spi1.0: sr = 40

spi_nor_sr2_bit1_quad_enable is called, RDCR is ignored so 0xff,
but I did a read of the SR and surprise, it's value is 0x40, so QE set.
This is a new kind of bug :). So yes, this patch has the same problem
as Heiko's, I will update it. Thanks for the heads up!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
