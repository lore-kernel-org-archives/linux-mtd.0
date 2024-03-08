Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C8C54E4A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVMnaGV2cC54QXwdNdlkoqXET72Eahe1hMWEWlTsVFw=; b=CaO0YLAz2TBqj/hvg0PpYQRup+
	HyaE8Jr2WKsQ82kr9XIXy1qQASQL/LyVtwaiHmjNw1e2+/12bZZWVZN7R+Xsq5fEB4A5mU/kFg1U6
	bCt2biCQNm8JW6GPHfaY6WHAV1jcf14ZUAzOZLanXeyiNVTzhcaNwTJ270o1Fv3eRhvLtzrOvjs9t
	QKJ1m0PByShvmNS9t7jR2SHD2JHAe8KKn6ChonL/y658byupAPOGEn8tqqedvN13zNA4qP2irFrp0
	yH919g0FpwEqB1cky1K/t+zpgRXAecsJZarZq89goxrFtXsxSvGOZL+6YKE2rL1pSHcYq2OIE06uf
	+wxzyixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rievZ-0000000An7L-0byV;
	Fri, 08 Mar 2024 18:26:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rievV-0000000An2B-2VWh
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 18:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709922397; x=1741458397;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iDnLy1u+JYcdwX3RxKRXB3HV8bHG+bno9khvqhB/jdc=;
  b=S3Ea0tbssSDYxFpGYJ5xh4yw8ydounXnqTnZ0HWTi1QGWyf/6vf1bB/W
   C1KjmdMKRiUBqHkkxYqdDeJ4lKLqFsbfffrAtyaZFDl8Do5mgG3A3wQU0
   nuhjKPsqCvYg1fhKb1ylJd0qdChPjFuEX4hwb93KApb/GiIsTk8plfY/E
   lXgvTn+zr5EhkkbUR+fIToP0K2Hd0HTr7QXVYSmgiTXYiTfsVa7xU1zB2
   SRggujSYUfrIHJYboiKz/3P4hi/qvVwcoLVdjKUbFgOMHfDurcj+JLp4J
   wHnOlHd8Xv+o+UcjPBSM9oLHXJdIRgsXUntAPVWhPqNCESWffLI2zBZor
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="5252320"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="5252320"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 10:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15027162"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Mar 2024 10:26:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:32 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 10:26:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXpeNseSw8sF6FVm9vVm2p6301GXRycdBXAd5iOcDy7AaNQ2qu1dYP1mU35X+BK3dNkF0dbqIRkNLI0jkJTzls2oRN5UmRLwIPoPXXo9hO7EStF8VjAW+7kFo7+kKxNZJibuDBor+sMD25YoiKXP20CNHfCf118F9h3epmtutnOp+uCzDdE+bH9cUyIsQ0T58FDA1km2hC28/irwg9ZlrVgxcTMvr4C5bEkTgiBbAMKG+RWwJdIJr3Mw7IK1fBbz1gfW1SYtXc+fDP7MpXMvErjT9nNVwaf7qeCCOc/qtVjJDua8An1C4RwJhNyxJ9CSvXNGSCLosw+TH5SNBwFhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSyr0r71Z5ZpBpwsIOzmt6JQMKxBhxNFqvyo7z1Lvl8=;
 b=E/+h7P0V3zbpCCQvsS4sLKOWHNQs3XlvkjOwpf2GR6Eo3866W9AtKcB19VvZSK1iT+jVnHApgo9TszZRZRhW73IftCDhAbnRj4XsoP6Ne0K3AvpfxMc1LTdUYVFF6ShEkg6TrFeeZVKuQU65FYbPKzxVG1kfbYKc+ZKYlKZjWBwNcWYlOm9wfU6c4Fyv9jy/wTe+F73MZhhqpEQuPRcEkecqSZPE54BhALOQcqGRSScMBIKEzPoSV6CrrXzj11vT1+h9tuOL5F+Wl5Jq15GQQTeVluNONCV8h9hyffs45iEa+3/BabF3/BMklxKC2h2DcAxT/XLjWa2WAWjaAUXRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.12; Fri, 8 Mar
 2024 18:26:26 +0000
Received: from BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::9c80:a200:48a2:b308]) by BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::9c80:a200:48a2:b308%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 18:26:26 +0000
Message-ID: <f13db290-72db-9b43-725f-4c43d7a8e839@intel.com>
Date: Fri, 8 Mar 2024 10:26:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-wired-lan] [linux-next:master] BUILD REGRESSION
 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
To: Jakub Kicinski <kuba@kernel.org>, ivecera <ivecera@redhat.com>
CC: <netdev@vger.kernel.org>, Linux Memory Management List
	<linux-mm@kvack.org>, <intel-wired-lan@lists.osuosl.org>,
	<linux-mtd@lists.infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-omap@vger.kernel.org>, <bpf@vger.kernel.org>
References: <202403090150.0gkUdeIc-lkp@intel.com>
 <20240308100630.456498c4@kernel.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20240308100630.456498c4@kernel.org>
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To BL3PR11MB6435.namprd11.prod.outlook.com
 (2603:10b6:208:3bb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6435:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6987da90-c6d2-4944-485b-08dc3f9d4425
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HULBBG5hTUqivkHKv9z6JEmDn4OZMX2XDvdQ1ImGq7PeeKaQIjXI0JFc5PuXXAXSot+fBbTtDcYpd9WFD5c6jvuh+kBxVcWANzjRLMIMzrEA33rWz/bkPxc2gQNBGSKCZzJWplnyI9hz1YnWzmZBruxmqaerEp4SRF5mkjVbk/vQIjH77DbeZ9qt+NZ4PffkI/v/o2L8eI5vzeA/+npVRDJ4BpfRU3343LilnQzclE4pmgCcGdxB9h6KAVyS3zMX9giUDJG7xjlzjqB6RIbruV3R5o/XyZtm2PcOCJlXdd0wU1jvdz9Ao3SRsYl75mG6mQjw1n+DBwxkXnuzjqBmwOazacYe8/b0jop/3XMw1dbSoO4izdKwY0D7odSVaGAlfF8g/rX1//JR6PgIdQk8bym6O0pOalmTmyK4Tfk58vpem8/pr5dBZ1/zCfNtKXL0UejPgWvXZgLvywZITVszpwqwLuMgC2Yl/3XPBvaRlX2KhVj8l4eBI611EZELFnEe5Pn7BYDLfz1jz5XVccnzh9mkA099OSv7mRI4AQY/wf+rEGSs+fVPCpoStbnBCzvNJ6gF4oiuVaa2H3zVCI5rBhVe490c/vjc74VuBIl46LM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6435.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1PNWhFRjZGcU54WmNuREJIRkxWcnBkemYySm9iZTJFU3pZSXlTaFQxZjBr?=
 =?utf-8?B?TjFvWHBySGlUaXpqeDZUSHFUTXR1bFVIcVVVTmV3SmhVWkRuKysyWkN5ZTJS?=
 =?utf-8?B?T1A2dVk1ZjZ3dGVwdzV6b1ZqV1RXWmNGY3JZOURUK0Z0anpJU0lkWTJoOVZP?=
 =?utf-8?B?UE1zYlc2VjcwekFjR0ZYSEdmM251bzRtUmhnT05LRU53dmJaRVJESnJERkQ3?=
 =?utf-8?B?S2VSempldkhENUtCZVkxcDhsR3BRdmQrNkdoWDJEWWlXVmhadGlWNmtVV1Bz?=
 =?utf-8?B?cjF3Qm9tdHNGZjVUbHRZZjgyd2hHNVZEUGNKYWJDbmhnN1lkWklwbVV5WEJr?=
 =?utf-8?B?aEtDVHVqdWpOR05JMjgvbENrdE1WREJib3ljVlF3cnd5VGJJVWoxbUVVemNX?=
 =?utf-8?B?aUdDZ0sxRWpSMmp2UlZJRVhHRkREUVQ1NjZqVWVlQU9xemQxbWxqM2oyRnVn?=
 =?utf-8?B?L3NVZTdVdXA0RWlkbHlGc1F1UEZCQ0ZCZUZuYmhWdDB0WkRMNDNqcnpZOGhR?=
 =?utf-8?B?U1dIbitjemQ4SExsZXFDUjRqeUdZbW8vQ292M2Q5T0VxR0ZRWHdYUWlERDF2?=
 =?utf-8?B?YWlvWjJyK2JqQk1uT3k5aUJBd1B2eDhybWZnbEFmVndFTGdKR3NNSFdMRWpa?=
 =?utf-8?B?MkRNT1VJeXp1U3hsdW1GMnJUWEhMb0Q0KzRNNmFiZGIxS21qYkFmeXd4VFU0?=
 =?utf-8?B?WnJUTk5UT0JGVC9QK3JuNDZlalU4OXVoM3JVSWtOZkljaENCTk81VEZTRVp1?=
 =?utf-8?B?TXQ2NHltQnJvcWhDazdod2ZzSTRlYXZiVGR0TENKdFZOOHp2d3dNL2dWaGFr?=
 =?utf-8?B?U0tUbjlPanJXOXFrNG1nKy9GWmtlTWl6dUFacXRUSysvQ3d4cmVuRk1reUhC?=
 =?utf-8?B?SEYwRUxmOVIyTEE0bnZqNHA4UThRbG5VeWovdnRiZVN1Q056K0M0bE1DR1dW?=
 =?utf-8?B?WEUvd1NYcWxGMWtkZjM4a0lyR0R5U1hJdG8yM3B1RUkwV3RBTUJrUmdLQzRy?=
 =?utf-8?B?YWJlUU4xRTRnMGx1YzFjRGZncG1RNEh0OE9iNEhwaVI0KzdOMHJ0dzRZUUFH?=
 =?utf-8?B?NSsrOUxoUWlqSlFRWnhzdW5YRWVsMEZJajFTUmx0bnlVdlQxbVQvS2IrUFY0?=
 =?utf-8?B?UWdlaGJha0VjVmYrdG9vbUplVzY5UThCamdIYjcvT3U3MUxJb2UvaWVhQ0pL?=
 =?utf-8?B?VDhwT2dMcE1FSkdIVk9XKythSFNadDV0U2trQUtlWmpsbTNnNUs4cUI3NWtP?=
 =?utf-8?B?TnVEcmRYNGF6UzhjaW1ydmhlN1R5VG03UkF3MWl0UE5wNkRFYmluZFB4WUd4?=
 =?utf-8?B?aFUrZzFlQ2RsTXl5Z0Y3V2JvZm9FaHgxWDYvU293bUZVa3N3a3JHdlJlbksr?=
 =?utf-8?B?akk5Ym1tbVJaVlAxR1ZlVTREenpvTXRHUCt3ZWp2dWVpVEErdFJGdXFFNXph?=
 =?utf-8?B?Q0N1L0hXVzdZM2JHRTNjZzZLRkF3Z1lKZlQ3RVV0SDU2QXFrTzRpRGhrRDB1?=
 =?utf-8?B?SndrR2NaTnBmeHp5MERVa012dXhvT1VWTFk2QVh4ZVhXYmdWR3dka3lmTUkx?=
 =?utf-8?B?Y0s1aFNRRkVJQjNPZXdoNnJSV0l2NDh3RlgwT0pzN3BMUmVxVDgxVmVvdnJG?=
 =?utf-8?B?aFFzb3MxcVV1eXdxMkJ6VnVybURUaXljMVV3Q3FCNWhBSktGTnJPcndCNjli?=
 =?utf-8?B?RDl2OVd6SG5VUHYvbFg4dUxFbC9MTDczVFJmaDVGbmhBa3BBYWJIR2hBemFB?=
 =?utf-8?B?TG42ZnJRK1BGcE5xc0tKay8ycEdRcUJLWGN5S3pUNGFNdmRhdWVjUUY3c0Rz?=
 =?utf-8?B?UWZnZUxhWlFvK3BGRExTNkU5VGpsbXoxdzRpRjVXMVh1UDZRUkxCM0ZLL3Vo?=
 =?utf-8?B?V0syS2dXdGV0L0U2RTV0bEdnRllXTUZFZysvRGVXUVZRanUxSmpGYlYyRjZy?=
 =?utf-8?B?aWNIUTNHK1BkVjhhVlB5MGNxWVZNNUc1dThsb1BsdXl5Nys4KzJUOXBzSndw?=
 =?utf-8?B?ckpmeHZIL1UzeEhIZ3cvOFd1WUlIQWo5R0laVW0xaldvWjk4a201YTVTS0d0?=
 =?utf-8?B?K2xmVkR4dThsVVRvOWZDeWxsa2htNkIzTnUxbzZsTTcxaGVBcmsvWkhsRm1n?=
 =?utf-8?B?RFE5c3BnbXlOdUd6SlBINCtIaWhzWWM0SHdQay93Z3dwUEk1TWF5TFU1c1RZ?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6987da90-c6d2-4944-485b-08dc3f9d4425
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 18:26:26.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDw5M4Zgoc/EF9Z3p8MFtltOr0dtbBrCAC+0O0cNb9XXpDkdHMHPsN3svcTDT6lyRS06oo5vLAA4fmipFZDAPXfli3CxU+apzPFrS5f1lzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_102637_742194_0474AF22 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/8/2024 10:06 AM, Jakub Kicinski wrote:
> On Sat, 09 Mar 2024 01:52:56 +0800 kernel test robot wrote:
>> |-- i386-randconfig-141-20240308
>> |   `-- drivers-net-ethernet-intel-i40e-i40e_main.c-i40e_veb_release()-error:uninitialized-symbol-vsi-.
> 
> Hi Tony!
> 
> Is this one on your radar? I suspect netdev@ gets CCed on the reports
> because of it.

+ Ivan

I believe it's a false positive:
https://lore.kernel.org/intel-wired-lan/63bd858a-fe07-4eda-9835-d999e2905860@redhat.com/#t

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
