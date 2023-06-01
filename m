Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EECC77B7A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQLBzbwg33+Qw3yPdEmRLFXnUsQ1ayo9rYiFFJdfYiM=; b=zyeWdT2gRWlWJR
	YPlyO2XO9uEf/61i/t3SJ0P/vCPH0dtucDCgzsTwCuTUnvwV7qKCCj4q9ZT8X1LwOw9rekjIln17+
	/7Ad6UF+mSCPfrqAgnmeN+e/CBY01QcpvPgUfOWxqc62ALfc0CIrxfsupFxZEIxZ8Od4kqW7+qjv6
	gTB/UZUyu4Bn5LDPdlbCV4ubYHXir7DzFhyywPPrAa0d7510hQGZGAJlql/LJY4wv2BcBf0aPwHnk
	NStqPowAtVUkqBmSkH/AZnJ3PQFFsok7yBbCOPrxS034G8JrNb9ZqY0YLmUb4ZA70Sz61qzPU4jUb
	p1Q67ymETjNRqyNcx/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lag-004KJ2-2f;
	Thu, 01 Jun 2023 16:55:58 +0000
Received: from mx0b-003b2802.pphosted.com ([205.220.180.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lad-004KHF-1M
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 16:55:57 +0000
Received: from pps.filterd (m0278970.ppops.net [127.0.0.1])
	by mx0a-003b2802.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351GkpvF003232;
	Thu, 1 Jun 2023 16:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9DzC7EQMqS9nhfH3aQ9MVYd4AEWCGr5sTPsDp58w9wo=;
 b=K/FkErUHl+z7gQN1/HXXXN8fk4WsjzX7vjpF3Bn0kazuTTnlA/c7q8bd1kRPX24DwEbE
 ohG5eHj+/UqUCgWTx0Rhfd9Jc7+kGD1yvUFA2OcjwjMPTCy53MNFhyTuezfO1ulo7CO6
 R11JctI6WnY81Pr9km1MK6R/MhOtjkkswaWNgHHz13GQS2R3GKY+zbms5GCSOmihiAIW
 C1ktgXl/gwUp9jWb409odC+Wi2Oso6sSGGsHVRz/RJzu9jzTB9TNP6oZ6ndqKuVgL4eN
 F0ssUlZG95NZs0lZtBYAN27Mz7h2gGPkYJe32WduerZHB1xCtp+cCzf03AYMrCnsMTTN Qg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-003b2802.pphosted.com (PPS) with ESMTPS id 3quawgtw7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 16:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5xHyapGLB0hkm6RJPva5QAha3oD0nQUjvrr/lI5i6XV8Fn/MA6E0WKP1uxhyhTXyloo4NM85uiBDFfCAFBLdKEsfjjJjP8NVwNTaNGJ17lUvr7/94HRBdGzvw9HW9HvQX9C2UGs536F8LlZ65njD5Drd+VJBu/omumzHjAoeEqwGd354c4bd/ZFnDiFC5LHdANrFVWqNCOdv1RwwMGbCGMreYWq30bwr3In8VcmHUufHgou3UHF2bUN77WFfH054hacnSCt76HN61vFcYtM4Ges/L2c0iTHkH9uV5i8RhSvsniyOnGgxZJwjDLGcK8gbXWHNuOp996LozMZlAtGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DzC7EQMqS9nhfH3aQ9MVYd4AEWCGr5sTPsDp58w9wo=;
 b=iWvST/dqhCylmr+ECYgjt1HiPbEkKedvDgsf3LBBIJF6P2mdN8Of6ieohGsTrb7EVQ+bLXnbag8YPoUZBLG3soEY7+9QPIY2knMzdop0f3x883ohS8JIu4dhXb8fREeCPa33cgp+HMGhcdp7WrB0lI9a+naMNoNd8uGn8y6H8CS6CBbjj+2/NjLrnBFmLcWSDxGo79YBmpw6rMqICzw5zAD+8LIB2iwUiWeLP24NWYS9EtKoxKs4VNhslTcA+fxTC/1+koMz9SoJ0fn0o6Yd1zITCxqfrW81D6VcPRKiU43PH/Puvg3y6XFyvQVcMuM0fQes0dRTr02gMc7ifYP0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DzC7EQMqS9nhfH3aQ9MVYd4AEWCGr5sTPsDp58w9wo=;
 b=XTc5UFep7RUf+64C/R78JEbs3Y2q6VFUPHkepxQVE3rUR+nKIJuwEMXQEdR8sXjLM+RYs+hrPJsWwBwuvwsWegPh3iY/bvgx/ay5R2TC2ukPM5HBwdrk13xsR2YYcZl9MKgl/EGcDhP7iGR1TrWCaQj3qDq+HPUEOCzkF5KQH7FJERHMePfl+sP60VrYMbgcWKXVpvoFAiVYQx6ZJtXheh5ZM5OeYptfxpmSWvdyjn6qPf41FtbwAAWzPfN/xG3rEnq1nJpTEknU8dIlmji3/glYVe1bU4S+N74/ZyrBd8hOLF/q0dCDZcVL/gaREelgmGM6i+1RprEBuisagcPgRQ==
Received: from PH0PR08MB7889.namprd08.prod.outlook.com (2603:10b6:510:114::11)
 by PH0PR08MB7956.namprd08.prod.outlook.com (2603:10b6:510:11b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Thu, 1 Jun
 2023 16:55:42 +0000
Received: from PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b]) by PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 16:55:42 +0000
From: Bean Huo <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexander Shiyan
	<eagle.alexander923@gmail.com>
CC: JaimeLiao <jaimeliao.tw@gmail.com>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: RE: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Topic: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Index: AQHZkiMzb3ovCmHk00i8y+AILspS+q9y4RPggAE3zgCAAXq0AIAAlvEA
Date: Thu, 1 Jun 2023 16:55:42 +0000
Message-ID: <PH0PR08MB7889C9577C6AD5BA2221B74DDB499@PH0PR08MB7889.namprd08.prod.outlook.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
	<20230529134619.255d0b07@xps-13>
	<PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
 <20230601093734.3c752d2f@xps-13>
In-Reply-To: <20230601093734.3c752d2f@xps-13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ActionId=4b38a657-d9f4-4621-82f3-cd402029df32;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ContentBits=0;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Enabled=true;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Method=Privileged;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Name=Public;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SetDate=2023-06-01T16:38:11Z;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SiteId=f38a5ecd-2813-4862-b11b-ac1d563c806f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR08MB7889:EE_|PH0PR08MB7956:EE_
x-ms-office365-filtering-correlation-id: 93c3938f-c79c-490b-3365-08db62c1091d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SKMDqXzARSbIwY8Go83Nkghx8pugpN9mcvJ1QXtsrfKEhvhEP7qZ9YpMz8cxTz3kyZn8iLk1E1iLsusy/QRypd4xIZw/ugmYljfPfggQu2PxP0UkUdRC4KezL/vbTrDvx0suylqhBqUxZycIkFeGV/Gh0Jt4UBW7HD6ML0vcAKuRnjHIR5yPJruseOv7+4P2V3++3t9cjU1+/4BHfXRh/byqXps2Tuog/erbGJVMdKCiqf3k75KJnK3bSc2avMxaAKGuzQCs588E5Z2MnnlUsACowOcBirI4uOmz20gnPbrtTACuxVFy7gCDSOiScfA+5tfV5bonO5/s3JNssXz/B5fq9mEkZGfmN7Aa0rEWUZCnxuNxzcNVvi7KHE4N1B1SAFJPxkb8LFaLvDlA/cR5hlpCCPhr71I4kh3IFpAoZdEiSGKwtcImJN7EEE6XprZxaqHpYaZkjc+9mi8tTIUt4SOjBk+JYoDUvkLk6AxAmgbqmljd1m06xW4/kAr8Ce8gLKmizYhNi8TJZ8QLGbPcqB5J/MPWNq5tO0JWTE0rNguTFL5PL0+AkQHrUt2ulqypazlBMyxMgOy/5lNm0Am5bFviucqnxAyer31Wgg5+ynY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR08MB7889.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(186003)(478600001)(53546011)(6506007)(9686003)(26005)(5660300002)(2906002)(52536014)(8936002)(54906003)(8676002)(38100700002)(110136005)(122000001)(83380400001)(66574015)(86362001)(7696005)(38070700005)(41300700001)(71200400001)(76116006)(4326008)(316002)(33656002)(966005)(66446008)(66946007)(66476007)(64756008)(66556008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djYxeTdBUlEvdmNiKzNRNmdxZFg5TmhrcTd1cDZldFVxVXVSRGFkMzE1alhm?=
 =?utf-8?B?WGR3Q3JRdnU0NjdwRVBHaVd5NDBVVjRkKytlWXByQ2U2RHlYRXErNUxGV1JR?=
 =?utf-8?B?dEZPUWV2eno1MVZmbE5JYmZsQVBCSWVSY1M4dExLYmFyY05sYW5pQzBBM1JQ?=
 =?utf-8?B?VThPcUQ2Z3kvbkpJTzdwVlhTTDBkL21IVlhCcEJ4azhoMnJ0V3ZzbHo0dnpX?=
 =?utf-8?B?NFI3dGpoNGE5WEJBOEEwUFVCZnE2QWVtTHFzZU5ZSFdVYkE4U01QdEZ4M09s?=
 =?utf-8?B?RzFRd2VIUWFmWG4yeUh1dVZucHp1Rm9PaytxS1RWZ0ZVdGVrSWt4NWx6Y1Vp?=
 =?utf-8?B?bjhrb21BVnJPZGhTdzE1RWtyeDVOWEZlTXV4TnA1bDBtcDNRL3BZZW80VXF4?=
 =?utf-8?B?Wk9FbTlvR0pzS3lRbjVnOVIvTnoyNzZUU294VmRyejIyVVhRM3pDVVhNSmda?=
 =?utf-8?B?amR2cmwvVEwwUU44OWdBY1I2L3BvRHgvRUw4VFMxU2hJb0ZDb3B5WEdqMkQ1?=
 =?utf-8?B?MmtkK05xbWRaV2k3OTdQMVpta2w3OFpieXB5V1ZEQWk3NzFIUlpJWUxDem9W?=
 =?utf-8?B?Umt1QTB0dVZoUlI3REZRN0FVZ1hDek5OL21nRTc2a09CRWxpQ2QyclRGSUxj?=
 =?utf-8?B?NDZXUEpEOGxkdXl4TG5odytxV1FjclhDK2owV29TNE8zQ3VNNG9adnpsb3hq?=
 =?utf-8?B?bWxBQlNibmwwNDV6ZlNiRldRMmFPS2F0YzR1RWZad25xaWQyWG5tekJQdFRP?=
 =?utf-8?B?NGxZYWtjN2srZWRVaVl5Y2pCNjJ2RUFTSEtLTW1JLzFqRHpuVmg2TitrenFj?=
 =?utf-8?B?YWsvY01TdDJlOXlBeE12eHlzV1pEY01pejZUdC9JLytMc1JLdTJOdmxERi9C?=
 =?utf-8?B?RDBHa0trd2tFSitQTzdZNGJ6aHhOTG9sZ2lTdTl4ZlUvWnFhOVladWNMTkph?=
 =?utf-8?B?V1ZwNmlQelN6ZVNESEloRGtoS1lRalNGa083SGhqT2Z3aUlsb0N5ZHhqSVhQ?=
 =?utf-8?B?Y1k0bHlXZVJxYzNsZlhUcVdQVHVRK2V5T1V6OWs1cHpvOEhTbjg2d3doRTc5?=
 =?utf-8?B?UzRRVlBUYU8reVNLRFZZWTc1dFdhUklNVmxBaXlqZUpLMjlPODdYdW45SnNu?=
 =?utf-8?B?SVE3R1c1RmhKb3R2dkRCYUswK1FGamJ4R09tME0wYVVxYzhCRDZmcTk0andm?=
 =?utf-8?B?blVkbmdrVVAyM3VWbVdoY21IM3lhNDJEMU9QbmNHVU40VWZQVWRLTk02bUEv?=
 =?utf-8?B?QUtnVitHdmdmcitJVmo3Q3IySFFLQnNRekFURWdSWDFiOSttMXM3cWxlNGhT?=
 =?utf-8?B?Z2ZmM2RLZW0yZkg2V0lkMi81eGRpYkZaK21BMDdCejRPbU5WQWNYbWo4SS9V?=
 =?utf-8?B?YXFGZUdFYnNuQkMvQXVIUFQxb1dnVkt1T2ZyUVFHZklwTUJaaU45WURQQ3lG?=
 =?utf-8?B?L0J3Q2ljWkthUUQvRGc1UkhiSzI4NjZhOGNETVY0TGR5WDF6Y0ZycFZJaGtn?=
 =?utf-8?B?VUthaktySkZJVVQvUHZVYjVXY0dLUjFoejMzeXBzMXJSZkpCM0ZGc1N5QnVt?=
 =?utf-8?B?UGRpcnV6VXRJNFl3aDU3ellFa0UvdWxuMzY3dlpXcThtbUdhblgrK0NIUkk4?=
 =?utf-8?B?WThLVUdiSmtsclBZTVBSamxnR200dGZQR1RDUEptYUdzaVVCNjZwMDdZb25R?=
 =?utf-8?B?dVUrMkx2dkNNakx1VDN4c09hQ2pyRzFESEc2ZHBNNXZFZTU4RWMwUzdLNHdC?=
 =?utf-8?B?T2F0UDBXNmNnMGUvcENlT0RDeHRhUXVrN3kvZXhybU5LSWo3VDM0MWEyd2RS?=
 =?utf-8?B?ZmhTZXdhcEd3c2YwMFU0WTQ3V3JPTm4yb2ZKeTFqQmN1TlJ4VGFRYklMVE8x?=
 =?utf-8?B?VUc2YWlkeWNTMm9TNmtzam5GQkdPWEh4aVJGTGl4akxsaUxaUmRaaVdwWE9k?=
 =?utf-8?B?d1ZmRURsK2pFdEVVOWVyYjc0WW9RZUhRTjNSWU5UeDVGVFBwNlpZeHcycUFz?=
 =?utf-8?B?OG1wQ3BFNy9kM3RGSTJwa2ZNNEJiMmQ5d01oQTQxd09OU3NTVGtQbTRmc0oy?=
 =?utf-8?B?bXQ4Y1FDMmdNNDRieDJ4eno2RjNGclFTOHBvWXhXUCswUU02UUhrVEFrQ0JT?=
 =?utf-8?Q?hWJOXiOyXObId3j2kV6sqG3Yn?=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR08MB7889.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c3938f-c79c-490b-3365-08db62c1091d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 16:55:42.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rCVM4qnGVFfIXSf6PQX0h3+RhWAL0rnWgMI+ONbwlAIAZYI0J3awYHJWhyoCPBnKue4ILnEfIqbZVkTbeNQf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7956
X-Proofpoint-ORIG-GUID: 0hy-l14RHljJXdjTerP82qt7fZKjsLjF
X-Proofpoint-GUID: 0hy-l14RHljJXdjTerP82qt7fZKjsLjF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_095555_696974_90959748 
X-CRM114-Status: GOOD (  43.31  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLA0KDQpBcyB5b3UgbWVudGlvbmVkIG5vIEVDQyBlcnJvci4gIEFuZCBTcXVhc2hG
UyBjb21wbGFpbnM6IFVuYWJsZSB0byByZWFkIGRhdGEgY2FjaGUuDQpXZSB3YW50IHRvIHNlZSBJ
L094LCBSRSMsIFdFIyBhbmQgUi9CIywgdG8gY2hlY2sgaWYgY29tbWFuZCBpbnB1dCBhbmQgZGF0
YSBvdXRwdXQgcHJvcGVybHkuDQpJdCBpcyBiZXR0ZXIgdG8gY2FwdHVyZSB0aGUgY29tbWFuZCAz
MWgsIGFuZCBpdHMgZm9sbG93aW5nIGRhdGEuICANCg0KS2luZCByZWdhcmRzLA0KQmVhbg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEsIDIwMjMgOToz
OCBBTQ0KPiBUbzogQWxleGFuZGVyIFNoaXlhbiA8ZWFnbGUuYWxleGFuZGVyOTIzQGdtYWlsLmNv
bT4NCj4gQ2M6IEJlYW4gSHVvIDxiZWFuaHVvQG1pY3Jvbi5jb20+OyBKYWltZUxpYW8gPGphaW1l
bGlhby50d0BnbWFpbC5jb20+Ow0KPiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW0VYVF0gUmU6IEJvb3QgZmFpbGVkIGFmdGVyIHBhdGNoICJtdGQ6IHJhd25h
bmQ6IFN1cHBvcnQgZm9yIHNlcXVlbnRpYWwNCj4gY2FjaGUgcmVhZHMiDQo+IA0KPiBDQVVUSU9O
OiBFWFRFUk5BTCBFTUFJTC4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdQ0KPiByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQgd2VyZSBleHBlY3RpbmcgdGhp
cyBtZXNzYWdlLg0KPiANCj4gDQo+IEhlbGxvLA0KPiANCj4gZWFnbGUuYWxleGFuZGVyOTIzQGdt
YWlsLmNvbSB3cm90ZSBvbiBXZWQsIDMxIE1heSAyMDIzIDEyOjAyOjA4ICswMzAwOg0KPiANCj4g
PiBIZWxsby4NCj4gPg0KPiA+IEknbSBub3QgdmVyeSBzdXJlIHdoYXQgSSBzaG91bGQgaGF2ZSBt
ZWFzdXJlZCBhbmQgaG93IHRvIGNhdGNoIHRoZSByaWdodCBtb21lbnQuDQo+ID4gSGVyZSdzIHdo
YXQgaGFwcGVuZWQ6IFRoZSBmaXJzdCBzaG90IHdhcyB0YWtlbiBpbW1lZGlhdGVseSBhZnRlciB0
aGUNCj4gPiBib2FyZCB3YXMgbGF1bmNoZWQsIHRoZSBzZWNvbmQgYmVmb3JlIHRoZSBrZXJuZWwg
Y3Jhc2hlcy4gWWVsbG93IGJlYW0NCj4gPiAtIFIvfkIsIGJsdWUgLSBBRDEuDQo+IA0KPiBCZWFu
LCBjYW4geW91IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgd2hhdCB0aW1pbmdzIHlvdSBuZWVkIHRv
IHNlZT8NCj4gV2hlcmUgZG8geW91IHRoaW5rIHdlIG1pZ2h0IGhhdmUgYSB0aW1pbmcgaXNzdWU/
IE1heWJlIHdlIGNhbiBqdXN0IGFkZCBkZWxheXMgYW5kDQo+IHNlZSBpZiB3ZSBnZXQgZGlmZmVy
ZW50IHJlc3VsdHMuIEkgZGlkIG5vdCB1bmRlcnN0YW5kIHdoZXJlIHRoZSBiZWxvdyBsaW5rIG5l
ZWRzIHRvIGJlDQo+IGxvb2tlZCBhdCBzcGVjaWZpY2FsbHkuDQo+IA0KPiBXaGF0IGJvdGhlcnMg
bWUgdGhvdWdoLCBpcyB0aGUgYWJzZW5jZSBvZiBFQ0MgZXJyb3IsIGp1c3QgbGlrZSBpZiB0aGUg
ZGF0YSB3YXMgZmluZS4NCj4gQWxleGFuZGVyLCBob3cgaXMgaXQgcG9zc2libGUgdGhhdCB0aGUg
TkFORCBjb250cm9sbGVyIGRvZXMgbm90IGNvbXBsYWluIGFib3V0DQo+IGVycm9ycyB3aGlsZSBz
cXVhc2hmcyBkb2VzPw0KPiANCj4gQ2FuIHlvdSBhbHNvIGR1bXAgYSBidWZmZXIgYW5kIGNvbXBh
cmUgd2l0aCB3aGF0IHlvdSBleHBlY3Q/IElzIHRoZSBkYXRhIGZ1bGx5DQo+IHJhbmRvbT8gU21h
c2hlZCBzb21ld2hlcmUgc3BlY2lmaWMuLi4/DQo+IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCj4g
DQo+ID4g0LLRgiwgMzAg0LzQsNGPIDIwMjPigK/Qsy4g0LIgMTc6NDksIEJlYW4gSHVvIDxiZWFu
aHVvQG1pY3Jvbi5jb20+Og0KPiA+ID4NCj4gPiA+IEhpIE1pcXVlbCwNCj4gPiA+DQo+ID4gPiBU
aGFua3MgZm9yIHJlYWNoaW5nIG91dCBtZSwgaGVyZSBoYXMgYSBUTi0yOS0wMTogSW5jcmVhc2lu
ZyBOQU5EIEZsYXNoDQo+IFBlcmZvcm1hbmNlLg0KPiA+ID4gaHR0cHM6Ly9tZWRpYS13d3cubWlj
cm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3QNCj4gPiA+IHMv
dGVjaG5pY2FsLW5vdGUvbmFuZC1mbGFzaC90bjI5MDEucGRmP3Jldj1hMjI4ZmQxNTRjMjc0ZWY3
ODY2OWI2N2VhDQo+ID4gPiAwOTdlY2RhDQo+ID4gPg0KPiA+ID4NCj4gPiA+IElmIEFsZXhhbmRl
ciBjYW4gZG8gdHJhY2luZyB3aXRoIG9zY2lsbG9zY29wZSBvbiB0aGUgcGFyYWxsZWwgTkFORCBi
dXMsIHRoYXQNCj4gd291bGQgYmUgaGVscCB0byBjaGVjayBpZiB0aGlzIGlzIHRoZSB0aW1pbmcg
aXNzdWUuDQo+ID4gPg0KPiA+ID4gS2luZCByZWdhcmRzLA0KPiA+ID4gQmVhbg0KPiA+ID4NCj4g
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gPiA+ID4gU2VudDogTW9uZGF5LCBN
YXkgMjksIDIwMjMgMTo0NiBQTQ0KPiA+ID4gPiBUbzogQWxleGFuZGVyIFNoaXlhbiA8ZWFnbGUu
YWxleGFuZGVyOTIzQGdtYWlsLmNvbT4NCj4gPiA+ID4gQ2M6IEphaW1lTGlhbyA8amFpbWVsaWFv
LnR3QGdtYWlsLmNvbT47DQo+ID4gPiA+IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBC
ZWFuIEh1byA8YmVhbmh1b0BtaWNyb24uY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBbRVhUXSBSZTog
Qm9vdCBmYWlsZWQgYWZ0ZXIgcGF0Y2ggIm10ZDogcmF3bmFuZDogU3VwcG9ydA0KPiA+ID4gPiBm
b3Igc2VxdWVudGlhbCBjYWNoZSByZWFkcyINCj4gPiA+ID4NCj4gPiA+ID4gQ0FVVElPTjogRVhU
RVJOQUwgRU1BSUwuIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4g
PiA+IHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIHdlcmUgZXhwZWN0aW5nIHRo
aXMgbWVzc2FnZS4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSGkgQmVhbiwNCj4gPiA+ID4N
Cj4gPiA+ID4gSSdtIGFkZGluZyB5b3UgdG8gdGhpcyB0aHJlYWQgYmVjYXVzZSBJJ20gY2x1ZWxl
c3MgcmVnYXJkaW5nDQo+ID4gPiA+IHdoYXQncyBoYXBwZW5pbmcgdG8gQWxleGFuZGVyLg0KPiA+
ID4gPg0KPiA+ID4gPiBTaG9ydCByZWNhcDogc2VxdWVudGlhbCBwYWdlIHJlYWRzIHNlZW0gdG8g
ZmFpbCB3aXRoIGFuIE1UMjlGIE1pY3JvbiBjaGlwLg0KPiA+ID4gPiBBbGV4YW5kZXIgaXMgdXNp
bmcgYSBncG1jIGNvbnRyb2xsZXIgd2l0aG91dCBvbi1kaWUgRUNDLCBJIGRvdWJ0DQo+ID4gPiA+
IHRoZSBlcnJvciBjb21lcyBmcm9tIHRoZSBjb250cm9sbGVyLCBzbyBJIHdvdWxkIGxpa2UgdG8g
a25vdyBpZg0KPiA+ID4gPiB0aGVyZSBpcyBhbnl0aGluZyBrbm93biB0byBmYWlsIHdpdGggdGhl
c2UgY2hpcHMgcmVnYXJkaW5nIHRoZSB1c2UNCj4gPiA+ID4gb2Ygc2VxdWVudGlhbCByZWFkcy4g
V2UgY2FuIGVhc2lseSB3b3JrIGFyb3VuZCB0aGF0IHNpdHVhdGlvbiBpZiB3ZSBpZGVudGlmeSB0
aGUNCj4gcHJvYmxlbS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGEgbG90LA0KPiA+ID4gPiBN
aXF1w6hsDQo+ID4gPiA+DQo+ID4gPiA+IGVhZ2xlLmFsZXhhbmRlcjkyM0BnbWFpbC5jb20gd3Jv
dGUgb24gTW9uLCAyOSBNYXkgMjAyMw0KPiA+ID4gPiAxMzozMzowNCArMDMwMDoNCj4gPiA+ID4N
Cj4gPiA+ID4gPiDQv9C9LCAyOSDQvNCw0Y8gMjAyM+KAr9CzLiDQsiAxMToxMiwgTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46DQo+ID4gPiA+ID4gLi4uDQo+ID4gPiA+
ID4gQWNjb3JkaW5nIHRvIHRoZSBNVDI5RjJHMDhBQkFFQVdQIGRhdGFzaGVldCwgdGhlIGNoaXAg
c3VwcG9ydHMNCj4gPiA+ID4gPiA+ID4gdGhlIFJFQUQgUEFHRSBDQUNIRSBTRVFVRU5USUFMIG9w
Y29kZSwgYnV0IHdpdGggdHdvIGNhdmVhdHM6DQo+ID4gPiA+ID4gPiA+ICA0LiBUaGVzZSBjb21t
YW5kcyBzdXBwb3J0ZWQgb25seSB3aXRoIEVDQyBkaXNhYmxlZC4NCj4gPiA+ID4gPiA+ID4gIDUu
IElzc3VpbmcgYSBSRUFEIFBBR0UgQ0FDSEUgc2VyaWVzICgzMWgsIDAwaC0zMWgsIDNGaCkgY29t
bWFuZA0KPiA+ID4gPiA+ID4gPiAgIHdoZW4gdGhlIGFycmF5IGlzIGJ1c3kgKFJEWSA9IDEsIEFS
RFkgPSAwKSBpcyBzdXBwb3J0ZWQgaWYgdGhlIHByZXZpb3VzDQo+ID4gPiA+ID4gPiA+ICAgY29t
bWFuZCB3YXMgYSBSRUFEIFBBR0UgKDAwaC0zMGgpIG9yIFJFQUQgUEFHRSBDQUNIRSBzZXJpZXMN
Cj4gPiA+ID4gPiA+ID4gICBjb21tYW5kOyBvdGhlcndpc2UsIGl0IGlzIHByb2hpYml0ZWQuDQo+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoZSBz
ZWNvbmQgcmVtYXJrIHN1aXRzIHVzLCBzaW5jZSB3ZQ0KPiA+ID4gPiA+ID4gPiBjcmVhdGUgdGhl
IGNvcnJlY3Qgc2VxdWVuY2UuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gRXhhY3RseSwgd2Ug
ZG86DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gICAgICAgICBSRUFEMCAoMCksIFJFQURTVEFS
VCAoMzApLA0KPiA+ID4gPiA+ID4gICAgICAgICBSRUFEQ0FDSEVTRVEgKDMxKSwgZGF0YSwNCj4g
PiA+ID4gPiA+ICAgICAgICAgUkVBRENBQ0hFU0VRICgzMSksIGRhdGEsDQo+ID4gPiA+ID4gPiAg
ICAgICAgIC4uLg0KPiA+ID4gPiA+ID4gICAgICAgICBSRUFEQ0FDSEVFTkQgKDNmKSwgZGF0YS4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiB3aGljaCBpcyB3aGF0IHRoZSBkYXRhc2hlZXQgdGVs
bHMgdXMgSSBiZWxpZXZlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQnV0IHRoZSBmaXJz
dCByZW1hcmsgY2FuIGJlIGEgcHJvYmxlbSBpbiB0aGlzIGNhc2UuDQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gSSB3YXMgbm90IGF3YXJlIG9mIHRoaXMgbGltaXRhdGlvbiwgaXQncyBvbmx5IHdy
aXR0ZW4gaW4gdGhlDQo+ID4gPiA+ID4gPiBzdW1tYXJ5LCBub3QgaW4gdGhlIGRldGFpbHMgYWJv
dXQgdGhlIGNvbW1hbmRzLCBuaWNlIGZpbmRpbmcuDQo+ID4gPiA+ID4gPiBXZSBuZWVkIHRvIHBy
ZXZlbnQgb24tZGllIEVDQyB1c2VycyBmcm9tIGVuYWJsaW5nIHRoaXMgZmVhdHVyZS4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBCdXQgZ2l2ZW4gdGhlIGJlbG93IHRyYWNlLCB5b3UncmUgbm90
IHVzaW5nIHRoZSBvbi1kaWUgRUNDDQo+ID4gPiA+ID4gPiBlbmdpbmUsIHJpZ2h0PyBJdCBsb29r
cyBsaWtlIHlvdSdyZSB1c2luZyB0aGUgY29udHJvbGxlcidzIEVMTQ0KPiA+ID4gPiA+ID4gZW5n
aW5lIHRvIHBlcmZvcm0gRUNDIGNvcnJlY3Rpb24sIHNvIEkgZG9uJ3Qgc2VlIHdoeSB0aGlzDQo+
ID4gPiA+ID4gPiBzcGVjaWZpYyBsaW1pdGF0aW9uIHdvdWxkIGhpdCB1cy4gQ2FuIHlvdSBjb25m
aXJtIHRoZSBFQ0MgZW5naW5lIG9mIHRoZSBjaGlwDQo+IGlzIGRpc2FibGVkPw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gWWVzLCBvbi1kaWUgRUNDIGlzIGRpc2FibGVkLg0KPiA+ID4gPiA+IFBsZWFz
ZSBhZHZpc2Ugd2hlcmUgSSBjYW4gaW5zZXJ0IHNvbWUgZGVidWcgbWVzc2FnZXMgdG8gY2xlYXIg
dGhpbmdzIHVwLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBvbWFwLWdwbWMgNTAwMDAw
MDAuZ3BtYzogR1BNQyByZXZpc2lvbiA2LjAgLi4uDQo+ID4gPiA+ID4gPiA+ID4gPiBuYW5kOiBk
ZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhkYQ0KPiA+ID4g
PiA+ID4gPiA+ID4gbmFuZDogTWljcm9uIE1UMjlGMkcwOEFCQUVBV1ANCj4gPiA+ID4gPiA+ID4g
PiA+IG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOg0K
PiA+ID4gPiA+ID4gPiA+ID4gMjA0OCwgT09CDQo+ID4gPiA+ID4gPiA+ID4gPiBzaXplOiA2NA0K
PiA+ID4gPiA+ID4gPiA+ID4gbmFuZDogdXNpbmcgT01BUF9FQ0NfQkNIOF9DT0RFX0hXIEVDQyBz
Y2hlbWUgLi4uDQo+ID4gPiA+ID4gPiA+ID4gPiBWRlM6IE1vdW50ZWQgcm9vdCAoc3F1YXNoZnMg
ZmlsZXN5c3RlbSkgcmVhZG9ubHkgb24gZGV2aWNlIDI1NDowLg0KPiA+ID4gPiA+ID4gPiA+ID4g
ZGV2dG1wZnM6IG1vdW50ZWQNCj4gPiA+ID4gPiA+ID4gPiA+IEZyZWVpbmcgdW51c2VkIGtlcm5l
bCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiAxMDI0SyBSdW4NCj4gPiA+ID4gPiA+ID4gPiA+IC9z
YmluL2luaXQgYXMgaW5pdCBwcm9jZXNzIFNRVUFTSEZTIGVycm9yOiBsem8NCj4gPiA+ID4gPiA+
ID4gPiA+IGRlY29tcHJlc3Npb24gZmFpbGVkLCBkYXRhIHByb2JhYmx5IGNvcnJ1cHQgU1FVQVNI
RlMNCj4gPiA+ID4gPiA+ID4gPiA+IGVycm9yOiBGYWlsZWQgdG8gcmVhZCBibG9jayAweGQyOTFj
MjogLTUgU1FVQVNIRlMgZXJyb3I6DQo+ID4gPiA+ID4gPiA+ID4gPiBsem8gZGVjb21wcmVzc2lv
biBmYWlsZWQsIGRhdGEgcHJvYmFibHkgY29ycnVwdCBTUVVBU0hGUw0KPiA+ID4gPiA+ID4gPiA+
ID4gZXJyb3I6IEZhaWxlZCB0byByZWFkIGJsb2NrDQo+ID4gPiA+ID4gPiA+ID4gPiAweGQyOTFj
MjogLTUgU1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIGRhdGEgY2FjaGUNCj4gPiA+ID4g
PiA+ID4gPiA+IGVudHJ5IFtkMjkxYzJdIFNRVUFTSEZTIGVycm9yOiBVbmFibGUgdG8gcmVhZCBw
YWdlLA0KPiA+ID4gPiA+ID4gPiA+ID4gYmxvY2sgZDI5MWMyLCBzaXplIDE0MzA3IFNRVUFTSEZT
IGVycm9yOiBVbmFibGUgdG8gcmVhZA0KPiA+ID4gPiA+ID4gPiA+ID4gZGF0YSBjYWNoZSBlbnRy
eSBbZDI5MWMyXSBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQNCj4gPiA+ID4gPiA+ID4g
PiA+IHBhZ2UsIGJsb2NrIGQyOTFjMiwgc2l6ZSAxNDMwNyBLZXJuZWwgcGFuaWMgLSBub3Qgc3lu
Y2luZzogQXR0ZW1wdGVkDQo+IHRvIGtpbGwgaW5pdCENCj4gPiA+ID4gPiA+ID4gPiA+IGV4aXRj
b2RlPTB4MDAwMDAwMDcgQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkDQo+ID4g
PiA+ID4gPiA+ID4gPiA2LjMuMCsgIzEwNSBIYXJkd2FyZSBuYW1lOiBHZW5lcmljIEFNMzNYWCAo
RmxhdHRlbmVkDQo+ID4gPiA+ID4gPiA+ID4gPiBEZXZpY2UNCj4gPiA+ID4gPiA+ID4gPiA+IFRy
ZWUpICB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hvd19zdGFjaysweGIvMHhjDQo+ID4gPiA+ID4g
PiA+ID4gPiBzaG93X3N0YWNrIGZyb20gZHVtcF9zdGFja19sdmwrMHgyYi8weDM0ICBkdW1wX3N0
YWNrX2x2bA0KPiA+ID4gPiA+ID4gPiA+ID4gZnJvbQ0KPiA+ID4gPiA+ID4gPiA+ID4gcGFuaWMr
MHhiZC8weDIzMCAgcGFuaWMgZnJvbSBtYWtlX3Rhc2tfZGVhZCsweDEvMHgxMjANCj4gPiA+ID4g
PiA+ID4gPiA+IG1ha2VfdGFza19kZWFkIGZyb20gMHhjMTAyY2E4MCAtLS1bIGVuZCBLZXJuZWwg
cGFuaWMgLQ0KPiA+ID4gPiA+ID4gPiA+ID4gbm90DQo+ID4gPiA+ID4gPiA+ID4gPiBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0IQ0KPiA+ID4gPiA+ID4gPiA+ID4gZXhpdGNvZGU9MHgw
MDAwMDAwNyBdLS0tDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
