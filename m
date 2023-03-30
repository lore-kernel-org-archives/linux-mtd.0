Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB48C6FD1D
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQTtIpYSGv2qGwVUq3YgV6pjG3NXtgFOLy7PPlsOJ0Y=; b=S+LGXpg1sUbxTcKLIOHDPSDyHy
	xhNiEQDJ6/HCNhGX5twm1rEoMBE2101XXSGgDsrc1l6QGedyI2bLh0haeUs6egf9tq7TXwYqfH26t
	O6Czyn25wHL9rWcI90ga54Obyiry4QiwG2Tx76NvQ/JHlENRJ0JIZ/kpqDoJb2/ni8HzYicHzJcOi
	a8ppEZ6QZs/YVOLELngaR3jFVctMdrGy2DTolGoSY5RXC9nXbihIoyoNY2f+xeHzDghcNv5TY/H7e
	USOIbB73IDvk+u0R0jfdzOuaC3jO3FMK25Yoz7qW0Wqbu1dGFvjlmxhLTR1tkXH71/rKGQlefzQkC
	jbOth0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phn7b-002zlI-18;
	Thu, 30 Mar 2023 07:54:59 +0000
Received: from smtp2.axis.com ([195.60.68.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn7X-002zjL-2l
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 07:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680162896;
  x=1711698896;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MV52fyoNIHTllvgjr2hMMPoJMLG8BXclnGuRc1KolK8=;
  b=KkDcNq+46e1Y9U627XpqvaAR5EXFA6QA6UBns+r254uO7IfPG1EygWk0
   DzzMImaWBHBJ6/RW9Wq0uAMjnRDkny23h0TVAfdw28NN5CR/Ekh6f2dFz
   JiVbAe3bYJj89O/Chw1XUOEYa7pAP7y81nHcolBpbR3F5J9wiLUoxTFA/
   w1V3u3P2/fQdQASGdB9wZfoOUBt5xde8N9WN9lDPiZM5gt2L+rjMvXibN
   0FE5soXv+l6etrdOqpHyhEuD2Oo1zr4xj9vFZoYrKbuJJO4AolYcKkD3J
   LjgezXlAYYzjnbU/ES6WIpz1esNmwregNV8V0cBh33PdcU3SjovLYhHjh
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5ZmgTu472sYxoXI9fBZkhf+/ry7d2orMe7k1havhXjtcNqltd6B/i7kSSrlYxd9Xa/mE+pMlAkiluxcuBSXkjBXBrxnHYgHdjEquiq3YmyGjf/JhQF7SUYRcJR6Hf8QJLtjFiLwPD/ZSBam0Sti0xNN5Cre0ewA1rYaQDJ4Pu1GZgpscZiFbRZ29zJhOxUABlC0+zfws2k0/esTORdNtfMPoFCAoxwnTLjvJoQaAeWBUqwyhbVlRkocbAQE2ZGSy5SdeBjT/iSP6+qtH4BPOxXiAGwOVmEccPPWK0L/tGyXbI45JIdFZcAbclaaS445Uo5dpdiwMNIMZy8eSnXmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV52fyoNIHTllvgjr2hMMPoJMLG8BXclnGuRc1KolK8=;
 b=inkVwCs/SIOoz+rAam5itWaOupmxXjY3Vq+XrOCpAr+lXwkrsmOfkMPhE4LdCdSj03FEctboonm9HNnzq5Rb13JgciSiwUWZs1/EnmHaVN7yb/ggiamnal4ux9RQ/fGTcLCBz3lwG4BkrgJpLA+b4zaua8GZRmDUUXWEqqZXUoDMBSrvY43vqc2DrhOVVTta66rHAPT/lo8zCzGESxfqTRduhrGOEprVqU7VaVNKmSF6pvAhyh5Zcl22sF1irt5Gm7Zk43T2R9WHfzEly6DRTEaEpEfC2F7OzUOtbAhAZelIfdwCIWEm+ZxerygOreQskICdJyXwTJi5Gbj8487ibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV52fyoNIHTllvgjr2hMMPoJMLG8BXclnGuRc1KolK8=;
 b=Oj/ALt2+6t8Jm228GhR3a4Td7xYHtDvfwnTzwmTrcgoIsOoE5pI3PK0+kKbZNjpFTL8wasrMjz2TVovjRqcj9/o/ZiVasQMaGdoMguv0fvFMmXG7S/JqllQR/SkVcLlSfR1946gdQskt7KRSdYdClIh6kMBi5WNT0a0sJA/4E4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <61344864-cfc1-0c57-bf3b-38e5a125d281@axis.com>
Date: Thu, 30 Mar 2023 09:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ubifs: Free memory for tmpfile name
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>, =?UTF-8?Q?M=c3=a5rten_Lindahl?=
	<marten.lindahl@axis.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230329-memleak-fix-v1-1-7133da56ea8f@axis.com>
 <cec30bcb-85d2-5de0-186b-6838ce94e3f7@huawei.com>
From: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <martenli@axis.com>
In-Reply-To: <cec30bcb-85d2-5de0-186b-6838ce94e3f7@huawei.com>
X-ClientProxiedBy: MM0P280CA0100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::18) To PAVPR02MB9523.eurprd02.prod.outlook.com
 (2603:10a6:102:303::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR02MB9523:EE_|GV2PR02MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: eafc2e9a-e772-4213-6c1b-08db30f408e2
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdP9t7K3JqPLggRFK6Za/v2sZaVv1/RwiuypG1Riq4LInCFGYUUHZE3JYoAGzUmvuc/EUJ8YXLioHshnJDnbJAqEydqJseEHYNw7NMyjVwnXrOKC9V+KArXLtoGkxb+9ZM7v8ddlrf7eNgjCK2luivCEz7NXzKXNcmYikzDVrAuKr0N5HVxiznpgrmH5pnSHYYYz9xNoJx2Sz5ZNefliWKcEV21FDzQ40y9XL7TNMTrYc7M1b0TARHVR3YLDzm8rgiKgbrm0qdCzPXwOgoJSNETHWutfFy3Q71lXMA2+Xh4n91Qu7VSg7J010+6DF1+EVWWz8c1jZTsbLJmmbV0TC2rZubE1/YhZFJ3EmqOwchopVOTcZ8GFehCSW3neFOZ34V2UxXUdab8tFH5heGBeCUGZqXjo1vkvBw62ytzqeBaX68yYYLSBgEWG7FwHpYQDO030fZAQNilZHsEwOxDpZrWRl4zQsPeBlUPOxy+qdkYbhjrP3FO8f7BcH3sWTeVyo4KqqUjksJmapA+w8Y+nvDFXS1z5HsN6fCKTdXoqa5BdEQvxpeQRYWvuMGd8P7R/rYJgjPhP99tiP9CQk2UyH1IcFdIm25iTx3jZZxptz1YjHxDyRlyBenGOb3moP6lkQ6KI+TTwUPyz2sOrVRf6YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR02MB9523.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(31686004)(83380400001)(38100700002)(66574015)(2906002)(2616005)(6486002)(31696002)(8936002)(186003)(107886003)(316002)(110136005)(36756003)(41300700001)(5660300002)(66476007)(478600001)(4326008)(66946007)(6512007)(26005)(6506007)(66556008)(8676002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFiaFBlblZBUUM1dHVWV0M2OGxZcjB6bVVHK1lLVlp5Y1dsK0duNnNRNkpV?=
 =?utf-8?B?UTZSdzFHMFZEUXZjZTNCZHdiRDhKS292aUJXYTJxRWJ4R0IwUVFBWDlWcUkw?=
 =?utf-8?B?WkxHOCtQNi9ORFdqSmtnSU5HZGFDMXVjbTJaeE9Zb2VqS25zbkN5TVZNUmhB?=
 =?utf-8?B?dWJQa0dMblJESlh3TUZNeHY1WXh6MHpnNGZZeFhpcWFVc2FjNWFIVU5CRW5w?=
 =?utf-8?B?djRIV1pYSTFQZko3Z1VhTERHOXB1UjF5MjJUamJHT2wzYnV1TlErTFJOamJr?=
 =?utf-8?B?cjErU0tTWVVpV1NkbVViNSs3VnFZc2NzcTJRaVE2cjZTT0VISWM4bVN3M2Jx?=
 =?utf-8?B?a28yUlVJdkJvOUt0dkFjQkdVdFQ0cnpjRXR5K0pWdUlIbXU2ZXYwT0Fxcmd3?=
 =?utf-8?B?bS84WWdsb0VDTnEySUdyc01aWk9MUzl4cmo1dEtqRnB4U1NlZ2JkeUdiRHl2?=
 =?utf-8?B?Sk9jTi85dWk5a3VkeHFKUGtnVGo5MVUrc0JsMjIvZzhwZ1gwNTYrM1NVZk10?=
 =?utf-8?B?Qm5NakdoNVMvK3E1Z2xPUDNkczE3SHFvUVkrcE0zS3gwcFRPQmFsWmZrQ1Q4?=
 =?utf-8?B?RVlEMHMwMGcyWkloQXhiYTA3YzdhMFV4NjVuZ0NmV2RRbXkrTzNHK1JycHFO?=
 =?utf-8?B?YUYzOHVQZVhEeVVZcE5XRDFvUE9hV1ZsUE9sc00xQzhlQlU3ZUVMMmRCK3E0?=
 =?utf-8?B?Ujg2YmcyVEc2ZWpad29uWGxIeTB2ckZoWHRQamFGZVBXckhwMVFhenpkQzhk?=
 =?utf-8?B?UUw5SXloSUQ1LzEwOEJxODRnaSt0Z0M1VUxlajhpMkxOYkNjWmR6dVAyNjJ5?=
 =?utf-8?B?SUFvL0Z6WEY3Z3Z6bnVGL0I5MFVOb3lLU1JmaTJBNUJyRXNHL0dDdCtLNjda?=
 =?utf-8?B?UDBoc3V6dm9vQkJYU1U1M1p5ZlRWWmFjbkQ3N21UL1MrVmZyWVdoTjBHbVln?=
 =?utf-8?B?bm1qWEozSXpEOXZoTG5LVzRtcVRhSEtWWmFFYmJrYlRzU2lJSTZaL1dMbkpl?=
 =?utf-8?B?RlNHUFRXcE84Q2hqcGZ1S1JUZlRwRjhid2w1UDFES1BYdVFiN0tXOUNqeDlm?=
 =?utf-8?B?MmtQbkRIdUdldlJySlk1dHpwek10WW9MamxPUEttUEF1L3Z4L0Fhd2tJbWhT?=
 =?utf-8?B?dnhFellCSExjMFNEazBIaGxsVEdkRjAwd1dMYXplSGFjMFdWQlFOb0U0cDcz?=
 =?utf-8?B?YnVzMGZFak14MTNtV1VOam1QeTdKdVZuUWxqMGZPM2o0eU9mRHlqdmxhNHM5?=
 =?utf-8?B?d0VFd2liK2gxUENucklaQ3Bnd0xXOHBnSGM1VmpYTzcrYmt2OEdMakFaZjBQ?=
 =?utf-8?B?OGJ4N1lmNWN4ME12ZzFqV2dBQi9seHhYcW9CemNxejVBdGZHYkFTZ0pQNytv?=
 =?utf-8?B?UVlNeXNEZVRRYkZ2ZU1ueFkweitFSjZBWE5iVUl4V0o2d1M4c2hySkpXcmFj?=
 =?utf-8?B?TXpwdTB4QjQ5KzQzK1pjc2I3alFsQVJUN2FNLy83VVhrZlBJUURJSE1yclVJ?=
 =?utf-8?B?Q3RBVjZ5ZStwdzkxM21NcmpyU3gxNVhzU29FaGpVU2NIclRmRVRGNGxzRXVn?=
 =?utf-8?B?cXVsKy9DSUgrVVdjYWIyQ0FIcldLdGpkWFB0bHVXVVlTV0RRS1dZZUsrUmtM?=
 =?utf-8?B?bjV1eElTRlVSWk0vbzE2S1kwVms4MHdzV1BScDYxY3FIRU1YTWdwUExaMTBJ?=
 =?utf-8?B?bTV4MWpiSWd4djlYZ0JoOUVzL05jYXQyWWI0ajlNTGp2MEpDeXk5Mm1ISGtB?=
 =?utf-8?B?UXFub0RYbUFYSnpIaVhHcG5VN3p5a3ZvOHhPd25zbTBSNHM1aktMUjZmdmJG?=
 =?utf-8?B?ZmEzNVFwc2RBVW1lMExRbmx0R2d2U2dQYmpPR2JpazZkQUNwSzhwNitFTUJE?=
 =?utf-8?B?WTBadndROHUyeXk1TFlramk0b08vZk1SQ3A2WHdNN05uUlhtdzJDeGU0RC9s?=
 =?utf-8?B?cHhNeVZxSkszZGQyTnJWd0JhUE9aR21tNERuTkdYM085L3IyL0E4KzVseDRq?=
 =?utf-8?B?dkltWnp2VFBobG42Nm0rTjZLeDExdElwYytBSkNVaHRvL1RQQnFtTEw2UG1o?=
 =?utf-8?B?WkFIWklXYTNJSnoybHQ2aGZnQThoRWt6TjBtMG9xWDVXOFBRaURpZ1Zza2s2?=
 =?utf-8?Q?y2Pa90+wtF3jQO8zYVktUny0I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eafc2e9a-e772-4213-6c1b-08db30f408e2
X-MS-Exchange-CrossTenant-AuthSource: PAVPR02MB9523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 07:54:48.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjrLY3h9UUb9FDvNstpCubl4Gc1hG4G138UmmEST8hC9o/ce0Z2yLnKq3euqMvUzsH5+FPcoPn8O5jbh/osygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005456_436321_F2341C34 
X-CRM114-Status: GOOD (  18.40  )
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

SGkgWmhpaGFvIQoKT24gMy8zMC8yMyAwNDoyNSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+IEhpIE3D
pXJ0ZW4sCj4+IFdoZW4gb3BlbmluZyBhIHViaWZzIHRtcGZpbGUgb24gYW4gZW5jcnlwdGVkIGRp
cmVjdG9yeSwgZnVuY3Rpb24KPj4gZnNjcnlwdF9zZXR1cF9maWxlbmFtZSBhbGxvY2F0ZXMgbWVt
b3J5IGZvciB0aGUgbmFtZSB0aGF0IGlzIHRvIGJlCj4+IHN0b3JlZCBpbiB0aGUgZGlyZWN0b3J5
IGVudHJ5LCBidXQgYWZ0ZXIgdGhlIG5hbWUgaGFzIGJlZW4gY29waWVkIHRvIHRoZQo+PiBkaXJl
Y3RvcnkgZW50cnkgaW5vZGUsIHRoZSBtZW1vcnkgaXMgbm90IGZyZWVkLgo+Pgo+PiBXaGVuIHJ1
bm5pbmcga21lbWxlYWsgb24gaXQgd2Ugc2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxl
YWsuIFRoZQo+PiByZXBvcnQgYmVsb3cgaXMgdHJpZ2dlcmVkIGJ5IGEgc2ltcGxlIHByb2dyYW0g
J3RtcGZpbGUnIGp1c3Qgb3BlbmluZyBhCj4+IHRtcGZpbGU6Cj4+Cj4+IMKgwqAgdW5yZWZlcmVu
Y2VkIG9iamVjdCAweGZmZmY4ODgxMDE3OGYzODAgKHNpemUgMzIpOgo+PiDCoMKgwqDCoCBjb21t
ICJ0bXBmaWxlIiwgcGlkIDUwOSwgamlmZmllcyA0Mjk0OTM0NzQ0IChhZ2UgMTUyNC43NDJzKQo+
PiDCoMKgwqDCoCBiYWNrdHJhY2U6Cj4+IMKgwqDCoMKgwqDCoCBfX2ttZW1fY2FjaGVfYWxsb2Nf
bm9kZQo+PiDCoMKgwqDCoMKgwqAgX19rbWFsbG9jCj4+IMKgwqDCoMKgwqDCoCBmc2NyeXB0X3Nl
dHVwX2ZpbGVuYW1lCj4+IMKgwqDCoMKgwqDCoCB1Ymlmc190bXBmaWxlCj4+IMKgwqDCoMKgwqDC
oCB2ZnNfdG1wZmlsZQo+PiDCoMKgwqDCoMKgwqAgcGF0aF9vcGVuYXQKPj4KPj4gRnJlZSB0aGlz
IG1lbW9yeSBhZnRlciBpdCBoYXMgYmVlbiBjb3BpZWQgdG8gdGhlIGlub2RlLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNw6VydGVuIExpbmRhaGwgPG1hcnRlbi5saW5kYWhsQGF4aXMuY29tPgo+PiAt
LS0KPj4gwqAgZnMvdWJpZnMvZGlyLmMgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZzL2Rp
ci5jCj4+IGluZGV4IDBmMjljZjIwMTEzNi4uMDg5Y2E2OTEwMTI0IDEwMDY0NAo+PiAtLS0gYS9m
cy91Ymlmcy9kaXIuYwo+PiArKysgYi9mcy91Ymlmcy9kaXIuYwo+PiBAQCAtNDkxLDYgKzQ5MSw3
IEBAIHN0YXRpYyBpbnQgdWJpZnNfdG1wZmlsZShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgCj4+ICpt
bnRfdXNlcm5zLCBzdHJ1Y3QgaW5vZGUgKmRpciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X2NhbmNlbDsKPj4gwqDCoMKgwqDCoCB1bmxvY2tfMl9pbm9kZXMoZGlyLCBpbm9kZSk7Cj4+
IMKgICvCoMKgwqAgZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCZubSk7Cj4+IMKgwqDCoMKgwqAgdWJp
ZnNfcmVsZWFzZV9idWRnZXQoYywgJnJlcSk7Cj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIGZpbmlz
aF9vcGVuX3NpbXBsZShmaWxlLCAwKTsKPgo+IExvb2tzIGdvb2QsIGp1c3Qgb25lIHNtYWxsIG5p
dC4gSSdkIHByZWZlciB0byBhZGQgCj4gZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCkgYWZ0ZXIgdWJp
ZnNfcmVsZWFzZV9idWRnZXQoKSBqdXN0IGxpa2UgCj4gdWJpZnNfY3JlYXRlL2xpbmsgZG9lcywg
c28gdGhhdCB1YmlmcyBjYW4gZ2V0IHVudXNlZCBidWRnZXQgZWFybGllci4KT0ssIEkgd2lsbCBt
b3ZlIGl0IGFmdGVyIHViaWZzX3JlbGVhc2VfYnVkZ2V0Lgo+Cj4gQWZ0ZXIgbG9va2luZyB0aHJv
dWdoIHRoZSBjb2RlLCBJIGZvdW5kIGFub3RoZXIgcGxhY2UgY3JlYXRlX3doaXRlb3V0IAo+IGhh
cyB0aGUgc2FtZSBwcm9ibGVtKEltcG9ydGVkIGluIDI3OGQ5YTI0MzYzNWYyNmMwNSgidWJpZnM6
IFJlbmFtZSAKPiB3aGl0ZW91dCBhdG9taWNhbGx5IikgYnkgbWUpLiBXb3VsZCB5b3UgbWluZCBm
aXhpbmcgdGhpcyBwb2ludCBqdXN0IGJ5IAo+IHJlbW92aW5nIHVudXNlZCAnbm0nIGluIGNyZWF0
ZV93aGl0ZW91dCgpPwoKSSBzZWUgd2hhdCB5b3UgbWVhbi4gQXMgSSB1bmRlcnN0YW5kIGl0IGNh
bGxpbmcgZnNjcnlwdF9zZXR1cF9maWxlbmFtZSAKaXMgbm90IG5lZWRlZCBpbiBjcmVhdGVfd2hp
dGVvdXQuIEkgd291bGQgcHJlZmVyIHJlbW92aW5nIHRob3NlIGxpbmVzIGluIAphIHNlcGFyYXRl
IHBhdGNoIHNpbmNlIHRoYXQgbGVhayBpcyByZWxhdGVkIHRvIGRvX3JlbmFtZSgpLiBJZiBpdCdz
IE9LIAp3aXRoIHlvdSBJIGNhbiBtYWtlIGEgcGF0Y2ggZm9yIHRoYXQuIFdvdWxkIHRoYXQgYmUg
T0s/CgpLaW5kIHJlZ2FyZHMKCk3DpXJ0ZW4KCj4+Cj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogYzlj
MzM5NWQ1ZTNkY2M2ZGFlZTY2YzY5MDgzNTRkNDdiZjk4Y2IwYwo+PiBjaGFuZ2UtaWQ6IDIwMjMw
MzI5LW1lbWxlYWstZml4LTg3YTAxZGFmNDY5ZQo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
