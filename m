Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B6CCFA13
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejzoANtLiqobLbcuoFErTd4nXnCcJQTLJaOARJ1jrrs=; b=jhLIliy+Onwdx9k2QsUHvwsTEZ
	smQHB7TuuTB9mbg2uNWnt9ooN311PvWJ1Bvj1w9rKx1NZAMgOVbCS+HfkLGM0cDekNjI4kqWaOM10
	17g0UrTJHm9TYAJ1BHfMHqGSF47gyICABJiebOZf1it1lrEAgSj3GOIH2hOAkCvzhFKWWTgReBqG8
	Rsz6nGqHCDeKPX3esxbq8j2r87BX24KSDchuokthZibRzFJr2QeArp437DzhoK7S5DtFxcaoY6Az6
	rAcbvIW++Y/9w89q5BGhjpqz++EtnwJpOYbMmp6o+oMoUBxazO/ZlOKTuU2MHW6GkwB4Q7WrUBVlo
	RQ5v4N5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWLh-00000005xXM-0Mgt;
	Mon, 10 Nov 2025 18:10:41 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWLe-00000005xWs-2GXP
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 18:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762798238; x=1794334238;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Vyo+GuRfUjUWKHEKy0DzsXmH2PFdUmVPuiem4h2cU3g=;
  b=MIGFEYZrcVRN82+mZGRldKptrIjR7ZRVHS6Qb8Yc1/AH8YWeSSlGpwUs
   aN5bcbxyX1ICPImL1VccywfXRjQS60HEyrezN8U38+DBptFnxKATx+aZR
   E4eIK8zabdiajhFquHD5fEMSBnvWwnwvJRwF7EGUJmHtVd9BCaxUvF5hB
   RarUFKHyLSBf3f3Isp1pIIV5QyBofVpFfcqjSQdA58jtrLStWjdpH7N4Z
   6j47a8n9mKhQSN/zNKPNWyXtHTy33+mhFCUcamltBVuaWQr3vmVUAUwPc
   ofykQIafztG9iw0QOgCARSQ30IG0ogSgbZc9cSU0F74UHH8KEFTqV8ibn
   A==;
X-CSE-ConnectionGUID: 9So3byr6RT2qi71xqC6KwQ==
X-CSE-MsgGUID: 4HBIr/arRiawJY7u7sRE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75540376"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="75540376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 10:10:35 -0800
X-CSE-ConnectionGUID: 1FmIUqg7Q1qrQNPoSR+Ihw==
X-CSE-MsgGUID: CUKrnhCGSoq3Lkxq5qkTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="192995419"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 10:10:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:10:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:10:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+37bnoy5aWAczv4vohnhleDjIcpq0O0LP6sgFcBWtDBQ31ByAZZ5JwV9sgfii7ea6UMirl7iLUitXd8aMVaFPlW+zltgZHqmDVlUo2nkl3crmIUT9kPgzovtwgj9KAmPbr84xMr44r9gzpikZ56elvstw5+et7m/kmj906lSNRnBg+2Iiomdjp5UTKwqaV7Cig+wxhnOhLdV0NQRE+FhdKDWHpQCi24cIlKtDCdU9wOsGZ2eu3Ydrs3DzmUFD54wy0+jxKZ5xp731Hna/G7okzdg6nfr/TsYW29za3hTkuo0UT85RzPdmttlO10EZrm8Q8zsoaGOm92IIwRstIM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7ulEU6TTWYdAdJMRUt5tY9oCeie+WUvxCeym/S7Kco=;
 b=dj3ECXwVQQikITz3YpA5fUm7MVsRKZ1Bte2xgu75IOSgvu6tFQa/2s9lAZfFEVZKRIC3GPHknSYpp+UOcJolbLio5LWvRe0WgUZ0zvGOVyhpAc2YuNr37YByjiwsCYJI6d6zER61A+QoICSwCMvQMuKOHJhA97foGoRpWT/6kVhwcSRksZW0X8xxFCrVWBGKOnqPy0dxMLwonOht/2eCiRuqpEtBotOSNjv3BCL2wFznptbpmfMbALmoY1nPs+7kd65JX8HzPq/h98MeSlH2yiGEZnUFW2rVm1/czpYRFjPuFzNSxW+Z+ak6kC3k3isIr+lED+raj12QLYKm+xOX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:10:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:10:32 +0000
Date: Mon, 10 Nov 2025 12:10:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Jani Partanen <jiipee@sotapeli.fi>, <intel-xe@lists.freedesktop.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	<linux-mtd@lists.infradead.org>
Subject: Re: Possible bug?
Message-ID: <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
Content-Disposition: inline
In-Reply-To: <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8d853e-8f9e-4a68-05ec-08de20846fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nY6M7jASS6NB9eEzWjpWslfwtp4Zk79YP/j9TO9R1igsIu1j1uvOCt1chZ?=
 =?iso-8859-1?Q?3QOyaRzqZPFhrL5OhesdURI0BN+BRZx73AJUpBogZVZI2CSjqrfI0H5HTZ?=
 =?iso-8859-1?Q?N1o8n/BHYotTbEM4LOa7sVHe+9qfzBCmGFDjFAlKglnLkrY3Ve9nWyDwc4?=
 =?iso-8859-1?Q?B1NP0+UsOlrq5k28dSHtg2IRKe8MTG7REtg2QBuCa637HvzVfgE19OH932?=
 =?iso-8859-1?Q?6t9dEZkG6vUNwUUZ+VrRVdc+eLROqvLc15ptrsCQo9FcwUYCfdohZw4o5e?=
 =?iso-8859-1?Q?Vvx832+C8Rl/kaYw/8bqB2HdqFESyPX82wK2/cd9nBS6zFJMc0FCm3g2TM?=
 =?iso-8859-1?Q?UHY2FJz97SURz6VSVKmtH9oHx4FxKBvVB7/qQfxtNI8jr85sJBbWFx1tVE?=
 =?iso-8859-1?Q?ZwBNMy0MvkDBJS6/TXIassE5P3ZiPPA/fySVW2YgQEuaARF0Jl6LRPx8yh?=
 =?iso-8859-1?Q?f7/PLYZvEsKtS4zF0/f5Gn6KpwpXwoPy9ut3izS70YGPl1ngTH/m5ZQSTP?=
 =?iso-8859-1?Q?EwrQX77BHDjBPKprp5E5x8Rb+XafRxJaysMlCoZk2czBzf0vF9hbv/l40E?=
 =?iso-8859-1?Q?BIpdCASZxE9Hq8YfJmoXi05tZO5H7lSt3M5A8uzPsvjoLExMt2LFNHlERU?=
 =?iso-8859-1?Q?7IuwStIFm0JHSG3OOhb97yfW7HeGPWRrSuhXaS/i20bw8f0jo8Qqpqu/me?=
 =?iso-8859-1?Q?B/gwbQuKNAb6iUaSDbxzqdkwryHPJM71MkiXvQ+mgvM9dnUxr1W5ezSdX6?=
 =?iso-8859-1?Q?YaCZD/j2G3QEdaLgIJAyLWNJID2qPlv3e1nqFfE79ZiYv65CJvNoPy7hNf?=
 =?iso-8859-1?Q?RmHBGOwl9JzESZGIv4l78jp9ec7Qtcq5ILxc6POYDyxIurVmDSWH2d5dFB?=
 =?iso-8859-1?Q?bpWOs6PCP7nzuKJ8KoREYDOfRiaw4Y/jDdZSDjvhHmnKuZsm8Gguh+YJ51?=
 =?iso-8859-1?Q?3wKWSsvKdaqOs02WxyvS5WfAhH68D4l0hh99XlnbIu4gvlLqS+kwu1VEdm?=
 =?iso-8859-1?Q?gU4ZgScfoT6DE5R0A8Zp815L5GnmEWFqputNjVfhTbpJYe1AUrR8dT2OTG?=
 =?iso-8859-1?Q?Jcgx3IyB9y7dDokynz0IFKjnApLZXsyiIOGDsOM0oAzHA+pNnAOaDdoAkU?=
 =?iso-8859-1?Q?oG2r1X/OxxkFTalM1PCfWA24o1GJ3YWrxcg3i33y605aNqIv1WkJWuSxav?=
 =?iso-8859-1?Q?GKyVvvk7WVSExZk6SaJTwxJWr9jj8Nn/mwTOmXftHFwbZeRmJ7KB3/NuBQ?=
 =?iso-8859-1?Q?ZudZyxztBzHpwqwBIazIqjGwhQBWhDxty7PNra59J6bOdjqEP1fnhBd9AR?=
 =?iso-8859-1?Q?kmMNIjURJpJ2BwUXE5x+V2KsEWvGR0eUxLR/XecDMhulOJFrx5x/J7tHFF?=
 =?iso-8859-1?Q?gvrFKVlc116uyqiRH+ZneZ5/uPFBPBBAB1Q75icQD2oKfJrD40Ji0nEJMK?=
 =?iso-8859-1?Q?174Xslmlhz8uFs+6de0M/u6etltIwSeC7iBaocXFqqrcU59oOVr/etCE2y?=
 =?iso-8859-1?Q?Nvmcq2iaIwBc/N0Gc36xKr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eZjaz8uCpS8JI907TARGQzPbS1zrEjjX3YykFbTpCKnq/MjiqCKYJoYGmf?=
 =?iso-8859-1?Q?NGLp/2GCJXYDBmyjIHIcHB4rg3S5vZR1FOz+IWgzTJE9wr6P5NbvC9cYay?=
 =?iso-8859-1?Q?QXvBwzdb9OL5L0t/RpghNM1njVsWZupzGpzvmCo1JhtiJSPlQ0f9Qs3ku7?=
 =?iso-8859-1?Q?sroavLRysCNrk8+PzZyzZCCMTGtn7TFT/OcMY0TR9lDlXC+CUf47iEshMx?=
 =?iso-8859-1?Q?O5q8aRyUNWuHlWrDTGjOsEHLZf7zRd5v40+mm+FLB/V4YawmLJOKHY3Jdv?=
 =?iso-8859-1?Q?nJKlmnNSPgqiaXCf5aeTAkHlZcR3MxICflR18QOVCTB4Zr60+FpfZLOeCd?=
 =?iso-8859-1?Q?77ZYNudcPVZpqylgAkpenjURyZKYUsukouVm5e285y15CZlvJSnUrzDaIr?=
 =?iso-8859-1?Q?D+X8aIRm4Pojb8AxgyV9h1qDqCnRZPKtchsUsH469KaxEMgD2UE2Xn0mNZ?=
 =?iso-8859-1?Q?iTyNR67N/NOFp+05FrEM6caD7yd6l+hMtSbeaGkszFy3XUm1gYhW7kooWG?=
 =?iso-8859-1?Q?SFg4sF4r38JGFio+uzWUQM0FfT7AFsiVxee0H3Y/HU49Mi/vp+NWn7zfJ5?=
 =?iso-8859-1?Q?90awIXg9U1RIgt7JGfxUSKSYMPv41SEnJu+KZEpBX7j2efsjuv07iNgZRn?=
 =?iso-8859-1?Q?ROTTMlcx2Cm8dcoOu1RqYv95CLhzyZuNJt2LtxW25XWzTdpNg4f0xWifzu?=
 =?iso-8859-1?Q?9k0tAcwzPGuaVdrYOepi/+WPb9Yy9V/w6Ia4whhFQdl6VHE/U8LpUjy+uW?=
 =?iso-8859-1?Q?uguwzFyqHw0b7X61jqQceauAoMXzndAA1nBM5z3LlOsTWiVYotOf86xwSj?=
 =?iso-8859-1?Q?L5YVd+DvfEkCQm9qaEQxpU7uigx5I7XF2mpN6bjizpjSDcjmmamG8xuH3y?=
 =?iso-8859-1?Q?OzY/zkrEjBe/WMbyn5gymVyPRUXV4L+khl8L4E+/FgeA1piI/z7xwxiGcH?=
 =?iso-8859-1?Q?He2ka/DpEirCVN4fVcfUpieQgXmaYvq3K3jit6Q/b/V2pBcM8vrijKmDUH?=
 =?iso-8859-1?Q?Oce5ozPxP+aXHNohRtfRqFmmxE62ztr0G2EeAe5tYOpNx0hP+A7Bm1GPH0?=
 =?iso-8859-1?Q?p64dSQuxks060lhL2ml255bJq/t85DPI+di6K71WE6/XIyV1zqI3e2tgoi?=
 =?iso-8859-1?Q?/K2PkXMccpikAyjgpdaiR6E50Xj/Seb+Cpz4VBC2lyT03UAL2WopnafOhA?=
 =?iso-8859-1?Q?m8CDPk1b3dkPaaMjpV0amNW1hUt1XjBFSSVCUMmcMZnYR6rNhSwlOqFZiC?=
 =?iso-8859-1?Q?849hN7+weyblcjNEOausPVnslw3l/1vE4OCa9UHYl4MpgX28CIg1Jf3Aml?=
 =?iso-8859-1?Q?5sHwYshuCfSds21+k+ofKqUC9dl/K1ko/0gsHQMXCHV/2WPTyx6Qwfx7gm?=
 =?iso-8859-1?Q?HoBiz/bAZjz43GF6lq6XOK0Fx6ToJpIao0h1DtHgOrGZ7NeX6tki8rGJzB?=
 =?iso-8859-1?Q?q7KhwP2qAbcYe1BpdHm7aszRCu15rJ1WgKuMbZS1PIgHicR1aRrMRL4IHo?=
 =?iso-8859-1?Q?KYLboAH6hGrfiGfc4o7Q+lK37LdtUp01nc/TpzNiHxeDBlvTkAbhyP3xrs?=
 =?iso-8859-1?Q?98ibas4/hzoj7RtrioP0069x6Mv7BpXLSZY22Cje8InyMOIh+is7UnGGh6?=
 =?iso-8859-1?Q?pMb/fyoQR4D8QLtUV+50FE9wW4ZnwBlWKc1MEgHfn1BwAlDhXOmEaeSQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8d853e-8f9e-4a68-05ec-08de20846fd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 18:10:31.9504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5taZxHKv6CmskJtkTVpq5dGyDeQhgVnng9X1NOyosiPn+MHMWQVlBl0huLZ3ue/SDFFDYAFyn7NkCPiT7mGiBNZP8puCPMLICy5OJR3Mrbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_101038_620777_7428B0F0 
X-CRM114-Status: GOOD (  14.96  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 10, 2025 at 03:49:20PM +0200, Jani Nikula wrote:
>On Sun, 09 Nov 2025, Jani Partanen <jiipee@sotapeli.fi> wrote:
>> Hello, I just got Intel Arc B570. It seems to work fine but every boot I
>> get this in dmesg:
>>
>> [=A0 342.865944] ------------[ cut here ]------------
>> [=A0 342.865950] UBSAN: array-index-out-of-bounds in
>> drivers/mtd/devices/mtd_intel_dg.c:750:15
>> [=A0 342.865954] index 0 is out of range for type '<unknown> [*]'
>
>Cc: Alexander and linux-mtd.
>
>It's probably due to struct intel_dg_nvm regions[] member being
>__counted_by(nregions) but regions[] is indexed before nregions has been
>initialized.

yeah... and we shouldn't silently continue hiding the ENOMEM... Sasha,
something like this?

Lucas De Marchi

----
diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_i=
ntel_dg.c
index b438ee5aacc34..114e69135b8d9 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -738,6 +738,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *=
aux_dev,
  =

  	kref_init(&nvm->refcnt);
  	mutex_init(&nvm->lock);
+	nvm->nregions =3D nregions;
  =

  	for (n =3D 0, i =3D 0; i < INTEL_DG_NVM_REGIONS; i++) {
  		if (!invm->regions[i].name)
@@ -745,13 +746,15 @@ static int intel_dg_mtd_probe(struct auxiliary_device=
 *aux_dev,
  =

  		char *name =3D kasprintf(GFP_KERNEL, "%s.%s",
  				       dev_name(&aux_dev->dev), invm->regions[i].name);
-		if (!name)
-			continue;
+		if (!name) {
+			ret =3D -ENOMEM;
+			goto err;
+		}
+
  		nvm->regions[n].name =3D name;
  		nvm->regions[n].id =3D i;
  		n++;
  	}
-	nvm->nregions =3D n; /* in case where kasprintf fail */
  =

  	nvm->base =3D devm_ioremap_resource(device, &invm->bar);
  	if (IS_ERR(nvm->base)) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
