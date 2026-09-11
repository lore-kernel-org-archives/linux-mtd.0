Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6994DC88E53
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZYhyn/md2uATeGozY3M5gF0ex7Aj/tKV1b+3QP9huY=; b=smvrdnMZwQfmiZ
	L7qKYZzAMKhrk4+ev8UjiWGeqQf1UqPNM7EiZIgl5Q6e/9OOHQUvcR6NKvoVJe0///okyS2IKQOuy
	uCUIrRv7/9ftAkMMVBwEtMolS/lNOrW8KwR87t9s28jXXOqY1HJh0akZZlrkeKOiVvwRwPmDIX885
	m9Nz8B1E1iNgwdpLMfZvQRMm07riGAeZPpXmQkEs3ecFYDcRQRddE0fxh+5jhUgqU1wHBMDJgmAJ5
	SKxwZN59lUlyI2FcXssNQIOUaOrtyNDmLamI3RJwnXG6rU8xhVWydn+idIr6LqCjMhn3VwVGeo0WP
	1FgluKC/P5GtWePNG3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53na-0000000HAzm-1P1J;
	Fri, 11 Sep 2026 16:08:22 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53nX-0000000HAzB-38Bp
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 16:08:21 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEj9rC2838484;
	Fri, 11 Sep 2026 12:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=x1zyd
	N8rr3Hagige9GKJKwgbeHd/BTkWJHP5weQvo2Q=; b=mvPuD0QhG5MyitCdxMskv
	VceHpjBjaz5mGfrze5Zo42a7yf3L+HIrZyvm8n7zoKglJesAt4chb8o3GLGDor/p
	dICWOCMJbrSj02H9FJ3aPz7CCAvJXrFUBPmO5nXsueEg9yj9FVLUhtVu3L7Uf3kK
	D60GmHPx5ghcY00s5AUX7xdmo8Og4NxrM+B4Lpp0LAt0/fwmtI1ETkphvznjtTnG
	KFjmJN5RD7iYQu020iIr/x2YRDuX8S9ilskNHjCgIDVhxMqNqeM4IFVwuqHwXygH
	eC7vEa9X6ZUO9TFyDKtgWaLW3+vmT54c+E3VE4o5pqLGTIbtyP+MszIUDPdc5agv
	w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxd1ws0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 12:08:13 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGD4bgvWLmV77pdaOf4RmK9CTWfjOXRfw+KHP3K8XP6++K/BRsuoZRK5cRLPwJ/zSfC3ICsB1mtCdrSNCIn5wYvJnWOh4LhSMJtCKmmJEv9VN4Vhs4VUS5X3Hg2DflHMC3PI70mgSFgmRHZfb5eUfrgdkeU/1+6LaSLV0nzoj8+MWRcTsu2aXp8xJh/teuHYemJdYugPkebWC7dD8B62Xeb2/Cne++uzlyZwq3lYoDQR62OudKchYn8nSujgLwe59bdYOJcIOmMs4c59hydrzQFsjYRnA9k9MvZuV3J/RGkwJLnwZtla0cHMIUqCs2VNESj1K/qDHGrIsmgd1NZimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1zydN8rr3Hagige9GKJKwgbeHd/BTkWJHP5weQvo2Q=;
 b=rHO2xXwcBiVpcsMpYUqyQ4KGiQ6V+3BWQx3AfO/urG8rjyZPaKotz1/IkizOP9GDYXKbVaWMxubgcxeV/QH+bubNNYQUh/vltl/y/NRBr04svu3/rhniJ8qc7nal1kpu4mqLEI5u2BgVS5QoLKdqrvUkR1w+8sSKwZPvE9THGSU+S31V0GHdzhsVy+veFJFvWeEtVHgcscJRzEZ6WU00lgXxaGMmN6YTUplGweyRQvXkbNgKaDAubA3WRRFdQ8dzx9e2e+4hamliDhvkNK6gTTUf6foMGK2fcI3i5GjZiMkZ+5qBFcf4jHCsuyBfsz9NCVFaKx6uxuIsUuWk8tSFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by PH0PR03MB6352.namprd03.prod.outlook.com (2603:10b6:510:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 16:08:09 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:08:09 +0000
Date: Fri, 11 Sep 2026 17:09:24 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aqQnfFnjnEC6RJUy@nsa>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
 <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
 <20260911154412.B53B01F00893@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260911154412.B53B01F00893@smtp.kernel.org>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|PH0PR03MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: e74f71d5-13c5-4749-34fe-08df101edf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: niuTUYL1Mg8hqOLaSJiWaQxcNjiHA8fvN1GZ+m/kKczeit0NV1Jax9eTubrSi+UHW2zMt4L5SgTls/F/y1CvbK/AqtjV9AblUkIKKjIezGi72bx7q8MJUutoneE9M9wu/Uj7v5FuxIEYCeN3etRy6pM2pbeCUwt1wK2OFcY86gGPB/dPXQK0U7RLFBYTKlkMp1EcfD+MxP2aL4y+yBdumpIkSxH5/gct69Gtjtcwz92sbmJDb8Q7BKP/2Xu/+djgkyHvgFXLPdwIXodsgPtwPWQbJymSQTGlKFpz1Lwk76bzlU2tyWMiJSEEns+GW1vD56s7a4I8PPnQnBAB/5j1MH6l5xcCEWJjZLcCFUgA8kiR5rWO5Ztl22L2RLAAsQobTJBg8Q/bcBMguZCYEpNYySUU65X/jDbDVHIWFCzCEOdtnnUzAYx1QD6ynzQgOJ+zBGjpzr3ydIIHEtz5K6/fedXVt0R19fEmrQWaqCtr+fexUqp/IQ36QrBUwHSaLeUycXdGcs+RtyaRWwrvZL8dJ8ue9DLlFmjJOj399GBFJ3eb6FL0gIG7DE2MM5ELu2mKePg2nOXdOHMVAFUo/9+6QExD3clSx3BXKstPluo4c/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJWZjVVd0xyMUxJNU9qcXFjTmFDNGZTclFnaEhIL3haUzFWbVI5bmN2Y0VN?=
 =?utf-8?B?dHBMRTVHV2VPSEJNZGxJalFGRGc3SUtyUHhpYzJYS1hCSFBrUFo0M2dwMi9W?=
 =?utf-8?B?eTZDbEp4QW52KzYzM0F3VEdEbGNDWGU3YlFOOCtJVDQ2WEpIL0wvSUtNVkhm?=
 =?utf-8?B?VUJ5S21meWRBbmM5K2RGTUoydjUzVFNTQ3FmWVdiUFAwcFZSeG1keUtFcEMw?=
 =?utf-8?B?WXNQYldiaFppa3k0K1Z0Z0NaNTNGSUd4SnQvS1JtNU5oNzFQZnU3VEhYaVhO?=
 =?utf-8?B?TDV4cGt0TFdLVFAyWk5rRXBHbTJmTWZvSjdvb2thcjdqckt0azlPZ0RCK1U5?=
 =?utf-8?B?MVQwcm9FS0ExYTlyck5JT28rdmZuUE9oaUlUWkl2bW1NbU41RnltL3lYZWEy?=
 =?utf-8?B?R0MxSEN4OTVHN2VjenlLcHJncnBsem1uUHh2eTlyQ0JlbUhrcDk1cEVsdzBk?=
 =?utf-8?B?YnpuRTZDL3lqM2VrTmREOWM4VkEvZVMxdnJWMzUvcDJnMGxHK0V1dHY4TUYr?=
 =?utf-8?B?YTFJRE5mTHhhWWRoc2dZVUF6UG5ZOGNTVmRUeDRGWVNja2wxaU00SXBIQkp6?=
 =?utf-8?B?bnJYbFY0dmxRb3dCOXFxK0Z2S08yUWt4OWpMOElETzJrcVlqUXdPelM1akhW?=
 =?utf-8?B?NU9JVUxkdkhhbm41ZWxxM0dTR2JhQ001UG5BMHNCTUFTRmRGWDh2MzdpSjY5?=
 =?utf-8?B?SFE1aXQ3c1h6THZmZ05HRll5bjlTUVI3aUtIVHJhQ2NOODhWR2tUdmlmV2Vq?=
 =?utf-8?B?UWZNZlFNSjBsYU5KZGlYMHQzZHdPVUpWS1YxY0xuRzNJL0t3V0dCQVkzUVlC?=
 =?utf-8?B?Q2E1alNWcXVRTG1hWUhVdXQ1VFlnSGFET3hyYWU1d2tyTWwvMDM3bDVtNHpJ?=
 =?utf-8?B?MnlOTDlVdlZib3ZLemp2UGpBZzF1L21CUldkSkJBWjF6Mm14aWtHSjJWRWpn?=
 =?utf-8?B?ei9icy9kTjBTZE1xTmE2dG9qNmZPL0pUYzNYcDVQeGNIZEpFNTMvYXNYMC9O?=
 =?utf-8?B?QW45eW5PUVBZMFppZGFPcW5aS2xQTFk1czRza2ZHSFdxY1JBa2JIcWVBd2tq?=
 =?utf-8?B?d0UzNnhxUG9wVFM5NTZCVzFNcnRJVFJFQ2xQK0dMVmNlSWpBUmJTZ0VYbjBD?=
 =?utf-8?B?cnVyWjJ0T2wvZnhxUXp3SXRxNzFaeXpBWXdtRHl4TWhCN3RITE5FSVhkQm5I?=
 =?utf-8?B?TzMyK2FTbTVZZW5QOXdGemNxU0lIRmpTYUdhNldpLzJQSncvUnNjbk5pZkVU?=
 =?utf-8?B?Uzc0ZHlRMW8vY3BWdGdXVnZoeGVoL1YvSzlDYk1leHFOUktaaWlFVVIyZzhW?=
 =?utf-8?B?UElGWDlhMWsrekd0TGp0SEtDdEg3QjRNMEdmRjNvNy9xRW01VVA5Zy9FWlAx?=
 =?utf-8?B?K21XaUIzYzVYVXUxSDJLNDN6cXQzQ3B1VnJ3WE80b3ZtanBqaTRYM2RFMGFP?=
 =?utf-8?B?OHpYTXNGbHl1WHN6MlB5bjgzTlNNK3RpS3V5L0pydms4eS9CdnlJeWwwQ0ZH?=
 =?utf-8?B?ZDI1eFB3WmNsajZORndHQi83T1kwTDA4RnJwUkt0RTNxdXYrRktGL2hXNTJx?=
 =?utf-8?B?dXRqN0s2bFBvVjhnRVdmSjJIc3RLbVpFWVdOMWFOckNyazNvSVl3d2U2Mk5V?=
 =?utf-8?B?SGxHRVZmSWovOGlhbGxUWm52RWpXZ3czUkhPcnoxZ2V5djlqaG55L2t0ckxl?=
 =?utf-8?B?Vk5qMFg1aldVVU9PVWhlWUp4dUxLelNSR05qMHEwZzZTOXdRN3lHUlMraVdn?=
 =?utf-8?B?ZE1Ra3ZmSmFRdXJTMlBBZXNpeDBXamwyZmZPVjFCMEFRQlBFbS8yYjYvVjd4?=
 =?utf-8?B?c3ZxUGtjQkFtUmRrTXhTdzdSS1VjUmRnSloxNmUvd09TVzJaK1EzV0tIVWVh?=
 =?utf-8?B?Qys3dXc0bTloL1ZKZEhqb1JVcGNLNVBvNEh2b3d0bDJwVWpLOFp3MXJ4aUg5?=
 =?utf-8?B?OHc3c3dSa0RQOGFMeFljTnFIL3dXL2tZWG9YTHk0V3ovUmJoT3FIblB2aXFN?=
 =?utf-8?B?eEZjZ0NGbUFISm1WZWxZUWgxQndEeDRjRklXSE1uZ0tBNkFRYmpUWjZvSExB?=
 =?utf-8?B?cnVyZmhxVFlmOTRUeUtyOEU3UlRDOWhmellNZUFHVGFhMTYyOUsxWU5BMU43?=
 =?utf-8?B?T3hlOUp0UTZmRWp0cDJMTmRLUEowbHNub1JJQkJrMlFjRzMrZjVTM0RIRmhi?=
 =?utf-8?B?bE1DTjFVWFhVdllaZW02cDNTbFd1UEh0TEZ6RVdVZnFNakdjV0hleHlEa2p1?=
 =?utf-8?B?Qy9OeEtueGphOVpjUXBTaVVQejZHeTVFTlZPMndxMTlBVUdqQ1FPMktnNzZP?=
 =?utf-8?B?OGNUVWlaTkkwdjJkNUtaQW9jVHhHai8zRzRFS3pBc1dtd0puQ3FaUT09?=
X-Exchange-RoutingPolicyChecked: HRp0m2Qso1udmdIb46CbC2K2t/DpPXrfs41UtUPSVzzmMRP34DeFp14Lbp2vNEhvV91GpWOQceaDgJMdGTr+uVfq0/GMbIITQIvrQIHB/GR2dbjC07NWuoeZqCTa5wU5Sha1ypQVCaMbA8IrzkqzDx3KnUs4uk/wCE3SDzy+OeqQHTVlLe4t0zEyHDNULkU+E99+FzjmOHtuXbkijjGQjDMzeaCoQ3cq+p6DftPC8aZOXCfkxroB+03b4PAJ+pcv+tmJDs8vmgpQfITFSiVmdZb0ZiIJbspatUvaa5fEYBZotp+LJ/PIY80vZYF/qSAFvVzrZXNrH+bwOtDcjlrdPQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74f71d5-13c5-4749-34fe-08df101edf04
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:08:09.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9QD46yQaWxH/gPlESkN3oJJQD34W5MeZ7tRwcR7mAu3PYXXlaT2/l8Gi8wQ8qFPa9W714bEasuMKFiKRm25PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6352
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyNCBTYWx0ZWRfX2D5DH7zb0ffN
 xY3GBBQEoyGkH9n0tJHs/zu4a5ZB8QRY/68FDwfjMtzbIbn8HsRuWzTASq53mIt46IiTMqDivEv
 djxdH+5SF2hqC9O1XQ5NcpnlHQk3I1lQ+IBPHOZhVUTOTlbdsx4bjyud4vbEiEKUAOvTFXoFUQS
 oSDC1XX2UQ5Ce5viFNPMwNfY0kowxgEzkXjF0IPE3dbZCw229bGbfQqcCD9/HDlWgvYatXlTUAs
 iJCgkEnvWwym57RPF7E9HDNrG3AQSETRKafqfFlpxYl/w5lWcQYKnwlw1nw4e13emcQiaN7vydS
 vkp9fu0cR2fftEZNLrah75sviINTFUGkUDu8+34uRXh/o4q656hMbTN3a0QtITMl5DAHE70cyI1
 Dee5koESzfbJ1OSYW5I+ou8JCDgKcBMcPWvaEODuD7UDioxYBWN1qLY8hSPBJNQdw/Yvw6IWe5w
 zDmwFc4Vf6LQnY6Sa6g==
X-Authority-Analysis: v=2.4 cv=GoTXaU1C c=1 sm=1 tr=0 ts=6aa4276d cx=c_pps
 a=qMfGPIaByV4ZnHoTJsbowg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=i62mXw7PhaByAR17FdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyNCBTYWx0ZWRfX7LHSplDU1VRj
 NQDJjRcndA7evubqdkbnUk7dz5sVS9FyNaYw2dxeTVQIXmTXp9akKEEQVuFXmblOIOOHC+LjvfX
 oVU0loB2EogvEN0XQWoul/QQiPJ0bgdOCh01jcYlypfabw24Sdmz
X-Proofpoint-GUID: GvcHbyxTxeKOafppkaEh1hd3X-WKGc50
X-Proofpoint-ORIG-GUID: GvcHbyxTxeKOafppkaEh1hd3X-WKGc50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_090819_811522_1D0C5998 
X-CRM114-Status: GOOD (  27.84  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMDM6NDQ6MTJQTSArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtv
IEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAtIFtM
b3ddIFRoZSBwYXRjaCBpbnRyb2R1Y2VzIG11bHRpcGxlIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0byBh
biBpbmNvbXBsZXRlIGZvcndhcmQtcG9ydCBmcm9tIGFuIG9sZGVyIGtlcm5lbCB2ZXJzaW9uLiBJ
dCByZWZlcmVuY2VzIG5vbi1leGlzdGVudCBzdHJ1Y3QgZmllbGRzLCB1c2VzIGFuIHVuZGVjbGFy
ZWQgZmxhZywgYW5kIGF0dGVtcHRzIGFuIG91dGRhdGVkIG1ldGhvZCB0byBkaXNhYmxlIDE2LWJp
dCBzdGF0dXMgcmVnaXN0ZXIgd3JpdGVzLgo+IC0tCj4gCj4gY29tbWl0IDJhMmY5M2NmMzkxZTIz
N2U0YjViNzExY2VmNjhjYzIyNWUyYmMyZmUKPiBBdXRob3I6IE51bm8gU8OhIDxudW5vLnNhQGFu
YWxvZy5jb20+Cj4gCj4gbXRkOiBzcGktbm9yOiBpc3NpOiBBZGQgc3VwcG9ydCBmb3IgaXMyNXd4
MDFnCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRyAx
IEdiaXQgb2N0YWwgTk9SIGZsYXNoLiBJdAo+IHJlbGllcyBvbiBTRkRQIGFuZCBwcm92aWRlcyBC
RlBUIGZpeHVwcyB0byBoYW5kbGUgdGhlIGxhY2sgb2YgYSAzNWggY29tbWFuZAo+IGFuZCB0byBk
aXNhYmxlIHRoZSBxdWFkIGVuYWJsZSBtZXRob2QuCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9pc3NpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+ID4gaW5k
ZXggMmYwNTdkNzMxZGYyYS4uYWFjOWQxOWI5MGZjZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvaXNzaS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+
ID4gQEAgLTI5LDYgKzI5LDI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMg
aXMyNWxwMjU2X2ZpeHVwcyA9IHsKPiA+ICAJLnBvc3RfYmZwdCA9IGlzMjVscDI1Nl9wb3N0X2Jm
cHRfZml4dXBzLAo+ID4gIH07Cj4gPiAgCj4gPiArc3RhdGljIGludCBpczI1d3gwMWdfcG9zdF9i
ZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ID4gKwkJCQkgICAgICBjb25zdCBzdHJ1
Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPiA+ICsJCQkJICAgICAgY29u
c3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKPiA+ICt7Cj4gPiArCS8qCj4gPiArCSAqIFRoZXJl
IGlzIG5vIFN0YXR1cyBSZWdpc3RlciAyIGFuZCBubyAzNWggY29tbWFuZC4gQW5kIFdSSVRFIFNU
QVRVUwo+ID4gKwkgKiBSRUdJU1RFUiB0YWtlcyBhIHNpbmdsZSBkYXRhIGJ5dGUuCj4gPiArCSAq
Lwo+ID4gKwlub3ItPmZsYWdzICY9IH5TTk9SX0ZfSEFTXzE2QklUX1NSOwo+IAo+IFtTZXZlcml0
eTogTG93XQo+IERvZXMgdGhpcyBjb2RlIGNvbXBpbGUgb24gdGhlIHRhcmdldCB0cmVlPyBzdHJ1
Y3Qgc3BpX25vciBkb2VzIG5vdCBhcHBlYXIKPiB0byBoYXZlIGEgZmxhZ3MgbWVtYmVyIGluIHRo
ZSBjdXJyZW50IEFQSSwgYW5kIFNOT1JfRl9IQVNfMTZCSVRfU1Igc2VlbXMKPiB0byBiZSB1bmRl
Y2xhcmVkLgoKT2shIEl0IHNlZW1zIEkgd2FzIG92ZXIgY29uZmlkZW50IGFuZCBpdCBzZWVtcyB0
aGluZ3MgY2hhbmdlcyBpbgpzcGktbm9yL25leHQhIFdpbGwgZml4IGl0IGFuZCByZXNlbmQhIQoK
LSBOdW5vIFPDoQo+IAo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBUaGUgQkZQVCBRdWFkIEVuYWJs
ZSBSZXF1aXJlbWVudCBmaWVsZCBpcyBzZXQgdG8gYSByZXNlcnZlZCB2YWx1ZSwgc28KPiA+ICsJ
ICogc3BpX25vcl9wYXJzZV9iZnB0KCkgbGVhdmVzIHRoZSBxdWFkIGVuYWJsZSBtZXRob2QgYXQg
aXRzIGRlZmF1bHQuCj4gPiArCSAqIE1ha2Ugc3VyZSB3ZSBkaXNhYmxlIGl0IGFzIHRoZXJlIGlz
IG5vIHF1YWQgbW9kZSBhbnl3YXkuCj4gPiArCSAqLwo+ID4gKwlub3ItPnBhcmFtcy0+cXVhZF9l
bmFibGUgPSBOVUxMOwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBpczI1d3gwMWdfZml4dXBzID0gewo+ID4gKwkucG9z
dF9iZnB0ID0gaXMyNXd4MDFnX3Bvc3RfYmZwdF9maXh1cHMsCj4gPiArfTsKPiA+ICsKPiAKPiBb
IC4uLiBdCj4gCj4gPiBAQCAtMTIwLDYgKzE0MywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZs
YXNoX2luZm8gaXNzaV9ub3JfcGFydHNbXSA9IHsKPiA+ICAJCS5pZCA9IFNOT1JfSUQoMHg5ZCwg
MHg3MCwgMHgxOSksCj4gPiAgCQkubmFtZSA9ICJpczI1d3AyNTYiLAo+ID4gIAkJLmZsYWdzID0g
U1BJX05PUl9RVUFEX1BQLAo+ID4gKwl9LCB7Cj4gPiArCQkuaWQgPSBTTk9SX0lEKDB4OWQsIDB4
NWIsIDB4MWIpLAo+ID4gKwkJLm5hbWUgPSAiaXMyNXd4MDFnIiwKPiA+ICsJCS5maXh1cHMgPSAm
aXMyNXd4MDFnX2ZpeHVwcywKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBEb2VzIHN0cnVjdCBmbGFz
aF9pbmZvIGhhdmUgYSBmaXh1cHMgbWVtYmVyIGluIHRoZSBjdXJyZW50IGZyYW1ld29yaz8KPiBJ
dCBsb29rcyBsaWtlIGZpeHVwcyBtaWdodCBuZWVkIHRvIGJlIHJlZ2lzdGVyZWQgdmlhIHN0cnVj
dAo+IHNwaV9ub3JfbWFudWZhY3R1cmVyIGFuZCBpdHMgZml4dXBzIGFycmF5IGluc3RlYWQuCj4g
Cj4gPiAgCX0KPiA+ICB9Owo+IAo+IC0tIAo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxMS1tdGQtc3BpLW5vci1uZXctaXNzaS1jaGlw
LXYxLTAtYzU0NjE1ZjhjMzBmQGFuYWxvZy5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
