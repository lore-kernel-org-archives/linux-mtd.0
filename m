Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C50EC98302
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=39ry4s7lyzJpEgEqXuu+rpoft7BJbtDrSlff2s02B48=; b=i0qAekCy8sVFhs
	fkAJRZ/eIYZEjmVufYgYZQzyLWlTB4q1pzeGF+1sICTNoZHWColGNDgdItiolPaU5rNTfIpAWYu3K
	0pAuqIRJFuwQybzbvLVcZBltxVT3bDZSTDX2pteLyAwsj1O5zr6Gemz8vxyLr/6qHuCLc0qGJDBw4
	8TMzKgi/CRh0wHAgtDl07L5xTSM4B8wwP56BRqYojbTpy2/09i9WAUfmcxZr+K/wV3bRRAuQg0lMl
	ROYUtLnB6ZkKCoYZLze+DsH58g2MfBlPxNlwE3ONU0DZ9bNLrzNSRTIJFbUozP80U+ENyGmZtLcV4
	D6KJ/BnTCYGA0im/7Weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NYN-00000008TaS-0g1f;
	Wed, 23 Sep 2026 14:02:31 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NYJ-00000008TZu-3kKk
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 14:02:29 +0000
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NCpGqO2936813;
	Wed, 23 Sep 2026 10:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Yo6RdG5pvW9RajtpplPL8adBtGv
	s4Wt5v4qZaQxWJJk=; b=bm9M78s77ghRzVzX7chjKIfHk2gNuQNbDr4erXwXLbk
	uOA/onuOeyN4R0Z5YxtWow+Ka2cV4X9B1zCNpMntQ/9DeK62brI4M3+9S5MuU7TP
	4VveuD10dkFnBZuRS124VaOP+I67oOqyGaZB6gUxSaBuhyROZY8dzJsz8ui87qNl
	xlC7GeG5RSoxYYS8aN73CdP39HpTCIxsdOt7PPJBdIjR2ed3/uLi+UTL/JKC8+ww
	r7PkLHeedMizMnPfdZ8QX8RjPWdpNamOyJgEokr0x4sodwlLZOcp5X33dxMUrfPE
	mRtYoF48gFWbwwAtmBSq2Xy3F4Ou6HPBdMiTs2DZp6Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gvagqsna2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:02:24 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju1KzGKDSKVyAdgfuYLkEqq0wRmTFRBLQx9HyzxRN+QNH8UJTyL4fDaIiKzSYHlOPHJhcEPmWYqw7LA8+D4VJgzVBPkxnT40D6CZfgLmpyXLZEXvRq78wz9uta8vh+VlItfmlBGIaIGA89F8eU8lyQRGX4wxxBt8hcNrB3/GsQjCyJtmrGvBku8ibdXdlGLxBWaVXSE9vE6IXrDTlcSnPRLuaKvb2fX5BV9at6dhyOgzVSMsv6VCdhmhks2qycA1Yd/4CF8EqQqC0N/liAVyCNQvOU1/enfMdb3YBcFct1aCVwvq5HnEx/Zu/aEI2+tYE6HoPItO3l+YOP6ggkV/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo6RdG5pvW9RajtpplPL8adBtGvs4Wt5v4qZaQxWJJk=;
 b=HJA64VDlHFfcBHNh8GKFzSAqKzsh4wB0lJVPFt8bcpBSUet9Bhe6dD6AptZh+OzWAWHLtY+SFDr5kSSeOfIx3FqefaAm9WCiqDBfXaBhp/9S7lu0EueWMzXl52/gx057ktfK8+qCmndCKCbEqD7ITcYDMXDwRjDbsIR5EXX8Z4tSO2zWO6ckIMX+9+fGyrPbbz0AYWJBC/Xn3o5AVqrkNf1dtP0pR77U6K9OQHbq2YWHEqA9UPCLAD+Wm/UWsSleY7GAjUSPCSFCkX7WvxsaLKOhb/XcuF4XWskEuxGiv9oJfzVZJBqfhUdbTdZxDVOLk8mXsqrDYSNJQeJFDrylYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM6PR03MB5004.namprd03.prod.outlook.com (2603:10b6:5:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 14:02:21 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:02:21 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 23 Sep 2026 14:52:29 +0100
Subject: [PATCH RESEND v2] mtd: spinand: winbond: Add support for W25N08LW
Message-Id: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790172217; l=4487;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=0aMVqyzlnbiw+3tLUgMvgOWYRRdon3x7idK/AkgvdF4=;
 b=8bh3CBExn+vtZsgx2TmeAjTGH2Xim8q0Ryh9YPaAvrdTj+vbr/t8IMh3unIx27JhLwGrCZj59
 KJMWe3uatvjA74u6InvBz+Xiq7mAvxhjbVh/XJP+tA/xo16E030HLZ6
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: ZR2P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::8) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM6PR03MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: bb39b6dc-44d6-41f7-1c47-08df197b4989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: CvmMYXdPuUiorAC+njQFOwctObtDpTbJlH/uJm5QLWEHoyMqwMiud534R2tPcv/ljXCFS/05EzZZxZCKq+YMuhpv0jn+V2ABXL0GKNXEcbRTKPePwLboHEILKofGWQoJZ1mypcm+m54I18fWmrWwZLgB6Wb/9J/aYbakQIxQAiMUAWMVvFi8a21QDHNMCX+fMd7FaDRgT57w7edVFpPocEqkCW279aBcf7wsJONM0BJdCdHLRtIPn+xvzJ6Bw9SFUKrWU6gtigVFe2CyMvLbSWE7d8nQM770EGpURDHEWZ5myHLuSDO+srJF+ThCi276cy6iAtAKAex19ewtM/E9wG72LFsMC4dqHekuNLKQBwIBPkaSV/+2Xi8nf9qq1qpCQyxs0ggHjdbC4TM/ypB0v0phPhyUWW5ixvgMTx++VZBTUAAVbamFg7Io8JD3x+Z0KaIj5RAvtqPN2UvShIBNAZaaMapahje7kUq9+hy7hBmK/bSqmEgxI3oLA8Rar8AaXGcT7+d5pn1T5XRe0iIVAxNHAC8wL+89K7Py/FitfW1YDmH8CptaNZcBukCT6XZPyFjKlCeiTNCnZax5skErmA21qtNP2uXN76gjM9y/zA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVBQTBBZ2RHc0J5WDBDOCtoRzdOQk9UQXhGM0pLc3psQXBWVGR0ZnFRMXpY?=
 =?utf-8?B?Ykp5c3lNVzBVQ1R3aGloZGZta0R0TlhRRzlOWC9PbU5ESFJ5TWg0ZC9HOXhU?=
 =?utf-8?B?VXE1eEpZS0hOUTV0TEl3bW10U3d2bXRXRTZQYnp2YmN3blF1OUVqdURlRDk3?=
 =?utf-8?B?RGNVcWNYcTRSVFcwRUx2L1cxRTZxeU04NFVQWGYrVlhlTkRBd1BETkIzMTBp?=
 =?utf-8?B?VFhJaytVc1V6cW1HMWpPOThBTE51TGJKRkFQWm5CS3g1VndxWFB4LzVTT0wy?=
 =?utf-8?B?V2xLcmJpczU4dkZ1dFB1bE5SZFIydjlocFY2aTh4Y2VpTCtTSk50a2dqc1VU?=
 =?utf-8?B?S3NhM3RRYm5pUnlZL3ZXYlVXQ3VGU1JTeExoa1QybDBFb0k0ZEdnV3dSV3lH?=
 =?utf-8?B?Slo0SEhiSWQxSGRUU25BN0plSEluMGFXTnFvZ0dCaVRaL2FWUnVRb2U0cFZV?=
 =?utf-8?B?ZklpbjZIOHlPdm1GNlFCaCtRNDZibTBrT0VmNEc2NnEySU5aMW51VzMrOFkr?=
 =?utf-8?B?RVNlSzQ5TE9EUmI0NlExeHFYSUMwMzRUR1dzMlg3WlFOakt5cFR2ck52ZytY?=
 =?utf-8?B?bSt4blY0eWhFd01ZUG8zVS9QS01vVXJMUVVtS2ZhaGYwcEh0M2MyZXNPSCtL?=
 =?utf-8?B?VjRxOUx6UkdNNnloYkQxMVJ5eGNkQ0J6Y245bzhST2VHRkxrY2xUdExaYkxO?=
 =?utf-8?B?TGVoeDRPaTBpaDJGZlBram9kaUNxcGZCU1ZJMURRRlJiUUZiamVwWU5GWmdp?=
 =?utf-8?B?WlFtL00yeDdPdUNyY1Q3OUJKRzRtaWlsVlFTcEtoTkRnd2s0dDVPMWlPS1A1?=
 =?utf-8?B?QmxMRm55d2ZxVyt6MjUySGZHUFg0VGNIeWp4My9nM3EvK2YveXdFR1VLQ0ZM?=
 =?utf-8?B?RVBoUkdlaFJMODNSVy9IbWhISHVxMGsvVTB2dzdSbU5xbG1Lci9saGdqbE1U?=
 =?utf-8?B?aWtXWXRCaFFQWE5nd2ZNYkplbGpKZndsOGVsQk9sQWo1MEUrdlpLbXBiT0JS?=
 =?utf-8?B?S1I3ejdoby9Vd0ROVjh1N2VydERSUU9tWmVCZDdSK0UvNUp0OGFhRWFKNlpY?=
 =?utf-8?B?SUtESnYwTGc1ZjZkZW0rSmowYVhBMlJDRFVIS1ZLbjgwNEwrTE8yWjEvYkJi?=
 =?utf-8?B?OEtsZnltU1VVblJRdzdBNnFtOW1GTnplcFNobUJwc0xlYWtXUGZNbVRJaDJz?=
 =?utf-8?B?aDNuK3gwcjlmZkJ0Ym5sOVlxbG1aWDhWY2pQV2g5VnB4UDVnc1lwaFRYSCtY?=
 =?utf-8?B?QStLVGVKdzJYUjJJMlFDaEZ0OXpiclJGazhtQ1dRSmRjQWQ2UTFnYnp0RmZL?=
 =?utf-8?B?Yk91TlQ3Nm0vQjh2aW02OGNXOE5nNUY4c2ZoSDlDTTQ4ek9yQmtOTy9ocjM0?=
 =?utf-8?B?V2F1V1puSVo3NVBmR0VJOVJwZ3YzQUZXU25KODMrVjZvOEtTUVRNZ0Iwbjh2?=
 =?utf-8?B?ZUozaXh3SVRHUGRuWE9IUVpCVFdiZ1BuREhOMWgzeDFmNDMyL09IM2VzSThS?=
 =?utf-8?B?Z05UQlJLakJBeXlVZUM5K2Z0K21LSGVXdFpWUmh6ODZ2STcwM0g0NjN4ME1a?=
 =?utf-8?B?QmphU2R0eC9KbUhpQnlPWFFwbVUrVlF2OWFVeGdNbHdpTlgxQVYxazU3cVpk?=
 =?utf-8?B?RmtoRjZHQmhONjdleUtpQk8rblhOcWxscUdrSW92L1A0Qk9abm10dkQrWVRE?=
 =?utf-8?B?eU44VE1PSEZyYXdMY0lEZFlFOHJBeXllNytvS2o2RHdjTHoyRkNKRGU1enFW?=
 =?utf-8?B?ckV5akg3cllFemE2ZlBjOFJxV1pjSzJGcHMwUGk1S2ZiNytqdmNmOTNpNjVv?=
 =?utf-8?B?eitMYVdOd3RNaUVKQW1KUHJYcmphNEh4Yzg2dWtsQVc3dStwb3cyYlVnRk5p?=
 =?utf-8?B?U08rMjlZQXhNYTc3SElrWE54MjFaM1ZwMWd6NG5vaUZpbXI0V1prOGZLNmNK?=
 =?utf-8?B?cmxGSXFKekh3NFl3V0FiVStlQzN4THdIOFVNSHVrWjVaZEFPQzdrUWNENmw1?=
 =?utf-8?B?WnU1TlVVZlU3eHVoSGtETXJtY1FpZko0ZThvRmNHcngzREhIQVJVMkFoK2pW?=
 =?utf-8?B?VWlvRkkvanlZREVSWnZEYzlPbnE4eTJuT1IwaGVhakU1WDlvc0hxbSt3LzNL?=
 =?utf-8?B?eno2eWFKOVM0OGVybzBZdEQrZ3VXMFdXZW9RY3k5ck1hWnRRaEkxcVZ5dzZr?=
 =?utf-8?B?S0p0aHZtNzliM3lKa05HNlVIM00wcElIdGNCQ1lFR3R5V29CV0tJVU5Ybmsy?=
 =?utf-8?B?WXRpVC80UnpqQ2ZvdTUrNFhsVHY4SUR4NWYwMWJMSVUxRGg1RXJjR3JOUHlK?=
 =?utf-8?B?dkx3WDRpcGo0MDBrSDZxOHY0azZ1SHh4Y29yS0UrbzVzcWxTWTdBZz09?=
X-Exchange-RoutingPolicyChecked: v6TLcjOt9fx2HB8ZlJHVKJKgk7V2kwuFGOwKPs7zNDRB7pmnG4GJFjpxtS8C6FdU+3neo8OAVZl9MUxy9K2JhkJGmL77RsK/+RlHFqddqRgKaUGbSGKB45rFo9qsiMYop86y3EkgkP15l0s4LX9FcuWMilHEZKc+I/tOw006N7O+DfHHPb8XsYgBkupp0MwSclkytM6k933qcGTJhtgJNbrAtiYQmyLPVIASnCk/PY2Cylg05ZH5Q7RlAdoDKg3JafHr9S/XFS06drp0n7xfyfx//ZOoixEL8l8nBqNvRMt8MRC4HrlH8MLqpjb6TkN8hi5FYDrzrBGjzribPnySEA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb39b6dc-44d6-41f7-1c47-08df197b4989
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:02:21.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emU+rlDWpDGpdFdeTGshUUjglolpLNGM0BiFwaiDKitTxyefgmRS9Y3i6bIbsmwgriXFpRfCJ8PKejrv0auvDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5004
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX1HmNXqhrbOTL
 WvcIS9LSys5aRUbnzUZrhD8Zpv5V4569tqV/f1//JQp9/qgwzkLH7bWakQtzAe1dyQNy3hHnytc
 TqQo3VelFeFS4qCgYbHuTL459Nq5kSKLtCYMuwqI7xVP0+pv6es7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX/vwQ+a/uJf9p
 PkMOx43hEM88JrKgx+pF9WeF4x+FhxaL+IcnHdDKgSqSEMMi0QJxQs0Fat39HzUl+pGtV14gMII
 rQcMxvbOfncwNOF+VvJ/+gi1cHF70SsZeTKfP7lcB9FPa4dNkE4/LNTgd8H3qeMhhRmqJpG6Tv/
 DCSdcgRLX3/aZYBX29OwhjoEtW4ArzxDxuV22fDyKZ0z/itXyXizTZKkjtEv1HP+ZxlyNbBotnt
 u5Odm+PlVUbl2yUVlxEVBHQTh6eVp0eWkfzwn6efQx1+TCGjVBRJ0n9vr1td4+Abw8U5t4IeyRC
 WtkMRofajIzbAyByLFevPe0dwAkcDiPwzkoHeEX5c+cdXHrXUq3Fm+bi7Rvj9farKNTPcLYFubv
 PpUVi2fhuOUMxyz1IliBSlC3RMa3xgaqlInj472Tw0uZJgN4qe0UmFHqqVEYhMSkqpEVj4ZUvSR
 aXjSTB6yMXHKnr6/o/w==
X-Proofpoint-GUID: M00L6YHLENWmxoLuJV8SGCVw4PB9KLHh
X-Authority-Analysis: v=2.4 cv=TJDQ2Fla c=1 sm=1 tr=0 ts=6ab3dbf0 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=C8gYX-aa70u0wLh4TRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: M00L6YHLENWmxoLuJV8SGCVw4PB9KLHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_070228_072537_C140E867 
X-CRM114-Status: GOOD (  16.35  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBXMjVOMDhMVywgYSAxLjhWIDhHYml0IFNQSS1OQU5EIG1hZGUg
b2YgdHdvCjRHYml0IExVTnMsIHdpdGggNDA5Ni1ieXRlIHBhZ2VzIGFuZCAyNTYgYnl0ZXMgb2Yg
c3BhcmUgYXJlYS4KClRoZSBjaGlwIHJldXNlcyB0aGUgS1YgRUNDIHN0YXR1cyBoZWxwZXIsIGJ1
dCBuZWVkcyBpdHMgb3duIE9PQgpsYXlvdXQgYmVjYXVzZSB0aGUgZ2VvbWV0cnkgb2YgaXRzIHNw
YXJlIGFyZWEgZGlmZmVycyBmcm9tIHRoZQpleGlzdGluZyBXaW5ib25kIHBhcnRzLiBPbmx5IGhh
bGYgb2YgaXQgaXMgdmlzaWJsZSB3aGlsZSB0aGUKaW50ZXJuYWwgRUNDIGlzIGVuYWJsZWQsIHNv
IHRoZSBFQ0MgcmVnaW9uIGlzIHJlcG9ydGVkIGFzCmluYWNjZXNzaWJsZSBhbmQganVzdCB0aGUg
ZnJlZSBieXRlcyBhcmUgZXhwb3NlZC4KCkFzc2lzdGVkLWJ5OiBDbGF1ZGU6T3B1cy01ClNpZ25l
ZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQpDaGFuZ2VzIGluIHYy
OgotIE9ubHkgZXhwb3NlIHRoZSBFQ0MtcHJvdGVjdGVkICJVc2VyIERhdGEgSSIgYnl0ZXMgaW4g
dGhlIE9PQiBmcmVlCiAgbGF5b3V0LiBUaGUgIlVzZXIgRGF0YSBJSSIgYnl0ZXMgYXJlIG5vdCBj
b3ZlcmVkIGJ5IHRoZSBvbi1kaWUgRUNDCiAgZW5naW5lLCBzbyB0aGV5IGFyZSBubyBsb25nZXIg
ZXhwb3NlZCAoc3VnZ2VzdGVkIGJ5IE1pcXVlbCkuIFRoaXMKICBsb3dlcnMgb29iYXZhaWwgZnJv
bSAxMjYgdG8gOTYgYnl0ZXMuCi0gQWRkIGNvbnRpbnVvdXMgcmVhZCBzdXBwb3J0OiBhZGQgdGhl
IGNvbnRpbnVvdXMgcmVhZCBvcGVyYXRpb24KICB2YXJpYW50cyBhbmQgd2lyZSB0aGUgY2hpcCBl
bnRyeSB0byB0aGVtIHZpYQogIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UU19XSVRIX0NPTlQoKSBh
bmQgU1BJTkFORF9DT05UX1JFQUQoKS4gVGhlCiAgZXhpc3RpbmcgV2luYm9uZCBjb250aW51b3Vz
IHJlYWQgdGVtcGxhdGVzIGFuZCB0aGUgVzI1Tnh4SlcgY2FjaGUKICByZWFkIGVuYWJsZSBoZWxw
ZXIgYXJlIHJldXNlZCBhcy1pcy4KLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxp
bmsvMjAyNjA4MzEtbXRkLW5hbmQtbmV3LWNoaXAtc3VwcG9ydC12MS0xLWRjYTlmNjNhYzBmOUBh
bmFsb2cuY29tCi0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgNTIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQu
YyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwppbmRleCBhMTgwN2ZhOWFlMDMuLjgx
MDk3NTgwOGM5NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCisr
KyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwpAQCAtMjExLDYgKzIxMSwxMyBAQCBz
dGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhyZWFkX2NhY2hlX3ZhcmlhbnRzLAogCQlTUElOQU5E
X1BBR0VfUkVBRF9GUk9NX0NBQ0hFX0ZBU1RfMVNfMVNfMVNfT1AoMCwgMSwgTlVMTCwgMCwgMCks
CiAJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfMVNfMVNfMVNfT1AoMCwgMSwgTlVMTCwg
MCwgMCkpOwogCitzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhjb250X3JlYWRfY2FjaGVfdmFy
aWFudHMsCisJCVdJTkJPTkRfQ09OVF9SRUFEX0ZST01fQ0FDSEVfMVNfNFNfNFNfT1AoNiwgTlVM
TCwgMCwgMCksCisJCVdJTkJPTkRfQ09OVF9SRUFEX0ZST01fQ0FDSEVfMVNfMVNfNFNfT1AoNCwg
TlVMTCwgMCwgMCksCisJCVdJTkJPTkRfQ09OVF9SRUFEX0ZST01fQ0FDSEVfMVNfMlNfMlNfT1Ao
NCwgTlVMTCwgMCwgMCksCisJCVdJTkJPTkRfQ09OVF9SRUFEX0ZST01fQ0FDSEVfMVNfMVNfMlNf
T1AoNCwgTlVMTCwgMCwgMCksCisJCVdJTkJPTkRfQ09OVF9SRUFEX0ZST01fQ0FDSEVfRkFTVF8x
U18xU18xU19PUCg0LCBOVUxMLCAwLCAwKSk7CisKIHN0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRT
KHdyaXRlX2NhY2hlX3ZhcmlhbnRzLAogCQlTUElOQU5EX1BST0dfTE9BRF8xU18xU180U19PUCh0
cnVlLCAwLCBOVUxMLCAwKSwKIAkJU1BJTkFORF9QUk9HX0xPQURfMVNfMVNfMVNfT1AodHJ1ZSwg
MCwgTlVMTCwgMCkpOwpAQCAtMzY1LDYgKzM3MiwzOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
ZF9vb2JsYXlvdXRfb3BzIHcyNW4wMmt2X29vYmxheW91dCA9IHsKIAkuZnJlZSA9IHcyNW4wMmt2
X29vYmxheW91dF9mcmVlLAogfTsKIAorc3RhdGljIGludCB3MjVuMDhsd19vb2JsYXlvdXRfZWNj
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgIHN0cnVjdCBtdGRfb29i
X3JlZ2lvbiAqcmVnaW9uKQoreworCS8qCisJICogV2l0aCBlY2MgZW5hYmxlZCB0aGUgcGFyaXR5
IGJpdHMgYXJlIG5vdCBhY2Nlc3NpYmxlLiBTbyB3ZSBjYW4KKwkgKiBvbmx5IHNlZSBwYWdlICsg
MTI4LiBXaXRob3V0IGVjYyB0aGUgZnVsbCBwYWdlICsgMjU2IGlzIGFjY2Vzc2libGUuCisJICog
VG8gbWFrZSBpdCBzaW1wbGUganVzdCByZXR1cm4gdGhlIGFyZWEgYXMgbm90IGFjY2Vzc2libGUu
CisJICovCisJcmV0dXJuIC1FUkFOR0U7Cit9CisKK3N0YXRpYyBpbnQgdzI1bjA4bHdfb29ibGF5
b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAorCQkJCSAgIHN0cnVj
dCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQoreworCWlmIChzZWN0aW9uID4gNykKKwkJcmV0dXJu
IC1FUkFOR0U7CisKKwkvKgorCSAqIE9ubHkgZXhwb3NlIHRoZSBFQ0MgcHJvdGVjdGVkICJVc2Vy
IERhdGEgSSIgYnl0ZXMuIFRoZSAiVXNlciBEYXRhIElJIgorCSAqIGJ5dGVzIGF0IG9mZnNldCAr
IDIgYXJlIG5vdCBjb3ZlcmVkIGJ5IHRoZSBvbi1kaWUgRUNDIGVuZ2luZSwgYW5kIHRoZQorCSAq
IGZpcnN0IHR3byBieXRlcyBvZiB0aGUgc2VjdGlvbiBob2xkIHRoZSBCQk0uCisJICovCisJcmVn
aW9uLT5vZmZzZXQgPSAoMTYgKiBzZWN0aW9uKSArIDQ7CisJcmVnaW9uLT5sZW5ndGggPSAxMjsK
KworCXJldHVybiAwOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2JsYXlvdXRfb3Bz
IHcyNW4wOGx3X29vYmxheW91dCA9IHsKKwkuZWNjID0gdzI1bjA4bHdfb29ibGF5b3V0X2VjYywK
KwkuZnJlZSA9IHcyNW4wOGx3X29vYmxheW91dF9mcmVlLAorfTsKKwogc3RhdGljIGludCB3MjVu
MDFqd19vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAkJ
CQkgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQogewpAQCAtODEwLDYgKzg1MCwxOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyB3aW5ib25kX3NwaW5hbmRfdGFibGVb
XSA9IHsKIAkJICAgICBTUElOQU5EX0VDQ0lORk8oJnczNW4wMWp3X29vYmxheW91dCwgdzI1dzM1
bnh4andfZWNjX2dldF9zdGF0dXMpLAogCQkgICAgIFNQSU5BTkRfQ09ORklHVVJFX0NISVAodzM1
bjB4andfdmNyX2NmZyksCiAJCSAgICAgU1BJTkFORF9DT05UX1JFQUQodzM1bjB4andfc2V0X2Nv
bnRfcmVhZCkpLAorCS8qIDhHLWJpdCBkZW5zaXRpZXMgKi8KKwlTUElOQU5EX0lORk8oIlcyNU4w
OExXIiwgLyogMng0Ry1iaXQgMS44ViAqLworCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFE
SURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHhiMywgMHgyNCksCisJCSAgICAgTkFORF9NRU1PUkco
MSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDIsIDEpLAorCQkgICAgIE5BTkRfRUNDUkVR
KDgsIDUxMiksCisJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTX1dJVEhfQ09OVCgmcmVh
ZF9jYWNoZV92YXJpYW50cywKKwkJCQkJCQkmd3JpdGVfY2FjaGVfdmFyaWFudHMsCisJCQkJCQkJ
JnVwZGF0ZV9jYWNoZV92YXJpYW50cywKKwkJCQkJCQkmY29udF9yZWFkX2NhY2hlX3ZhcmlhbnRz
KSwKKwkJICAgICAwLAorCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmdzI1bjA4bHdfb29ibGF5b3V0
LCB3MjVuMDJrdl9lY2NfZ2V0X3N0YXR1cyksCisJCSAgICAgU1BJTkFORF9DT05UX1JFQUQodzI1
bjB4andfc2V0X2NvbnRfcmVhZCkpLAogfTsKIAogc3RhdGljIGludCB3aW5ib25kX3NwaW5hbmRf
aW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCgotLS0KYmFzZS1jb21taXQ6IDdl
ODc0YjE3NTBhNDBmM2RjOWE2MjlhZWI3MmViYTA5Yzc3Zjc3ZTkKY2hhbmdlLWlkOiAyMDI2MDgz
MS1tdGQtbmFuZC1uZXctY2hpcC1zdXBwb3J0LTQ0YjEwNjU3MjQzZgotLQoKVGhhbmtzIQotIE51
bm8gU8OhCi0tIApOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
