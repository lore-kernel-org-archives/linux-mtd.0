Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF10C25B4E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/OZmT2Z6M2hHCVEX8LwVjuNTDurvy4Dk96xxnaa1Jk=; b=F4XBOEAgertWIf
	/azaIOw8vHNFJQfNmwGkSA1jVMr3y+XSKe03cbYP7/BXOMyUUvb8pcH2ru3lvFSWlkEilAwaA+5LO
	ou5qZdMoNTUu1qj88X3ah4kInfllUCeD5p54yQoeWuw3jcU9NHSvun3SUjW4jrMWS07F7PG8CnS/z
	T1d08HaXW3rNER/vJPHeqTeKyRdor0o3/flCHFiCT8rU6BrvGWOfAbtpcgYYgBaqcyEfl1sWCyu6f
	Mg4tnfgEJQTauSeTvAyU2QXg2NvQ0CzING3503cHwq75NINrHuWB7nAB4XCIEMt+S1/YrbRcjLuMh
	432NLcfsgPvri6ZOPkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIrxM-00AYb0-Vt; Fri, 20 Jan 2023 14:01:25 +0000
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIrxD-00AYYD-Tz
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2023 14:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsoaGZythdarLCAbrctWqCOqTYPxLtBJ1MLPODBA6PrrZO82bIFJx/YYQorKx/Wd68wF3hiq4Hjn9adb9pguBUjHIy+/Q3EUDpePGj/5zo0XsCqRWddWZtb6uhjSiYb5mzTgmab0G4O38nsQYfUf/jC7ESWH8iEjhze8UTHo5IYfXdJmmmh34vz0VMLvE5bX9zVX003CxicrOpGfNjJWXGKwKRL0oabt93rilk0xZOZ8dyCSMQCZmjUEVZqFRuUHhP2nwwSmsxHu0f4vFXbY6zQ6m/ElwEA13E3qp8anuPe1KXCqdRv17d7crCYeXc+dpVYE4oBDg/K0brc+246HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjpmGD7r+PTU37yvUzD6T2Y9265HE+SSGFoWEC7dsAs=;
 b=JU1lyy9OCragDAe1zk05tHghs83S9qJ2Pj2AJVITkLMNLYLyAue9nTdG2E5la3KYtNpYuty6oss/hZc6ybTrG8z7mkjja/BEWF3y95kP0SfVnqSLrkhB62ExeDLozkKcVwqUUh2nfD5jlaEviTiYce/ZAzHVVfMW42yCTP5KK07+DpOcfKZcbkj/xZLOhPmCgQ05WS5XmAZWSscragGYvUXtKcV8d0rp+GdPsDXNeR4Uheg44oMZ2w3GY60pyCXIOplfhYFBnIx0dvgGkpkxYZtMO5rhKDpzbTMLGK9Q/X/Ob30jB6YycJgTKqAOdY290OI91hfFq+I6WrRj0Z8tHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjpmGD7r+PTU37yvUzD6T2Y9265HE+SSGFoWEC7dsAs=;
 b=e6NYJBihBabcU7NQ2PwL0awlcFYmfThknU84TNRimv60Km1omLNdxEVGVOwN1GgyiOwDjD7H32T4CS+P3vERwnNJiWRsXrMZXZegbxRgDjW5/SOsHmQ+Ltu5nXYojnuQxDfIa4uhFtEkriZJ4KXxMbm8erdupU+XPdONZvmWWqc=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS0PR10MB6725.namprd10.prod.outlook.com (2603:10b6:8:132::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 20 Jan
 2023 14:01:06 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::84a6:e9c3:8c53:8369]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::84a6:e9c3:8c53:8369%9]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 14:01:06 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: SR_SRWD bit in SR reg can be OTP
Thread-Topic: SR_SRWD bit in SR reg can be OTP
Thread-Index: AQHZLNejSPGHcjPsQk+R/m8qYiMJmg==
Date: Fri, 20 Jan 2023 14:01:06 +0000
Message-ID: <381ca50060991b74672b2afbacfbb817a0c02428.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DS0PR10MB6725:EE_
x-ms-office365-filtering-correlation-id: ad3b39c8-2b18-4b55-ebe4-08dafaeec651
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B8dxTS+LHMF4Oe+dLCeWlqNOMyvumnLvk0YucIQFV/cYJ0atcgOpWgv3tQwEPpcW4Q7UFtZ/hBmSA6qxwIfs3GTAn6Kc8l7BdaR8dd+OxC5PYH85C+MOHxrmOHcjjxtxDSxD7zgwgdsnN4RnTBH+bkpw7hmKOX/NMjNa8OB7A1IKeq8n8t7ocCPJ1u6nLYBzl1xMC9Zy65LC8ntsq6OH4e56W1xHumQaJMliVbob9zVCQnenGlXRgQbQpCGbuygyLIBSZaWzDL1fMRu3MApxGY0nx7CqTswmiNR0jne9JrpmY6X+VXUM8PS9RB2iaMcrPg5q1GbU6gJNoPLJbFy7HaKCLep86EHti9HGwREljvuRkfTknUTawxJJFdcSBxWJmT8YJried+wdaoiFOurBP6iOHX8+a5bDoP6mKwuLcqAdSi9SJnYYe0vRWlY1ZV+CRpg3qn289e8JvHjIzDjbgqDeocDwCtOWLfP4xASvGCJl60CccUwz+VM/Nrptttvnm281rd36M+x7jPUivzpLSa1nCLDUD9Ow31sgJBre/6kOH22FtD4d3PFD7jN7iEk/aVW66RfjG6W9BWAkql+jjz8kJE1YYjEHuwH1uIQ5th+KbUbfcfVoPctt2vWbnS0ktKcsKpxEJ9Y63EcUaFfLhTZC2xJEP5CnBX/mS7YehSoe8pnxU+Ju+sUf+yAXrzlevREXXkIt8UdMNKBerJzDZQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(186003)(6512007)(478600001)(2906002)(83380400001)(122000001)(6486002)(5660300002)(8936002)(6506007)(86362001)(71200400001)(316002)(76116006)(91956017)(36756003)(66446008)(66476007)(64756008)(66556008)(6916009)(8676002)(38100700002)(2616005)(66946007)(38070700005)(41300700001)(558084003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TDZJZm0xekRIWTJMRm9pK3gxRXUwZWFjc3Z2bmlleExPZDYrYVBIWmZUTk1T?=
 =?utf-8?B?cVltaXlDazhjeXdwMlJKdzQwVEN0a2I2UTcyQW5oYmN2UHVNZjB2NmRmL0FW?=
 =?utf-8?B?YUQwOGZZQ3VxSHBiZVRhUFpLT1hOSkRvYjNNdzN6QlFzQUk1WnFoQlhBTVdU?=
 =?utf-8?B?UHZqblFzUWJWRVFSVEhETnptNGduM0NMcTI3Qzd4Y2lIUU96TDJEN01mN3Jt?=
 =?utf-8?B?Y1MrWnc2MHdIcE56RHFDM0dRQi9LbWtWVTc0Y2JHWkVqQy9kdmUyRUNmU1Y4?=
 =?utf-8?B?aisvMElnTDhsMk9vMDd4c0JpZFFFZFFCQnI4L1hFNE5TSW5ETGgzNlJ4dzJZ?=
 =?utf-8?B?c2F5UW0vWER1cHlxajg4aUREdVlNM0FScTI5cThvMUU4eUNYWjR5UEgraGlU?=
 =?utf-8?B?RWlUcXMycTdZODFscWVUU1ZDR083SFJsSHZWcWNJM0hCenFiRGFjeHArMzBt?=
 =?utf-8?B?RmZnSjE4MXFoTjY2YUNkU3k1bTlSQ1RkbVpUVFBpUkhrUDd1MXFJYXVtdzR6?=
 =?utf-8?B?Wm50SDJtcGpvRjFxN1VvTzZGSnhBVzgwakNMd2IyUnVDTUVNK3NWTWw5bDZy?=
 =?utf-8?B?UDM2VThXWit6OUVVOXVlRjNXZis1cTdMRUYxQzBOQ3RqbWd4WUprOGRONTNO?=
 =?utf-8?B?Nlh0NmM1dGUxaXlwbFBRUXgwWU9paEpjb2tYbk9Da0s4eXNUckNXVVlEUkRr?=
 =?utf-8?B?UnB1ekZCZGJLWkdrSU1EdytwTlNLSkhKVWNuRFZvcW5GM0FreGpBK0t6U0pT?=
 =?utf-8?B?TTlFL2ZNMGtCRmV2eWxwYmhMcWRPOE5teVYxZHZOTVZ2cE5YUllqYUp0RHQ5?=
 =?utf-8?B?eFducWkyYzdwVEFIVVBUQjhrMkZyaUJFcVgyTDhMS0U2eGRlR3hxQ1I2V2pK?=
 =?utf-8?B?ZnRXNEttU3J1KzRmSmx5ZG45b1BDQ3RzWkQ4RWF5SFluZ29zZTR1bjVrWFo3?=
 =?utf-8?B?c0FOeTdKKy9INnZSYmJhSlc3S0w0UFUrdVZCbXRpOEY1bGQzTGs4K0ljRTRu?=
 =?utf-8?B?OW5saDAweS9IaDJzcVUzSDRScFh4TTVGMm1tbCtKZnJxVkp5WHAxT21CelI4?=
 =?utf-8?B?a0hQbmkyU2JFZUw2ZTVKWW1aNjk0SmludEVXZHJ3YlV5azBndUExWkFaVk5t?=
 =?utf-8?B?RFpnRGZGL0FySnlld2J2M0MrVTJGcDdrMDdlQlptaWwwZUs4UUNUVG1HU0FK?=
 =?utf-8?B?Um5QcXJldkVmR2lJaGxpcThxb0VRcWE4N2tGME5mYlFnZlZmUmR4dmVHNzFm?=
 =?utf-8?B?NllwdmdmL0d1TWZYNDhaQUZNSllsaktIZjdPVDBNM2VIamJMVVp5TkhTMDhI?=
 =?utf-8?B?L1M3Y0hvcWpabGZEcjhYVXNQTGd1NnVSb2Y5QXk3OUpKV2w5TjhpYWV6TkJG?=
 =?utf-8?B?dklNYXRMSDBQTHc0ZDZlK3RMWjlubWFneWdPM2h2ckRuMVc4c2psVXY2YjJE?=
 =?utf-8?B?L1hQK1BjZTZaTHJCTzhMU3RlN2RLbHhyY3Fudk5zSkxQQmxjWndqQUN4R0xj?=
 =?utf-8?B?NS9Ta08vMTJ4SXNMdmxjOVgxSGRIRnNZcVF3dzlXMStaRGNhZmNMWFpFWGlw?=
 =?utf-8?B?dXVsRU0yNU5LTVFGdlZNWk9FdG93cDEyY0txd1dTbEVYTCtRZW1ObHNURStr?=
 =?utf-8?B?VzhhQVFaRXNqemI0SkFuQ2RFUEw5N3ZiRHFnQUJzdHBQTExicGJmbGZLMC8r?=
 =?utf-8?B?SzUvRTRkTFdRZ2g0MTBvQ0VCdjYrdjZBZGliNjBtRWU2QTR3dzJvOHc0V3BW?=
 =?utf-8?B?WTQ4emFBRGh3MVRKWVpaTzVaMHpmNUFLdzZxNnlnU2ZLZWRpU0lxNXNIbzBi?=
 =?utf-8?B?c2VFbjRMSEIzSW9jQ1pNc3ByOXJ1SWttYmc0aXRPbUJWVm5RZG9YVHJlbWhy?=
 =?utf-8?B?aE1hMCtCWXFid2crUlhqSUpoNWJ2YkZQQnR5d09FY1ZnV1pNNjhrR0lJaTk0?=
 =?utf-8?B?Mk5CRFpNT3p4TE13d0VzRHkyMlpuSU9KRjlyZjBiRUF4OGRVblg2K0lLcUo1?=
 =?utf-8?B?aE9VWFRsVVBia3BXcSsrOCsxelZPWnF0V011ckZpcVpnTUw4SCtWVi9SSkMv?=
 =?utf-8?B?STNBT3B1aHlsdUx5TkhuZGN5REdidTlHL1R1WmYzeWtPVGhaNEF2QXRNZzdl?=
 =?utf-8?B?R2pJUFNaaENENWF6RDhXQUVBUUlScjRzcHN2TzZoMkl6eVNmY0FRR3F0M0tp?=
 =?utf-8?Q?ZqT2pxS8Fwf1ldFuV/5Hr01BlMQWwDhdz9rtjOK6F6Sx?=
Content-ID: <DB598B118451DA4C84C6EDEBBF4B512E@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3b39c8-2b18-4b55-ebe4-08dafaeec651
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 14:01:06.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUvOGlCjR9Avd3us4Y/jQsMntn/lLrp48eGEARgiDrNaZZy9hn/bO/+nadaL298Mn9omngN418PI6Wfta9+i6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_060116_260101_7D171CA6 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

swp.c, in spi_nor_sr_unlock()/ spi_nor_sr_lock() the SR reg, SR_SRWD(bit 7) is cleared/set
each time lock/unlock is perforemed.

Micron has a (new?) security feature for some chips where this bit is OTP
and will lock down the SR reg.
Does this bit really need to be set/cleared for normal chips?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
