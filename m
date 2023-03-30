Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E4C761A6
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbIvr41/MwOMyjFRGcWMemZa2LQ5fDdiY2IkyGua6Ys=; b=L1lnsOnK7yRnuIm6KOxCzjWtEG
	9ENvrnQZVS6n8L/ozJp7jqiP4WNufSrM5pPFiFTHwjWb7E+XEpqwYrP1yCJzijAHSFoZjOZRo9E/q
	so9nCJwt+cJOD4i964tLP9Y+S74qETnbMdv2/x2Gxn4G/0fH5Ablx461gsCRhFP/RPwq+GOXuQLOI
	Y854tvoKtuBr0Yuo06mgTUb1t6bazTR2UbiVwZD2tMiPMcdk8mBqlGxS1dXVaT9UrG4Tq3U38bkpA
	Hm10b9XZaKB/IxbY96MFXo2namUnsnoa4FXHiQDOWRsSy9omDlfaZAPmg6H43u0YVfFY88+yR75t3
	obInHckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phtQM-0046i1-0K;
	Thu, 30 Mar 2023 14:38:46 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phtQI-0046fc-1N
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 14:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680187122;
  x=1711723122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a9Ww3URL8IKa4ToDwwEl2NAqjZek9o/NJEa5wUe/rBo=;
  b=WEi2MCToLn2+mJhxzBlzF7N7nxd0q5J8JRFi3lV11gBIagtJyuN3tG8J
   qvEcGSjM1u0UJ5mFah66a42UaSCmpFYs43aoKKuK3BT3q/FTPF5+oiHvL
   kgBgeaiPMUuXjdTv8nNWERwiWmUuSadcnh+cRScseBtYXSxkkT0DMp8qu
   lwuENC4inn36QF8xFA2nJJJOq05xBLU1wQeNz9Pkw7KS1f+rz2Qyc7Zja
   MUtTYpqo3l42xasjre3hZMs2Lz27zwPPvEcmbzfFhAWZG8FxgdKwZ5h+D
   nPBBqUHVmRdoF8MLTi6YuPAeYWVaKFd+gPKvFfUNpRAamSb3onfe5qNmW
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYewM5jbMQ3kp1Q08eLBgIYMMu3p9li2A5tYNc+aPRs3hlfPg8Wx0KEKm9SdxGAC8wfWYBukKOD4ImKPBdnkSt2QcPaIFLYZAwe8nPIxn4mBMaRmhnYKF0cSpWA0Z9hmZawTi/rT4vFPi5TBElZ29raN87fm9pI28JvnQzZT7NXqrrvhMbQJPRy3P4xVYlZkJL7XpKEU+lv7xOOsBWi7cMS3RQhmgMKipEOzyNLYljh/E47cu1SIRCGEWAzVqLNwyT3V8GUAUfk24j/VmSfXDYd57oZPwXc2CjXInUBpxLLSZxQ4Q4Dxu9FH7yORtFHE+uSIqqV3osUzFAQc0MQYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9Ww3URL8IKa4ToDwwEl2NAqjZek9o/NJEa5wUe/rBo=;
 b=nHt1TDp7ymOOVo3U7YngbC983oxruvvJ06CmsOZD+xdGoNwLtGWJ6Rr80frVqoUdQ0eOYg6IkcO/gPn9pOvny2kZn/Ok7FHhGGAU9eyv6tnoPgsHIeL6sQT8o6AK18p9j6d31TahUqwJz3CkwffzPKmvxu0tfbx9Ce/mIoCdP2gSMMGDwHuWWRnB2r/iBUuo6TylZmN4S62+zL20H6wdZxM2dApWgzrLwISxmTpOrsrJF9qESis82Cxs6lgydWwnee18ClxuBdH1iAu7xcDKFhTooyQXOIabSngxIyU1H2lVBFcMHfdlSqjm3uLhr1LnL99dAq/o9/r6xeVhJEMsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9Ww3URL8IKa4ToDwwEl2NAqjZek9o/NJEa5wUe/rBo=;
 b=rX5OlMDb8CzzTOa+O6+bFXTGnugICXwLWn7MuDjmz/gkmmZNEAFniwxvF/NllW0NwcskJnX4v/FjhAA7rJ9ed2zbfFuqSiM/IukKQqHswW4aMZFP/Rg5Wcx7iqCu5lp1h24QIsS91sBL3zrYIFf+8Uosfa0k1JRhpNe+fDtAff0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <585bbddc-7c02-bc10-df37-6b91337e5618@axis.com>
Date: Thu, 30 Mar 2023 16:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ubifs: Fix memory leak in do_rename
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>, =?UTF-8?Q?M=c3=a5rten_Lindahl?=
	<marten.lindahl@axis.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230330-memleak_rename-fix-v1-1-99789e908fdf@axis.com>
 <bc8aaf0a-0b21-99a8-4c50-92edeff8edd7@huawei.com>
From: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <martenli@axis.com>
In-Reply-To: <bc8aaf0a-0b21-99a8-4c50-92edeff8edd7@huawei.com>
X-ClientProxiedBy: MM0P280CA0115.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::28) To PAVPR02MB9523.eurprd02.prod.outlook.com
 (2603:10a6:102:303::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR02MB9523:EE_|PAXPR02MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 89314547-d0bc-400d-7696-08db312c71ec
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAcUAcTSXxh2biyRELuj0fpwLe36H88/vrgHG/8iSP+v7dwZmddqdRvab2tEW9rLc0xaEgdhInHsRJg/5M/vzQk4lAo1BVmpEML77pa0MrNgQaT6HIS2XUmrdzqO/kc3PSALhsdOvQdu+ap0kZKX9ulo/cfmPKrvQla77Cjzf0N1L0TP/G+J2DfTf06AwMgPQLjPENmOo6ovA4fDJbFAsVhDpw+UY4723bcoo0ZD4S8ew2Fb+p28lNpTev/kOYl2xKWvB2+6i1fZZnLZPu4fb76+4cYG6VLn/QblymVr7XApT2wEtBmwuMdOFOnieLyn+9a43+DVptItL0vRTFvhZueJ6VclsoNJAbLldYj3afhQcho14amnWNacuwgne+pVljT+UiemecERa0SrtcSjb4OuPomnXUcXI3yumJshl+lSn0GLqP5pEBz1i2QS5uguIrdsd+L+ezt7Sg0Uv05qL/DltSaSiAMPGzxCLzylLf8Csx9xPpWH5rduUEemTbsghmxir3ACegyVhplrpSz8OtK7SR7qfe8fcmX/hxvxtuOytumnHCGWXagH/BehLEhC2FnBma71k3yMJ02OYx3UAXaJRomq80AoQZI2Xicre1Nrn+A9uR4+prwgJcp7Bg/V6FVef3HUrgDtgeWvBK49aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR02MB9523.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(83380400001)(110136005)(316002)(6486002)(38100700002)(66946007)(107886003)(6512007)(53546011)(66556008)(26005)(2616005)(6506007)(2906002)(478600001)(186003)(5660300002)(31696002)(36756003)(41300700001)(8936002)(66476007)(8676002)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJ0KzJTRG9YSWNSb0xnSkI3SmVqcyt4eG9PYjV3U1VtTTUyQi8zZGljZWdZ?=
 =?utf-8?B?ZlZyMTR6T0pTQlFxaFd2VVhMVFQvd3ZGY3paaWJHNVRNRURMSWUwN2UzTzlx?=
 =?utf-8?B?ditpNm9jbUZEcFhsOG1qNkkwT3U4UkJVY2cwd09vNDd5dGhQR3dHUTVwbXV4?=
 =?utf-8?B?SFlTMkxOd29WR01XdlBDc3NweDBBOGlHQXJPcFp0SmJsQk4yZkZpTDI5N0ZD?=
 =?utf-8?B?UDdmMDJENm53MWt1Mm9mYVVEZUlTbUFwWWF2cXRGbVFLMitjRTBSV0RuMG1F?=
 =?utf-8?B?dytxTmwyWVQxcngyTThSMHlMQ1htZ3U1akVpUUVGdXJOS0l3Q2tuUTVNeVB0?=
 =?utf-8?B?bjh1WnR6dG41cm13b0pIbS81R0JWTE1ieExsZzZKb2ttRzdxVGhXNzR1YWJR?=
 =?utf-8?B?aGhwc2J3N05TeFhXNUY1VlpZY2dNencvU3JXaWU0QVBWY1FkL09aSjlmaEtZ?=
 =?utf-8?B?T3ZYSXBkbk5KR1MrR1ZLb05WTURkTHFQRXdIKysyYU5XTWllQU5xbzNLMEZa?=
 =?utf-8?B?MXlpbmJkTFJzWEh6MzVDRkhrK3NsOFJJeDl0QXhQaDZDSlgzNFpSM0liWnB0?=
 =?utf-8?B?bkt2MklyWTF6MnVhZDd0V2JNVnhJQWhtSkRweXpta21hdDBzY2RHQmFFYk1N?=
 =?utf-8?B?dUY0N21CMkNJS0RlWTVOMTR2czJnZlcxK3NJUFhIY2hFbzFqdnovRWw5SWdU?=
 =?utf-8?B?cXV6RHVHTmhYdkcrSzAwOHdQakJ6cHNvVENLeWFoRUNSUDcyR0Q0dHJHM3dw?=
 =?utf-8?B?c3NkOU5PdWtvVFN4TUFvQm41NEloczIvVVROVWE1bGcxWVQ5em1mZXNObzlU?=
 =?utf-8?B?YU8yUC9MWVM5ZnpROUpwZWpidExWNkFLNWdsUHdTQXhDWlB5Rm1wd1dTYStY?=
 =?utf-8?B?MmtQdmoxZWtnNzhWUmVyb21EYUVQZ2prWmgrSFlkbE16MmtXUUdhUzdMY1F2?=
 =?utf-8?B?NTNiR0tMbHN1Qko4RHUrZ2JZTUI4Vy9SanRYaUtuNzdPaGtBZUVDYXBtK0Nn?=
 =?utf-8?B?YjE4dzc0VXNZdmY3ajFGb0IrVTgzZWhOeGNnTllycm9KRUJoU1FJNDV3dE5D?=
 =?utf-8?B?ZXhCYmd5dDZpNmRGUWFuazJvdk9TWVU1eVZHQXJJckJDMi9zaDVlNGVIcTFK?=
 =?utf-8?B?bWZhUlBoNldUaFBSZTVJRFRQR2FyU1hvVk8rd09zTDVTUy9UYW1wSExUcTI4?=
 =?utf-8?B?eTloVk94SkJpSmJkQ1pLZzJqVTNBVUg1M0dsZnNUbEhncllkTTIva0EzTW1r?=
 =?utf-8?B?K2pCOWx1clNySVE2QUhuczdmUEhVK1lvODArSThVRndldk9JRGFJdUJnMlQ1?=
 =?utf-8?B?ZzFudzFtUCtsWUtmQSs5Y1JLVU1FdmVnQW5aYnY1azM5YjBQSW85QTNTcXNr?=
 =?utf-8?B?ditNVkMrRnJEeGdxNFhrS25yTzdzSmVGUmkrMGNQQ0FPYmZOQ3Z1Z0NJRnhn?=
 =?utf-8?B?RncrUytSRjFiS0YvVnp4QkdNRnVEUzJmZGxkWGxrbHhoZHVZYlNSWXgwd1Ru?=
 =?utf-8?B?NW1wbDk2eHpQQVMwWXE1T1pxZlYrVnV4SHRRcW92UktpbllOL3Q3WDM5eDFs?=
 =?utf-8?B?U3JUdXJhRVMzWjZNdkpDaVoya0ZkL2JRdWUzNHVhZVR0SlVscWlBS1Z6UXlV?=
 =?utf-8?B?Z24vanJpZkpSaHZrdWNaZlRtdkVJQkRnNjcwQldvUWdSeXdHdVUvZTNzWXVt?=
 =?utf-8?B?dEg2Y3NvODJ1bDR6ck1rc201YjF3TUNNK0hZQWRCU0swZzgrWlJmMzhpZ1FS?=
 =?utf-8?B?c1JtRG5XOW1oUW9hTEpWR2Vob2l1aithdVd2clZOcHM3eHN3WnN4bktwdmpt?=
 =?utf-8?B?b2NkenFwWDhOY1UvNm1waVV2SUxzUjZ0TCtDWE5qa0RrRmU0K0k2anJoSzVZ?=
 =?utf-8?B?dG9MQWd1MmRUOVhON2hDdEY5dDhOejF3QmpFYitDbDh3dW43UlFGazNXb1lt?=
 =?utf-8?B?RGxFRnBkOFRiUFRrNWNlRW45OHJaa1loUTRrWm8xTVBNV09YWU9RL2FLV0dv?=
 =?utf-8?B?RzRZam5CQ3FDVDM1NTJyMEs5b3hnUXFhdzd6YW4xVUNBT1oybzNKMk5YcWw0?=
 =?utf-8?B?MXAwRW9rREVLV1I3VHYvYnNLYnNxQjgwWUhTVDd0enpJcWtSN2xmdDZEVUVy?=
 =?utf-8?Q?Q61pfYgOFy8RiDERcZKANY7WN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89314547-d0bc-400d-7696-08db312c71ec
X-MS-Exchange-CrossTenant-AuthSource: PAVPR02MB9523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 14:38:36.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vTIuNrYrXH2ZlxFKPT8oM4hUeAIFr/c3QUB2n8Nipk2K3dyD4MoBJUcmeDtF54HxeceG4cYvFuGcUjnuGJmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_073842_998073_21390BE5 
X-CRM114-Status: GOOD (  17.12  )
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

SGkgWmhpaGFvIQoKT24gMy8zMC8yMyAxNjoxNywgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiBJZiBy
ZW5hbWluZyBhIGZpbGUgaW4gYW4gZW5jcnlwdGVkIGRpcmVjdG9yeSwgZnVuY3Rpb24KPj4gZnNj
cnlwdF9zZXR1cF9maWxlbmFtZSBhbGxvY2F0ZXMgbWVtb3J5IGZvciBhIGZpbGUgbmFtZS4gVGhp
cyBuYW1lIGlzCj4+IG5ldmVyIHVzZWQsIGFuZCBiZWZvcmUgcmV0dXJuaW5nIHRvIHRoZSBjYWxs
ZXIgdGhlIG1lbW9yeSBmb3IgaXQgaXMgbm90Cj4+IGZyZWVkLgo+Pgo+PiBXaGVuIHJ1bm5pbmcg
a21lbWxlYWsgb24gaXQgd2Ugc2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxlYWsuIFRo
ZQo+PiByZXBvcnQgYmVsb3cgaXMgdHJpZ2dlcmVkIGJ5IGEgc2ltcGxlIHByb2dyYW0gJ3JlbmFt
ZScgdGhhdCByZW5hbWVzIGEKPj4gZmlsZSBpbiBhbiBlbmNyeXB0ZWQgZGlyZWN0b3J5Ogo+Pgo+
PiDCoMKgIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTAxNTAyODQwIChzaXplIDMyKToK
Pj4gwqDCoMKgwqAgY29tbSAicmVuYW1lIiwgcGlkIDk0MDQsIGppZmZpZXMgNDMwMjU4MjQ3NSAo
YWdlIDQzNS43MzVzKQo+PiDCoMKgwqDCoCBiYWNrdHJhY2U6Cj4+IMKgwqDCoMKgwqDCoCBfX2tt
ZW1fY2FjaGVfYWxsb2Nfbm9kZQo+PiDCoMKgwqDCoMKgwqAgX19rbWFsbG9jCj4+IMKgwqDCoMKg
wqDCoCBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lCj4+IMKgwqDCoMKgwqDCoCBkb19yZW5hbWUKPj4g
wqDCoMKgwqDCoMKgIHViaWZzX3JlbmFtZQo+PiDCoMKgwqDCoMKgwqAgdmZzX3JlbmFtZQo+PiDC
oMKgwqDCoMKgwqAgZG9fcmVuYW1lYXQyCj4+Cj4+IFRvIGZpeCB0aGlzIHdlIGNhbiByZW1vdmUg
dGhlIGNhbGwgdG8gZnNjcnlwdF9zZXR1cF9maWxlbmFtZSBhcyBpdCdzIG5vdAo+PiBuZWVkZWQu
Cj4+Cj4+IFJlcG9ydGVkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNw6VydGVuIExpbmRhaGwgPG1hcnRlbi5saW5kYWhsQGF4aXMu
Y29tPgo+PiAtLS0KPj4gwqAgZnMvdWJpZnMvZGlyLmMgfCA2IC0tLS0tLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPj4KPgo+IEknbSBva2F5IHdpdGggdGhpcyBtb2RpZmlj
YXRpb24uIEl0IHdvdWxkIGJlIGJldHRlciB0byBhZGQgYSBmaXggdGFnLiAKPiAoRml4ZXM6IDI3
OGQ5YTI0MzYzNWYyNiAoInViaWZzOiBSZW5hbWUgd2hpdGVvdXQgYXRvbWljYWxseSIpKQo+Cj4K
PiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KClRo
YW5rcyEgSSdsbCBzZW5kIGEgdjIgd2l0aCB0aGUgRml4ZXMgdGFnIGFuZCB5b3VyIFJldmlld2Vk
LWJ5IHRhZy4KCktpbmQgcmVnYXJkcwoKTcOlcnRlbgoKPgo+PiBkaWZmIC0tZ2l0IGEvZnMvdWJp
ZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+PiBpbmRleCAwZjI5Y2YyMDExMzYuLjRjMmRkYTEz
NDZlNyAxMDA2NDQKPj4gLS0tIGEvZnMvdWJpZnMvZGlyLmMKPj4gKysrIGIvZnMvdWJpZnMvZGly
LmMKPj4gQEAgLTM1OCw3ICszNTgsNiBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpjcmVhdGVfd2hp
dGVvdXQoc3RydWN0IGlub2RlIAo+PiAqZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCj4+IMKg
wqDCoMKgwqAgdW1vZGVfdCBtb2RlID0gU19JRkNIUiB8IFdISVRFT1VUX01PREU7Cj4+IMKgwqDC
oMKgwqAgc3RydWN0IGlub2RlICppbm9kZTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdWJpZnNfaW5m
byAqYyA9IGRpci0+aV9zYi0+c19mc19pbmZvOwo+PiAtwqDCoMKgIHN0cnVjdCBmc2NyeXB0X25h
bWUgbm07Cj4+IMKgIMKgwqDCoMKgwqAgLyoKPj4gwqDCoMKgwqDCoMKgICogQ3JlYXRlIGFuIGlu
b2RlKCdubGluayA9IDEnKSBmb3Igd2hpdGVvdXQgd2l0aG91dCB1cGRhdGluZyAKPj4gam91cm5h
bCwKPj4gQEAgLTM2OSwxMCArMzY4LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3JlYXRlX3do
aXRlb3V0KHN0cnVjdCAKPj4gaW5vZGUgKmRpciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KQo+PiDC
oMKgwqDCoMKgIGRiZ19nZW4oImRlbnQgJyVwZCcsIG1vZGUgJSNoeCBpbiBkaXIgaW5vICVsdSIs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZW50cnksIG1vZGUsIGRpci0+aV9pbm8pOwo+PiDCoCAt
wqDCoMKgIGVyciA9IGZzY3J5cHRfc2V0dXBfZmlsZW5hbWUoZGlyLCAmZGVudHJ5LT5kX25hbWUs
IDAsICZubSk7Cj4+IC3CoMKgwqAgaWYgKGVycikKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBF
UlJfUFRSKGVycik7Cj4+IC0KPj4gwqDCoMKgwqDCoCBpbm9kZSA9IHViaWZzX25ld19pbm9kZShj
LCBkaXIsIG1vZGUsIGZhbHNlKTsKPj4gwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGlub2RlKSkgewo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gUFRSX0VSUihpbm9kZSk7Cj4+IEBAIC0zOTUsNyAr
MzkwLDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqY3JlYXRlX3doaXRlb3V0KHN0cnVjdCBpbm9k
ZSAKPj4gKmRpciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KQo+PiDCoMKgwqDCoMKgIG1ha2VfYmFk
X2lub2RlKGlub2RlKTsKPj4gwqDCoMKgwqDCoCBpcHV0KGlub2RlKTsKPj4gwqAgb3V0X2ZyZWU6
Cj4+IC3CoMKgwqAgZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCZubSk7Cj4+IMKgwqDCoMKgwqAgdWJp
ZnNfZXJyKGMsICJjYW5ub3QgY3JlYXRlIHdoaXRlb3V0IGZpbGUsIGVycm9yICVkIiwgZXJyKTsK
Pj4gwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihlcnIpOwo+PiDCoCB9Cj4+Cj4+IC0tLQo+PiBi
YXNlLWNvbW1pdDogYzljMzM5NWQ1ZTNkY2M2ZGFlZTY2YzY5MDgzNTRkNDdiZjk4Y2IwYwo+PiBj
aGFuZ2UtaWQ6IDIwMjMwMzMwLW1lbWxlYWtfcmVuYW1lLWZpeC02Zjk0YTZmOTkzNTAKPj4KPj4g
QmVzdCByZWdhcmRzLAo+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
