Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD257D6DDEC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WKidinP6Buo77yU19xdAmJboCUioIsRCarz3pLzk98=; b=3Vi3Q42rMvlJ6PbzdPhM+7GHzO
	Qr8R63Dt+g2UMQC48OMsZ9oEzag7B0YqO5cpvnPIwSTOZ8sReM2Myx7OXdfxtvNLkzAZVyMMYv1r7
	5jdOyPZjfMfVASTFC9P11IYue9lvvsbSzuzuR3LIDATVDWbbuPqLw/ji1+bnpeqcYVUNjn8CxN5Hq
	ejfDeDI7dJInlNUUkbo406+UjrBY4h+coVNYb5W31V1IPK/PLOZRA/d9yVqPaZudThBKDrIympnN5
	qce0tKR90inDcrR6e7jebJuKSzZjsmpjKxVCPHFGFd689+kJZ3yQ/RxHcUzou7p0dtITJ4bSlBKWK
	42DrdC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsCN-000000027PD-1UxC;
	Fri, 15 Nov 2024 09:01:03 +0000
Received: from mail-db8eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2614::62a] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsBa-000000027Dc-3foi
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 09:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iy4vQ9bgO0wAYogOjoTWkfuNMRuVdPt8eMo/TfhsU/LoYf6WBfJ3BCuEV8NI59icDVnnuzhqv9KqH6PUPbHOWO4GxQlKbUfH/rqmbXNlQzyK7YZPI10OyBqNjIUfyZh4zP6K/aUZdQeSTKpon0yzjH6Y9k3u4ZnTdHMJzWMzLwK69AYfup0PpPj5+SHg2sq91Z858ShyXquTS5q3aovJCfgru/NhDraCoo9UfEfVMwtokKqx+1oNUcgR/ZnpcHlDxov6SQK5RoSufgLMYNZPa3HWPPUY/+SCcwBMjXNM2hP1NsxJyEqhoqd8+O88e+ca7nnDrYdZxI18zpMuGU8BQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym7tMrr7bQk64K+I38EHsSdYI73u8nR2uK6GpQJAP34=;
 b=LgveDC9oK0UNf34aqXp7RvvUDPZmT/5kZXmzX7u8HTjp7vdGFHCLxsauIZVAq+mGCxuKmqP0WVfnEJmW6iAQyMH7OwmVEkReyPcfwTgb77GBnDVVDgkjW3P7JTKioLNSprBaGCo/jLhFv+vkAdACX4JCUaLP8SiJ553s9gLol2/8YLj2mg0xR2Fr+B9rj4wyOv6/AcSVrxk3Iop4ml0p5/RNAavzeOxVoKXDC91Wu7PNs5OmynU890VFAPuN6fyatV7hloVT/uveae1EA8YcbOlsi/zVxMUyGwskkZtY4XyVunLioXljZSLNV4KdRWMrKeglIWOV2W/puJg8K0evxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym7tMrr7bQk64K+I38EHsSdYI73u8nR2uK6GpQJAP34=;
 b=XZZbYnBIhJ9xlHqtEeWjXf6vsNTKi5fhzFarnFbBnrPD3rYQ+Zp6snqIfVm6fO8XiNW5Zwhn1V4EhgZM44QIpTcR/q7HNPHMyghDVi73n/XUW8V7/hfYc/PHUt+9goXnsABUWa9F/EzzlYrm6Xvfs5inPP3/VqkSiO/N0SO5d+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 09:00:09 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%2]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 09:00:09 +0000
Message-ID: <c57b8b7d-a773-0d51-8f38-2a2ac8c0e31b@axis.com>
Date: Fri, 15 Nov 2024 10:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 chengzhihao1 <chengzhihao1@huawei.com>
Cc: Rickard X Andersson <rickard.andersson@axis.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>,
 kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
 <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
 <66292421.21714319.1731610221872.JavaMail.zimbra@nod.at>
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <66292421.21714319.1731610221872.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: MM0P280CA0052.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::33) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|AS8PR02MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: f47fd57f-6d93-42cd-8466-08dd0553e814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW94SGRMa2pjekQ4TE1BZDNMYzg0QlQydXRVMzBCVnF5N0RDaUQ5dWJibU5D?=
 =?utf-8?B?MTlyVis1Vm5rRXFDSksrN1lkWThpcEtFTVhPZ0twNlVXNEZQY0g0ZGY1OHRG?=
 =?utf-8?B?QnVSdkczQXNJRHhlSC96cXZWY21CLzJOakVkUDhyVk9OSXFqcEVqZmIxdHlO?=
 =?utf-8?B?ajM5T0RxZnJoT2RVSjU0eHFYMklOKzgwUUdLU2pQcnJRclNORTJyaHNZLytl?=
 =?utf-8?B?SldPMkExaDZObVp2V1UwMkdUallKRENIWlZMUDNTdFNBczR6enRGcXM4QjVL?=
 =?utf-8?B?Qy9sVks4eHdFL0JudGVmRmNXd25DSys2cTJJZVl5aEYvMzVWV21tK0pETGEx?=
 =?utf-8?B?RGQ0QjVSa1EreXRDaXNWMUxHaWlmTFNSSkZaNEU3NVhIWW5meXBGOFF6aTVw?=
 =?utf-8?B?NmFjaE5MdVNmOW0yM0FtZkdibDdnNjJMM3NWOEhDK0piN1RrVUNrVlVYc2tS?=
 =?utf-8?B?YjRzcHJaU3UwbUxIcVByRk9DRUpFcld5REE3NlFoOHBDK2prL0J3QWVGNk9s?=
 =?utf-8?B?NTEra0pIaDhFdFRlUkowU2x0YkJVUnc5cHhZeGE2RnF5aVlNN0FnVDVOMGlR?=
 =?utf-8?B?NndXNXV4VlcyODF6UlpueE9vMCswSEVmZWFoMXZTdzgzVVVrOU9HTENNcC9S?=
 =?utf-8?B?Z0ZEWHl3V1lPcWoyazhrREduOS8vSDNuTXgrRWFEcWpPMzVUK3hoU1RpY1JK?=
 =?utf-8?B?TWRaVDNVRjhVL3lwMWN5cTNWbVpxY3VmMElXOHVMZ3VQWDI2cDZxR0NyWVVw?=
 =?utf-8?B?d2V6cjUzbjMrMWF3NmJVbG1Iakw3eXZNV2NBNHNBNTBNYkNPcDArTk85ZzBJ?=
 =?utf-8?B?T1FnZGc3VEV3YnlVQ2tyUUxybVJ1OE5odm5yQTFmeENoVVozK05FaFZEWWtp?=
 =?utf-8?B?eWg3N2xDYUFTSGFVSmo1NWlpcHJJSmNwZHlGNEpxUFRoVVQ3R2thS2RBeFhC?=
 =?utf-8?B?Yk0yZlFSbkkremVvbm8vMGpsWnY2cmdzM2NUL1A2RkNqbVhrUkpnTyt6WkRo?=
 =?utf-8?B?M2N0NmxVTGlYaGRKMk9ZRk9RWnZRTlhVRm02eW1vSlVmZ2luaWRQN2kwdFds?=
 =?utf-8?B?UUE2SUxhaVc0RVdBb2pyclBiY2s5MGhWZmU4SE9kTWlEVDRzaVZ2U2hrUnp6?=
 =?utf-8?B?cE9Wd1RWbnRTVFdXVXl0WGhhdC96OXcrdVhmSGJIZ2VGbE5EUTR4eVFCckx4?=
 =?utf-8?B?SFJCcWRQZXlJM0M4UW1odE8vbnNUajJrYjM4WW1acXlxS01SQkNobFRNcHRo?=
 =?utf-8?B?QXZDamhoYjRsaVppY0lyUDhjc2tnbW5HL1lwbks0N2FWN0VJOU1Xa0FONkZZ?=
 =?utf-8?B?TTFJRnU4NDZSNHRJd1NjU29kSko2d2YvYmRCZ0JuN21SNk4rOGRSSHBFUkk0?=
 =?utf-8?B?Z2FKbGRSYXBiUFJRTXA3L211bFB5TUFXZEpMYytjZXB2Q0RjMVdwSkZ6OXF6?=
 =?utf-8?B?QTJoY0pDOXVPYjc5S2Rnb3hwb2xxSWVwZm5GdVErQ1dxbHVjMWVTZVdyNWJ2?=
 =?utf-8?B?ckIvd0U5bWxKUWdhR2liTURXcHV2enJLWEc5OWU1R1JLRVRHN0RUTVVadVFQ?=
 =?utf-8?B?ams1OTVEUkVOUVR0TFJNeDQrSTVCY0FFOWZHaDd5Ung4NmZPYm5XT2piMHJp?=
 =?utf-8?B?NzVTUlNmaFJDUkZFd01xWnptWk9YdnRBVXZOOEJOZHlpWGNVSGlhUXM4WDU1?=
 =?utf-8?B?QmpZZnBEbE4zcno4dXFlVEVnQ3ZIcmo3YllmRHQ1bHhuT2ppTHI0d1E3SUtw?=
 =?utf-8?Q?2Jh9lxpnddxwnHyIWuRhCMj41Vc8EM24WdfX7kO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU9hNy9FUU0xYnhrbTFZVHh5MXAzckdrREZBdUFRMmVNcXZSVGpUTlJ3Vzc0?=
 =?utf-8?B?Qm9FK1MwSlZqeGgyb2lGdFRUajlyRUZ0QlNKQnVhc2Q3MWlpcEpuVDlvcmlL?=
 =?utf-8?B?cFJBZ1ZxT211bWZlSFQxNnozMmJDNjJPVEt4NEtRN1dhRmcyeDhBVlRSaTY2?=
 =?utf-8?B?WG5EMVBUekFpcjMzSnlIaCs3dVNGU0l0M05RaytrQ2lucjl5MktiRnEvaUY1?=
 =?utf-8?B?Q25OZXFxR3FIeml6NSsxVy9sL1YyNEhkditzMW1aNVpqWlBsNnNKSlNHS3l6?=
 =?utf-8?B?THhRNWo2N2tZQWVuam0wODBiZk9HMllsVzZGd1dpeDFnMHdOWUgra29kcU9C?=
 =?utf-8?B?dHJhY00vVFd4MFJ6bnJoSzJ1M0xiNi8rdExjbGJhU0h1aTUzamJmajVYUm42?=
 =?utf-8?B?QmF4RzB1UFQrY3lld01jajFZM1RHWFc0TlAyNk1EMWNoUEthNEpQOFVMdmZn?=
 =?utf-8?B?OUU0ZVJTVU45M3RtblZMT3U0dXMxSE96bnU0STJmQ05zSVI4UTRocGtla2xG?=
 =?utf-8?B?WSt6Qk1yczd4U1JUNmlOZDZvNHJRN3pxYUlFLzZpVXNHSDZuNUZGMXlubXBU?=
 =?utf-8?B?N3BPajdPYWxnbWhtTUdUaUNkN0dDVERYSjZmb01udHphZU1QdkRwdTN0RzRL?=
 =?utf-8?B?K0JueThHZmppcFMveHZRWWs3NlgrN2Z6QWtQSEhtTWJUWE5STitrVFJUVUNE?=
 =?utf-8?B?QVdnWGRGa1ZlbUV5bVhQOGs2ZXp0cnNPVEZOeFBKNGpleUE3WDZaM2E1YW1T?=
 =?utf-8?B?ZmwybG00azQxSEtUK3p2eVpscXUxT2xERDRocTRYd3pGa3gzUWpEdUkyTVRP?=
 =?utf-8?B?T01pb0ZEMHNGWnI1RTd2RjI4WUZvbkg4aWk0UVN1eHFBVk1lT04yM09tVmMz?=
 =?utf-8?B?SmVKSVpiUmZwTGRWa3FYRG5NcW1UT3JzWXlwMldOMnV5VU5VQnpqSmF1b21L?=
 =?utf-8?B?U24xQURaZmd0c3Q1bFEzZ21yd0UxMGQ5Rjg2N2Zqd0huZkxzVlI0blFsWGZq?=
 =?utf-8?B?UEpVb29nOEZSUHkvaGROOTRCK1I2aWJXMkwvQWk1VDgwT0dzWnBUeTFqSEdl?=
 =?utf-8?B?RFZSenM5VWU0cHhMWENlZ2tKNC90S1B2NFFzcEdJYUQ3RklKNEVDYmZPTHpR?=
 =?utf-8?B?RXBuYlhXVFp0Y2JGMTN3NHJKOFJwMmpJNGJLdUFLWmtkVjhPb1ZpQmtsYmJS?=
 =?utf-8?B?Y2lHK1IzN0JPNDVQTDdkaWFXNVNhWkp1NVQyVEFiMzZ6TWpjVHdFZm9PQlZQ?=
 =?utf-8?B?U0dkZEc3UGpxbHFEMU5JNldCYm5hbWtmS01mSUdvem91RVBtbUQvTmNhMUNX?=
 =?utf-8?B?YlYzWmhFVmJZNFZLMHNEVElmQncwc0JIOERvNWZNdEpDQUE1a1NVMkx6anFF?=
 =?utf-8?B?d1hCa1NqcnliazFlV21LQVhXMXNpRUpQRThCNjN3MEY4MFV1NjdxRkExNEZ4?=
 =?utf-8?B?TVJGOWpMWHQ5dS8rRkZqSldiQkxNRWhHZXJUZ2JGUGZGV2xRVlgwSTJ1MGZs?=
 =?utf-8?B?OWszbmtuY1UxYUlzYWE3SDh5YVZ5Y1VLWVNmM2NidDRaSFZNOGtnOHFPVmx1?=
 =?utf-8?B?N01hanJMMHllRjlFdzdXWUZlaE9UQmk1TStiSjNFSlpHc1NoSmtPNFB2bDlk?=
 =?utf-8?B?WmoyaVBhbmx1ODdjcnErRmhaWnNnWVp0TXY5RTdXSVBYbFpCeTkvbHhJTDJ2?=
 =?utf-8?B?Q0U1Wk00MHdJK1NqSUJEaTdVbCtQcWkyVXQrNkNpeDZ0UWs0NlE2OUlPdVVw?=
 =?utf-8?B?WUhia0JnTVlpZmsxMUhXMEt2bTBTaFQyZmFxdTAxd21GRmpMcVI2cE0xV3dX?=
 =?utf-8?B?MlNoMExWdTY4emlVajZrVzV4dWJrOVBKSHg2K3dyVS9EM1NMdEVHVExWWVY2?=
 =?utf-8?B?dGI4dEx4bThrdjVqVC81V0FQVGtVWEJJN0JyVm93Y0VYRzlLbWt0cFVES1VR?=
 =?utf-8?B?VU8vNW9XL0w2ZUVzMVYrNXhmeFJYM1kwM0NsK1Z3a0hqRWI5K2pVRmJsUlZB?=
 =?utf-8?B?S0Y2QnFpWkltaVdrNnB4eTBLSVJWSHdTK3ZoTnJsZDVQMWJDN3dZWkhUQzh6?=
 =?utf-8?B?a0lkQmFmN0pFbk1LZUtXOXArdzVKUlNxMnNzbXF6S0RSWnRUdXdtQnZManJy?=
 =?utf-8?Q?oTyMR4sa3uo8o5xfM+RRP5bXW?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47fd57f-6d93-42cd-8466-08dd0553e814
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:00:09.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j9OOaHYNFLb0xA+DV2hCHy5K0rozWokFjT6QWFcPx5oK03dUBxr5i2VBjMcyB2rcHWIWbXH5/hZKSiBVnAZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_010015_165890_5612B3D1 
X-CRM114-Status: GOOD (  13.41  )
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

T24gMTEvMTQvMjQgMTk6NTAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPgo+PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJSaWNrYXJk
IFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+IENDOiAibGludXgt
bXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAicmlja2FyZDMxNCBhbmRlcnNz
b24iIDxyaWNrYXJkMzE0LmFuZGVyc3NvbkBnbWFpbC5jb20+LCAia2VybmVsIgo+PiA8a2VybmVs
QGF4aXMuY29tPgo+PiBHZXNlbmRldDogRG9ubmVyc3RhZywgNy4gTm92ZW1iZXIgMjAyNCAwMjoz
OTo0NQo+PiBCZXRyZWZmOiBSZTogW1BBVENIIHYzIDAxLzEwXSB1Ymk6IEV4cG9zZSBtZWFuIGVy
YXNlIGNvdW50ZXIgaW4gc3lzZnMKPiAKPj4g5ZyoIDIwMjQvMTEvNyA0OjM0LCBSaWNoYXJkIFdl
aW5iZXJnZXIg5YaZ6YGTOgo+Pj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4+
IFZvbjogIlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4K
Pj4+PiBUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRlYnVnZnMsIGJ1dCB0aGlz
IGluZm9ybWF0aW9uIGlzCj4+Pj4gb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4KPj4+
Cj4+PiBJZiB0aGUgZGV0YWlsZWQgaW5mbyBpcyB1c2VmdWwgZm9yIHJlZ3VsYXIgdXNlcnNwYWNl
IHdlIGNhbiBhbHNvIHRoaW5rCj4+PiBvZiBhZGRpbmcgYSBub24tZGVidWdmcyBpbnRlcmZhY2Ug
Zm9yIGl0Lgo+Pj4gRS5nLiBhbiBpb2N0bCgpIHRoYXQgcmV0dXJucyB0aGlzIGRhdGEgaW4gYmlu
YXJ5IGZvcm0uCj4+Cj4+IFRoaXMgbWV0aG9kIHNvdW5kcyBiZXR0ZXIuCj4gCj4gUmlja2FyZCwg
d2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBvcHRpb24/Cj4gCj4gVGhhbmtzLAo+IC8vcmlj
aGFyZAoKSGksCgpJIHdvdWxkIHByZWZlciB0byBrZWVwIGl0IGluIHN5c2ZzLiBXZSBhbHJlYWR5
IGhhdmUgdGhlIGZvbGxvd2luZyBpbiAKc3lzZnMgKC9zeXMvY2xhc3MvdWJpL3ViaVgpIHRoYXQg
aXMgcmVsYXRlZCB0byBmbGFzaCB3ZWFyOgoKLXItLXItLXItLSAgICAxIHJvb3Qgcm9vdCAgICAg
IDQwOTYgT2N0IDI0IDA4OjU0IGF2YWlsX2VyYXNlYmxvY2tzCi1yLS1yLS1yLS0gICAgMSByb290
IHJvb3QgICAgICA0MDk2IE5vdiAxNSAwODoyNiBiYWRfcGViX2NvdW50Ci1yLS1yLS1yLS0gICAg
MSByb290IHJvb3QgICAgICA0MDk2IE5vdiAxNSAwODoyNiBtYXhfZWMKLXItLXItLXItLSAgICAx
IHJvb3Qgcm9vdCAgICAgIDQwOTYgT2N0IDI0IDA4OjU0IHJlc2VydmVkX2Zvcl9iYWQKCldpdGgg
bXkgcGF0Y2ggc2VyaWVzIHRoZSBmb2xsb3dpbmcgd2lsbCBiZSBhZGRlZCBmb3Igbm9ybWFsIGJ1
aWxkczoKCi1yLS1yLS1yLS0gICAgMSByb290IHJvb3QgICAgICA0MDk2IE5vdiAxNSAwODoyNiBt
ZWFuX2VjCgpJZiBmYXN0bWFwIGlzIGVuYWJsZWQgKENPTkZJR19NVERfVUJJX0ZBU1RNQVA9eSkg
YWxzbyB0aGUgZm9sbG93aW5nIGlzIAphZGRlZDoKCi1yLS1yLS1yLS0gICAgMSByb290IHJvb3Qg
ICAgICA0MDk2IE5vdiAxNSAwODoyNiBtYXhfZWNfZGF0YQotci0tci0tci0tICAgIDEgcm9vdCBy
b290ICAgICAgNDA5NiBOb3YgMTUgMDg6MjYgbWF4X2VjX2Zhc3RtYXAKLXItLXItLXItLSAgICAx
IHJvb3Qgcm9vdCAgICAgIDQwOTYgTm92IDE1IDA4OjI2IG1lYW5fZWNfZGF0YQotci0tci0tci0t
ICAgIDEgcm9vdCByb290ICAgICAgNDA5NiBOb3YgMTUgMDg6MjYgbWVhbl9lY19mYXN0bWFwCgpJ
ZiB5b3UgdGhpbmsgdGhlIGFib3ZlIGlzIHRvbyAiYmxvYXRlZCIgaW4gdGhlIGZhc3RtYXAgY2Fz
ZSAKKENPTkZJR19NVERfVUJJX0ZBU1RNQVA9eSkgd2UgY291bGQgcmVkdWNlIHRoZSBhZGRpdGlv
bmFsIGZpbGVzIGluIHRoZSAKZmFzdG1hcCBjYXNlIHRvIHRoZSBmb2xsb3dpbmcgKE1vcmUgc2lt
aWxhciB0byBteSBWMSB2ZXJzaW9uIG9mIHRoZSAKcGF0Y2ggc2VyaWVzKToKCi1yLS1yLS1yLS0g
ICAgMSByb290IHJvb3QgICAgICA0MDk2IE5vdiAxNSAwODoyNiBtZWFuX2VjX2Zhc3RtYXAKClRo
YW5rcywKUmlja2FyZCBBLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
