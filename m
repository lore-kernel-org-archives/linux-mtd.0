Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F68C636D6
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSeoFvWfq0Ghep+PYUjqCfYQf24RY41q+pSUVCImWl8=; b=JQWqRTkhWMfzKlzrs7ae5CQmIB
	iCjzmdx+BOSu4RyO+tq9Y/ot71tZazt/jptXuGJAzu3b/zpcFDYMAxwRB7bsENZPujKyhj9aoH2eF
	CiCbb2yZ8Q4xvWK2whBw2svNGcybIy4qt7WwfwPJIeVArwb6C7ncbmf/WBcd+I22H/m+hPxlmzzKJ
	iSns3ePzZZPPMejw1h/ce/9OQcIG1ns5JbQrUawCFmDcJ73OD8ywWN9tEjxE7UJkHA9RpJSfqgmN/
	BXKAZe5W19hcKZhqj+fvp5eN3J2N0K/8C3W2d4noLwIu8nHjwxStXsbzMq4fjoQovc3aRU2NpJe3I
	NJcH6crg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9Hs-00G3Za-73; Thu, 23 Feb 2023 10:57:20 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9Hm-00G3XG-Qh
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 10:57:18 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45]) by mx-outbound44-36.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 23 Feb 2023 10:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anw7+OhxJxmBWjiQeS3EK3MAvpFjRD2hkAzwn+XxzpEAvbZ6QGIY9hU6/doL3GHqOqkT2VBQQuav0r/bA6VEL9hbQjFoIt8n/0ztgl7RQ4w4gf4bg22DlgWOfsArqLQF0OH94s1vOJgS8cMDhWQduSzWrZBBQUXlRhkyDsr1BpoZQMZaRwjN4pMbrh1c8P4pzSsrMFtkKK1sRpYkmi6RiMpw+gcvyIo30THfWhbeGrlUL0BjrZyh+KItcujO73rB3AsRkE0vEYzm8REQBC5MhWQtMC+/h/6LqoLhi42voMLtrLrxlc9qGswoz3mK5tK1eAjzaMUzajUYRTc+2IhvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5QS5DDamUtmK2EmQLdcp4NSmiW76bygw6YDA0BFcho=;
 b=fDbMxoR1xsCKB65LOKiF95H8B8AlYky2Tde+u9wmrkTE2pA5e9PMTW2yaW2Zbigl1/WA2MUwVKNWbN7pHbb5yeDcIhQm0XEwpnEiFQo/FAd8sGJt0DKl+lYMbNX1uq1Ni8n5m/38aoJXmFOSXM+293oShC+H/TbKdgFXKHPUEg+yG2bJCFsSoZCogCUG+4HpZbLokAZB9C2tK7TAUQSqEDIzdIqLqBLDmJrmQC4Y3U5n/jIBZiSzPZw+Z2hrFJukmOYI8hWpN7eZzNQoWHH+LAGL2XnSWwuj4ecWBmmhjWQy4Ygg7beswWwzqEEsXz8vWFPj5JIcsv3Mff4TACn4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5QS5DDamUtmK2EmQLdcp4NSmiW76bygw6YDA0BFcho=;
 b=CtDCcST1X1WEMCPnrl3sLbK5B055L33Anl8phWo3lT957ZdtMnn1CbibB9koHtG14cbVHqJD5FrebIlX3L9DQQcmABEB58ZbA+05I1hGog15xXBcgHzBSS0PjrdAxcZSbviD9+v4BmNHaVDa6ZifArRfAXOGql9WHoer2JpErj5WzP0DufjqPsQQMlS6IZ28B7o0zVRe3kxq074MvK83tSmz0yxrQ5xc3ACnkltuRPyxNuWioRhRbU0JkQ4v9uv25AvZTEBuqIUs8+0KlwWJxvZ/XuxDbfXco3vhquO3LGqpZehO89tLpNHds/oGVVztqCRwg+mVYLke5LoA391nfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by CH2PR10MB4376.namprd10.prod.outlook.com (2603:10b6:610:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Thu, 23 Feb
 2023 10:57:01 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:57:00 +0000
Message-ID: <19d6f9c9-1066-1b36-cc02-65bd1b3f331e@digi.com>
Date: Thu, 23 Feb 2023 11:56:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] nand_base: force best_mode to be >= 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: herve.codina@bootlin.com, sashal@kernel.org, linux-mtd@lists.infradead.org
References: <20230222152510.1064332-1-hector.palacios@digi.com>
 <20230223085156.76fade4e@xps-13>
From: Hector Palacios <hector.palacios@digi.com>
Organization: Digi
In-Reply-To: <20230223085156.76fade4e@xps-13>
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|CH2PR10MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f41e8b5-10c6-46b0-d5ed-08db158cb07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QghU8o4heOgrKlMBxKCN51y+DNoKuQXyGPlzhHWo4Npk8F5mauXIlVuefyQuGbdIEoXWQfwToIgCvQfmx8417xuDGKjU4C7Oz54cxfH5d+jBe6Zkp8gMdKfWIoCylgMjrAFe/EoUPgeF49U5u7k7KLz6XyvdYIqzDKU/9AepkbcJYqcn8Gis9LuV8EoIdnFED6+1F0QoW7k4aJdm7pvkh4tZzA1GyrSHkBzu3kxxp8YEc1NGCK8Nlb8LCR//i5dSsVs+pGFCWv0sMyCYJ6e8WRniUstVKbFv+8iRRjQ8LDYmwW1/I2qPblVpLbwp8ueoKkZw5Q/cd26tLVsCPJAPR0EjUqCsZHE+/eSknlRnU+55cQwRzl36nLqy45Oj58U56QWQ++YdRiDsmcKq6pn1NeQycXtVx21GASO+EK7X4HU+J14BOIg+wkA4lexg77UDLDdogJTS0kMy42hFN0+d/iyKvUz/9DYrJePrlAVlpvP/y1Y//jxlXSZqKoxLRx6QCBUdOaY6y1gEAUAfQ66x175e9ulQONZ7khJw3MtLjdsNvRGHNHf1JbtHiTGfIGvKjbbCObSEPjNr7/ia6c9ntQ1zpG5WWCbLH+b3gmPilCmTP1s5zXGmZfjqa1cC2Yaqz+V7s04W0L7hWPAcyubLAVOOQI5Nu0cZKDZlfy6WabMRAHN+HQJgaMyaiZ6uo0IkMEL9b9mjOwWxUHSSzhmtttU3JucHXqv1s7k12QiMZAM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(39850400004)(346002)(396003)(451199018)(44832011)(86362001)(38100700002)(31696002)(2906002)(31686004)(966005)(6486002)(478600001)(36916002)(53546011)(26005)(6512007)(66574015)(186003)(36756003)(66556008)(66476007)(66946007)(83380400001)(41300700001)(4326008)(2616005)(6506007)(6666004)(6916009)(8936002)(8676002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MHA3RFMxWWJVVjduRHdBUWlCL2JpckdYN0ZyL0R0cUFndFE1M21RNDZqVVJx?=
 =?utf-8?B?TEhnNzhicmhUY2xmNkFoU0ZKVVNwSnRvNmRlL0Z3c1ZkRWwveDltRTNrRzZJ?=
 =?utf-8?B?RmdOQUZNa3JINTRpZ2pjNmxuRHFpOG54N2dNaTB5U0g5c3FvWFBTZjBvTmc3?=
 =?utf-8?B?QjlLcW5ZTnpOYWc3aDBtbnVieE52YlkxVVhieGdOOXpHTmNMR1p0WkVERlFR?=
 =?utf-8?B?Wlh1R3FiYTYxRURVK0d3UG1xM1N1UWhqR0taSTNleWZKWHl4S3JJVXpINHAv?=
 =?utf-8?B?SmJsU1M5bFgyUVN0V3l1OVNDaFROWDJtcWVPUmtMb0xvelEzaldVM3FGSEJX?=
 =?utf-8?B?QnBlNUJ6dW03b2hMa0VIWmlkaVF1Sk9qMTltYWV6TWVGVHJHRHRJTndOdE4y?=
 =?utf-8?B?UmY3RGg3M29kTkRSaDJTamtMb2VVV1lxclZERTZGVHVYb2JQUG1BdFNTNjlJ?=
 =?utf-8?B?dXdkWk5KcGwvVHdoQVJJdFlqdWpWYUQ1TGNMbCtLdmV1QlRIeXpnamc1OGY0?=
 =?utf-8?B?TDFnOFJFa3lOQVg3dFc2MzZsemtneTBQdFB2bnArWlJUYnFjSU0yNzM2bjNi?=
 =?utf-8?B?UkQvaTlyajMxRTZEZHFTRkg1SnZYNCt5cW1HWitZNHZhcG82QWxzNGZXTlM3?=
 =?utf-8?B?VEcvdVd2ZnptNXNxWnNyNCtiRTBnUFZBOWxRNDRnTmlsT2k0VGNMQnRabkI2?=
 =?utf-8?B?SXg0TFNHazFEU2pYcXdzS25jL3hkSCt1MEpkQVo2cUFDUFIyUEdyaUZpcUpF?=
 =?utf-8?B?V2dGL2VoTG5YWDB2RnFwS3hUb0t3YjduZzNPa1BTTUVvcGM2TkYzSTdFT1ZR?=
 =?utf-8?B?S0RxeG1HTnViSitWcjdwNUdGK1RITXdnY0cvL1liTkFxWTR4NmZXYnptdlJi?=
 =?utf-8?B?NjVxWmNrZVNpNjBsK0VESjlUdk85bmlMTEtwQ0VhSUFrdHE4UnY0TXlSRzBW?=
 =?utf-8?B?V24xcmNiTGhXV2NaZ0E4cnU3MW8wMk81YTFxKzFaMS9UQ1pTNHdIeWduTFRX?=
 =?utf-8?B?eEtTay9vKy9lUjdKMVZJUGVKdHRhejlSTFRYbjk5TTZJMmZqdXZOdCtMb1JC?=
 =?utf-8?B?UjJBV2pHV3VQaHpOaEhGaHJvT3Eyc1ZlcWFvcTBTL05CK1A2U1RoRVpxRE9k?=
 =?utf-8?B?OTk4TWdNNkJ5SDlhdzlFQm9wRU1GSXRNY0ZUUW9kNTRmckFVc2FHWVYzbDBQ?=
 =?utf-8?B?Q3NhcGdmZ3VSWGc4aEd4NGFoeHF1WGZ2c3hvYWRmL3hESHBoUXBFdERCUS9O?=
 =?utf-8?B?VjBobkJIdHMwRVhOKzh2TW53WkZzZkJIYjk1QWl5cSs2NHhUMW1oc3p6aUwz?=
 =?utf-8?B?M3ZvVTRNUGlHbmtCUXA0anByQnlPcWJIVDFPbGtwb0krZ0llbFFCZEY3NFJ0?=
 =?utf-8?B?dkxHSDRDdmVxa2c1dmRMOUhaUVkrSFhpdGFhR2ZFN3k3UjhCZmJ6RGRIWFJw?=
 =?utf-8?B?TjlwYnVpZitQczg1bDBjaWdKQjlGRWJxb25sVUl6U1Q1NW9EZUQycTJnTmxz?=
 =?utf-8?B?K0lRUTI2M0g3azlzRW81Ti8zK2huek43dkZBNjhPdlRCOG9nb09YVXgzTk5p?=
 =?utf-8?B?TGIrdWNmSmVFbm9OVytsWmxKbmRTOGIzZng2TlJBejA4eGd6dkNRbmZZeTQr?=
 =?utf-8?B?ODc1cFVPMWJ4aUhFOVNIdzh2cjd5WDBzbElKZEdMVFVDYmhYKzF4M2d3anV5?=
 =?utf-8?B?eEdwS3ZNZ25WM1F6UzRRTjhxbWE1ZFVxQWV6K3VDUDBqR0YyR1JGL2pWR1o5?=
 =?utf-8?B?bnlGUjNkSm14Yk5Ja3k3TXB2RVpKSHVycFRYQWJkbmpKVFlwUXdIdWJrVVoz?=
 =?utf-8?B?a01zR1dtQkJ6OWEwZXRpY0pxOFVqVUlFVEorV3luRlpkdWttUnl6ODUvRWpr?=
 =?utf-8?B?MWdIMVVma0NQeVNzVjN1bCtiekhYV2w1YWRKZnZPODYxdTNEQTRIU3dMWHVt?=
 =?utf-8?B?SWtYRzFLdVdSd0txMGlqZU12a0dDTHpHKzhFeEx2R3MyTEdhakFNV0VMTUhM?=
 =?utf-8?B?NWJJK3FqYmZodElaVGNjdm9yQTQrdHhJQ2JTRkFxT05Bek5tR3Q2eDFJNE9h?=
 =?utf-8?B?c1hxc0pnb1RicmFkTnFkMlMvMHNyYk1idzNHQ1BJNWF5U1JCM2Q3UWt0cEhv?=
 =?utf-8?Q?I6sKXFtX3jowNOauxX6CA2XUG?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f41e8b5-10c6-46b0-d5ed-08db158cb07a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:57:00.6952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yDTz71UY+TJ1y/z8SVD1CEXVzY9Vcg+7oJUJ8cl/dOw1eRJAICoB6ml5a3jjLVLhO3gm3vNN2ytnKK3JX3gbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4376
X-BESS-ID: 1677149823-111300-5411-137616-1
X-BESS-VER: 2019.1_20230221.1854
X-BESS-Apparent-Source-IP: 104.47.51.45
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsZmxiZAVgZQ0NIyMTHJNNHAyM
	w0LdkixcTEMNE4xTzFJCnJzDDJ0tBIqTYWAFFU/+9BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246349 [from 
	cloudscan22-166.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_025716_486057_A8269A75 
X-CRM114-Status: GOOD (  33.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdWVsLAoKT24gMi8yMy8yMyAwODo1MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4g
QWNjb3JkaW5nIHRvIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIGJpdCAwIG9mICdTRFIgdGltaW5n
IG1vZGUgc3VwcG9ydCcKPj4gKGJ5dGVzIDEyOS0xMzApICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFu
cyB0aGUgTkFORCBzdXBwb3J0cyBhdCBsZWFzdAo+PiB0aW1pbmcgbW9kZSAwLgo+Pgo+PiBOQU5E
IGNoaXAgSHluaXggSDI3VTRHOEYyR0RBLUJJIChhdCBsZWFzdCkgaXMgcmVhZGluZyBhIDAgb24g
dGhpcyBmaWVsZAo+PiB3aGljaCBtYWtlcyBiZXN0X21vZGUgPSAtMSBhbmQgdGhlIGZvbGxvd2lu
ZyBsb29wIGJlIHNraXBwZWQuIEFuIGVycm9yCj4+IGNvZGUgaXMgcmV0dXJuZWQgdXBzdHJlYW0g
YW5kIHRoZSBOQU5EIHByb2JlIGZhaWxzLgo+Pgo+PiBHaXZlbiB0aGF0IHNkcl90aW1pbmdfbW9k
ZXMgKm11c3QqIGJlIDEgYnkgc3BlY2lmaWNhdGlvbiwgZm9yY2UgYmVzdF9tb2RlCj4+IHRvIGJl
IDEgYXQgbGVhc3QsIHNvIHRoYXQgdGhpcyBmdW5jdGlvbiBkb2Vzbid0IHJldHVybiBhbiBlcnJv
ciBvbiBhIE5BTkQKPj4gdGhhdCBjYW4gd29yayB3aXRoIHN1Y2ggdGltaW5ncyBkZXNwaXRlIHJl
cG9ydGluZyBhbiBpbmNvcnJlY3QgT05GSSB2YWx1ZS4KPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRj
aCEKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIFBhbGFjaW9zIDxoZWN0b3IucGFsYWNp
b3NAZGlnaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5j
IHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+PiBpbmRleCBjM2NjNjYwMzk5MjUuLjQ3
NDg1MGU0NDU1YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPj4gQEAgLTk0Nyw3
ICs5NDcsNyBAQCBpbnQgbmFuZF9jaG9vc2VfYmVzdF9zZHJfdGltaW5ncyhzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLAo+PiAgICAgICAgICAgICAgICAvKiBGYWxsYmFjayB0byBzbG93ZXIgbW9kZXMg
Ki8KPj4gICAgICAgICAgICAgICAgYmVzdF9tb2RlID0gaWZhY2UtPnRpbWluZ3MubW9kZTsKPj4g
ICAgICAgIH0gZWxzZSBpZiAoY2hpcC0+cGFyYW1ldGVycy5vbmZpKSB7Cj4+IC0gICAgICAgICAg
ICAgYmVzdF9tb2RlID0gZmxzKGNoaXAtPnBhcmFtZXRlcnMub25maS0+c2RyX3RpbWluZ19tb2Rl
cykgLSAxOwo+PiArICAgICAgICAgICAgIGJlc3RfbW9kZSA9IGZscyhjaGlwLT5wYXJhbWV0ZXJz
Lm9uZmktPnNkcl90aW1pbmdfbW9kZXMgfCAxKSAtIDE7Cj4gCj4gSSBmdWxseSB1bmRlcnN0YW5k
IHRoZSBwcm9ibGVtIGFuZCBob3cgeW91IHByb3Bvc2UgdG8gc29sdmUgaXQgYnV0IEkgYW0KPiBh
IGJpdCBoZXNpdGF0aW5nLiBJIHdvdWxkIHJhdGhlciBwcmVmZXIgYSBwZXItY2hpcC9wZXItbWFu
dWZhY3R1cmVyIGZpeAo+IHJhdGhlciB0aGFuIGEgZ2xvYmFsIHNvbHV0aW9uLCBqdXN0IGJlY2F1
c2Ugd2UgZG9uJ3QgcmVhbGx5IGtub3cKPiB3aGV0aGVyIGFuIGFwcGFyZW50bHkgT05GSSBjb21w
YXRpYmxlIGRldmljZSB3aWxsIHN1cHBvcnQgdGhhdCBtb2RlIChvcgo+IHdlIHNob3VsZCBhdCBs
ZWFzdCB0ZWxsIHRoZSB1c2VyIGFib3V0IGl0KS4gTWF5YmUgcmVhZHMgd29yayBidXQgbm90Cj4g
d3JpdGVzPyAoT3Igbm90IGFsbCBvZiB0aGVtPykuIEFuZCBpbiBnZW5lcmFsLCBJIHdvdWxkIHBy
ZWZlciB0byBrZWVwCj4gdGhlIGNvcmUgInRpZHkiICh3ZWxsLCBtdGQgY29udGFpbnMgYSBsb3Qg
b2YgbGVnYWN5IGNvZGUsIGJ1dCB5b3Ugc2VlCj4gd2hhdCBJIG1lYW4pIGFuZCBwcmV2ZW50ICJ1
bmRlc2lyZWQiIGJlaGF2aW9yIGJ5IGZpeGluZyB3aGF0J3MKPiBjb25zaWRlcmVkIHdyb25nIGlu
IG1hbnVmYWN0dXJlciBjb2RlLgoKSSB0aG91Z2h0IGl0IG1hZGUgc2Vuc2UgdG8gZml4IGl0IGds
b2JhbGx5IGdpdmVuIGl0IGlzIHNvIGJ5IE9ORkkgCnNwZWNpZmljYXRpb24sIGFuZCB0aGlzIHdv
dWxkIGZpeCB0aGUgaXNzdWUgc2hvdWxkIGl0IGFwcGVhciBpbiBvdGhlciAKTkFORHMsIGJ1dCBJ
J20gb2theSB3aXRoIGZpeGluZyBpdCBqdXN0IGZvciBIeW5peC4KTGV0J3MgaG9wZSBub3Qgb3Ro
ZXIgY2hpcHMgaGF2ZSB0aGlzIGlzc3VlIChpdCB0b29rIG1lIGEgd2hpbGUgdG8gZ2V0IHRvIAp0
aGUgYm90dG9tIG9mIGl0KS4KCj4gSSB3b3VsZCByYXRoZXIgZ28gZm9yIGEgZml4IG9mIHRoZSBw
YXJhbWV0ZXIgcGFnZSBpbiBuYW5kX2h5bml4LmMsCj4gZWl0aGVyIGluIHRoZSAuaW5pdCgpIGhv
b2sgb3IgaW4gdGhlIC5maXh1cF9vbmZpX3BhcmFtX3BhZ2UoKQo+IGRlcGVuZGluZyBvZiB3aGF0
IGlzIG1vc3QgYXBwcm9wcmlhdGUuIFlvdSBjYW4gcHJvYmFibHkgdXNlIGEKPiBjb21wYXJpc29u
IHdpdGggdGhlIG1vZGVsIHN0cmluZyB0byB0YXJnZXQgeW91ciBzcGVjaWZpYyBkZXZpY2UgZm9y
Cj4gbm93LiBIZXJlIGFyZSB0d28gZGlmZmVyZW50IHdheXMgb2YgaGFuZGxpbmcgc3VjaCBpc3N1
ZXM6Cj4gLSBodHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMuY29tL3VybD9hPWh0dHBzJTNhJTJm
JTJmZWxpeGlyLmJvb3RsaW4uY29tJTJmbGludXglMmZsYXRlc3QlMmZzb3VyY2UlMmZkcml2ZXJz
JTJmbXRkJTJmbmFuZCUyZnJhdyUyZm5hbmRfbWFjcm9uaXguYyUyM0wxNDgmYz1FLDEsOUU3bkVs
WmNqU2o4a2wyUjhoa080ZTJhdWxocTJNODlxVnBPNGxRWUtxOEtubEVLSHB5MF91a3RhVGdqNVZD
aDdSRjF6aWViMWo0YWpSX0hNRk5JVXJMNmk0OVJTM1NVNW11SHJPcEVfUDAsJnR5cG89MQo+IC0g
aHR0cHM6Ly9saW5rcHJvdGVjdC5jdWRhc3ZjLmNvbS91cmw/YT1odHRwcyUzYSUyZiUyZmVsaXhp
ci5ib290bGluLmNvbSUyZmxpbnV4JTJmbGF0ZXN0JTJmc291cmNlJTJmZHJpdmVycyUyZm10ZCUy
Zm5hbmQlMmZyYXclMmZuYW5kX21pY3Jvbi5jJTIzTDU5OCZjPUUsMSxQc1hHZGRRbzBNNkR4YVlp
THk5SU9FVFktT3U3TWRxUXBtaWpVTEFZSlgzVXY3OFZPZUgyVXNCekdYcDVPZjJOSHBoY2dvU2F1
Tk9sc0ZvQ2RiNzY4WG5SM2x5cE1lZkNMR1B0b2RENzF3UFp5d2RIMUhuSlQ3WDRicHcsJnR5cG89
MQo+IAo+IFBsZWFzZSBkb24ndCBmb3JnZXQgdG8gYWRkIGEgY29tbWVudCBleHBsYWluaW5nIHdo
eSB0aGlzIGlzIGEgc2FmZQo+IGFzc3VtcHRpb24sIGFsc28gcGxlYXNlIHVzZSAiQklUKDApIiBy
YXRoZXIgdGhhbiAiMSIgKHdlIGRvbid0IHdyaXRlIGFuCj4gaW50ZWdlciBidXQganVzdCBhZGQg
YSBtaXNzaW5nIGJpdCwgdGhhdCdzIHRoZSByYXRpb25hbGUpLgo+IAo+PiAgICAgICAgfQo+Pgo+
PiAgICAgICAgZm9yIChtb2RlID0gYmVzdF9tb2RlOyBtb2RlID49IDA7IG1vZGUtLSkgewoKTWFu
eSB0aGFua3MgZm9yIHRoZSBsaW5rcyBhbmQgaGludHMuIFRoYXQgd2FzIGhlbHBmdWwuCkkgd2ls
bCBzZW5kIGEgdjIgc2hvcnRseS4KLS0gCkjDqWN0b3IgUGFsYWNpb3MKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
