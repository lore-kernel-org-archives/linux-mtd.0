Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED598C47DD9
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Feb 2024 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKxD3wZqmfDmGW+yAemB7TsNMR5Cylp/gsQCZ4h+Oqs=; b=V3Wurhs07sSqksuDlx1sRoZLjF
	qM1eIbF46+JyOyVdW1rxGnt3kIFYiK3mfecgWJv6UUEZ8v26KFfar2TA11nN5DruFNNChHl1k3S6M
	Oe2iniPmdfAFrKhmniU951p8s/J7DyHxqpB3KSpbtQn1kHST67ZdgM/H72O9zqE/7SSO3VcGOxvo2
	eO0StXb+5/eqUgMaht8P+Y4YsEmHvtpaiQqzYBe51DeiIQGB7bCwykm9xw2gIx+HKJSXzRdktMB7P
	KR+5n1McpDO3sxRrQKZmW95x1OD2NLHVoHm+2RY9HGmLO4hs1Abn6UX0rKlT9VRTFB7Rd5XxULAue
	7l6HMd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfS1P-0000000B5An-29ru;
	Wed, 28 Feb 2024 22:03:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfS1O-0000000B59t-134t
	for linux-mtd@bombadil.infradead.org;
	Wed, 28 Feb 2024 22:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ze64DGQvdviW8TxzxI+uUFWHQW3HhDlmwIQ6G7lsMxo=; b=m4s/bXlZSwOCgD7I7Zr5/vQSjJ
	ZN6dvJzjUfDyvarcBrY0S2LqD1bS1JIYMSxktkzfaEnO3NVIldjeWkf3zGHWNdq12EuRHMklK8A4E
	0IEnpvQ/YFXeX57ZLyugNchZSe482jkL6/t6/JPRa+z8FUuOnTRZ7ZaacdvgHLR9Ao5SHGa7H8gL5
	pT1oGWQdys+2i2jYVKh2YS9oQ4OEk/vQ6SQweLvBqpW7lxzLn/cC/E1zWMF8rp9sfE6PUp0gP5pPo
	EsAT+FPre/Wlkyb2L5X2HP63IwA7pG683bdAYQOi544xbl9IP3mwVgpM6G5XIu3HpFpaxsoMS73pI
	zJDvgLUA==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfS1F-00000002Xhh-2eYR
	for linux-mtd@lists.infradead.org;
	Wed, 28 Feb 2024 22:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709157798; x=1740693798;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ze64DGQvdviW8TxzxI+uUFWHQW3HhDlmwIQ6G7lsMxo=;
  b=eBKr6DzadcLU5zFrglJVc12bo0EmMRNZa6JhEXpHW7cBOMmMM8MXG1/w
   vrg0+3aEM5Z2htyR4AbcAUAeGqO/Mm+yAROrnsaKmR8KzRvO6jnO0wR8S
   ALn+8qfPuT/GATPxeJcE5vMIAuIF6hVO5FKqXGAzMmomwCZu4L6WlDaIM
   jN3RbASulFnIQCWr9C5UuN0uFLvG7ZPDVuV5bG8Z/BShdaZJPCzUJeIrs
   Ivinz/5aqyC+fe86LH7YcwWwBm5viO43XaRFfw9O31bydiPY/gnzSB+fI
   Kz/fuJhlp9nb2NLHQF/mUz6e/sgF18rvZI13rJ4/ZqiiUvhUQl6ePs/H5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755761"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3755761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 14:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="38432916"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Feb 2024 14:03:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 14:03:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 14:03:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 14:03:08 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 14:03:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsWUP/4QkJBX1Vv8DXurhOy00+Wpl7PUBbABo/wT7I/VbHifleYduagLIk7viO8i7VEefl0R1P9brWAyk94cPfRjJoufdwG0yNYbv3RLAdOneW00N44dEQwHOWSvYdiHql+TgbgX9X7Q2AqYzuFDEjkM8bx15fKFgxXbdbE9N4CYuR5O1YB1e3QsHmUCQ/jouERjwussDnUk+4f+Mb60kB2YQ2ipJGDOs4YKdSScgY3UnSz/TeZXBQ5n11uF0GKC5hGWBV7iWgyjMY80ybV2d+e/C5kOf6O+C9YED7xyo9GkJxqfFaLcuZVX6PYEAmzM65PUXlRHR4HQKdFUR48wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze64DGQvdviW8TxzxI+uUFWHQW3HhDlmwIQ6G7lsMxo=;
 b=X6kFW0eIbTr9kWtrYzMs8p+p4iQp8L77zlItYuh9sdBfhMpKwQKkboGjW4hbPVtIotTQ8u3gd8sArSGqDwPh/ikEmP6Xs9xQ5GHIzmURnECJMY863YuV2v1IIBHwK1Mo5oYNTuWUpik2RGlNjZekxM5Z3t97OpOtpAf4hZaVyzqOD0fITufPGKLHN6GzIxNhhOsbiPmMBH9dJ98/GnqOArD5pA1GNO2XEP7+345QqIx0FIxmQP8y3i7MG0GTLJmd8/tXZQusCefQfATBHDbM0V9t/r0NVO+776G1g8AkAYqT4G5pHURDzN9wL156MAoQLBspY2ZV8ETU8onBKW5k/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 22:03:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 22:03:06 +0000
Date: Wed, 28 Feb 2024 16:03:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, <dri-devel@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>, <io-uring@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <mhi@lists.linux.dev>,
	<netdev@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
	<ntfs3@lists.linux.dev>
Subject: Re: [linux-next:master] BUILD REGRESSION
 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
Message-ID: <hi5aznnmjnblxth6zov7cqen7c3gx3trdrzd5eyopudr2idsmu@n3wjzv27na6o>
References: <202402290145.QdPSD3XP-lkp@intel.com>
Content-Disposition: inline
In-Reply-To: <202402290145.QdPSD3XP-lkp@intel.com>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8b23bd-5644-4eba-52ed-08dc38a90ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24x9qogm1sh3KVEKP8GWDCPKTBdFFqDc40pMcUnROPXpHc4J5aCfeFeb3b1FHlfr9JfZ07EhZ9x94mqmIwu3GUB7nph5kyCFuKNAWHSX+wYpxbQBm0CxSx1far3pLw5kibD0V9PqLzyvmXoYJLed4/vs6N2ve4ZLsgs0TC8Uh2oXZ6ZlcdfUyCv/uDqG61O4gWvBjvgYT+chcV5FpjCK1wTf5uPZoZ8GNcyyqzwII0Rx1Cak8Sv8YzUjB93Tba1U0ixnsxslxbPFICfhK5AO8nl8XwhwpLwVPLf2VtjxQfwWIvPdQfI1IEHoSZCmBd9owJONJiE3ErgVcquF9r+nb62LeXK+gTcuw/As2O79JxTJqvkY+c21SFBK9s0jivcHnGpT4wtKNFdHxyKiedQ+x9/TXktGmNBvpgbkdGOpHZEGhrw/GFcHv5VTMt7OnplBLkBhePARefc5U0y6ZG+Gv3w0rVRiPsk9XEBsCvQexDazZxkXG5M/Q9IFffuI/eLcnEFPHfqAsJ0UJPjbxwRWqy0/7+QBrZOUPEJVqz34wHBqBqbrLwVUXpSqDZG9dmsjPddCMDEoXCMwfhuoySK3LkqyJsW9LRFEMr/7+3k+OS9HTupHs6g6ick176rWUEpR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0eoCi1EEuKXZTh/GMbUTLSl2RAvaaHkneYG7MAQpb2mITXOYNVjSNls+b3Hq?=
 =?us-ascii?Q?NhlSG6CfdN8YU7lsgToAgG/tT3xKXbtITpJ4XhryslZP9o0rJAJHjn8mrvkD?=
 =?us-ascii?Q?W/S9yPcIdE2pw1U1m4k7tuWOqtURZwUY5eacHVEmLkieoF6ZYVdRBt4w4e/l?=
 =?us-ascii?Q?/KTVf7uhPWwZGj6pDzwkoKjtnKUYl3ztAJX1Ejv4XyKDB/UaOhcLMOfqwI50?=
 =?us-ascii?Q?sA9H5qKSa6iEfHycEAXYnjbYT11u1DhRiIJHAmLEbHt5GIF14A22cTNiXzyu?=
 =?us-ascii?Q?mZxZRbJ71faKd8koP6TvMP2PNqWQ/WUMeLW510mcPeR+bU5C5x48kzDiT0Z1?=
 =?us-ascii?Q?gANgxHdh+jFIrIq02UvmWe8hCbjuZVbmOV2qgQb0zXaS66BDOuHgRsk+f3hX?=
 =?us-ascii?Q?bRtVcg+4SMY6pZpOw/Ej0sSPjGGenjYbKrZ6JLjLzj6bT9pDMT97WWQSJl+V?=
 =?us-ascii?Q?Q2q4EbZFQ2aziDrJ+QIlDnudSldPz+hXAzLQHL6Fg2xdx/gSoIjwEwS3xWRn?=
 =?us-ascii?Q?nvlRmVO0jWeHOdm6K6NodmM/018xOMyL0QhPurwuhMUUKGcIFRMHGqtKZjeO?=
 =?us-ascii?Q?OcY4AIGfC34G0HHqdb5sdOIQU0+4mgEeVNfJggoK/vK9L3VfjjvRbZNa74yk?=
 =?us-ascii?Q?dIE78TAy/HfrT82dUeSoN12jzMrz8QJryaKOqzbbzfWXpsldQOQIj+sgX7YB?=
 =?us-ascii?Q?ILcGFs2Pfv3ZT3bJqq+OtysfveD9nqDlFuiOEnBctG55pECbQFuhmsysSFYC?=
 =?us-ascii?Q?t+V1DJaqPwqu/+iStH3JWlLY7OwALoPuZhCuuTdYiS6ryFjSwg8EqWO+LQAS?=
 =?us-ascii?Q?FUGw1Zulv5xZIK/T3hgOU8uREVCGPchH5ogWypvctvfHEf6zGwbn/uiOFFXz?=
 =?us-ascii?Q?k7oqWgiIh1XlKIbtWtTm9AXjY6fr1mOVsTvFS8LygUsj85uHKdL4DNPMYpHX?=
 =?us-ascii?Q?WPT74QgA2qzKD1rGOgXuavbS4YTTZgiYkDcbcJeK2EUPozaPnt5NjMEaYJml?=
 =?us-ascii?Q?3+xBa/kGFfPxP908o6Mz2VJtXCL3JuWTC95WniVPCea3PQu5mVFiOwwBD4Zj?=
 =?us-ascii?Q?ayZIgeki1cQctdVjD7eVvBuLsoG7IbT//BA7TbZxNZypM3Cela/Ud0JOctGB?=
 =?us-ascii?Q?WS6Ho7vaRZAnbaRD4e2cC8nE2U8p3b8pHGH8Cx1uCWrpcS7rCpnu8/Cx8YTd?=
 =?us-ascii?Q?gH03q0vTgtqAMdbGGBXsxZS13qZ9kPiPZPCgpn6PRWD/gP5JW2I3DQTiMvVm?=
 =?us-ascii?Q?Ru/T3bflOLhUnQudD6LC6DMhwiscLwhKgJVFnYS0WzbCYxOpXxvBhJvMpoBf?=
 =?us-ascii?Q?VNTTUMC+T5jDfo0yy/MT8pchs6biv47cSrHD0iQQuYYqBQ2Hh3qa7NmFkCT5?=
 =?us-ascii?Q?e1kW58Bzq2A4Q8tDj2mG2zQRyc6tAvkq9F6tA6MuONQopx7+oQQN7xZP5kg0?=
 =?us-ascii?Q?q4F3af/5SVQxSMchNgSZpnksQNP2SZPuGaRvKKJw7T+C/Nzki6Gcxt8iy0Pt?=
 =?us-ascii?Q?IoXoPXmkrLFHFeu/MrrH47tNeVI0Vv3b7YEDP3Ywhx5PKO36ccEmhQsa5sVW?=
 =?us-ascii?Q?3GxTxjz2Sw2qDRBosNOnWdyykBRzOZvNTrbcz5iagRMG4E4KGU2TjA0Ljnc9?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8b23bd-5644-4eba-52ed-08dc38a90ae2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 22:03:06.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAX2Nk/o5Z+4p/kGNo6Tg9q3cGsQ2/Sz7laMC/2iGz394wGS8OFMQ+r3l91MiKM3ef4zH73bNJiuwgfx07mro4fYLGV0XpiW9OMC8o2MZLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_220319_566031_4A946365 
X-CRM114-Status: UNSURE (   5.52  )
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

On Thu, Feb 29, 2024 at 01:31:53AM +0800, kernel test robot wrote:
>drivers/gpu/drm/xe/xe_mmio.c:109:23: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]

this is fixed now in drm-xe-next.

Lucas De Marchi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
