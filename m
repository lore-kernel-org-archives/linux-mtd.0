Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62894C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ha8xtt+MWVw91oXl7t7yrkD/TPwISmXGYEBwJQZ2Uks=; b=DthIpJCpWTYFuiYZCpA7NwVgnw
	r6Nusf4M9JkLQPTCJih0e174vEdx7m7/j4AyLnKoRInjfKEanzNxJoK0YRu1FUq0Q+HLR30p1Pyis
	0Mwg6WLjgUtiKF3aaFCmoccF0jJnEIaqSnk46rYwxLsyFVRlnQQiMty+Wwkt1W4FgJkTpUQLNpRZH
	d6Syg3X3MV2YvcJ6PBjnp8LEwK14HI5iyO1PbdQ3SddZetkFYJv0lxnAhm34ugrXa1AURgTtlmQWt
	EnFv25+VYYTFXPJ+0Cee/2fcPOjgTGTcb0X6uOoSI9DhbdponzmMfw0Q49ChMMQlybup/I+nUo1Hk
	8xJi9Kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmwx-00HLN9-J1; Mon, 10 Oct 2022 07:11:43 +0000
Received: from mail-eopbgr80118.outbound.protection.outlook.com ([40.107.8.118] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmwv-00HLKz-06
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2022 07:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhK3S66D5FZOFnJyIKVlscLqCCIIfk3CNtWcvzmHFAZ1RR1hVtitJht+n3Faqqwti7Rx2Nf5o/jMQUOlTNNrYarrEs54R7Eb6jkZU9LuEbxjIyJHXEAHjag58qswH7ZWq+ukkfDc/Y2VtGbkAOnrL5n4oXOTvd3a/zwlqJMtzeAWVcRDQ9c9DEw+s+O9S9eGWN75He83U+yr81DKqNRjPlRAGwOSdFu6kPXoJGfqak427BR+bjEUlybeqcz3uPCGcdIi3jRhIEUXdsGV3ktKKaMu1eQGyKz+Nmwx1Yj1tmOTVO91dDlr07ElXurHP0Cb1oi3QQArMGHnhvqNJpFvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJyhTnU0SwQB54VezVbEczYNOhmpGv2SwcVtNzbpIEQ=;
 b=iWlrzqdAT9QQysCuC7TE477aVjABHeQWtlW/xFKN0i7cvRu3wR8X2N9sSY1AntwUYCeavL2cgIruqj7Ah8INcbUDCwx2XsCHxsFN4PVVgUB+4D2Fve8LcxOql5EeWOm8AMyZj9nhyp6MsgntAHFR10ILyMlB1CLgG60HSEBs0Hvc4qA8Px+3rtUuPypoPP9cOIVv+3U2AG2B7fSfPvp1VuvgoWhLcUHP7MVx8bdVYPFP8kLn7aZDZFNHlfZ3wAsI1U3BxyOc5Kw08OonG9Wq7wkT5mWRnxtn5KeucidTPDZpMmI9fsIeDQzUO/dPjNgG0UTSkQmXDmZTCTtsnUdjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJyhTnU0SwQB54VezVbEczYNOhmpGv2SwcVtNzbpIEQ=;
 b=NfMWk9JlzkfjEDTbJlLoio2uUIce39/JZJ/UZypE6IuuxMIHCkPltb7AJ9GJYRpW0PH92bsyZSQFoj7W07R3SFdoBJjC1jRjjbaBG/Gpd42g6FjZgv1Az6/GXkEWED88zITuZ5OK5N1uNaTrguo1tJ+QVALGpstigJUpW6qb+ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6898.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 07:11:35 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fd4:b93c:2d9:2542]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fd4:b93c:2d9:2542%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 07:11:35 +0000
Message-ID: <fa1a74cb-d240-d3d1-1ede-3c786becef7d@kontron.de>
Date: Mon, 10 Oct 2022 09:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: fix winbond lashes
 identifications
Content-Language: en-US
To: mikhail.kshevetskiy@iopsys.eu, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221007104820.198938-1-mikhail.kshevetskiy@iopsys.eu>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221007104820.198938-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: AS4PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a795b7-899a-4bd3-ecb9-08daaa8eaac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	V4DOZA5l8Ic+CuDUI07y1aMrrF4oJK4mdnUojRAUttiag0y/LnA8aALNb4VXnrD4Fi6Pe/TnrEXlT6SEsacYAbhUkWficUjdbp3aGSQmDzCaJaf+PP20nv1JTnlypcbEvvtBG8BpQfDfohQficp1nN/qgMor4Dq2e5rnwg5C29yHAgrWBwtmz+VWAwYj9pJ4/X7wrEnnnsesbzCm0i6eC80KP2q8KcfxP+FhWtaOFd5iDGjXeRCjtUrvYeSmt1P1EK0T3JaJcNvh5MhSu62y8a8XoVbDwU6Ovy8NIOW8QDcqLu4ulwUjJ0J/g6Hi8aKuuxKuAUvi4OplXTBH8Wn0FX/A5ethAYXyrPGVb3cJIoF/U6sDVj3fsGnvFeQc/mCg8FfWBNBUm/dlgR6mG1QBIFnmwOxVC01hgAbVc8/qCnfc9QXWAQ+TcqcCWRN1Phe85x1Vc+76mkkpjY4B1vq/UIpI+dLRAhZCJac8LDTMH11R/hPFkCt32s1hdoYR/6bHboyXmN+u5N3+1iFVCvUjTwOxYsbRuzrSpZ0CWfYcURBg6Ls6MFQokfs7jElgfSX+C6Rn40V1m6dQ1+7V29Co7xkBrl87SYKgeqhiCiAvNMR32u2mgt2hmQqq/AbO5dye9LYn3W7dcnF+goKIgqHXAmANS3q89t2wprXNrJEcWkRkby4rYvQRxpWNMNXDy5evR7BbsPBMS4ktYlShQlowM3r8BhKxAVLXwxlvyJY7+4PtdO5q4F7fco6X5E/WtIRgHR1Utlc7MBcZDcq7ih1ac8En+VTM10ILHOJx+tA1s5Q=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(478600001)(316002)(6486002)(54906003)(6506007)(66476007)(66556008)(66946007)(186003)(36756003)(31696002)(4326008)(41300700001)(38100700002)(8936002)(31686004)(86362001)(44832011)(4744005)(8676002)(26005)(5660300002)(6512007)(53546011)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?T2pES085R1FRcmxQQ0pGMFJNVWJwSWl3c25QcEUxWUpqeHphR0laSHVoa1pp?=
 =?utf-8?B?Y21XOTFXRXg1WlgweWdrenNkYjRBSkZZQ2FQUE80N0xsMGVxeUtmL1NlT2k5?=
 =?utf-8?B?WWV6RU1IalpIYS82bXhFYzJSWFdsbGNyYTd3dnVqTjVnajMvOStNdlhtanor?=
 =?utf-8?B?aE9uakY3UUpoMFFGUlVqNjNDVWtDSzU5dXlPSG94K3hVWFpSNU1pY0d5ZlZJ?=
 =?utf-8?B?THIrQnZJUlA2d3FyZlk4NlRRejlEa3lBaU85TWd0ektKZDdNeVlDc01pUHNH?=
 =?utf-8?B?alpFNmoreWRQbDVEQkpEYncrRllia3BJL29sUVR1Vi80M0o4d2Q1Q0l6UTVp?=
 =?utf-8?B?N0dqY2x4RFB0SGtucXd5MUZOTGFYa1NONHZMM0hTN2dEaFNiNjZURVc4ZGJG?=
 =?utf-8?B?TGF0OWI5TUYvSVU2ZWVScTBsZkpNUkM1SG1zVDJ4RjVCTTRTRUNKZFFOQWVI?=
 =?utf-8?B?UVN6c0grUU1sdmF1aWhkbWsxVS9yM3BpSmQ4VEdhNGh0RUJzSGxUSVU0UnVF?=
 =?utf-8?B?OGE0ZWFZS0hhWVp3UytQVllncERNdkowRDJYWDM4M0FGZnF1YUtZVm8zVFBv?=
 =?utf-8?B?dVRsbHR2REwrNEVQcU1qSG1PeGF0ZUh2VDR0UFBJYmx1ZFV3M3VSOExtcEhY?=
 =?utf-8?B?TER1Ymppa0RVUkI0ZTRIdnFVdWl5SW0vREo3RUk5ZlErTzI2YjdsTlNpZzh5?=
 =?utf-8?B?cGs0azFWTnBSVUY3ODhaV2N3UVpidnZiaXJ1SnRqNnNEV1ZELzFHdTRmeWFE?=
 =?utf-8?B?dXZLUU9yc3VTb0pJdzhLaXFmd0NBZDZpSlNDVFdDV1hyUHE4UFFWRXNDc3Jn?=
 =?utf-8?B?RkpJZ3pXaWI1ck1rSHpNd0pQV3VyN213QXJlWHoyeERFQzRXQm9GdUxLalZY?=
 =?utf-8?B?K1RSWG84SHV6NVBzejVpYkY1N040cXVPNXpWSTB4clRtR215NGRkZVo4L0tu?=
 =?utf-8?B?RktBZkZHamN5dGVhQUtScW5GdjdJWVV6bXc1SHJJeVVHMmM2UVhGS1JnL1hY?=
 =?utf-8?B?czNKUFoxcWZHYnRPblJkdG92OWNnZko5OFpiS3pFT1ZGeWl4cWxNZkVMQi9G?=
 =?utf-8?B?Y3k2Qm4yWXJQSVVWQzIyREptVVZkNzROQkY1WFBwWEFrTzUrbUlMcTJjRFIz?=
 =?utf-8?B?QzgrOFlxTW85YzlRMGNZVXNQMC9RODU1dTE3Zkw5ZTYzeFh1N1FyemN0OXZr?=
 =?utf-8?B?ajBVTnhUZnJUL2JIMllvWngvenFpWGt1VFUvTitCMGFSNloxNnZlWTB4cHRl?=
 =?utf-8?B?bURZL2FLbWFhWVl2QWc0eEprWktxa0tXMnFWMlRGQjB0ZW1UeTErTTF4dWRn?=
 =?utf-8?B?eFJvcHFqUGF4NE5UakU5ZUIybzlBZ3pUUjRVbERCT1VTRVdGemN0T3BtNGV6?=
 =?utf-8?B?Q2pGbkUxTDEwdkJhZjVCdktuVmszYm55bm45Y2VxMGpEVlg0T2VwZ2FzUzgv?=
 =?utf-8?B?cjhrbHBwbysrakZSN1lBZnJzWGFmRjRKQWhUTnM3K2haQzBCMU5Nak5yN1Yz?=
 =?utf-8?B?VjZ3cC8vYjNGUG9XcUdVR0FsWXFlRXJYRHNLa1BFZXRybllLQVhVeGw5bkV1?=
 =?utf-8?B?ampkNnAwUjFVemhFTlRiZTVleUpZcEttVWxIT3hOOWlOaW5pWVJUemRXcGIv?=
 =?utf-8?B?cFpuWkhYSlNzQ0VMbUUzdTBidklZWlNqMlNmNUVDdEc3V1BYZmxEMjZGK3dm?=
 =?utf-8?B?SURVbUV6MHVCLzN2RFczaUQ3Q01Ncko1SVhYQmIyVGtvK1FwVEp4cDB6bVQ1?=
 =?utf-8?B?UVgyN1ViUkZJUWhOaWl0ZUg0K09BQUNJbDlKUlRSemltdHVzMzFFczFCb0Vl?=
 =?utf-8?B?dlhGcC9ZL0dUYmJ1UGFwOWprN1B4SFRWMStlUmVhMDlPNWZtd0lOMmFpUjJC?=
 =?utf-8?B?UU5kZEZvaW50UjJKVVNGZlM4YjlsOW02MWswQUxFU2FXR1pIcVY4MU5mWTBr?=
 =?utf-8?B?SEd1dFZhR3Jaa0ozV1BvZHdhd2NBaHZQaTRiMjZmZGZuUjAzT0I0U1VUVk1v?=
 =?utf-8?B?SDhhdytqRUZNbmdpMlNnZUs4T2xoK0VRZmNhdmFOTlp0bVRlZVo2VVdaVHh3?=
 =?utf-8?B?Q2dLR0NEKzdzQ1pwWWUvdmJpNUYzQ3ViZUpYc0FPOGx1Y1g2WjhKTkZUZENG?=
 =?utf-8?B?eWVteE5QOTcweDhidTFYeWJyaG5sYXk4aFZHR0hIY0UyeUZXRERHd1dQdzNK?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a795b7-899a-4bd3-ecb9-08daaa8eaac9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:11:35.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y8sIwRIBBLv7MTnU3tGvmku+7kLnMZPQcqXNVwXQfqsZ8R7GmcPTFu2DyhKlQZO+u/HVRlSn3PlgWOcu3Dz7WFFB7ao6+9uoT9pMKQ0CpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_001141_266741_B558B72A 
X-CRM114-Status: GOOD (  10.61  )
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

On 07.10.22 12:48, mikhail.kshevetskiy@iopsys.eu wrote:
> From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> 
> Winbond uses 3 bytes to identify flash: vendor_id, dev_id_0, dev_id_1,
> but current driver uses only first 2 bytes of it for devices
> idenfification. As result Winbond W25N02KV flash (id_bytes: EF, AA, 22)

  ^ identification

> is identified as W25N01GV (id_bytes: EF, AA, 21).
> 
> Fix this by adding missed identification bytes.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Two things:

* each time you send a new version of your patches, you should increase
the version number in the prefix (e. g. using "git format-patch -v 2").

* I'm not a native English speaker and I don't get what "fix winbond
lashes identifications" is supposed to mean. Maybe something simple like
"fix identification" or "add missing id bytes" would do?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
