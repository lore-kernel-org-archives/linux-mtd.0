Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39721C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 23:56:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08B360F91
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 23:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E08B360F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ByK0Me8I76GYMEYYraNvo2Dm//9Gr/2RFViuLh33EA=; b=OHfpHOCGISRuN/
	kIrovGdi8SAxjoehs+9Jw3f7XWBbY8RMK0e3YgcC5uYnvm1tQseN3jObfVz78lzh7DSN8nQjwyrny
	/LJoE8Riuh7au2InDH+lHpc+LrCv27EQBeX5R/Mq2XF3i75xfFmcAvcv2Axy46MWEZBj7O14FQiBq
	dx/WW1lhb+99m0t0rPZhTn3HuEVK7MaYzgywrCF4ZULHQmf5jJvcYSdOX8m29vghU38WcjLGqzfPZ
	44uE0qx6zuWVwOKq1yQftRjrej2ZtzAD3wtrzhhwSHMltTYJC6zr4MEo78RtKA9RYLio05mcsizZB
	0/b0FE52/uiQQv7CnWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWHn-003J74-3e; Tue, 26 Oct 2021 23:55:19 +0000
Received: from mail-bn8nam08on2045.outbound.protection.outlook.com
 ([40.107.100.45] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWHh-003J5v-Po
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 23:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlAInOK09z4s9Iek+eOg830+LwsGw+vuCpEj0oK3Z2ooz/vU07ZsoJTfQWhvHQD/zLj8kDrHG4wKET3DJBZHk42e7bO+MZ+8Tcxy0Yo1U3jMkpYOL6tQONTMDpVQy7F+jHmNiw7GwWWZf+R+8Yi4ITcVN2wUbOCEmN/j4pWEDsBbjBjHKy5S7ga3t6msRUSvVgsTbfMTXxkcHXSjUKRSQVkktxsXBSuZAHP/u6OdSdQNIoAM1KHjCSN2SoKpX8WGQ6OPAg3u3aT2TAL25PQBxDS0H47pXm2sPLaSnH2Zh8D2kAO+OmMcfU1NMU6RoZpDaWQHZawNlpvWyBFMAsfpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1VV98xbZNPH7dqmC8KU4L7m56U8PvTTB158klKn/MI=;
 b=aXsBdaouKWfdk2mOV3Bf4zAsG5VPYGYnehXwzo3AntWseqTFpfXU97sjDmJR+bINgq1bTi3qUNYPuZKT+L7cTdJhg6QNNwX8zXkL/PPHxD3MIOHHRLhOpjY6S02zRbOM2W8X4VdPrYCjnh6MTO6INmUIeQcLBnlWJg5AsfXaAkJarheUBCa2hg+TdFp8XsztZfKZOQiWTaDDeIf6kYpeWBsaRyr7Y9gWnxrl9u89l44uEEUAmBt/BduI/wZ+JHflCnOma//lYxTsoLgF2IXg927T2ft9k3PrPHKEY0Admg4mFFX65IXqOBtu+luB8vGOKSNGe/qEMwtyyMupaHQ7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1VV98xbZNPH7dqmC8KU4L7m56U8PvTTB158klKn/MI=;
 b=FdU6J2JFW493q7KLbsJvE7c/7tIxGKK9QZrKIorkzqv7cAHLPzZIdJ1s62jlTzAr1ACtispq7NqV/ciRD/wtNCICD3rF32iGlWWSLwiuVBwGT2yFN9UdeABy1zlznIgFdlIOakISd4q5UM7hkzQkIzzsylOTDZCAEdFnCgB4FCz3BOf46bfXLNPI8Kzx0DbMfFwMnoW1PLL9w10Kz4TExR2TaxJTs4axNh0S37u6xogMFwSvAvx4e3djfOlI2f8GRROnSHLTOfFNqpF0ZS6l9LI4wNDhKgD0Bh2xihjudlwvOwlXcMu/Rz9FEJwYoWcRraEwqs9c5fqfGo6Q3l7uMQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MWHPR12MB1566.namprd12.prod.outlook.com (2603:10b6:301:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 23:55:08 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524%7]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 23:55:08 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 01/12] block: move blk_rq_err_bytes to scsi
Thread-Topic: [PATCH 01/12] block: move blk_rq_err_bytes to scsi
Thread-Index: AQHXyW622C7FLy0ytEOazH/alslcZKvl9vCA
Date: Tue, 26 Oct 2021 23:55:08 +0000
Message-ID: <e93f8426-7871-7967-283a-2c98526b0936@nvidia.com>
References: <20211025070517.1548584-1-hch@lst.de>
 <20211025070517.1548584-2-hch@lst.de>
In-Reply-To: <20211025070517.1548584-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69839579-30f6-4054-4421-08d998dc0a65
x-ms-traffictypediagnostic: MWHPR12MB1566:
x-microsoft-antispam-prvs: <MWHPR12MB15663A5A92548D65DA5F8316A3849@MWHPR12MB1566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RvdNIUS9MHrdSVJ3Ir0DhTl2QVlOLUJuDN8KpNsxqCRf9IHdB5GcO3DoxfMiX44cCM6CYW0uxqG/wcl5wAjzh3iaq+KRLeBsZ2bcheiT9EGXi73EPTgkBAt5c7x+XtvRbfFcX7eGTS3UzNYYQQqTTTXnPWF7y/ppxT+gdFioEI60T6ovgYxyRYfsBsHy+hrfrxiHj4z+xkevU4bKV5st+LzptW5FoiPYqNqOCquEutlL3jyXNOA3sMbKf74hlvy0LTu0Kx5lGtiOoosrEQKdyw77Gu9TcxFWHdofkCoKPW4LxHDieOYdmGZU/L/WYp/qdyI0DFJ7XVnqaWT6IREQ0M/AB0HFlHV2NuR4WLmGlKmCmZSM/25K08PcFqGSfj6lSgl3uuQIf2c2XNciCsp1nJ2JXIVo28huX1So9GcmlZCPimDnUUSVzAXmF9M+Bx9eG0Zoiz0VLWbc5VWBC73cyawOTRIUHh5+96kkJ2II3yLDAQiUyciChkpwThT2zA4xJ9S9YJ/lBuDAHugPPce4XNu7Pa5vO/Mj4yRll7tLQ+wgFELX/VGt/nhhhnV2az35sQRLZUd48P4Fpwq+Asr4Njm+k361UlnvkJNXAKz4t6ANFFEFPnsXaKMAfK8ayQeWwQdRlRq6YOjzZLuH9I68/TnSE6l5X7s4CATd+f/j7i7rteB+KPncOajWHl79jkF7lNRRMhZFn7lDc+sYCEn4XSPMECTnE6J3cG6xbwd7qsy4+qnV7TeKIXwXH1+fdhyh/hCeMzLLVrl11+l4EydsMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38070700005)(54906003)(86362001)(2616005)(122000001)(6486002)(71200400001)(186003)(6506007)(8936002)(6512007)(316002)(64756008)(66946007)(558084003)(5660300002)(53546011)(66556008)(76116006)(6916009)(66446008)(2906002)(66476007)(31686004)(83380400001)(36756003)(508600001)(38100700002)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTh4VE9PRkVVcW1MMy9kVEo0d0Rtc3VNRzRBd09WQk4yL3g3NVh3OTMxKzA2?=
 =?utf-8?B?NGo3UDl2cHJUMlBwQTAwbm5XamVpKzNqMWJLSTVlR2VQT1l5NTNldDUxNWUx?=
 =?utf-8?B?MHpvbm1uc1lpQVdkRlRjTmZndnpzRVFnVExBeWpxdENHaE1qVWtoRytmSXVq?=
 =?utf-8?B?NU1CVENSM29PUFBlZVBoNWl5U0dCdTk1ZjVtaDdiQmxJSXVGajEwOWNtc2l4?=
 =?utf-8?B?ZnNxTjhobmVzWm1zWE1CaWJidmllUXV5ZFJXUFFYMEZadnVhd2JCYWo0NFp3?=
 =?utf-8?B?OEh3azJoZmhNd2xXamNWbUdPSVI4bzRxazBqRUxVNXR1UjV1NnRPRXFFR2wz?=
 =?utf-8?B?YWVZcGtlSFFWWWhSNlRNUHpqUFB0T1pEUzBqY2ROTmFFZXI2QzlydU1NaGZ0?=
 =?utf-8?B?Nk9BZzBQb0RMRmwwdHNHaURqZlhYY3NTa0NRRGFZNTFwWE1jdDNLNWZwRmtl?=
 =?utf-8?B?UFQvMEJLM3FYdFNKeVVrKzF3WjY3dUEzUjA4cHVEcnF2VlRqb2xTMHpWT1RS?=
 =?utf-8?B?Tmx4SUF5V2poeU1Pc3pOc0pObzZRTkprWThUU3FQNVcyTU43bVEybjlOcCth?=
 =?utf-8?B?NE95SG1HQURFb1kzRnpuWjRjc1dVaXNnaVJZa3V6SnpnZTdUZUVzckJaS2ZK?=
 =?utf-8?B?VWRTSC90OTV3TERpU1lTYUd3aC9jY1g0TW5udzloSmpONi9mZlFTMGlhQjRV?=
 =?utf-8?B?bXUwSUt4RWk3cE8ySkgxcFg0VEhwaGxZanhkKzVGYTRjMytRT0lIQy9qVTdz?=
 =?utf-8?B?MFNwMnBVRVhWTVBLZFEwbG5wMm1UMWdhL0M2SXM1aFg3L05UTVh2cUVoSU1V?=
 =?utf-8?B?R2RyeVhRUVhYcjBwbFhEanZMSG1Ga0pwU3RJREEwYkh3b2ExY3BGc2lYS0FM?=
 =?utf-8?B?dGJJdXdnc2ZybnU1dTdpV1hVdDgyeERQb3dUZ2pUdEtFdUpaS3FLc25oR3U2?=
 =?utf-8?B?Qzc1WGdzWWd0OTh5NDFaa1JWS2t5MVVhd0NNN3gwaFQyK3FUVUh6cGhhNEF4?=
 =?utf-8?B?N0Y0cFlYS09Na2EyWHdxSGY4SE9hYmJ0R0ZDc2NvODRYWUxhMHBlK2pRZWto?=
 =?utf-8?B?aEJPcGRhUjhzZFRhWjNudWpFWEVETVlFS2VzNzh2N3FMcUZNZ2RaZ2hwTWRy?=
 =?utf-8?B?bFZoMXVXNWFMeTVDUmtoTFh1bGNHMG5IWThYc21qK1gzakVjbXVYbXg3Wk10?=
 =?utf-8?B?bXoxQWVGVm1pTEFvVkQvcnRkNk9MRDExRkZBdVdUN1NqaVB5TWNSSG9CVWZk?=
 =?utf-8?B?eDhJT0dNbzhyYUNhdC8xc1FEOXF6dmYrdXRGZDRlOThVdEFVRm9rSlVRZzJP?=
 =?utf-8?B?MDg3Z004QmJJQUpVSE9ic3Z6TzJNeUZWUndHV1pJN3g4RGNNN05PY01Dc0Js?=
 =?utf-8?B?ZTdFNFFCWEFVLzZnaGVpMVJtRTA0S0liajZwZWpQc2tPVjRMVmZDcWxwcXpE?=
 =?utf-8?B?SzgrQWVZRTVBb2x1TG5TRStCUDdQZG5RSEEyQWx2Z2Z3VjdOSHdTemNXaTdR?=
 =?utf-8?B?VlJORnZScXRTRnBMdDJTTk9zZ0hnMTltQ3RZTGRMMjJJSjdiNjdUS2ZIMXds?=
 =?utf-8?B?N0kxQXkyWm5MU0xXaVNPbUQyakNHSVVpbm9UcWJUME5yNnNDREdILzNqR3FL?=
 =?utf-8?B?Q0Q2SzZMdElGdno5KzNyY2tROXJCUFpDeFF5bXJUS214M3dSQ29vMUlmZ1JW?=
 =?utf-8?B?eS84VFRabFNiVE94Y3dkK1Y4bEc2UzJyWVVrVmVoZ1Jkb2d3d3dBcUJHL05u?=
 =?utf-8?B?cE9GMitIOFNtbm5uN3QzWnpBZkRscHlmeWhxYjFQVnlxZHZjUWp4RHJJaUNS?=
 =?utf-8?B?WDZWRFBWcHRGUUJ2d3orekoxYkt0bDRyMVVza3AvTVE5bnBITkxRUWM3bWlC?=
 =?utf-8?B?WUpyN3JUTEt1NjRpbWpSS2ovRk1tSWhZdjdhdmdQTGIvcForOEJmdSs1eUdz?=
 =?utf-8?B?SUFuYm5uSmEycVF6RlFEejhkaXh5WWhyRjZEbndTMlVVTmZZNUVVTlRwM3Ur?=
 =?utf-8?B?ck92VVcrTEhWeTB4bTBpUWZLZzRSbkxFWFlDS09sWkJTVTFMaVpVckw4V2tR?=
 =?utf-8?B?VVBWM3ZQNXh5V3JlYXNnZTJlYUZMMkxhQzkvL1phZ2RhQi9rUUk0WnVqL1R3?=
 =?utf-8?B?M05xT2Q2c2svT1dRT0VtdnIxeUhuVVEwZE1reFlTSmVxT2VQN0ZzOGdaOEZP?=
 =?utf-8?Q?ttFuz5D12YSLw8osqfMBrvu2IU1j3pQnbK9k7EWjEn9L?=
Content-ID: <A1E4AFB6526AB1408EC82F1B4860AD4C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69839579-30f6-4054-4421-08d998dc0a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 23:55:08.3532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pE/jyI0569WV46ySmD9fec/DR1GqBZRfKvcw7q1hEo3Z/G9l2AO8F1yWCG4Aq4l5JNgsccfzRWA0bWvNyFqwIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_165513_885698_E33AE378 
X-CRM114-Status: GOOD (  11.51  )
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

On 10/25/21 12:05 AM, Christoph Hellwig wrote:
> blk_rq_err_bytes is only used by the scsi midlayer, so move it there.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

make sense to not bloat the the block layer code...

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
