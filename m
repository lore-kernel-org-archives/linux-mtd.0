Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33FCCF34C3
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 20:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44j2CjvFveyMxa5P1WKWvkbge/XkhawZPnJbNByPu/E=; b=u3g8fqz287QGGz
	8nrgsTGxvf0TZ3y/RDTHOnSocuzfzbWuxDqqgLZ+ndFygFG6YbTTRuKISP8KpWf6iDduwuscn3gV7
	41F6XBwK1T17R7GZFnCr+xz9RVA0Wm2Bslx0m5j9M8LmdSDGcc1i/Rcw2zOaR7audC3o3QVFsKifj
	P4rhoilbGNJAjtb42vqMTgduHl7z6HerHuXj8ioYxBMoZZEifqWL561NLkWhzlfcJFT/ho4guD4C6
	FbbVxgT7sWEjq9NJamJ4mEw8hkHfPEiQUyPXug7X+n51jJTQIn2/QN0zHjZP5TZFPH5SnKI+KDhUf
	KsMNv7s89uZ8AOzqteOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swS4k-0000000AGTh-3TpX;
	Thu, 03 Oct 2024 20:05:26 +0000
Received: from mail-am6eur05on2061b.outbound.protection.outlook.com ([2a01:111:f403:2612::61b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swS4g-0000000AGT4-3nWB
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 20:05:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMPdwN2ama1M209fV7qSVMD4NvACRa0wHFVJwkWaJ0vpqiiSub6wxoZDYrZ0fRgetmAfQG8WKsFBPKlFF2yzFfuoHk9yfnLzha3T8wgxy/Yi43IQ2DobElygnnEzmtiVFpoiUQPlGFVLfyTmvVgdEYSss/D6JZX3oNwR15X6eyTK0Pof+2GxwCjfyN8r0cX3rkye8J3jeAi64PWGloOQatNes0GHH1YmpE/zutgQ3XURvQgLe7kmrmcRsSeFDTn/r/NvShrpNJJqbYhXwdrJgDIjS6gYZ75xjjftex7ksizTfpd/7yPNdrMWLzO10WeGo/CMt6vpQlm1qSBpSCFttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mfhkZzOHOqkgoj8au8T+Lz5ETZyQfDDeQOwUu8YEWc=;
 b=WUkpQGSThVAfMYhrD/j+JTsNu6B3zH89j3d9kZgUtKdBT9v1TUj9NTlSAm0blHxDGVAukiGNU8wn3AHYKhQ0jurtqb9Dl3bZdDpXsokjSsWuxwjvbKPmazMis6TR53oTyVYM4zPMaPq/DUm5BZ/KUahmanlDb2z1PBbVU45dSB9ANRNv20b0rRZqD/5jYQj+TBuIX3fMyT8+PbMXAz67DPEBB2WpQd90fANgw8Zo1J3jE5binF26iMY7v6OgxBe8yGRz/f8M8Bi4ctOckmijV4ZpMcL+b3rILTM+EdCUEaiU4t59AKIAyqq/9RMSH4FULZRSUVYNUYjxQlvT8E9BMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mfhkZzOHOqkgoj8au8T+Lz5ETZyQfDDeQOwUu8YEWc=;
 b=EnnBKYkxQQUjdXqNZrm3idLYelChzUPDoXmIK7HxoXTJgWVJTUwEh80JNDMPzcPd8rsE0Vj543XaaAo+hm+JT2qNX4F9zWsJzN2AGvu2kT7sWG/ALFLJ9VW3x9hi6ZAoXkelhTiLO7jB+oWtR+P/00HPNsSsa/7mMYwb1GC4gTgIR5mqGmlrihBuGoXhXgaQRsS4cBHQ9UzDHTngo+vPbefF5To00wZnbsv0OpJLicZ5P2Y3XGUddBozTZwdLXuXs0+rclvh48KOyCh9TlsZpNHYaJWvrEU7mY5blqU9M69h2mgm+dfvWk0rXA89FWm76ONqCDgWO25cMBhMsaE3Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:05:14 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58%7]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 20:05:13 +0000
Date: Thu, 3 Oct 2024 15:05:08 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241003200508.x7tbf2lpbg6ngm7q@cozumel>
References: <20241002153944.69733-1-han.xu@nxp.com>
 <20241002153944.69733-2-han.xu@nxp.com>
 <20241003093840.2965be20@xps-13>
 <20241003150500.uz2efay7kadu47if@cozumel>
 <20241003172820.50324192@xps-13>
Content-Disposition: inline
In-Reply-To: <20241003172820.50324192@xps-13>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1fab8f-26df-469a-0c45-08dce3e6b154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXAxdW1rNWkrWVNOU0NVSVlIOHZoT0dMQTVTWG5hakhkWFFCNEJPMEtSU2p3?=
 =?utf-8?B?S1ptNkw5cWJZQyt2OVE2eFdPSk4zUmZXTURiR0pKcmpUVnRHTkFvdUd1MGYx?=
 =?utf-8?B?Sm1sNnQ0WVNSOUc3RlFFUkFDVmFWQUprUzAyeEhMaHI2WjV1WUxlWVBSS1lM?=
 =?utf-8?B?Q25VZU9zWkhDMzErTXE3YUxvaXVPUUZadTEzZjgrMUw3WkpLSWFBMWxyaTBL?=
 =?utf-8?B?Um1xR0IrZmhVOHRHU3lZOFlJdmR4c1E1c1NwYndxSVZJN05LbUFzR1RuMEUy?=
 =?utf-8?B?dUxJTEYydUdzTUxMeVlBUGloRFhzMklXQlVvb1FWQnQ5VXRSdk5sMnBrZTRT?=
 =?utf-8?B?SnJXYnIvU2FhSm1aSzNaWThzRkJxNmcraml1clJyWmY1dlpsZUt6M2ZTNGlk?=
 =?utf-8?B?dWF6Z1BNVHFmUHhKZ2JrTWxoRStURWRlQkd6cU9hNVhMQ2FmZUU5S3F6NTNj?=
 =?utf-8?B?Rjh5eiswNldaSXc4dGtRTGJEZXA4ckF2TWEyckdIZ05tcGR5emJpM2s5M25y?=
 =?utf-8?B?MUpHYVJ5K2hpVmltenpWODY0MkVkUk1NTUNDQis1MnFKd1dicTU5cWZDV09w?=
 =?utf-8?B?UzEvWW50YktpMWRIV0xyTityRkRXMEtueGNWNmRzSjZEVG0zOFRDUGJQUmho?=
 =?utf-8?B?S2FMUzdhMHowZTN3aW9rUURiTXU0WVNFcWdVc3hoNnFId2diajdaT2RuN3Nj?=
 =?utf-8?B?dDhzelVmQzRBVTJKcUpZc2F1VUwxR2NuamhHMWh5NjhmQmZlTGVSVkh2ZmpR?=
 =?utf-8?B?bDdqZWxabTgvOW1MZkxIaG1rL0lJZ3UrZEJuUUo1SUxvK00yeG1nOG5HaXdQ?=
 =?utf-8?B?S3RkV01oNkxuVkpYZE5PdmZXSVQzemJrMFIwZnlxN1RzNDFBNklYRTBadElp?=
 =?utf-8?B?NnlZaHRHeG9CeFBNYjY2cFBVQkxaTHdNN1pvMmNkbGYrVlAwVEphS2VONFBt?=
 =?utf-8?B?bVVJcnpqU0NvRXFzcERXYi85RzlLYXJyRE0rRXFJbmh5d3RLUi9YQU4wRDFz?=
 =?utf-8?B?aTE4d09SRkdXaWxYalB4Ni8yaExjNEpZSUZQQkY5RGs0Z29ORlBVVFQ4WmVm?=
 =?utf-8?B?WEQxclRSb1B4OFQ0dUE1QXJJbWpWOFp4bTV1SXhZM0lzVVBNN3FTS2JBSS9r?=
 =?utf-8?B?WlB2UjZJelpzWitxVHc4WHJsTWFJaXo4UnQ2V2poazlKQlp6K2hCZlNMY1Fi?=
 =?utf-8?B?UDJpQ1d6ZmR3d2pBMkROcEY0SGZGMStMWkphM3ltVCtDbnNpOEZRNmlUanZz?=
 =?utf-8?B?WG01cXU4cmhDaXIyRzhBeWpvRkhJcjNhUjlGOXNlSUcyWlJKZy9ONTV0Q1ZY?=
 =?utf-8?B?Z1Y3RlJzeFVCMHUzZlo4bk0ydVU5UjJGQllxNGJrTzBXbTNSdzNZSGgvcW4r?=
 =?utf-8?B?ZkdDbk9xTzcvK3lRaDIrY0ZQQ1lFdXVDOUY2WEczeXpGdm9Ydm1mZzBPb1Ns?=
 =?utf-8?B?RUVYUUMwRThDV2NEdkdkMjRGUTNhYjdvT21yeFFzUmxmZ1htcTM3M1hPR2lS?=
 =?utf-8?B?b3hhUEpJRDF0ZWlHSGtaN090Q2NTd1VpMHQ3Q2JEREp0bVNxTU9qZVh2QitK?=
 =?utf-8?B?c0RBU1J6bnpsOWl0K25NWGllcXNPa2JtQ0pWeDNzay9zQ3krQlFCU2xiZ1h0?=
 =?utf-8?B?WStkZjJOL3VxclR1Qm8rYjRGQnB6RTg4bU5pMFJ4elVHblh0aURUUWpkT3hI?=
 =?utf-8?B?NjFMN3NzL1VpSjFnOWZNNmc4Nm9EWVM5SERuNi9aSG0wWW9UaE5kSU83OThZ?=
 =?utf-8?B?MnVWenhzVHFsc1h5OCs3UW9wWXoxd3Fkanl3QmNXWXQ4SkZPaEh0M20vaEJq?=
 =?utf-8?B?RWozdnovOG5JU3E3aVJPQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZUYkxUNGhkTjJuT3ZqWC9WSFJZRXJzY091ZTZEV2lQekx1cy9KK2twckJY?=
 =?utf-8?B?R0JaZU9OMUFMMWVscHVzUXY3SGtOa2hZRkZncExmc3d3RTFFZVRwWEZIVEtK?=
 =?utf-8?B?Zm9sVTljeHJjTFoyUWVOUE5RQkZNZ0RNVFExd0tSdklHbDF3ck9xL25XWTBB?=
 =?utf-8?B?RDZObUl6T0pWYW8rTHY2UXYrTEVFejlGNTFxNDJEVi8zWFR0TmRUN29aU0Ny?=
 =?utf-8?B?MFFpWGJDOGVYS1c5ek5FN2xvckRlSWR6ekVzV2t5b21nNzdBUEtlN09Xc1Vn?=
 =?utf-8?B?OFZ1LzBJVWhsVDZMcVpPazAwMXliWU9sNjE3WXdTc0pISUg5cUpBSnZpLzIz?=
 =?utf-8?B?RGhXNkp3NE1RWGc5aVVsS1owTWtrb1BaNG5hc1FMeEduQ3Bqc1ZnRHFabkxW?=
 =?utf-8?B?L3RZNW1kTTBrMGdnZXpXWVpaZmsvaysrS2FBQWxJN1JJLzA3dUVEVHJ0Wlg0?=
 =?utf-8?B?NjE3Vm5FRWxUMEhhQzhJMDM0cStoQUpnV3hiTjlORWhYOHBsTEdTWm02aFVp?=
 =?utf-8?B?b0UzKzVjZ1BVQTZTMHd3MnpoZERhZnkvVjBCUFpXVnhVTFFnWUw5S25EVkF5?=
 =?utf-8?B?QmRPMXVtWUZNRHd2QU5CYWhMdFB6UFNmWnMxUy9mV1ZMNXJRZ1VYMFdNYzJw?=
 =?utf-8?B?blI5dHhtdFdheXdSc21qdkZuOHEwdkRBcGR6MS9PcHdJYXpQRjRJUm1KeTZw?=
 =?utf-8?B?ZFhIaTFNYlBGUXQrWWZZWXlaWk1ZemdJa0kzR2pLNmU2U3FScmJhbFozWUFJ?=
 =?utf-8?B?WlhFYTgxRWp3VzI0RzJCbzU2dW5OamV3YUhQdTlCWDNDbGpIcVdmZjNQVUVa?=
 =?utf-8?B?N3JoRUl2TytVN3N2d3FMR21pckNBL3dzZjhXT0cydlNEUG4wME1tNk0yUHNr?=
 =?utf-8?B?dDRDV2ROeks0Q2xtQkI2NklBbUVXa0xMYXZxbHprcmxLMWxFRlN6WG0rd0RC?=
 =?utf-8?B?Qzh6MkJrR3JBSm9PNXdWbXBsYnpDckd5ZUdrVFpzZVFEZW1waFJpZFlhNWFw?=
 =?utf-8?B?dENqRUg4K0dZaXRTTlRuUHV0WHpLdW9zdndLc2xoV2pCd2VRdkFETm8wZWpl?=
 =?utf-8?B?TFB4bksxR1FVSVhZN0RuTUFxZUpyQWcxQ0EzT1RYQUxJNEc1QjhYV1dFUExB?=
 =?utf-8?B?WnVsU2tqNlBGUitQZkR2TEFpQm05aWtNUnMrb2pnL2o4dk4rZGRDTFJtVDBl?=
 =?utf-8?B?ZGsvR0VTRmM1b1FaaEJsWmFCT1FqOWt0ZlgyZ3k1QnFiRXFaMksrZ1V2cGlK?=
 =?utf-8?B?WXAyWnhCcG5nVDUrUUJ0RmNjNmFFVlJkU0I3VlBPWjN2WG5Ja1JJOUdzMXo1?=
 =?utf-8?B?VU5lbmhDa0N0S1pHOHJjNXZTWm9nYzUvRE13WWVSWXJpdWMxZlNrclBTU285?=
 =?utf-8?B?TmdJQmpnSHZ5akR4WklTL0syYTRvTTFXZlFwSWhmVmZIb29KdEgxTVFNTDlM?=
 =?utf-8?B?UGxTRzN5QXZBYmUrWTZCQU1TZ1UvdVpURlhXZWpBcnIwbS95ampiTm1wd0lx?=
 =?utf-8?B?ZURLKy9qUHFwWXN0QXhpcldIY3pIemRZTThVRWkvZTZkRGlBNjcrS2VvbVR6?=
 =?utf-8?B?ckpMVCtyNlBqVnE1UEJGdVM3Ykp4L3BUMXZzN1krQzc2SUhwU3dqNU1xcTNi?=
 =?utf-8?B?NnQxZ0duUEZjTS8yMlRKcWRQbWxZVk9JSzloWlVDWkFXZlNPejVTWGx6WnVQ?=
 =?utf-8?B?SU9wNW9aS012OHpVby8zTTFmTGdJRHpXbE4xbmhmelhoeXlIZmtLc3E5NlNj?=
 =?utf-8?B?RjdEN3lTSHRtZnIvcWFNdENCRFc2b21UK2s1RW9lN2E5UnFKdzRoRTd1Ujk2?=
 =?utf-8?B?NWV6Z1dOL2VtQm1RNmNwcmJCQldBbVZmbEo2blpZRWxRcW9FQmV5K080ZUZX?=
 =?utf-8?B?dWxWVjkwdGxnaHl0NXZKOFYzaHBvdEtFMS9qbnhDRlRjWXlBNGMzVTBsUTVC?=
 =?utf-8?B?SnF2allIRWZPdWlFVUs0bHB2SDVoVDZ2WGw4QUs2S1BmWXBBMkIxVTltdGVY?=
 =?utf-8?B?TkF2cFR6dVpOR090UTUwV1Z6NDEvYzdlZi95WTh4Z0d2SE9UQXpQdkF5OCty?=
 =?utf-8?B?SnBxSGtNbzdnNUZ5aFREKzI2ZmMxY1lIdlRIaUNzVk5Ga1Q4L1lJalpPVCti?=
 =?utf-8?Q?SRME=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1fab8f-26df-469a-0c45-08dce3e6b154
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:05:13.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEdjenI/1p/Q05gVLmn5g8WVy6e9LdKzETz4UsHz/Uus/S/udEqisWkj31KxFdsi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_130522_975657_6D4AE28B 
X-CRM114-Status: GOOD (  23.38  )
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

T24gMjQvMTAvMDMgMDU6MjhQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBIYW4sCj4gCj4g
aGFuLnh1QG54cC5jb20gd3JvdGUgb24gVGh1LCAzIE9jdCAyMDI0IDEwOjA1OjE2IC0wNTAwOgo+
IAo+ID4gT24gMjQvMTAvMDMgMDk6MzhBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+ID4gSGkg
SGFuLAo+ID4gPiAKPiA+ID4gaGFuLnh1QG54cC5jb20gd3JvdGUgb24gV2VkLCAgMiBPY3QgMjAy
NCAxMDozOTo0NCAtMDUwMDoKPiA+ID4gICAKPiA+ID4gPiBUaGUgY29tbWl0IHJlZmFjdG9ycyB0
aGUgcG93ZXIgbWFuYWdlbWVudCBoYW5kbGluZyBpbiB0aGUgZ3BtaSBuYW5kCj4gPiA+ID4gZHJp
dmVyLiBJdCByZW1vdmVzIHJlZHVuZGFudCBwbV9ydW50aW1lIGNhbGxzIGluIHRoZSBwcm9iZSBm
dW5jdGlvbiwKPiA+ID4gPiBoYW5kbGVzIHRoZSBwYWQgY29udHJvbCBpbiBzdXNwZW5kIGFuZCBy
ZXN1bWUsIGFuZCBtb3ZlcyB0aGUgY2FsbHMgdG8KPiA+ID4gPiBhY3F1aXJlIGFuZCByZWxlYXNl
IERNQSBjaGFubmVscyB0byB0aGUgcnVudGltZSBzdXNwZW5kIGFuZCByZXN1bWUKPiA+ID4gPiBm
dW5jdGlvbnMuICAKPiA+ID4gCj4gPiA+IE1heSBJIGtub3cgdGhlIG1vdGl2YXRpb24gdG8gYWNx
dWlyZSBhbmQgcmVsZWFzZSB0aGUgRE1BIGNoYW5uZWxzCj4gPiA+IGR1cmluZyBzdXNwZW5kPyBJ
biBnZW5lcmFsIGl0IHNlZW1zIGxpa2UgYSBkaWZmZXJlbnQgY2hhbmdlIHdoaWNoIEknZAo+ID4g
PiBwcmVmZXIgdG8gc2VlIGluIGl0cyBvd24gY29tbWl0IHdpdGggYSBqdXN0aWZpY2F0aW9uLiBU
aGUgcmVzdCBsb29rcwo+ID4gPiBvayBvdGhlcndpc2UuICAKPiA+IAo+ID4gSGkgTWlxdWVsLAo+
ID4gCj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuIElNSE8gdGhlcmUgaXMgbm8gbXVjaCBs
b2dpYyBjaGFuZ2VzIGluZGVlZCwganVzdCBtb3ZlCj4gPiB0aGUgZG1hIGNoYW5uZWwgYWNxdWly
ZSBhbmQgcmVsZWFzZSBmcm9tIHN5c3RlbSBwbSB0byB0aGUgcnVudGltZSBwbSwgcmVsZWFzaW5n
Cj4gPiB0aGUgdW51c2VkIHJlc291cmNlcyBhcyBlYXJseSBhcyBwb3NzaWJsZS4gSWYgeW91IHRo
aW5rIGl0J3MgbmVjZXNzYXJ5IEkgd2lsbAo+ID4gc3BsaXQgdGhlIHBhdGNoIGludG8gdHdvIHBh
cnRzLgo+IAo+IEFjdHVhbGx5IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlc2UgY2hhbm5lbHMg
YXJlIHJlbGVhc2VkIGFuZAo+IGFjcXVpcmVkIGFnYWluLiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8g
ZG8gdGhhdCBpbiB0aGUgKHJ1bnRpbWUpCj4gc3VzcGVuZC9yZXN1bWUgcGF0aD8gSSdkIGJlIGlu
IGZhdm9yIG9mIGF2b2lkaW5nIHRoaXMgZXh0cmEKPiBjb25maWd1cmF0aW9uIHdoaWNoIGFzIGEg
Zmlyc3Qgc2lnaHQgZG9lcyBub3Qgc2VlbSByZXF1aXJlZCBoZXJlLgoKT3VyIGxvY2FsIG14cy1k
bWEgZHJpdmVyICh3aWxsIHVwc3RyZWFtIHRoZSBjaGFuZ2VzIGxhdGVyKSBpbXBsZW1lbnRlZCB0
aGUgcnVudGltZQpyZXN1bWUvc3VzcGVuZCBpbiBjaGFubmVsIGFsbG9jL3JlbGVhc2UgZnVuY3Rp
b25zLCBzbyBJIGRpZCB0aGlzIGluIHRoZSBncG1pCm5hbmQgZHJpdmVyIHN1c3BlbmQvcmVzdW1l
IHBhdGguCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
