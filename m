Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeLM2cbedEfEfLEIGPllp0ABObmAVf2Ci2mNE7CtNmI=; b=GwJm7+JZ3iWBzV
	1HOZwMbA2NDhSyUU4DOw0Ysyt1AsYqDQqrM2WdE1gaHjO6tVVoNySQ0zyvgtvxxtHGJraIUJ+Jvh7
	mFiQEfHhD0M4+oK6pkD8MFacpQYRW4nxk7WNi4JzuTigEPFsdzB+bOrtw9dUNnFcidtZNMtr9qIU8
	MfpfBowu+6FfCh5niV6PVy+KRz0u0RtCiYK2h8qoLAdqsccsUxYO+FRMRKv7OkQhP9L1PPAljEVpM
	P8h20qDTYpARKm0pWz4W57jm6CVvgR0mqOfpgW9Mf4NcBndxzxnsYvVYV8KWYGOI50AxGfsYiEed/
	pknRzM5+YX13uCv8vMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhVJA-00DGPH-KW; Thu, 21 Apr 2022 11:49:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhVJ5-00DGLa-Ej
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 11:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650541747; x=1682077747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IJzOjp+YCVfv84xubf5aCElnyLeWxSlSwXNP9XjPWdk=;
 b=AFoPK1VLd3EZIa67Vs6NIA5TI38japedrcYBNlCZ//BxQydqa6GJV08f
 HJOXlcaexkLymy4wPX5jxXDFAhwe7Y2ZBDjv/oAczhex4AivCPugLcNrK
 1oT86u0zHXpzoiC52hLRXnoSYl1ZnHoXzO4I7FBy28j80l4yjx7JDNRZ5
 CJIjaR2D6JjrzwhViHYCE3saXPA12po+7/+Gxv8o9Zvx14FPIRVEdy6wH
 ZRppcjX/Sy2V8zsvL6px9+55oOrvcKHKzhyk1CEctVwQRo9wxsUVlheLT
 LWXBQCFioGGN2Q3GWYPJj2eHCI6G29nwjc4vjfnjY0iV/s8oCHrVOUgeM g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="156298019"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 04:49:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 04:49:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 04:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeNhtl0NbJk4rI9m5TKxl7+x/MoLrpA0UruU9rtqp1KH/lKIk5g5LJQPBwlyzaQ03FzOd84dIyzMwze6Hq7EaENlr0FTBOXA08+cbsTMP2N9LJdbKNjMGEQ7ABW3C0ibm3Q5ORR56ErZm8rVVsEQZPY+u88tOhSInF1nIyYEq1aPoyHvs22Wfyt+UaviRACzhBihoShtVoo/QJjraCJ6eJ7dICyedx9elKqzMQq0m5DuZUedWauGQgzOLeQ46cqb+XmHYMb9o0DcF2p9yMI7K2D/u0QIF78ziNBVTMFEmHu7fjURrObCL4qRYemQltIqI5JYt1Ap25sDvTchGQ9NUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJzOjp+YCVfv84xubf5aCElnyLeWxSlSwXNP9XjPWdk=;
 b=l7J1gWfVR77sxYD8lZqAS4bDF6ig1PUN/V1xkclxFJCBWD2VZ956ARdcbDOme+hC/K0YSEDVDRq/ewQVNptXtallY6pea7gZard7Q25NiKRCvN4K9cokVVU5eWoYkMz1BgiE1sfa2EF4CzmZGJw7J93kKogkt04Dc+fIwbNhnszsCIa4SVx4oU7L5dGf2Nb30eY+71rRJRx45Mvupoj/gdICA81CUr8bU3MkuMk/vB7sZ3pm9jQK/Doq6SIrOUt4HZ0mf0gEcgM1POtklivsePieHyLOUGAKks7UYxZyy0tr10l1EySP6Co4eo5hRLqG8b7xdf7CG1wXDgiYmfi9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJzOjp+YCVfv84xubf5aCElnyLeWxSlSwXNP9XjPWdk=;
 b=nYGmAhenBUjsocKoec1dTPz9msGNzQwE5FoVSrpa7GnMDhFvPMlqhOiHtwnpa/uaocjEeSv7PtpGr73bOYSL8yZEW8Bfwygr97tiIlgthP7REcCmUGhI6M0HFYYmRs0MFXqYFblqG1CHTMS81yQByLqVB4x1BZ+/obg7l9JZc38=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by BYAPR11MB2934.namprd11.prod.outlook.com (2603:10b6:a03:92::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 11:48:55 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::3d19:dba6:1424:44da]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::3d19:dba6:1424:44da%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 11:48:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYVWxPC1dIdG4rOEeRpjF1YXhMN6z6PSuAgAADioA=
Date: Thu, 21 Apr 2022 11:48:55 +0000
Message-ID: <abd25802-8d39-7f5e-4fd2-fef96f85e45a@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
 <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
 <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
 <cd0599c2-6099-def1-3cfd-f70ae1545565@microchip.com>
 <381db18c-5e6f-9f39-ae92-7fdc21cc4844@microchip.com>
In-Reply-To: <381db18c-5e6f-9f39-ae92-7fdc21cc4844@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77020f23-74bb-4bd5-7c3f-08da238cea10
x-ms-traffictypediagnostic: BYAPR11MB2934:EE_
x-microsoft-antispam-prvs: <BYAPR11MB2934F60856F587D5697ABB32F0F49@BYAPR11MB2934.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EC8RR6G+YypEKV4lXQ2gPV9nUfBXFVqnSNRbQS+/7MrE4fJdvzRaBl3IYFANEJIcTE8b2yrh4v1ECJpJx83SpWE1TMgvOqlEJevfcIkgoDCrSkFtkSRWYvXWRToCOO+FmXFOT3ciyML2Qtr3DV35eRbeTm0kNbp+KuLZM8lEGQcysOPD2TrCFqK3oeMTD4RF1L+86Mm9Pq2aXUu0kfls60BgFixcfEa02Q5hEZ/VO+g33MJJESasWXpeFxdvJKwH+WOr+poX54FmHrDOS89mhIUdpMQ9Emnc3ONb8cFuU3kvxTN7OgXXWH2UiFdMQc/NcaJnipONp1cP9n2P0AVSb0KRBiN3+PgUAg7L0gkbth6d33allA2tM7ARI63CTcWA2mQHyiBNl6uI42CS1u+DCjrDQ6EdK8VsPUq9MpKTqNM9UGf5BYJDXP9h4Jsjff7JpSgBZ7MHaLvVUhkcRmjzk99jNm0O8yUe05dokJLmbo4K4lDrRXo5v3ZY3n1BMTVUdNo8cW7jNj7BYeOuugSAwN5tKXp/etIWSu5HWtfZabRoj7AgSf57GKSlwTnVxZihB2VV3w9JM4wIEt4gfvvctY2AqqAx3J9cYWItV3xdbFHomiJFfL4sKVuXDShFA3irg04vLTEMH5O+jx5L687AObu1qDecQInu9Mbv2nqyTDW/eKSWsv9vhWjeT9zORVjCNZCuL+VgWcB7JdUSqhPbv2oPxrF2YnWJSw/x8YAHPIuJzXmcs9QDOAKIJlYH3Avm7itq8Zp7vSgvfKY5NBGrhoPr36YqH/i+KwLE+Kd4eQkx2TjczZ7aoZwNNXMKOpccBOu8hFzOoob5isLex0e+dRWyikN5h0i6z7ldjBs3WbDG6NrWqolGvUqi8JIYs0Gnyev8dcRjkGNVmQsqSpCWyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(122000001)(76116006)(91956017)(53546011)(66946007)(8676002)(38100700002)(38070700005)(8936002)(66556008)(4326008)(66446008)(2616005)(64756008)(66476007)(6486002)(966005)(186003)(6512007)(26005)(31696002)(86362001)(508600001)(31686004)(71200400001)(110136005)(36756003)(316002)(54906003)(83380400001)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWZ1VWNiamFrNGlNenVYK1NjVUtpdCthekMzem5LRFh2dGNTaS9RUU1MaFZ5?=
 =?utf-8?B?SFJEYnVUUHRnZDVCZ05CalJTM3crNEZFMWtOUDBmbk90bTBETUpkWXhrdlJB?=
 =?utf-8?B?ZnQya1lNa0J2aWdwVFgrU2UyOVVCU3o0ZHhkVWZXbjRIeXR5bW8xakUxSTBy?=
 =?utf-8?B?NnVXR2Z3SWNYVHhDcUg3UzZraGZwd1VuMnY2MS9nT0ZRVTIybWRGN0FTZk9q?=
 =?utf-8?B?YWJRN2VqTVR1ajJPbkN5MUd3aVRuS1pqeXd2anQreUdZK0tmRlhEUEJVR21r?=
 =?utf-8?B?VXlOUVNLMkFrV1ZPOHMyYzd1WUtaUkdaejlzZmpWMkVGTVI3NW1WOXpraHBw?=
 =?utf-8?B?aHkvalpmSXBRWmdKU0tPMXc1VzNyL3RDWDAwaWExZVdMQUtwbzd5M1lKU1o2?=
 =?utf-8?B?ZGlvRFNaRWxxRnhKWmhJT0FidjczaHhRTDJKaUVvcm9VcnFZcGpMYWdNTzZR?=
 =?utf-8?B?VTV2UnVRL0RtV0JWU1dZeFRibjhDeXhjUEdiZkVqVGpuem96Y2dCK2Z3ZFdj?=
 =?utf-8?B?Z3YwUHIwWkZqUUdEMERvK21MRmt0blB2OU9LRFF0aDJBQXJxUURNSDhIQW80?=
 =?utf-8?B?NDdTbS9RZnhXbzcrWTRkVzFISG1mN1JLMmgzeGFpeTB2ZnZPdU13Q0dBL1E2?=
 =?utf-8?B?akxzYWdHemxLbmpnU3lQMFR1c1BVK2pIeUkzaWwvNzQrbGEydmZseTF4Z2dR?=
 =?utf-8?B?RXpFbk5KNmlmSElNV3lURXJUNTE0eFJ5K2lhOWExQ1IwZGJtclQ0TmFyeDVQ?=
 =?utf-8?B?d1gvNmJRVHBUS1FLSjZRRUNHbkY4cnJkUjlqREtneTlDSEVhQUhDZCtRS3Fv?=
 =?utf-8?B?c1d0RlVGMk9PT2ZrTmZjTERLY3hWNVZnTjN3amtjSTliSUtFSWNBRStFZ3Zo?=
 =?utf-8?B?aCtwQStFV0wzNmY0ZVVIdTArMk9qczdtcndFakI4Y2huV0ZkalRmZVQ1Q0Nt?=
 =?utf-8?B?Q0JXN1F4UEFBaGxaR3pSWG1sdDM0akZvTis3MzNHN3dBL0JzSVgvQ285TUxr?=
 =?utf-8?B?OFQ0ZEZINkFaa2txRDdqUG0wUEhTa0hjWkg0d1JSU3NRNDBMZzJVbkJzZzNK?=
 =?utf-8?B?R2VwdFZ0V1pkYkVXeU5BeUI4UlJCa2orNXREQ3lldUk2eXJ4VjdyR1BSTVhJ?=
 =?utf-8?B?VUV3V0t3dStxbEtmcnZTeVlTM0F6TXRURmtOVC9JRGhKNVI4Ti9HVXBhRi9u?=
 =?utf-8?B?QnlpbG43d3RoZG84RjJ5NkQ5N0dRbUdwTGJoRk5mK0tJc3NKZWl6a202aHNm?=
 =?utf-8?B?ZmJSVFYzcFFhdm5CVjJvQi83WHFaakJRSm1zMVR2NjBNMUcvRTJ0ZVFwM0h6?=
 =?utf-8?B?SmRodmNGOHJxSS9oeXFENVRqTkZsbW1PSE1FZVZldUd3NWVDRE16ZURaQ3Jh?=
 =?utf-8?B?WVpCVWprdkFPSm5od1RrVHZUTlhnektOa1VrTXdrb2lDMnRUZEFIMW5KZXpH?=
 =?utf-8?B?bk5QZlNJcFpYdUU2Tit2MVNQdGVFUytML0dDNzRLcnV2THl3bzRQT1R5c3RB?=
 =?utf-8?B?bE14VjlqcDJyZHFsRSs3dFRIWXNGZDk0UVl1R2Q2WURPL3NLcVZXKzByVmtV?=
 =?utf-8?B?VTluT3dwcCtOa2JWcmRCOEhOY1loRS9nTVRockdIV3NNYWd0ZWxmcVhCZG4w?=
 =?utf-8?B?eEJ6RlJMaGdzUDNpYzM1WHVMY1A3T2trR1o5ODVGVG1mSGdHMk1vd1locjdU?=
 =?utf-8?B?S1VYLzRuRnIwY1ljditWOTN5WDh3ZjBQNGxUY3JOcUEvTmc5R0xoTE5laXlS?=
 =?utf-8?B?UHNJNTVKOFNId2lXZ09hREoxRnpuVVZWeHVRZytZdzcxNTdKZWR4NFJiZHJM?=
 =?utf-8?B?SlBKMDk1aFlsZ0RiY2ZQZmsxNHNvbFBXKzJpU21KLzhMVFp1bGZJWkFNdkh1?=
 =?utf-8?B?Z3ZWeE4yd2V0aEZnRG56QnRDU3ZmYUpxRGlWY01xTmRCMFoxN1FVK2pBTmxw?=
 =?utf-8?B?ZWVTd01NLzJKNGp2blVlVHZLT1lXQU5rR3UxWmcyR3RiaEdaS2xmcUFlQXp6?=
 =?utf-8?B?ZjhvdEpYYmFBNkZXbU0reTh4bVBxcXNDMlhYQmpyeFhUWGJDODlpM1lCazEz?=
 =?utf-8?B?MGdoU25iVVU0Wk1LUXl2TTFXRTJMYVphRGJqRVdKUXpkWTRYU2NzUkNVY1E5?=
 =?utf-8?B?Zmt4T1lCekJPZDhKK01TcEtIc3hSanlMdTdlVEUyOWl6SHJrWW5nVXJJa2x2?=
 =?utf-8?B?U2Y5QmZsZHE5bmk5SFFRQUZZQ1JyWEtVRzExNWozMkxETExiSTBYYW5CcGJU?=
 =?utf-8?B?UjljT1FUNVhuNG1HOHI4YWptVDVCckVIYUkyRlJNRkhWeUkwQlZ5eHc0YTlB?=
 =?utf-8?B?OXZVUVNYM1NrZ2phNzF4UXhkNVBqK2Q3TGczNStyaXBTdzdUMFF6Vzl6ZjBI?=
 =?utf-8?Q?uCT6HxKQtYcNXoA4=3D?=
Content-ID: <E0E976DDA9B9294CA3C4F984F4EE4DE9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77020f23-74bb-4bd5-7c3f-08da238cea10
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 11:48:55.5220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2drqE7xmJoARvCR3y5SFv9twgHPuXrUDk1w/9cBnfQReS+gvXs1k0rX5OSbRfELoYEqXk03TBgPMGAlXX2N2JAiB+MCQIWKL5mrLmS3v13U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_044907_851576_33F41FD2 
X-CRM114-Status: GOOD (  19.53  )
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

On 4/21/22 14:36, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/21/22 13:56, Tudor.Ambarus@microchip.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/21/22 13:47, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 4/21/2022 7:41 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>>> [...]
>>>>> +/**
>>>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>>>>> + *                                      register.
>>>>> + * @nor:       pointer to a 'struct spi_nor'
>>>>> + *
>>>>> + * It is recommended to update volatile registers in the field application due
>>>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>>>> + * also set during Flash power-up.
>>>>> + *
>>>>> + * Return: 0 on success, -errno otherwise.
>>>>> + */
>>>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>>>> +{
>>>>> +       struct spi_mem_op op;
>>>>> +       u8 cfr1v_written;
>>>>> +       int ret;
>>>>> +
>>>>> +       op = (struct spi_mem_op)
>>>>> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
>>>> nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?
>>>>
>>> No, at the time this method is called, nor->addr_width is set to 4 by
>>> spi_nor_set_addr_width().
>>
>> I see. Allow me some time to re-read this.
> 
> Does this help you?
> https://github.com/ambarus/linux-0day/commit/05f20ab7ee349628f0e2d22a4d3852038a6c8c70

commit 05f20ab7ee349628f0e2d22a4d3852038a6c8c70
Author: Tudor Ambarus <tudor.ambarus@microchip.com>
Date:   Thu Apr 21 14:15:42 2022 +0300

    mtd: spi-nor: core: Couple the number of address bytes with the address mode
    
    Some of Infineon chips support volatile version of configuration registers
    and it is recommended to update volatile registers in the field application
    due to a risk of the non-volatile registers corruption by power interrupt.
    Such a volatile configuration register is used to enable the Quad mode.
    The register write sequence requires the number of bytes of address in
    order to be programmed. As it was before, the nor->addr_width was set to 4
    before calling the volatile Quad enable method. This was incorrect as the
    address mode was still at default (3-byte address), which resulted in
    incorrect register configuration.
    Move the setting of the number of bytes of adress after the the Quad enable
    method to allow reads or writes to registers that reguire the number of
    address bytes to work with the default address mode. Now the number of
    address bytes and the adress mode are tightly coupled, which is a natural
    change.
    Other (standard) Quad Enable methods are not affected, as they don't
    require the number of address bytes, so no functionality changes expected.
    
    Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
    Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7095bf897318..a057b177dca5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2270,52 +2270,6 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_set_addr_width(struct spi_nor *nor)
-{
-	if (nor->flags & SNOR_F_HAS_4BAIT)
-		nor->addr_width = 4;
-
-	if (nor->addr_width) {
-		/* already configured from SFDP */
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_width = 4;
-	} else if (nor->info->addr_width) {
-		nor->addr_width = nor->info->addr_width;
-	} else {
-		nor->addr_width = 3;
-	}
-
-	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
-	}
-
-	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_width);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -2325,10 +2279,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 		ret = nor->params->setup(nor, hwcaps);
 	else
 		ret = spi_nor_default_setup(nor, hwcaps);
-	if (ret)
-		return ret;
-
-	return spi_nor_set_addr_width(nor);
+	return ret;
 }
 
 /**
@@ -2711,6 +2662,78 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
+static int spi_nor_set_addr_width(struct spi_nor *nor)
+{
+	if (nor->flags & SNOR_F_HAS_4BAIT)
+		nor->addr_width = 4;
+
+	if (nor->addr_width) {
+		/* already configured from SFDP */
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_width = 4;
+	} else if (nor->info->addr_width) {
+		nor->addr_width = nor->info->addr_width;
+	} else {
+		nor->addr_width = 3;
+	}
+
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	}
+
+	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_width);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
+static int spi_nor_set_addr_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_set_addr_width(nor);
+	if (ret)
+		return ret;
+
+	if (nor->addr_width == 4 &&
+	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+		nor->params->set_4byte_addr_mode(nor, true);
+	}
+
+	return 0;
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -2742,22 +2765,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_width == 4 &&
-	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
-	}
-
-	return 0;
+	return spi_nor_set_addr_mode(nor);
 }


> 
> Find the entire branch at:
> https://github.com/ambarus/linux-0day/commits/spi-nor/next
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
