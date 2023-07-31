Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80908C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3+brkiQpG33LVSuef3lTbRq0Y/z1yMY/fEDgXjqaUU=; b=F1wJ09tjhsueWe
	X5r3vBwUqav9IQVM1QHeuHLyDdVzTSl+N24+BTgmBOG76C7QyiHZCCWjrcgHvPKV/mxVvBQMZ95Q7
	NQWCep/Qo6MsniCsq2ydy/bwKdToTySgWhmeGM07mLZdcvNUYt5mExDbkNCqkmQikdScOR5lWd/Rd
	X+QZ/RogpMdN1EOnkwDSQ8VsEpHXv0gNWVlUc8fH30xr8HxHf+WSPac0bHxmidXlico5D++UYrcXE
	hYGtpsE1r3u8apn7YNxlsYHfgcRNFixTlfQbNurz4iTYVq6LCR6ypqf4NmdwYSZ2urWPfNlv8s80A
	YRFQpTK5yMcl5lSnT6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOFw-00EWoW-01;
	Mon, 31 Jul 2023 08:27:56 +0000
Received: from [192.55.52.136] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOFs-00EWnK-1q
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 08:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690792072; x=1722328072;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o+EmPEAl8uUb/cuGSBvqDpyyyAoNiP1mIGhLhT6Reog=;
  b=BrcGbzhb0KL/QaYdSFFqrNYF7CWXq/ZHvvdIh0psOWDv45Px2KW+GIqo
   tiAp/YNvugJtSmxh36nRTorA6LsqKT4L7Szfb+SmY322vSEaO0CBfjaXk
   TXYSt1JPuRmzqKCDTiG8jeTCPAyDKEjSUwQdGrT7wItnelqHyaYZq6o/t
   6jDcvkYp8ggwiVkdUMFDkPQdJuvJNBo+7XQQQwgQqi9h+t3uHOCC4srFC
   b8CTCbsnDklga9eOtcYQdI1N69E6iyIPOK0Axfs916NRQP1lC9Qg0Um6n
   J+szbkqmS8RVkzr6mR/e/8kT1GSfqvmP/DRouM9ujM/izVImij1OrUnXu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348554281"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="348554281"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 01:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678223599"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="678223599"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 31 Jul 2023 01:27:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 01:27:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 01:27:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 01:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/9h/uHCan8Pxfcr3WeG7JGbEqxq4IKl6BBZdlhS6mtQJkK9R8EwMUEorXVjqMnuLN4Tjo0H1B911xxitC8o7WtNP0B0KRMDU4HGwnesMqN0Kptwh9dQQtWN3U0RHE88vQBVbBucX0CwI1MDlpguRyujhTeCTRKakPFygrwkH8YfG6tzdpYCaGrz8w4kEUGgGdtZlJobMPsk4vGWr3OykXS+yb5JQU3BmMy2RsYuJfRtp6PNNs19iWqWi1qjr0s/TdVdQN/q5dy53aZC+6HZCC5SLHrVpjWHnENQ090S3duSaMvR2z+mcvRTzkOqyma/0vfe9cMPCiAnjsBNk2InPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+EmPEAl8uUb/cuGSBvqDpyyyAoNiP1mIGhLhT6Reog=;
 b=GsoKHkzZJYumjkRGY1S1XMEm1s49NbLD9m+9dxEW16xzq3TcxhpcdbpRaEiRqxiu1RQElJk6EXWHI7uFy4943yKqjmvLyPOec+ej++RYS0hwU5EGwq8H3x6viXcVrH50ndmrf0Vz9R0NKd16UaZ8/eMcJXddoqpfXCbvL+nsVfDoSKrjf3hRkygHFlfcU8viGgtmJvUgE3/wjsosvVo+QMw1rMGE0llqIj3qADaes//BuBvhZwTMFB+Zt4NwENv1FVMkzR+q0EA/VB9jUZhJnb5OMFCuSSD7+DnTeHlqak0X9W9a8bWAcEDE894i3GBQJE5S433wFcNCcbXzicnjug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 08:27:44 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%7]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 08:27:44 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, "Michael
 Walle" <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: "Winkler, Tomas" <tomas.winkler@intel.com>, Zhang Xiaoxu
	<zhangxiaoxu5@huawei.com>
Subject: RE: [PATCH] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Thread-Topic: [PATCH] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Thread-Index: AQHZw4fut2wB9432VkaVIyBRr0R/F6/TialQ
Date: Mon, 31 Jul 2023 08:27:44 +0000
Message-ID: <CY5PR11MB6366441D6777C577032AE77FED05A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230731082029.762385-1-miquel.raynal@bootlin.com>
In-Reply-To: <20230731082029.762385-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY5PR11MB6161:EE_
x-ms-office365-filtering-correlation-id: 914ee1b9-42a2-472e-282b-08db91a003ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ap9DPl5T1VA5tJCgIk/hknSz5QAddhgcqeiQDvkts/tas6dLj1r515SR5jjNLQk8MxNdmDWnI2lQK1FPVBCQr+HwtLSvmPStOr/IeHW379vWhpdxho9LttZlP2faJWV0i5ShP/EHXhU2tmXSynmMwFoXgaXg9dQKH/zyP5HKvHq3qDeoXMFw2SJoxKWp7LZgEYMCj3KBUNObhbg0eFVCx7JQlP/p2WbW9kHgJbZ1R44k8B8OmFQ7rZPS2W9RTafMKRsfeO2fuaX0xCNr2+SN+Igoh3M4dS6O2vYpnafQ4Zk/Mx/vFql7Z/b1L+47pPxRYyNG+g+uZlgSbdeXRLzRUQ7i15M3nn+/qLw+ioquIW938ZclAfXTCIU+escx8F3cd54fFIKds7xxYJp2kl3DLNDw/OoZwk+YIVLNel7SWZ2YcnS6gZTOVu9xpkfzP3BzgDYjSQR46zPhZaosZwGwAjIlNNBoLIHGpgDt7foBduxBXN3xU+WRYZoKByJHDqLTL9jJr76lx06MoBe8ZPWcvvMbqRRmwYCTmiLVIDIQQi4KdwkVEUPDOXfW0ddfJBEvu+dBVMkDNeBd0Zy5n7Bj2ezdYWlWZlQouIpAmil4jiEkwge0n+q2iTrUNpevEMCr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(9686003)(7696005)(55016003)(6506007)(83380400001)(186003)(66574015)(33656002)(76116006)(66946007)(66556008)(52536014)(38070700005)(122000001)(54906003)(82960400001)(110136005)(41300700001)(86362001)(66476007)(316002)(64756008)(66446008)(4326008)(5660300002)(8936002)(8676002)(38100700002)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlpLcDJLMXpPTFl6V0VtOTc4Z1J6STBYeTJLdk16SkF0cXVrMm9BVVZOUWlC?=
 =?utf-8?B?cWRlUm9BUHR4VlZob0RRYzNyUVFJV2xKTDgzbG1CclNhSnlpbW9QUEhGY0FY?=
 =?utf-8?B?VkxvQy8ycTE3S3JwUUFlaGxOL0c5ZEtlUjJmSWlIcHFWZ0ZaT2NMUWR5QkZq?=
 =?utf-8?B?cDBUeWNFWFRzNHRSTjl3ZmxObUdNL0I5MkNpZ0owZnhLRThFUDdzbEEvQUJa?=
 =?utf-8?B?V2xvOUY5ZVlaMEhqMldQNGZsdVN0enE0aDNyTkxra2RkSmd5M0o0dzVxRERE?=
 =?utf-8?B?SmorZll0b1dPVUU2bE9kMkVrSTVmOWxXVUwxK0I5VXBQYnJFWUFVUmd4NWhW?=
 =?utf-8?B?ZzIwY2JkM1lVYjlKV3VSWG1PTDBWWXRNb0dld3dCaXBFeGtvZnNMSFdobmJz?=
 =?utf-8?B?cmZHTUh5NENvNlhsbEI2eEdlckorSUZURGhXQkVhRk1HOUF4NTNmU2xuZlcy?=
 =?utf-8?B?dGVsTTJNZWpTNSswM2MyK2htVXhLbVBFeFVnU0lpeHhmbjVxbU9Qemg5WU5i?=
 =?utf-8?B?Q0hDbzF5bGNabUJ2WWU2MFl2eSs4NkVJbTBpbDByVExhTXBTK1hXMWxOZHdk?=
 =?utf-8?B?UHBvMGt6M0VHYnpkajltdC9uNWozMlhtdTAwYksrSWpaWEVGNWI3S0xIUEZP?=
 =?utf-8?B?S0FLcVdsMmpqQW1rTmViOE0vWDBuYWJOZHBlQWVmbjRXbjhXaFB4bEt5Z1pl?=
 =?utf-8?B?OVNHL0Z4ck9QZDFSWDhvVDBJcG5QTXlSeG9GMVRsREJqa3NWa3V5cDY5NDB2?=
 =?utf-8?B?RGoxUnF3UUsrMEdpanQ3aHI2RmNhWkY0Q2RuelZQQVAvbUZjd05GL2Mvc3Aw?=
 =?utf-8?B?byt1WGRsUWpVSUQ3aHVkMWwySFFkd3o2NVhhMXNsS0lLV2pYek5rREtVNCto?=
 =?utf-8?B?WEdaUkcvN280SVhTV1lLdmxXN1ZBSmRDV2pnWXMxSndQeUZtSnJwQmZ4YWhz?=
 =?utf-8?B?R0J1cHI1LzVWRFNwOXZOdmk0Rm1aeXI0VHoyb0MxQ3Ewb2VoQWtJdEVkcEox?=
 =?utf-8?B?Y1FVT3BzeTdTVWdaT1VjbGV2YW1UOXJ4R0t6YlZkRGQ3SnJ6YzZUNy9pd3dr?=
 =?utf-8?B?OEhFc1Z6TjNvMDIxQkpjTzFTWjROcVp0dnJIdGpWTUxVT1JNYU01RGxmdmNj?=
 =?utf-8?B?U3FITi9KZWFnajF2MFRVUUREZkJCdm84WlZMMHhNZnRrTnZzZXhwK3gvMDJn?=
 =?utf-8?B?WUdZY3lFRWtwbHY5MmFOTXNXWE1NOExVUFc1L3lLSVkwMjRyMkptNm9NT1Jz?=
 =?utf-8?B?aGRZUXdjQzlJdUpxSEpWNlBPeE50ZlRwMDFUWGhkOC8rckJRV1F3VU84Q08v?=
 =?utf-8?B?VW52c090UWxJZk5BUndaaUQyM1dmWEF2TDRzeERQbjhlZGlkRW1tcU84Ykd1?=
 =?utf-8?B?RkpKc0pBWVgzcWtQckp3enVJbmhmUUprTGxSNHU3amJlTkpKblQwTks1K2ow?=
 =?utf-8?B?NW1lTllHbnBKTU9kc1NxdjhLQXFhajVJWFoySDRSR1pCZ1dKNTc0aHdxRWx6?=
 =?utf-8?B?SXdJN2R1ZXVRTENnMkZCaEdiYmhVYkVDUGdIazJsT1dtOHdnL09vNm1taW9L?=
 =?utf-8?B?RDZ4UC9FdXY0dkRHYmw1ZWlteHlLZGN2UVZGM3BjV0U4Si9jOHhnMGJFKzBl?=
 =?utf-8?B?azh5eURSYVJlVEhkQVhwZno1WFJvc1VJcVN4YkNHeitIUi9ocndETUF4aE81?=
 =?utf-8?B?SDVxNjdkdlFha25SZ2dEaVpIZ0FzazhIem1xL2xRcDdSVzk3RjZ2VE9hUjVX?=
 =?utf-8?B?c0NuSm94cWkvam1WOW94SU1RYnlpR2hBRXZnUDN4Zk9DM3B0VURNMDZ4ZjIv?=
 =?utf-8?B?YkhFZ3hFME9Fd1BtdWtpQlp3alIvWDBaK3F4TkJhTi8weStZN3B3RENwUUNl?=
 =?utf-8?B?aDhIQ2Z4MUtSNENsY21SdytQZEZCekxwNEZhU2ZqREdBQ0s2MlJjY0hhS2Fv?=
 =?utf-8?B?UGsvUzFLS2tNcWpZZm1waS9nV1R1cC9uS0U1NXlrZjdOV2ttcmxmRWNsQlNO?=
 =?utf-8?B?SlA3UGtCVHdlREFQcFB4ZVBtNHRuWUZTMkN4bXZxNzlyaDE2b2djNVRwTTZx?=
 =?utf-8?B?SFZTMEwvSFlDRy85Nkk1Y2JZZ3FPZEQ1NlowZlpZRjR1ZThXUWlaQnljaFdn?=
 =?utf-8?Q?0cYI=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914ee1b9-42a2-472e-282b-08db91a003ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 08:27:44.5510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euZLttUxAb9zZwt/YDa0kJTpQLfQw0YoP/rI2lqgq1IQh2549etWksUJNlsPNbRld6G07q4NKEg+6lg0cbZAY/P5K3NRA0KEAYnKCYBGZFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_012752_630372_C22A4F29 
X-CRM114-Status: GOOD (  29.05  )
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

PiANCj4gVGhlIGxvZ2ljIGlzIHdheSB0b28gY29udm9sdXRlZCwgbGV0J3MgY2xlYW4gdGhlIGty
ZWZfZ2V0L3B1dCBzZWN0aW9uIHRvDQo+IGNsYXJpZnkgd2hhdCB0aGlzIGJsb2NrIGRvZXMsIGhv
cGVmdWxseSBzb2x2aW5nIHRoZSByZWZjb3VudGluZyBpc3N1ZQ0KPiB3aGVuIHVzaW5nIENPTkZJ
R19NVERfUEFSVElUSU9ORURfTUFTVEVSIGF0IHRoZSBzYW1lIHRpbWU6DQo+IC0gSXRlcmF0ZSB0
aHJvdWdoIGFsbCB0aGUgcGFyZW50IG10ZCBkZXZpY2VzDQo+IC0gR3JhYiBhIHJlZmVyZW5jZSBv
dmVyIHRoZW0gYWxsIGJ1dCB0aGUgbWFzdGVyDQo+IC0gT25seSBncmFiIHRoZSBtYXN0ZXIgd2hp
dGggQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVINCj4gU2FtZSBsb2dpYyBtdXN0IGFwcGx5
IGluIHRoZSBwdXQgcGF0aCwgb3RoZXJ3aXNlIGl0IHdvdWxkIGJlIGJyb2tlbi4NCj4gDQo+IENj
OiBUb21hcyBXaW5rbGVyIDx0b21hcy53aW5rbGVyQGludGVsLmNvbT4NCj4gQ2M6IEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+IENjOiBaaGFuZyBYaWFv
eHUgPHpoYW5neGlhb3h1NUBodWF3ZWkuY29tPg0KPiBGaXhlczogMTliZmE5ZWJlYmI1ICgibXRk
OiB1c2UgcmVmY291bnQgdG8gcHJldmVudCBjb3JydXB0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gDQo+IC0tLQ0KPiAN
Cj4gSGVsbG8sDQo+IA0KPiBBbGV4YW5kZXIsIFpoYW5nLCBwbGVhc2UgdGVzdCB0aGlzIHZlcnNp
b24sIGl0IGlzIGNsb3NlIHRvIHdoYXQgWmhhbmcNCj4gcHJvZHVjZWQgd2hpbGUgbm90IHN0cmlj
dGx5IGlkZW50aWNhbC4gVGhpcyBjb21waWxlLXRlc3RlZCBvbmx5LCBwbGVhc2UNCj4gY2hlY2sg
b24geW91IHNpZGUgd2hldGhlciBpdCBmaXhlcyB0aGUgcmVmY291bnRpbmcgaXNzdWUgd2l0aCBh
bmQNCj4gd2l0aG91dCBQQVJUSVRJT05FRF9NQVNURVIsIGFzIHdlbGwgYXMgd2l0aCBLYXNhbi4N
Cj4gDQo+IEFsZXhhbmRlciwgbWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgdG8gZml4LCBp
biBhbGwgY2FzZXMgdGhlIGxvZ2ljDQo+IGhlcmUgd2FzIGJyb2tlbiBzbyBsZXQncyBzdGFydCBi
eSB0aGlzIG9uZSBhbmQgc2VlIGlmIHdlIG5lZWQgc29tZXRoaW5nDQo+IGVsc2Ugb24gdG9wLg0K
PiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo+IC0tLQ0KPiAgZHJpdmVycy9tdGQvbXRkY29yZS5j
IHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
dGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMNCj4gaW5kZXggMjQ2NmVhNDY2NDY2Li45
YjkwZTFiZTQzZTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYw0KPiArKysg
Yi9kcml2ZXJzL210ZC9tdGRjb3JlLmMNCj4gQEAgLTEyNDEsMTQgKzEyNDEsMTUgQEAgaW50IF9f
Z2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpDQo+ICAJCXJldHVybiAtRU5PREVW
Ow0KPiAgCX0NCj4gDQo+IC0Ja3JlZl9nZXQoJm10ZC0+cmVmY250KTsNCj4gLQ0KPiAtCXdoaWxl
IChtdGQtPnBhcmVudCkgew0KPiAtCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElP
TkVEX01BU1RFUikgfHwNCj4gbXRkLT5wYXJlbnQgIT0gbWFzdGVyKQ0KPiAtCQkJa3JlZl9nZXQo
Jm10ZC0+cGFyZW50LT5yZWZjbnQpOw0KPiArCXdoaWxlIChtdGQpIHsNCj4gKwkJaWYgKG10ZCAh
PSBtYXN0ZXIpDQo+ICsJCQlrcmVmX2dldCgmbXRkLT5yZWZjbnQpOw0KPiAgCQltdGQgPSBtdGQt
PnBhcmVudDsNCj4gIAl9DQo+IA0KPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19NVERfUEFSVElU
SU9ORURfTUFTVEVSKSkNCj4gKwkJa3JlZl9nZXQoJm1hc3Rlci0+cmVmY250KTsNCj4gKw0KPiAg
CXJldHVybiAwOw0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoX19nZXRfbXRkX2RldmljZSk7
DQo+IEBAIC0xMzMyLDExICsxMzMzLDEwIEBAIHZvaWQgX19wdXRfbXRkX2RldmljZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9n
ZXRfbWFzdGVyKG10ZCk7DQo+IA0KPiAtCXdoaWxlIChtdGQgIT0gbWFzdGVyKSB7DQo+IC0JCXN0
cnVjdCBtdGRfaW5mbyAqcGFyZW50ID0gbXRkLT5wYXJlbnQ7DQo+IC0NCj4gLQkJa3JlZl9wdXQo
Jm10ZC0+cmVmY250LCBtdGRfZGV2aWNlX3JlbGVhc2UpOw0KPiAtCQltdGQgPSBwYXJlbnQ7DQo+
ICsJd2hpbGUgKG10ZCkgew0KPiArCQlpZiAobXRkICE9IG1hc3RlcikNCj4gKwkJCWtyZWZfcHV0
KCZtdGQtPnJlZmNudCwgbXRkX2RldmljZV9yZWxlYXNlKTsNCmtyZWZfcHV0IG1heSByZWxlYXNl
IG10ZCBoZXJlLCBzbyB0aGUgbXRkLT5wYXJlbnQgc2hvdWxkIGJlIHN0b3JlZCBhcyBpbiB0aGUg
b3JpZ2luYWwgcGF0Y2guDQoNCj4gKwkJbXRkID0gbXRkLT5wYXJlbnQ7DQo+ICAJfQ0KPiANCj4g
IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpDQo+IC0tDQo+
IDIuMzQuMQ0KDQoNCi0tIA0KVGhhbmtzLA0KU2FzaGENCg0KDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
