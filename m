Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70E7C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XrWiodc+ETiVT9SSsxOi/19tY5EC0B5u9o4BUP/d+A=; b=YRsLJxNHvrH30g
	+NMguPh0PTMPVlRT81Lm/8fd2nBc4c6JL3lUF+FyOb+QDCDyRuSoX/xZIq5uDytz3YAOcAYNRopWP
	XSOtMHjgPni7A+R9y8GDFHvIc5insPm4DRvQdIHfrXR6FjqUGqeAdtLgGrgwNA86w+JBjJzgQg0+i
	pvQgpvdMkRCY4myOAUSKkT2/zS6R3JgX/nxPqKxphptqxfFQ39SM2ynHO3zsvKP7JMGhwcg+QQoNS
	RgJwt1moQN2H4EWnUYC6/UuKtrLRyv6Oz5T8n++X+eIu78T2A0RHw4yzvKWmmPWmCIJ6B+UiKXj+c
	zSzYUHN2raEj8TH/iE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRwX-008hgD-B5; Tue, 22 Nov 2022 12:00:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRwQ-008ha1-Qd
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 12:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669118394; x=1700654394;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NJ9LTirZCLENaUhWbUb3Rce7jXE4DGtXm1gyXK6MqXs=;
  b=EWTNIHkFUaDW/zM2cBMluHNsHsbef4FqKwxu+X9GFFUtIrhqjcRdK/Fy
   3P8fRqM8CjcwtbhkB+SbWT/O9F08e2HAqTX7eShSkS3a1xHk6UpR+4W4U
   RTB2VWXmnwaoodQCB1eRW5Ru4Rw5BYT0FxD2E7j90PFMutfU/0NVLGUjm
   X5HsoQ2y8Hjcu8iy8lEs020eCIhlt1JF++ZFsVRJW/ECQTbM4v2xXWAAN
   E8oCtDC1oeDlxpOuNZPCSL4PsVg/JDOPwKq+61cZgQYPGCKsDj3eQWLoa
   VJvu+tO4mZePj5YqGaL9/TK6oFM+ddKdhN3wrvpZf75HarGsRWkFMDnCt
   A==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="124575453"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 04:59:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 04:59:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 04:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIY/15fjx92r4xTshUdzJdOhKlchrtDM9LNrzO5gRGcASJvOG05mkDx6J5/Qo5jMuWJB6jZKi9TxfLGcRWh+CiP/MGC7av9OfgvPaKic4Y4QVzA/BZiqzDMDC4+J6CGyoqcqMMbJ3OdSAtFsiR5PH6RXGz3R/R0bdP0pa8XUybs+maEtc91TEya9dsGSjgY4Cg9LR+0FiTcMYYF6gFkiTFD1bb0BofgoMWuCPumAD4swjoTvcAT9AwxU3K7owLWyDV0DbLCyJEHZYdHg/NfMWr+i7pWlxhSP/PonjuyDFGASlqbyl0/TIIW8BKT7vMQhwM6kXK9KADC/nFtVUPCowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ9LTirZCLENaUhWbUb3Rce7jXE4DGtXm1gyXK6MqXs=;
 b=EcX3inSPN2fjHgAQix6KaXxy78puyM4aEfhKQZFkmcDtlaZwZc9fS0n0R3Ec9stydpRACC1kPgFrY5vst1eVBPJ/56MksY6vEKuUgPsdalj+7GbKrfk66YSwbW9kgIq6mPEKPr3OdfsyT0h0Jg2QHdQQX6Ejw2a+QE3vyjK32/gC5y7UGXhX8rgKI7YAFwZCJ2up3qnNzmq9ordmO80yQi2mi8SBHA1UQk/+dRQilDeVx3u9/P/s+xqc1rYQ/CrgctCp7ml+fpZudaZQdhwVv+qg2YtByXRQGjGH1MoYJto4HnHm+gI3DxsbGy7oo6ZNvskBAV3ngW9HrxrxNGgI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ9LTirZCLENaUhWbUb3Rce7jXE4DGtXm1gyXK6MqXs=;
 b=ZVZCY/YNs63O+wzdEXVyFVZMlrv1GuO0sFK0JUjUvTbzo5z9jFbs8t5SDVvsdZ2Co3W/jywWijYyheHNGDdDV+cf5HDh4bl8pQFXPu9NuoVuyNsjep1GhhOsG8ehpSfcfDiTpgO3QUmvaDu445W17Yjym0XwJBAQoCqNfNjlR/s=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 11:59:47 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 11:59:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Topic: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Index: AQHY/bp3TTNDOiKYzU6EJOHdvS+Odg==
Date: Tue, 22 Nov 2022 11:59:47 +0000
Message-ID: <870780c6-6f2e-9b90-6540-2c408f206f6b@microchip.com>
References: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
 <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
 <Y3yxDLw3n643Ivf2@black.fi.intel.com>
In-Reply-To: <Y3yxDLw3n643Ivf2@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|MW3PR11MB4522:EE_
x-ms-office365-filtering-correlation-id: 513a4ac7-42a3-4353-625c-08dacc810d4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: msGtUyzAnDYuD6EzOpBlSp6CDYYWPjslg1xcGuvCX5S8V8U0WdIvlfumS8krFoDkf5IiJlwypUisAVB0Nkcyb03BArMzQzQpKuJy7CUAtKTY5WeIZ/RobNtLvJc4OI7NlTHxrkZ77wXjry5DBBz90p58DIhRJ9FQFZC7MnHEgKaqRUdt1QkPYuuDhameInazg3AcLTLzj1dtqo1zyxJ0XYRVBU7T4qpE1aUQCbbjPKVTdahYTH038cDYRdUmQXKIQ4Ov4KOOZzLWk40XpxV9/vHe9JizUZ+13MRkO2Cb3NIbEC2Ax+OLH3DxOsn3carY3+V3eYM5rjUZqD6hoUgM68H1rCeJeV4xpXoXtVoV9EB8akqG3AS8tB2+lSHoA+1pr/QCvSctBvo80TXpD44LN75mZVLghuWLJXT6NxHP1mtuPL2Qn2vCFgy4zGW7wWAj2oYdWWI/P3IQU5zsGB1wZ8H3s7yOqC315E6vzKfPOLPVrxEo4xd1ZF6XQInWn4wH4tVY71dknQcbATv9R/tfO0q3tF7h5NEOcNJNO92R/6rT9+j4/UeB64+x/+hyYoAa6D3nDzH7XIe4rS9j8PhWIJ/jvWCrfw0nzSu2f/mzW8Gpk/eANV4kfCQ0084TH93bynvvG/+LKXesP6vug5sC9FQVUtHceZqegiFptqY9OoHweWkdNgYgQqlhF0IKFnVl0cZUvoKSVpkJQCyHh4ncB0Z3gg9OvjMDQeRVJQzYjRb6IHh7dHeOc3pS2kachVZLkG46uwHeoqEZpsaD2J7u/QXIk0qrc28q+HVfWgoB2eDN0eOmVm+JIDNEqy5WPDIgZOlFbqauRRCcq4IvtzJesMGYVAf9ToffgP0uxDfIAMZ0evfrV6CgSv8bhj3UCD4E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(31696002)(86362001)(38070700005)(5660300002)(31686004)(36756003)(71200400001)(2616005)(6506007)(66556008)(76116006)(64756008)(66946007)(66476007)(91956017)(66446008)(8676002)(6512007)(316002)(4326008)(6916009)(53546011)(41300700001)(26005)(54906003)(83380400001)(8936002)(186003)(966005)(478600001)(6486002)(2906002)(122000001)(38100700002)(138113003)(45980500001)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFc2YVZ4ZmhMdGpZOHE5WFVaU1E4NlNtc2xjSENZN0wra1dneFhBKzBDYmwv?=
 =?utf-8?B?WXdSZXdyaWVLRm4yZ1IyM3hDSjMweW41aVpHOXZRZlZlSUJrZXhuam05Rk5B?=
 =?utf-8?B?bWdKcDl1c0NyRnZDSC94ZHB5OEFES2ZuSTRaaWY2VEJVeVJXM0dJVnExVFE2?=
 =?utf-8?B?b2E2UTRWS1RKQllkc0daaUx4NU5VWWp4cUxhQXoyQWswNUZrUmU2aVZIc29P?=
 =?utf-8?B?Y2dTT3NsTjFaQWdhYmN0dGVtUzZqZXdCc0VMMXFjVnZML1N4WUcwR3l5eHU2?=
 =?utf-8?B?Q21ySXJCT2tzR2tXMEdBSUl6R3JlVzlWcnJFdWE3YUc2bjk5cmgvQndqSk9m?=
 =?utf-8?B?RGs0WlI4ZWo2K1Z3MjQvQ2ZRTnl1YU9MbS9SNURmNDI0MkZNVzF0NTduNHda?=
 =?utf-8?B?ajVhUVNlSVcxVElLMURYMkl3MHpLV1ZuYzlkbU1HbFdXNVJqMlNQa3ViQzFj?=
 =?utf-8?B?QmlsQlNuMjVYZVdsbzlaaWRTTEhQRlZQeEFSbnFycUwzeklUbzhEUVEybnlJ?=
 =?utf-8?B?U3VLMm9jc0Eya3E1YkowUkl0M1FqSVo2VnE0Rll3c05ZT01RNFlFRUI5Rk5t?=
 =?utf-8?B?ZjBDbU9qUVAyWnUybWdrNStFam5BQ1Q4eTR0aGdvUkdGdU5jY05rTEo0Z2RI?=
 =?utf-8?B?UGxmelZYZkxQWnlYaSt1OXhCUzdlMHlZdGtYcWJjczNaZGJyTE9rMkw1Q0Iz?=
 =?utf-8?B?U0g1ZDhuR2JYSFF5NnliTENkSkFWTkI2dFRoZlZNdGtjY2FHTDQ1TnYrSzRN?=
 =?utf-8?B?cEZUS0NUVzluekJueThYcjl4REVaN0thWDB4TCtWL3p3cTlwNzNvck45WHJa?=
 =?utf-8?B?Y0NGUGtHWU5vV3dsQjhXQ0NGV2lMbkE4M1o0eFB5NFRmTTB0RDdQejlxQkZR?=
 =?utf-8?B?MHMyRG8zWGtjZW5DSzJiMFJFNDN1dFVtZjB2YWRxQjV1Z1pGaDAxUzlMaTZC?=
 =?utf-8?B?NnBFZlU3UjFidFZRWUQxakZIU2RZMEtPamV6bXYrY05xVVptbmMzR1JNNUJy?=
 =?utf-8?B?TVJ6bThzaCtNNzR4QXNKM2VXVklLWkdXNFRUL1lTejNudjkzcmRGa3I0b0I1?=
 =?utf-8?B?NzFoT2lMbmZnR2ZaaDJrWnk3WVg1Z0NoVUJXdVFMR05ZdzhkeWprM1UyeUxI?=
 =?utf-8?B?U2VFMktkaVpnMWlaa0ZVUEErb3M0S3hHLzRFQ1ZIYVBlUXdQUnBOTHBPeXgr?=
 =?utf-8?B?RjdjQUhKejlPSmdJa3lyYjUrQW4zTUt4QWxpK3pSNTloTHVFUUlmK2FRbVda?=
 =?utf-8?B?Y2lybHF4Znc5b0dYTVY4L0t0Yk1UdkI1WVo1LzVIMWEwVWRDTkVZVUxISkk5?=
 =?utf-8?B?bi9BZ0l6bHkvaC94NTBMdUl3NG9TaDNWVkNKc00wbEpzNjRZdmtVc0djRXg3?=
 =?utf-8?B?aXRkT2EwZy9Cbm9kQTBPWWphOEFPdS9KbUd4K3d3V3p2QzRhRHNWQTM3Z0NX?=
 =?utf-8?B?RnZmNEgzUTZqSkJpS2RNa0NCWFBFK2w3ZklCM01CK0x3Q0pDaUo1NVRQUkpl?=
 =?utf-8?B?QnNTREx1U0dKaEZkR2o0aVg3UE9TZUJ0Q2dBSy82L3UxQVpKN3JyT3B1bVJU?=
 =?utf-8?B?SmNBandFSlVRQTFKM2dQZXUxeS9nWnFlZjYxTFlqZjJGU0JiNTloQ3RoOUxz?=
 =?utf-8?B?ODF4OUI3ajFyaUQ1ZmFQMDRHdExaUmplVTAvZktreWpMR2pMSEhtSDB0U3BB?=
 =?utf-8?B?Q0FGZk5JbkdRekVsRUU1ci9Ja1BoQVRTU3Vtb3o5ZW54dDhGVGJucUlIN2h4?=
 =?utf-8?B?R1VYOW5STmxWajFqRG9mWk42ZlNyanpXcWpDRjNrNHJhM29WeXh6aldVR3VL?=
 =?utf-8?B?RTNiNG95S3NkWmE4bE9rVW9yUy9PT0FPdVh2azdZbFkyTGNkcGlVeWx1WWcz?=
 =?utf-8?B?b3BOcUF2d3Z4WkRxdWZ4WFN5SzdtK0UyZ3pqZmczWEZueWxSK2hXdHpHYnhK?=
 =?utf-8?B?MVArc0FURk1oaEpXelhZMWNRTkRXMEFPL2FKK2gwSWtwRW8rS05XSjlFR3g0?=
 =?utf-8?B?UmZhNjhta2Z6MWQyRkNvUWpLeldoVi93WG9kYzRQUUw0VHNkczNVaFllUThl?=
 =?utf-8?B?djVXbTVaZWZQMEdNRDlFS1FRdk9EaVpyS1krbVBRc21BSFBCTlFSYmwwT3Fm?=
 =?utf-8?B?ZUFJTzJRMVB5TGRobHM0Nmo1VnhzUHprTmlUUE9CMFcySzlobkczUGJWNWY3?=
 =?utf-8?B?YkE9PQ==?=
Content-ID: <2B66E0A11EDDB14DA4D61F3E74853CDC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513a4ac7-42a3-4353-625c-08dacc810d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 11:59:47.2147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3vCu/dnpmDqnMgNhcqT2qjxmsfVxrCNIlrp03GkRPWCJV+U/4hHC/iSnK0splA6Um//CrZMNAWIrOcSFqHN8s4J9zE/ZWUk9mITj5AuXQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_035955_126140_770AA4BD 
X-CRM114-Status: GOOD (  16.03  )
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

On 11/22/22 13:22, Mika Westerberg wrote:

cut

>> Here's the simple test:
>>
>> Run the test_qspi.sh script:
>> #!/bin/sh
>>
>> dd if=/dev/urandom of=./qspi_test bs=1M count=6
>> mtd_debug write /dev/mtd5 0 6291456 qspi_test
>> mtd_debug erase /dev/mtd5 0 6291456
>> mtd_debug read /dev/mtd5 0 6291456 qspi_read
>> hexdump qspi_read
>> mtd_debug write /dev/mtd5 0 6291456 qspi_test
>> mtd_debug read /dev/mtd5 0 6291456 qspi_read
>> sha1sum qspi_test qspi_read
>>
>> The two SHA-1 sums must be the same to pass this test.
> 
> That SPI flash holds the system BIOS and I'm using it remotely now so
> there is no way to revive if something goes wrong so I wonder if it is
> OK to skip the above step?

sure, it's fine, yes. Did you test the locking part of your patch?
I'm asking because if you don't need the locking or you're not able to test
it, then you can use the spi-nor-generic driver introduced by Michael at
[1] and you won't need an entry for the flash at all.

> 

cut

> These I was able to read:
> 
> # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> gd25lr256e
> # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> c86719
> # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> gigadevice
> # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060103ff00060110300000ffc8000103900000ff84000102c000
> 00ff03000102e00000ffffffffffffffffffe520eaffffffff0f44eb086b
> 003b00bbfeffffffffff00ffffff44eb0c200f5210d800ff4362c9fe82e9
> 9c58ec6006337a757a7504bdd55c2906740008500001ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
> 8156d9c8ffffffffffffffffffffffffffffffffffffffffffffffffffff
> fffffffffffffffffffffffff38ff0ff215cdcffffffffffffffffffffff
> ffffffffffffffffffffffffffff389b96f0e1a6b2ff

Okay, thanks.


[1] https://lore.kernel.org/linux-mtd/166903807811.85501.6803386075881922742.b4-ty@microchip.com/T/#t
-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
