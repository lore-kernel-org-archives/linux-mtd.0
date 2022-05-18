Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C1C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GGNBBDCr8Pi7eEJ9agXCxX2zBsbLus8QCmcsqsjh2fc=; b=qqW
	+MclVKnMLzg9f8a3XP6a99IPArHSb2rvZ0qM6UWa1n317wGrL9UwRZ1kiqTI+dzyBtJ7hI9JKZzE2
	fMRcDqKkE9OeUKhlhpG7w+XI7GFmWbzgG1QiyGS5/vBoF4FZ9xMt4T2iPsfRhnr1jfEtoIaOJUovI
	anNRlTV0Ywnzct13lAEqi3urQqD5E+KWmyru1/eWY01JEhkBUOjxCxbywe2Aaxa+KhIPZJWT7eV/x
	qQHAzMCff/HiaLGYe80p6DUSlKjk3btQWHnG0iucH/E4Nme+/NYOh9Ynw44npiX/vsp/SBEnq36CL
	p2MkH+1fEqfHqz+qpdtHI/5FBECiM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrIvY-00261w-8t; Wed, 18 May 2022 12:37:20 +0000
Received: from mail-lo2gbr01on072d.outbound.protection.outlook.com
 ([2a01:111:f400:fe15::72d]
 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIr1-0023NU-GH
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 12:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMP8kItTITnZQBBrxSDykP6eBN2R0TxaWiHJE6iAQWRi+uV7iRSx1vJ7myxwRbH31w7cheqUVLjFwaC81DnOV7sOMC124k5kfGToJxuyqdbpToPaMsGTClL7fT/cPvrlE+DbosceD9jEebLuXGdH+XK5Nz2e5a3PN1Ny/gXHuHzv86SKHWhvU7ZF3PV94CfW7PEsSWdLEjHNmtmMWLGHMK4qHPURWfjADS2gSHUvafXEKbZiIzb3BruBNnj898xLXKeuc6z8Hr8zEETdint5KJ2ZC9LGpgThhE6Q+XN/gTZklq+8UiOsmNP+k/LpgzQr28atEc4NtD1K5HpGDKXtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLdI2XldNTLPZL6P0RGedhslwr3wg5RmLyOywHPa2KU=;
 b=nBWsHZUqyk/JGKoaz89R+mF1ZON4rJFGm0KaX/ZZEXwEGmXhmDin9Z/8qfNYlnZum9ipH6jzXr9XiBY9Ijxc29QwB6qTckkJxSU8s5rd9+yC1DESxu4nP/J60ah0/oy6/uI/fYejf5OPtAOAI4WFcLAOLOfWYVl23PdURdqfrsAF3/1a78CPgUzv+0VjE543UyxHwOpyGOo0GqsH9rhKiG+vMLOmlahPVZVqhUqXT8X3MlUohsvOfNDppRMhZznNbYgsD8R6lMa/nZyXwwB5k5e0W2Ajnd8r4nGlx4yq+NOXKe5yvT17jlWA4FuCytGsNmO2II3UVcJ3I7ZtGX+2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLdI2XldNTLPZL6P0RGedhslwr3wg5RmLyOywHPa2KU=;
 b=RXYqBSTWuEo0waaHZ6iqlX4ufjhseRjW3YB7T/VJYgrNzTAZhNENGySspUXvMaf9zHLchQjLBsKwSxAVmTr00Y/IYogcA3k6RXljr8jxSEMCvZu2XGTLi9hbScSN1kCZCY4xrzDU9G7DGB7Io1hzroWA4Q7j4Wl8mbcU9SIBp+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO0P123MB4796.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 12:32:33 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::6514:8bae:5874:5bc9]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::6514:8bae:5874:5bc9%4]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 12:32:33 +0000
Message-ID: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
Date: Wed, 18 May 2022 13:32:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Paul Barker <paul.barker@sancloud.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Stuart Rubin <stuart.rubin@trustiphi.com>
Subject: Sending vendor specific commands to spi-nor flash
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23badaac-3198-4000-14b6-08da38ca7b7a
X-MS-TrafficTypeDiagnostic: LO0P123MB4796:EE_
X-Microsoft-Antispam-PRVS: <LO0P123MB479610CDD47F3DEA3189FCB893D19@LO0P123MB4796.GBRP123.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEfgT2GgyfhlSkN2F3xO5w4AD7DvfIJq7Ry9bGKf8yBM06BS1zLKtn2s3kq0vyjmlVyncVjABeUaDraRhZh9spqB/jqY79+8vSZQI2gqK0UVqtAfu5tDjdmyhHHopytUi4kIIP67rN1E7O5Ny5Bc57VclyQV8zIp2Wqx4KAbkjF8qHOdBd0hPpODI94TddWEV6hrcoX8HmO+t2yg1Gy879O53bQv951VQDnmBkH1K+7HBPfo4AELfid9dIHfjbdDcbGtcU0C50VNHwcE6boTUtm0ZAsEKXXQnBQP+xZ77uYglZrwF64DOyEziOziheSJVf8Y69BH5E1LhBgMpjKz5atFD7QGas4p10lPB7/J++d7s3nkESOWXQxyWhrzh92QDQc/h+p+Mcvyu/lcWY7fH2YXEE1XSSZ5cqd4JBWgIEWbUUCtL6TooBNfgcd6awubJGZ13K+sMmJo1t9s7d+QhmkoMyXPAbnUSjc0BsgHMtoXqxDUdxlvapPb78iBm33khs5TCZ3WwLJrVAKqZM5sPfJIrvxXRcIbxcr+2Fkqbb/9akbN1ykinuTBF7XN2Nh4vNRvA1KdDzW4t2alQvnHZQZsh5BqXfNMdbx+1zeU55TfBE9zQNy/wcYXTccfyrE2AydkP0Spl9o8SjLnjTPHpMDr8eTbW5a1llibXUJGwFiMCB41CzJeEi6T+371KpovX0AcHsrIdB8uVW5K+Exz+fLqtCctyLCq1c6ZdoL4nExETnufvRDW2H22mH8k6JLU27c4L6wUWLaZ/e2rTjSdQNYECgghMwx+ugpg665GzKy/mwTy1pWuYX9w9Z1HzeYKDmRx+df4qeICc7F8TeRKQVubmKJKCE7q1kKzCUbfC9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(136003)(366004)(376002)(39830400003)(346002)(66946007)(66476007)(8676002)(4326008)(66556008)(31696002)(8936002)(2616005)(33964004)(316002)(86362001)(21480400003)(235185007)(5660300002)(41300700001)(83380400001)(52116002)(186003)(44832011)(36756003)(31686004)(6506007)(966005)(26005)(6512007)(6486002)(2906002)(38350700002)(38100700002)(508600001)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejQ2Rk12aERaeXA3eGduYStCTzNsYlZzNUoyVnNhaXNjVk1rdHlNWkpoSDJR?=
 =?utf-8?B?dUN2aGFoNHlvM0VwSTNNQTVaY21LelJtUzdjbzhlaDRhblY3aDFPNjNNa2tw?=
 =?utf-8?B?U29JVzFRdTdnWG85WjBwbVlxSXdXS1UwU0xBS1htb0tIWHd2ZitjYVNJd2pK?=
 =?utf-8?B?dVhsWWlwU1VnTlNhOGdTSU5ud3RrWDFmNEkzbHpoSS92S2xHeWlMSzZ0b1Z0?=
 =?utf-8?B?Y2lmb3FvVURoQ3ZZQmhMa3JscC9IaCtSQUhDT0tlZFptOTdwaUN5SS9TRWww?=
 =?utf-8?B?QXhHNzN4ZDgyRGkzdVJwMWlyTU1JQzBqc3QydTBFODZhZUVadUdVZ1hxV3Bi?=
 =?utf-8?B?aUtncmk5MitwaHVMMUR3TW1ZK05XRUFyNGs0azgyTFVkOGRwS1NkQmVYcFZL?=
 =?utf-8?B?V1J1cUJnbWlGdVdoK1hZcVlCKzNlODlXVkZONVBTWVNvcmxkTGQ3OFdGWG5P?=
 =?utf-8?B?Zmgzd2RKYU01OXQ3VGRUK2FrNkxlWGhUck0yaXlLeUthS2dFWlZ4UGdDZU1I?=
 =?utf-8?B?NnY4ejhKaTU4SzZrTXZnVXZHa0tnayt2QnlwVWdlWnpMek1jRTM5dWdicWZl?=
 =?utf-8?B?bXdPSm4xbG9HYjk4cDY3eklWTXlwMmhFS0pZRWFIQ3BjdnorTHE4NkVPM1Fz?=
 =?utf-8?B?TVJrNDFLcE5RbVFrNHo5Y0RDczJiTmFDZlVZZjhUblo2VEF0RnNIWGJubGxF?=
 =?utf-8?B?aU5WazFVbGYrSmpGWnQvRUVndm4wb3ZlQkFldmlocXpjcjBNK0lGdWlyWFR5?=
 =?utf-8?B?Q0NvY3ZOT1dTSkl3MzA0WGxMT1JTZmpzWGp3MGFHVkdoVktGU0M5VzdrbXZE?=
 =?utf-8?B?VGQ3ZEkxT0N3KzBRSEU1YVpxTGpSamd3RmszRVBQK0NZTVRHbnlsczNTVjNI?=
 =?utf-8?B?TUhQNm1LUjJNUTZzUlRXRm9JRW1sRElQVkNNTWh1Zm1MSWxNRmlvSjh4RThF?=
 =?utf-8?B?OHMvTmpSaThacEdHUTY0djdWVGZsNDloY3kvaTVQK29ieTljREc2eUlEaWkz?=
 =?utf-8?B?UmR5cVlrUVlmbTIxSXBSV1cxSkl2eW5aZUpzbHpCYmNtRkQwYkwrNW9uUEl4?=
 =?utf-8?B?d1M1TVFOUk83VVpmN2QwSm4xQWZnUTFoWTlubDZ4VmRsTm5PdlNQa1BVMGdB?=
 =?utf-8?B?VEQxMEtDbmpiQlF4TFJ3QnRUSEtWM0tacm1qWVo0TTBsNXhjUEZhRGNJUW9E?=
 =?utf-8?B?WUp3THZ2QnB5cnNwNlpPSE1QTUxzdEc0WVJvRE5UMktSK3EyeGd1RW45bUo0?=
 =?utf-8?B?czZpcWxzU1l4VCttRzhCcDJ4MHdFR1FFdjJ3am90WnZvNmcwZ0poTnFJcWN6?=
 =?utf-8?B?Y2plYmxRRVRqd0FEUGhaazFydDRxd1FLdm9RT0lxdnNZOFBrL3F1Q0ZhVkpa?=
 =?utf-8?B?ajd5d1J4WkYvMlZ3c2tCVlI4UVRualVxSCtCU0NNd1RiTjNaQUN6YThJdXVk?=
 =?utf-8?B?M3B3azVFUzBQTXVMNG11MjJkUllBZ2p1VjBsRWdmeG4ybjAySlJJVnUwSHVn?=
 =?utf-8?B?UWdmajhiNUpSRU9HRkJYS2tWeWZGUVYrQkJtRTZrbG0wY3lTSnJYeGw3RlQ3?=
 =?utf-8?B?cWdVQWN6cC82S0F1d2pWd3VBZUY5eDhMaVkzOFFiRGk5dkpZcTdGUDZjakUy?=
 =?utf-8?B?VDZoMDFlY1BWYTg0N1JLRHFRdlM5N0dSeW5lZUFEcnJXQ0tnWEoyVnRlQm12?=
 =?utf-8?B?dGJybjB4TkR1c3pPaFBiaSs3cXdZcWNmWXh3NFlhdnR1enNwSXdXV0dhVTgr?=
 =?utf-8?B?cXJ1MDU5YWt4d1dGZlllUG5QVU9ZaDF0c01uQXV0Ty9qMFlGQkg0Sy8wVzFL?=
 =?utf-8?B?OW9lQXdld0xZaFJDZTFucW1oYWdzSzFWTGxxOU1kbkpvZ0RIaFpqcEtYeUw1?=
 =?utf-8?B?ZXl3NHc1cTJXK2Frb20vdUgxWUgwSk5DY0JFTm5xS3E3T0dFWmZvQzVkREMy?=
 =?utf-8?B?b3k1QUhLNnQwbzFLVVZLQXRnSEIrT2Q1TTZ4U3A3S2hhNUIyQzhFYzNWeXhi?=
 =?utf-8?B?UUR3aHZwN01YMmtmUjVoSGMyOVZRM0RaOVM5OFM1TVhyVmoyWmRYYlNVTDk2?=
 =?utf-8?B?U1VwMmdLdExNdWtHZGVPODU1Q2FhcktUZFozYzE2OEdYWmE5WE4vV1cxenFR?=
 =?utf-8?B?dVZDRFBKLzUvUDI1Z0hJRHVjc0tXOEVsQ2ZmM2FheWoxQktmd0dDWmtFbnN5?=
 =?utf-8?B?cGRCMDhGL1BKZ2FaaDNCUy9VdnQrVDREL2c2SUdtOWpoajA5bUtxUSt3WGtx?=
 =?utf-8?B?SFJ5Yi9uTUNmSDVrTTFLYWZ5YzhQcXB3b0ZKS01nODRuZG5IUEdjaGFRNkdP?=
 =?utf-8?B?TW50RlAvYkNNemVjUUlVd1doT3E1WWJ0MnFVVGhLNW05TG1oWVhwSFpaWU9H?=
 =?utf-8?Q?vOc3k4WHHHJ2sC74=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23badaac-3198-4000-14b6-08da38ca7b7a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:32:33.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QzuavE7W1nT/0dlZKqOGQS7w7owcYp2lAhe5zDdZJnOm4RWDjspPZC74dDTWqrf2wwQ6Aax1qlU20t5wxeeEDvjjxGsQAow0fvcAJJ9Sjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB4796
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_053239_873912_D97E5203 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: multipart/mixed; boundary="===============3150646243426381651=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3150646243426381651==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8nvJVPu6P0Sa6v55Ef69yJ00"

--------------8nvJVPu6P0Sa6v55Ef69yJ00
Content-Type: multipart/mixed; boundary="------------AAQA4o4OvN0rBUqZmi55luoA";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Stuart Rubin <stuart.rubin@trustiphi.com>
Message-ID: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
Subject: Sending vendor specific commands to spi-nor flash

--------------AAQA4o4OvN0rBUqZmi55luoA
Content-Type: multipart/mixed; boundary="------------P5sITxa92ZMlW10XA5z4KYrk"

--------------P5sITxa92ZMlW10XA5z4KYrk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCldlJ3JlIGxvb2tpbmcgdG8gYWRkIHN1cHBvcnQgZm9yIHNlbmRpbmcgdmVuZG9y
IHNwZWNpZmljIGNvbW1hbmRzIHRvIA0KTWljcm9uIEF1dGhlbnRhIGZsYXNoIGRldmljZXMg
b3ZlciB0aGUgU1BJIGJ1cy4gU2luY2Ugd2UncmUgdXNpbmcgdGhlIA0KTVREIGJsb2NrIGlu
dGVyZmFjZSB0byBzdXBwb3J0IGEgZmlsZXN5c3RlbSBvbiB0aGUgU1BJIGZsYXNoIHdlIG5l
ZWQgdG8gDQpzZW5kIHRoZXNlIHZlbmRvciBzcGVjaWZpYyBjb21tYW5kcyB2aWEgc29tZSBz
b3J0IG9mIElPQ1RMLg0KDQpJIGNhbiBzZWUgYSBjb3VwbGUgb2Ygd2F5cyB0byBhY2hpZXZl
IHRoaXMgKGFzIGZvbGxvd3MpIGFuZCB3b3VsZCBsaWtlIA0KdG8gZ2V0IHNvbWUgZmVlZGJh
Y2sgZnJvbSB0aGUgTVREICYgc3BpLW5vciBtYWludGFpbmVycyBvbiB3aGljaCANCmFwcHJv
YWNoIGlzIHByZWZlcnJlZDoNCg0KMSkgQWRkIG5ldyBJT0NUTHMgdG8gdGhlIG10ZGNoYXIg
ZGV2aWNlIHRvIHN1cHBvcnQgdGhlc2UgdmVuZG9yIHNwZWNpZmljIA0Kb3BlcmF0aW9ucy4g
QW4gaW5pdGlhbCBzZXQgb2YgcGF0Y2hlcyB3YXMgc2VudCBiYWNrIGluIE9jdG9iZXIgMjAy
MSANCndoaWNoIHRvb2sgdGhpcyByb3V0ZSBbMV0sIGJ1dCBubyBmdXJ0aGVyIHByb2dyZXNz
IHdhcyBtYWRlLiBUaGUgbmV3IA0KSU9DVExzIHdvdWxkIGV4aXN0IGZvciBhbGwgbXRkY2hh
ciBkZXZpY2VzIChyZWdhcmRsZXNzIG9mIHZlbmRvcikgaWYgd2UgDQpnbyB0aGlzIHJvdXRl
IGFuZCB3ZSdkIG5lZWQgdG8gZW5zdXJlIC1FSU5WQUwgb3IgLUVOT1RTVVBQIGlzIHJldHVy
bmVkIA0KYXMgYXBwcm9wcmlhdGUgaWYgdGhlc2UgSU9DVExzIGFyZSBjYWxsZWQgb24gYSBk
ZXZpY2Ugd2hpY2ggZG9lcyBub3QgDQppbXBsZW1lbnQgdGhlbS4NCg0KMikgQWRkIGEgdmVu
ZG9yLXNwZWNpZmljIElPQ1RMIGxheWVyIHRvIHRoZSBtdGRjaGFyIGRldmljZSBpbnRlcmZh
Y2UuIA0KV2hlbiB0aGUgbXRkY2hhciBJT0NUTCBoYW5kbGVyIGlzIGNhbGxlZCB3aXRoIGEg
Y29tbWFuZCBub3QgZGVmaW5lZCBpbiANCm10ZGNoYXIuYywgcGFzcyB0aGUgY2FsbCBvbiB0
byBhIGRldmljZS1zcGVjaWZpYyBJT0NUTCBoYW5kbGVyIHdoaWNoIGNhbiANCnBvdGVudGlh
bGx5IGhhbmRsZSB2ZW5kb3Igc3BlY2lmaWMgY29tbWFuZHMuDQoNCjMpIEFkZCBhIGdlbmVy
aWMgU1BJIHRyYW5zZmVyIElPQ1RMIGZvciBzcGktbm9yIE1URCBkZXZpY2VzLiBUaGlzIHdv
dWxkIA0KYXZvaWQgdGhlIG5lZWQgdG8gZGVmaW5lIElPQ1RMcyBmb3IgZXZlcnkgdmVuZG9y
IHNwZWNpZmljIGNvbW1hbmQgDQpzdXBwb3J0ZWQgYnkgU1BJIGZsYXNoIGRldmljZXMuIElu
c3RlYWQsIGtub3dsZWRnZSBvZiB0aGUgdmVuZG9yIA0Kc3BlY2lmaWMgY29tbWFuZHMgd291
bGQgYmUga2VwdCBpbiB1c2Vyc3BhY2UgYW5kIHRoZSBrZXJuZWwgd291bGQgc2ltcGx5IA0K
cHJvdmlkZSBhbiBBUEkgZm9yIHNlbmRpbmcgJiByZWNlaXZpbmcgYXJiaXRyYXJ5IGJ5dGVz
IG92ZXIgdGhlIFNQSSBidXMuIA0KVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBNTUNfSU9DX0NN
RCBJT0NUTCBzdXBwb3J0ZWQgYnkgdGhlIE1NQyBkcml2ZXIuDQoNCk15IHByZWZlcmVuY2Ug
d291bGQgYmUgZm9yIG9wdGlvbiAoMykgc2luY2UgaXQgbWluaW1pemVzIHRoZSBzY29wZSBv
ZiANCnRoZSBjaGFuZ2VzIHdlIG5lZWQgdG8gbWFrZSBpbiB0aGUga2VybmVsLiBXZSdyZSBu
b3QgdGllZCB0byB0aGlzIA0KdGhvdWdoLCBzbyBsZXQgdXMga25vdyBpZiBhIGRpZmZlcmVu
dCBvcHRpb24gaXMgcHJlZmVycmVkLg0KDQpbMV06IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjExMDI3MTAzMzUyLjg4NzktMS1zc2hpdmFtdXJ0aHlAbWljcm9u
LmNvbS9ULw0KDQpSZWdhcmRzLA0KDQotLSANClBhdWwgQmFya2VyDQpQcmluY2lwYWwgU29m
dHdhcmUgRW5naW5lZXINClNhbkNsb3VkIEx0ZA0KDQplOiBwYXVsLmJhcmtlckBzYW5jbG91
ZC5jb20NCnc6IGh0dHBzOi8vc2FuY2xvdWQuY29tLw0K
--------------P5sITxa92ZMlW10XA5z4KYrk
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
4yvD5AdHy8s8HYtBP5oowjSllz6aOtP0BiQ=3D
=3Duult
-----END PGP PUBLIC KEY BLOCK-----

--------------P5sITxa92ZMlW10XA5z4KYrk--

--------------AAQA4o4OvN0rBUqZmi55luoA--

--------------8nvJVPu6P0Sa6v55Ef69yJ00
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYoTnXwUDAAAAAAAKCRDYN3IfEvob6iMg
AQDu9X5zC3EJDJQaQFuRzXE33eKJ9PNJQALuRKSkJaIpZAD+KSFtfRYAOkj72lLoEKNfG3/ZsNOg
InF/Uy7TLA0LowE=
=UcHs
-----END PGP SIGNATURE-----

--------------8nvJVPu6P0Sa6v55Ef69yJ00--


--===============3150646243426381651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3150646243426381651==--

