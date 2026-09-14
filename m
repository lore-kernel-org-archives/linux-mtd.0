Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE246C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BriLiGhbYSPg0W9Km1rFQOlueLk+AdzPJS7VwdGwr4=; b=Zm1ee+LS3EPszB
	YfmSmqjMBHjKUWTZsCspKz+d40pMUgOT84Ox/EkE9zY2AVbQhB71/OQEV9LymXNJaIbQSyJ055h7Y
	Aoq003TQ7AXU5maqWgrM39/+s41ZI4SBO+qw7sthQKBM58bHqUfJikRpDpcgwhhZvokKrVQWKOcNo
	AvTievfCzuufeacoQ4Kf6eIaardf2KN/7shzSJ6vKxGS8jMRFNU2uZChXk0HLy1Jkh6rIMpiSoOz/
	IreN1bIxPLFK4MwE3GN5ILxHu9kRy/dIwTtCK8ErQ7STHdM7CPwrkjpKN8TnZuBO38DqH+yt88qT+
	oMEqr0tjUtF/Oc9lxNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68eB-00000004AS9-43sD;
	Mon, 14 Sep 2026 15:31:07 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68e8-00000004ARQ-3Ril
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 15:31:06 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED5hsc1344254;
	Mon, 14 Sep 2026 11:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lhRhJ
	N2s1GTAEgJnnIrq5voaltZJ/b3gb4Ybk+l+6ds=; b=Bq1l+r+eazmej0rqf6VLI
	EdZczIEMUS67ayyMhWP1C8D0ZTareevPwDXwF0N8dwivcEhQKNRi4l9zBQTcKGV0
	uabW17lPBGSLJU/1w/21Io3DfbcTqdTBdHyScy7Ldl3gIRJBqF4HALl+hgvYIGmL
	aMyN25SdVwDTQONyluz90u4vkIa1eXlXE1U/X8jdbsViXj2ss+1Y96E82vv7zfkJ
	qVNRLdbdPeSJTatV6ewHrV53/jQcsz45XzjwI9gMG7ekYle/sjtahsUETR6p+ujC
	OX5LdLfhFtYwrRNR9ZCBBYAJm6AuD/PNWXksHFU80/HMUXIevNzLWeoFlZRynQeO
	g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnn2ce92u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 11:30:58 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjrhAhhYXgCIO5NBkemLY+38U6wnqlRpKHK33Tm3INr9bLBbFCmifdvnQQ9phWtb8RTjezXlQqZIf9wYsvQoIZ3LXcyGWFPdVp8awwuXCcnUyljuuJNtztmPjhcoVgtbP0lAdJf9uGU35V6eVBmIcv/FyW7uwi2A0y2P9jpLerpi8a7MUzHKxGik+M35xov6Nc+3rFhLwD617lVMogBoMNChB0S1daoSmCr17a/wiwgbDhrP81E5IU/GSlGWtqAVRTwVe+svVsWTFVBT8qkDqpK2fE7fgDmjFd3lAit9pO+WG+fdFJninKJPQ5/DPSiRXS2+648PXFnmqpLH/WAbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhRhJN2s1GTAEgJnnIrq5voaltZJ/b3gb4Ybk+l+6ds=;
 b=j9QiXufAqimCh2O2S6Gp1M4ndWT9/HlSyG8kT77G4qrJUjFgWieiBn7r5KVVa2+3cAz9o56JKiYMO1tdh2gdDUYfAUFWFNn99/XQz31oXgS81puRSKJ+uDMcZkuQpUpK60tb9zYG3YbpaboCyFHZhoAuZf2JqBe5kOpLfruLJdhRDrCUZVw5YJnR1GRH/d/7TGlMxKDHRThTNkY8klBTgQczjpogUhTeqoGv5X0uVQimSD4KQ7qrw7l9RD7mIQIbdUvZVlJF3r//ron9DiNqHNFXZWH/4cDlVSLSSibFlF+TCk/EDSqR0JCIL9Om998rQSvRcB57FMwYCROVnwuxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BLAPR03MB5476.namprd03.prod.outlook.com (2603:10b6:208:29b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:30:43 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:30:42 +0000
Date: Mon, 14 Sep 2026 16:31:57 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aqgRsP3cxzcLok5C@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
X-ClientProxiedBy: MA3P292CA0024.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::12) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BLAPR03MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc0620b-195d-4446-10f4-08df12752352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0eCYlqNbD0CZrkpj/1JQ8p5i8PF8uu68F2t4xSfQ/kyH4vHBvm7HYYOBrDVM0wTuIrE/PTfnZQClMTWJwTkg+GWK6iQQ3h1n2o9hl7v6b4u4+bH/w0d4m5BVpozDMEOZnRdjm82vCNp+unDoGL5Cv141crUHCb0mgVY+Eijo85rzLzioXjBIyd0EYOrVCw8YQGfrPw7pgphkcwNUJFHXSt0ceFX6B4ILbXktkufwgHwL3gMxTpYYOIozvUgJwhCLMElm3XvxC0rJNiXE2s/pgXGVqujHX8HrFrWlFfhhkD/ajryKlOVv+431NG70kBxFTD1EAwcpp9YVTj53NB8vUs2imUfmdXtr/rODDRbqI4oBlp2ziSX96BPY8/Num44ih/s6Ot5isgSGuDKzOK7rpVrYkr0MDV1QaTlBsZBnTKxoeAh6pmaostWSq59AkflLQbxhxqSPzasvXdHqoStbnz9txOjpXQYMUn3oy1ZofMSslUOWDtI2aC3zZHETLSL51FjThMPApd0EvzQ/thXjLIf0gGVW3MojPr6sB9rzYViAFtQnQHRSku59REewOhh5YqjOfwFPfIIbyteXfhFfSS0htf3CIkVcpQhyXIqFNG/FovPLQwnzIa5R8CsVVU8U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVaczdtR3VtVUQ1WVdScVZGRGZibWF6VGo3VHJXVmFIazd3d2dJNkxHemZ4?=
 =?utf-8?B?bnVaTnI1OHNSekMwb1hxdHJtQlF5bVFUdytaQXYydHh6bExNeDNzc3dSRk5o?=
 =?utf-8?B?SlEzUmNxU056bThtY054SFN6a2pGZHlmRzJjVFlFdEF3aFlubG1OcmszRjBo?=
 =?utf-8?B?bnYwbVp1SGtFWlFvUmZiRmxKZklHRHgwMUN4SkpJSlZwdkU4ZzNNYnRUMERy?=
 =?utf-8?B?UGFKUUVaVTB3RGc0SmlzNTFNVzROM05mdmhlUkVSbzY2TW92RHYxRHlvUGFs?=
 =?utf-8?B?MWtUcG45S25mS094SUxaTlA2Yk5FL2xjNXBhdldOeTRlTUdNVTViVTZsWDdD?=
 =?utf-8?B?RldXanF3ZTEyMzRFQ1ZVQzh2YkJsWHo3L2lVNk5qZ2hxWWN5Z1czNUNpNVpt?=
 =?utf-8?B?RDY2T1lpY29LU2lyRVlQT1N0Q0lxSDdxdHlyaUtTeTRvTk5JQld0OGZqbEE5?=
 =?utf-8?B?UHFEcHY3NnVHWWpmQTNXUm9VWHBiSnZETEloWHZwcm5kV081QVNkTmtHb2J0?=
 =?utf-8?B?SS8xSGVoYUFyR3J5NDB1SzJ6T3lhVXk0cUJqVnA1QThoazcwU3FMQXV3NGdn?=
 =?utf-8?B?STlGT0VzQ3R3aEVqN1JmWDRiUXNVa1loN2NZNzR4Q1gxZmhlZitUTlJQYUQx?=
 =?utf-8?B?dVY5ZTVyenlBd0R4WHhqSlo5WGI5ZSt1ckRXaTl1amNuQlU4cFhmMTB3TjJK?=
 =?utf-8?B?T1N1bXY3Rit1QisvdDZTcXhma1ZkV1Q4TnZzTkloRUpOR1NNT21mOEptaDVC?=
 =?utf-8?B?N2pJNkpwblMwSHM5aUlwYlhCbFNObWNLM2tFQ1cwYWFjYTZsTGZSaEtNbXBh?=
 =?utf-8?B?SG54SEdUKytYMWdpN2J4OGdReW5NVytHdlJDcUNFSHhPUElUUXE5MllDUDFP?=
 =?utf-8?B?Q1FQNUdBcTNEbytydUlaMmNiOXNlZzNWTENpVWFoZmxVck5URXFQY2xXSFRu?=
 =?utf-8?B?Y0Z3c05tRUpJNGJET3lEL0U2RnJUVllKanFwTFYvU3ZvejlSWG9JSkVUb3RK?=
 =?utf-8?B?Y0JuUlVIclR0cEl3ZGU1RFdwTHlBc1FYRlpIbFRMeXMyMXc3L2dOOTN3eTNQ?=
 =?utf-8?B?VTljQmRrZ2p6WFJ4V2pmOU9FS1pHcGlNQVJDT3RMNDFXeStCelp1VFg1dzc3?=
 =?utf-8?B?VzUvSUlLQWgydmEvTHJWb3o3emtVQS96aURVQlFtaEpCNFFDejVRT3VRVEFt?=
 =?utf-8?B?bGdhakhmOW1BVWhlaDhMVlR0ZmZwN0p5MkFGSE5WbHY1SVk3ZVJJWjhvSEJW?=
 =?utf-8?B?ZzkzMGxaekxBbjM0TEozQWFmQitOdWpIeWMwakl1T1ZwNlMxSzY2WlMyQlE4?=
 =?utf-8?B?bEdOOThrWi9hYmIydzMzb3JYb3RkY3hQUUE3QWpTSlExYjMxU1hGdjRteDJV?=
 =?utf-8?B?bEFjNWVVVzJxcVVFUkM4dDg0SmlOVk5zRFZEUDdsSmdieU42K0xCcS80ZHhT?=
 =?utf-8?B?UjBkRi9jYzNadjJjWUhtMTVTbVhFeWxBclg0azdxMjBXZ0ZJckRHRGtkREUy?=
 =?utf-8?B?V3QwVlp4SlpPZGZCQjJtMXVwbDZMMmJxdmtDTk5JZWVWMU9sSTB1bi9ROFVt?=
 =?utf-8?B?Y1VhckNPTHR5c0ZqaEx3dXRMUTJvb2FNQUQ1dlg1WU05aS9wZ3NmRmJPb0dh?=
 =?utf-8?B?Ky8ycWV6dk1wbHNaOCtnZ3Budk5TQVRPQlpyV0dwSXFnMXBXejY5R0ZmakNa?=
 =?utf-8?B?Sm15ZkFlVDNlQlRWaW9CQms3T3lJajB1UEVmY29LQjZ4SVMxbXg5VENqQnc0?=
 =?utf-8?B?NHZQOWtCS0JWUXRoTlowUkJXN0ZoL2IzRUE2Q2QrS2JuVDBMTTQ0UFJNZWRu?=
 =?utf-8?B?VzJvckVSVnZkc0s2bkVndlRLWVBSMStJV2szbmVRRU9EcnZsWEtoOWJHUzJs?=
 =?utf-8?B?ZDEwdVVtcU5UblR6WkdUUVJMRUhUYVoyNkN5S09YRS8xeGVmcnlsVTJVNVE4?=
 =?utf-8?B?ZGxRTVBRc2Y4akcvTFBFa09PRC8yM2JCWnBxNTN1TE9RdXM0NE15QzA5bFN6?=
 =?utf-8?B?N2N6TUs5N1VWU2dQQTRVbC9HNWgwbUtnK3pZc1pSNDdYTFRPbzljWFd6NVZ4?=
 =?utf-8?B?TzBEWGk0aGhIRWhOcDNydjFONHdkclppSHFoVFZmMnA5a0pHbGNmb2xFdUVT?=
 =?utf-8?B?WlhFb09wYXVLS3ZpeGQzZm1jU1NCMys2ZXcrWlV5eHdHRlJkOE9UcGhZdll4?=
 =?utf-8?B?SmhYME5GSExnUklPeW9KbFhaYmFBYTVmTkpMeldIUUVSaHF3S1lTYWlYS1FD?=
 =?utf-8?B?RlNmbDZDM1ZJdDZ0ZkcyNVpwL1VpcTczckdGMXJqa3NkZjZBMVJ2Q0lVcmI1?=
 =?utf-8?B?OFJJTWdnMWdZdnhPY3R2UUZuQW5DSVlzQ09HdFc5WFFrT3ZZclVtdz09?=
X-Exchange-RoutingPolicyChecked: 1iLL39S38PjdKM6RtZtq0/T7skjG5lxvzhDcXKn2tuHwwiSQc2m6vA9UVhcua96ZUhPTrJxPYHYL7UTnhTrcOJ5mo5v6d3JSoKlWZjfQSxb3QnVYPkZqcAEae1okF7PtOaMEUX6kbz2MzislsFcrCVaFg2zKVC58WOxPPxQtthHTMZFzO++stPC0n6Dhv3VqhCjtzy/i5ZGZU9QrC94vi0jg59nnqlUMRQNd3MtSGVE/+VhZ+89sN6/rzQp1FoCbNaCnXtsWJrkNeHsQCAnoCWnwQ/XkTI4TYsbxoYi9kfYWUngmHnNqCm2c1wc7KP7uTvifIdoQakh3/8nkn5TZ0w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc0620b-195d-4446-10f4-08df12752352
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:30:42.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14Sr0VTQVBDRj1soHpJ5NzFQyZGdd6W3t+CykgvLLzKtiwc30atqE/70IBxbq+N6eH7610vJMV5jzCE6rsylgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5476
X-Proofpoint-GUID: 0hJPfJEHK7p-cxh_ywpJspqRpd-O42V7
X-Proofpoint-ORIG-GUID: 0hJPfJEHK7p-cxh_ywpJspqRpd-O42V7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyMiBTYWx0ZWRfX76XhBzi07loq
 5LX7pEOIbjxkEkMFDhfKGZBWKzcJvsPMX77NqbPqkSSW/7wF2ZHyjTHXCTsk1MyVZ6m/LZ/vtoZ
 pVIpgtA+gExuDFnzgBDYqCPq8FtyJjczfqspNy77zILD7dfGfCdZt8WMcLZrQfQqQRWRQzATJC5
 fMYfCs5NraSvYYtvVJ+ICc2Nc+RZPQHmuRwjL3cgal9V72MbaP2A+WHUcpBDspbz3iPDdGRjR8b
 xsU2LywBVpDbDwMZUtmL2j+ZXBsFNdcfNporLj/lJSoxlAZn0XxYYd+yiBwD8VuMEhlE1qtJNdF
 AEK1KwrTCRBl4Om1EHm0gxncIcOU0zLfT5zRBPpiA12AsppK0zlrKpk1AKDsXh2BSBiwK8+pOJE
 1uIIcWlsrrmoiGUvYwLbZmLqNOtG/KJJcTUBw0/+StAabKK7egxr5zVAbW1PhkU3gLNN5xwnyHI
 ij8xCQvgSIe1pNqysGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyMiBTYWx0ZWRfX6rBUMnyzOg7V
 1Ty4XNXSf4mKxFkRYyn+0aQndm8XMZxnvd766B/F8+cW6ixE+JBSWl9o0bz0blFuH4WRUtu81j6
 /oQSKS4w334xmGa0wuerMXMiz2S7pvWsYTbZUK3ePdXeWr49+yj9
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6aa81332 cx=c_pps
 a=R5REeynT8B2cGAMauuPKTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=OIKUQu8lOt7kVA2ysUQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_083104_905892_A09752ED 
X-CRM114-Status: GOOD (  29.47  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMDQ6MDQ6NDBQTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDM6NDIgUE0gQ0VTVCwgTnVu
byBTw6Egd3JvdGU6Cj4gPiAoKik6IEkgc2hvdWxkIG5vdGUgdGhhdCB0aGUgY29tbWFuZCBhY3R1
YWxseSBmYWlsZWQgd2l0aCAtRUlPIGJ1dCBpdAo+ID4gYWN0dWFsbHkgdW5sb2NrZWQgdGhlIGNo
aXAhIEFuZCB0aGUgcmVhc29uIGlzIGJlY2F1c2UgdGhlIGZsYXNoIGFzIHRoZSBzYW1lCj4gPiBG
U1IgcmVnaXN0ZXIgdGhhbiB0aGUgbWljcm9uLXN0IGZsYXNoLiBTbyBXRUwgaXMgc2V0IHRvIDEg
YnV0IGNhbiBvbmx5Cj4gPiBiZSBjbGVhcmVkIHdoZW4gY2xlYXJpbmcgdGhlIEZTUiByZWdpc3Rl
ci4KPiAKPiBXaHkgZG9lc24ndCB0aGlzIGFmZmVjdCBvbmx5IHRoZSBsb2NraW5nIG9wZXJhdGlv
bj8gV0VMIHBvbGxpbmcgaXMKPiB1c2VkIGFsc28gZHVyaW5nIHdyaXRlIGFuZCBlcmFzZS4KCk5v
dCBzdXJlIGlmIEkgZnVsbHkgdW5kZXJzdGFuZC4gQnV0IEFGQUlDVCwgdGhlIHJlYXNvbiB3aHkg
ZXJhc2UgYW5kCndyaXRlIGlzIHNpbGVudCBpcyBiZWNhdXNlIHRoZSBkZWZhdWx0IHNwaV9ub3Jf
c3JfcmVhZHkoKSBvbmx5IGxvb2tzIGF0ClNSX1dJUCBbMV06CgpPVE9ILCBvbiB0aGUgdW5sb2Nr
IHBhdGggd2UgZG8gc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSBhbmQKZ2l2
ZSBubyBzcGVjaWFsIGhhbmRsaW5nIHRvIFdFTCBzbyBJIGltYWdpbmUgdGhhdCB3ZSB0cnkgdG8g
c2V0IGl0IGFzIDAKYnV0IHJlYWQgaXQgYXMgMSAoZ2l2ZW4gdGhhdCBpdCBjbGVhcnMgb25seSB3
aXRoIEZTUikgYW5kIGhlbmNlIEkgZ290CnRoZSAtRUlPIGluIFsyXS4KClsxXTogaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdC90cmVl
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jP2g9c3BpLW5vci9uZXh0I241NTgKWzJdOiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0
L3RyZWUvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM/aD1zcGktbm9yL25leHQjbjk3MAoKPiAK
PiA+IEFGQUlDVCwgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyBzaW1pbGFyIGFzIG1pY3JvbiBzbyB0
aGUgd3JpdGluZyB0byBhbgo+ID4gYWN0dWFsIHByb3RlY3RlZCByZWdpb24gZmFpbHMgcmF0aGVy
IHRoYW4gYmVpbmcgc2lsZW50bHkgZGlzY2FyZGVkIHdpdGgKPiA+IHRoYXQgc3RhdHVzIGJpdCBz
ZXQuIFRoZSBxdWVzdGlvbiB3b3VsZCBiZSBob3cgdG8gZG8gaXQ/IFRoZSBjb2RlIGlzCj4gPiBw
cmV0dHkgbXVjaCBpZGVudGljYWwgdG8gWzFdLiBUaGUgbWFza3MsIHRoZSBvcGNvZGVkLi4uIFNv
IHNob3VsZCB3ZQo+ID4gc29tZWhvdyBoYW5kbGUgdGhpcyBpbiB0aGUgY29yZSAoYnkgaGF2aW5n
IHNvbWUgY29tbW9uIGhlbHBlcikgdGhhdAo+ID4gY291bGQgYmUgc2V0IGluIC5sYXRlX2luaXQo
KSB1bmRlciBhIGNvbW1vbiBNRlJfRlNSIGZsYWc/IE9yIGp1c3Qga2VlcAo+ID4gYm90aCBpbXBs
ZW1lbnRhdGlvbnMgc2VwYXJhdGUgZm9yIG5vdz8KPiAKPiBJJ2QgbGlrZSB0byBrZWVwIHRoYXQg
b3V0IG9mIHRoZSBjb3JlLmMsIGJ1dCBhbHNvIGxpa2UgdG8gYXZvaWQgYW55Cj4gY29kZSBkdXBs
aWNhdGlvbiBlc3AuIGJlY2F1c2UgdGhlcmUgaXMgYWxyZWFkeSBoYW5kbGluZyBmb3IgdGhlCj4g
aW50ZWwgc3BpIGNvbnRyb2xsZXIgaW4gdGhlcmUuIFNvIG1heWJlIG1vdmUgaXQgaXQgaW50byBh
IG5ldwo+IGNvbW1vbi5jLgoKQWxzbyBkb24ndCBsaWtlIHRoZSBkdXAgdGJoLiBDb3VsZCB0aGF0
IGJlIGEgZm9sbG93IHVwIG9yIHNob3VsZCBpdCBiZQp2My4gRnJvbSB0aGUgdG9wIG9mIG15IGhl
YWQgSSBjb3VsZCB0aGluayBvbiBhIG1mcl9jb21tb24uYyBraW5kIG9mIHRoaW5nLgpEb24ndCB0
aGluZyB0aGlzIEZTUiByZWdpc3RlciBpcyBzdGFuZGFyZD8KClRoeCEKLSBOdW5vIFPDoQoKPiAK
PiBBcGFydCBmcm9tIHRoYXQsIHRoaXMgcGF0Y2ggc2V0IGxvb2tzIGdvb2QgdG8gZ28uCj4gCj4g
LW1pY2hhZWwKPiAKPiA+IFsxXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcu
Mi41L3NvdXJjZS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jI0w1ODUKCgoKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
