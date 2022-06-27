Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA8FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 22:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dHPST8U/nSB3Jr2Y/LgxFvI7HNLqUsgHQkYODKYdsQ=; b=tLIXw8PpXtGO1O
	h+dVF59AVWX/iYEj2S57OqwI8CVxh/f/f9BqSoSl5/9Jn90xzjeZrJzTqA1ffixaC75bZyWBmWXKz
	tCgjBL8g+zgjQIYjvspFdRvPjYVgNzJAjg+FcT0cP6DDa3XX2weFr7gvXdY0I+Hh2E1imaXAJt6v5
	PO6gK+WD4GSyfr9AquFH/OR+kQ/ypx79O/OAiI9f21+BJIX6t3mVQP0cZqxfuP3nmL/3Ks18ZUuiU
	8PFR4KJsi1Hw09z8geBpsztYEculwkgRSis6qJZ9sYHV//wpbcK1KrjysGfC/80Ob+f8OaYkeoLTx
	Dh/1IGrzGXjKjmCIQKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xGv-0037Ja-Fv; Mon, 27 Jun 2022 22:31:57 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xGs-0037Hw-Hx; Mon, 27 Jun 2022 22:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656369114; x=1687905114;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cFfs79so5bDyszYGeV34Sx13DSMu8p5hKhG+YTrPg6I=;
  b=n0GKZhT2hafk7Y8txaGMfVAZSWNE4KoTA+5msi2UogOtBawKkTBdmbje
   +GsC64JwCgI/vc2r7g6IHaFBk70n7sekyiPLsYcS5rDwFFamRZeLTT3rc
   MG66bsCUqWQeuMM/dNJLxy+xXX7lk8sYiVx3mwdYelEoTX/xwuGPphezn
   u4RR/cTfFpKFLnR6pF/AACOK/wVDuhKDrpf4Imd7Z+iGeZCyJDKGhTr33
   GzHpvK4UtVM4e6w1h7H0kHRJO9+HnB2PC8hMjGXoCcKNkJewm2HoFt87P
   oULLjY9VoENN/JRoBQajMpb23qB3hTYbOlPY9PlaI5u9qAOdEjNTLQOmC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="343266019"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="343266019"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 15:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="594502569"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2022 15:31:49 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 15:31:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 15:31:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 15:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgbRU5ZSJ+1Njs1Ls5+mrC2TiMXDi6j+q1nXEW35T0vgGO9W6aK0KqFw8sLIpVNW5OEYewvET37n7OLnzZJzrdoAPvuBbKl2gKhhbMESYILsmLYunOjlbKIBJepwvrBGTXlteBN4XqKcJA3F5ktTDOcARc7D/BEWm1ouxrRANeHu7u58sV/HAAoNgfi/egYKuQLeez6w+8vyf6/t3bVzALpXu4HHE9Zu0zqEJk2ju0blX3YtecrfUxzHj/CVnr40PS3z1w1ZMy8GJZzHL7fpiQznoZJDug/Y+NOh43a03VPTMQQvWz4AoCcRi+x91siT0uSwWDqDOh7397up6lUgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk+tjoSHkPKT19HAXvoo/zCR1SLEsyiUuNU6CruvzGM=;
 b=QI0iafA/bjqr3Gx/f278cS7Oe2x/WkoQMqIGtb6F5Dxfd8KGUdN0WY+LZsBdW5DuG/IkEiGDaJLunvc+wYSbILqxZb12Aer3pTYr7w8s46PErQpET6TL3qYW29h2Ov9/EnK7F8GH22u1w5GbZgtfq5oQQYIpUatlbQe4GzlKUmVSPR6hRnIesSOW9Vyo4AYmxRthVk7LvEDo8N/e0qC5Yke05/8T1b32FiLPtXodGmdngB9bhvjeeKmMTiW3Gs6/1vEACeKhtxeUnT3KCN0/cetAqByvXQUerrK00rSjds9UgCkj018UeCPxBTH+mSq7QbJmqLlZKctqU5S1D0VuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by MN2PR11MB3615.namprd11.prod.outlook.com
 (2603:10b6:208:ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 22:31:46 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::f50c:6e72:c8aa:8dbf]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::f50c:6e72:c8aa:8dbf%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 22:31:46 +0000
Date: Mon, 27 Jun 2022 15:31:42 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook
	<keescook@chromium.org>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <dm-devel@redhat.com>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <kvm@vger.kernel.org>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-btrfs@vger.kernel.org>, <linux-can@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
	<io-uring@vger.kernel.org>, <lvs-devel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kasan-dev@googlegroups.com>,
	<linux-mmc@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
	<linux-perf-users@vger.kernel.org>, <linux-raid@vger.kernel.org>,
	<linux-sctp@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
	<target-devel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>,
	<v9fs-developer@lists.sourceforge.net>, <linux-rdma@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	<linux-hardening@vger.kernel.org>
Subject: RE: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <62ba2fced98ed_103a0e29448@dwillia2-xfh.notmuch>
References: <20220627180432.GA136081@embeddedor>
Content-Disposition: inline
In-Reply-To: <20220627180432.GA136081@embeddedor>
X-ClientProxiedBy: MW4PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:303:dc::23) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09857533-95a6-4ce5-821a-08da588cd147
X-MS-TrafficTypeDiagnostic: MN2PR11MB3615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8QxY2dRCssS1nOBaKo6XXukRWcQnmTJH2CTvS1oBWI5m88TdZyePC8+8Y0lOy5CTi+gHMca0W8aiZ/N99wYfzWDT4IwVc4nlPrt+m+R4p2eDFjRwAp5zJ0VpYLntAd+8A00LZQoJik2rjbu5yVMxLfzdAE/sViq6QR/ukrAYU6UH00hT/qjTfq5KJ6RNmBJjkE9wR8YlchdCVQfclNLDMwBRKAceVhlApanN3Kun5MvZcVR3nAEDzee42+78vAUhiTD75bcuXHURf9mM6NWettdBNB+fgoFRuSIfNbpFulswaXgt+/W3zFI5GI6s+IO6P7PaIkaHL5ETfxVXF7R5o8CyVUDydZpe+Wo6FiGJLus4dot7TeZ2i7BumDmuP2aPbFZpX0GbQZu4hursUXqRwE2dMGw5Mf+B4E0s5mE8SNKEUgUaTQbQGCJ+39EGCF8oMg/hVKoYY9RhxhEhjLKAozVDeQ4YIGG0uJOByhFexDi/CUzss4zWm3FPSVVNx4WelTO8Eiasy/iNjTp8PznOSLGYIo42iw/Hjo++nvz4kH45aIuzAYBtK24nNuwNzMbw4sZoThoJKGKwgdXb5MUKX0VZNuO4cSKb3qG94N5aRCJ56Wdc/+RlFCaggvApnHVcVb8WZ2tBa7ELxVh5io/heAz/fk/UX+HQSPPeKz2L/y2wd5VLtSoLAK+t2RnWXIknFIHsQEtJpjJCc3Z5XS3bsdpx9Mhe7/ar6cHw6C6qj10wOiolEM6AzvfHFUUlo6+4Fm/bKWXrtwiCf23irh7lEh8H2PSKKbYuEuqvEmBbfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(346002)(39860400002)(366004)(6666004)(7416002)(6506007)(41300700001)(38100700002)(8936002)(83380400001)(66946007)(66476007)(7406005)(66556008)(82960400001)(9686003)(26005)(6512007)(5660300002)(6486002)(110136005)(478600001)(8676002)(966005)(2906002)(316002)(4326008)(186003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG81TEp2bjd5Ui8vcXRBOE1oT2o4aFh0aE1Ma1hEaHNzOWFKMEpVOEdjc0I3?=
 =?utf-8?B?SWNnYkVSZ2gxcDgwU2twTjF4ZW5PbFcwZHpEZlc3WnBtOXhsVUNMcVhTb2hw?=
 =?utf-8?B?Z1UvTFZkSXdjc3lZU1JpbGhXSDExS2RTcUhFanJHbitxYk5nSzB2TitnUTB1?=
 =?utf-8?B?d3Npa2lreGhFanpCS2Z6WGhuaWtsYldmWXB4eVAyaE9lSG5JNHV0SG9FTG40?=
 =?utf-8?B?elVLZEpIUWZ0K0ZFamlxcHU1Qmw3T1J1VU9CK29Ib0VzanNEK0xad2VyeFM5?=
 =?utf-8?B?c1dUZzh5RE9UR0Y3Wk1mOHpMdS9FUjRTU0VKT0ErU0tGd1pvdng5Wk92WmVP?=
 =?utf-8?B?aGhLVHE5QitoeUVFSmRYd3I1UEJVckw5SXNobnQ3VkNFYzFGM0VWMjR6NHZE?=
 =?utf-8?B?MW5hbUVZR3Q1TGRXQnRIbEYyU3BuRHRzbjFoN25iQ3ZsRkRwTUNiZWpLRGwy?=
 =?utf-8?B?dUlDcnNJZlRWNjZqYzNJY1RPQnhEWTJMN056dkJtK3FMS3NNL1paZ1dtQXQ2?=
 =?utf-8?B?c2toU3JpelZQMm1yVkNiTnZReUROU2thMlN0K3ptc3lqSFpGQTc5dFZ5ZkZH?=
 =?utf-8?B?M1dRNjhzT1NSOHFBRm9lV01xSExNeWJmM0d3L3hoVXNZSVc0N0dTZ1RKSnBZ?=
 =?utf-8?B?T3l5WDhrTlVZTWNYZHI3U2V3TFFTc1hKUGxZTXFNVm1Ga2hFYTNnZmZCcWZV?=
 =?utf-8?B?d29rZjJmN2NUbGh0Y29KR2hBUkdIRHpJc2FCRHkzZjZiMkJMRExhRGtPOWZK?=
 =?utf-8?B?N3VjaFU3aEpNZHFnUC9qY0RJZGwwcUgzT2crTlVnWHI3NEdGanZPVTlna1NY?=
 =?utf-8?B?ZWdsU200UjJWTVBSWW1ENTRUWTFVMmFSbDliV0FTVlJQRCs3UFI2L0JRK2pH?=
 =?utf-8?B?Z1NWQjZGdFh2aGg0ay9FV1paWmtram9tK1M4ZzgwN3h5TThkNis1bHVXTDVP?=
 =?utf-8?B?czlJK1NnR0tNcDQvOXJrdnN6YnEyRHkyNzdiMzA5SWhGV0J0a1h2Q2poc2F3?=
 =?utf-8?B?Ri9DYkJjVm9nQWVjME1ndnFtT3Q3RjFyVEVDM0U1VFd0elBCRnlXUHJWR3Zx?=
 =?utf-8?B?S3kzV3dOM0NqSjRnOUVWdGhTN0hnbTRBOUpnT3cwc3hhTkZEMzBNbkpzbEtJ?=
 =?utf-8?B?Vm5lVE0wbUN4UEdlTHBVWG9QdzRobWdCWStjb2QvcGlPd1JhUnY1UUtHcUUx?=
 =?utf-8?B?blp4NGRWbE5SYTRrRjN1Uy80ZWJoZXBvdnRDWFpMNTZBU2NCci9McTlMelJC?=
 =?utf-8?B?VTlHaGR3cGF5UlEzR3BrSVdRalM3TnJtMXhaQnBnSXNISE9aL1lHS29qQ3RV?=
 =?utf-8?B?dFd6TytkMkVUNmNMa0Z5eHBOSGJ2UXVoZFR1dHdXemhDK29MWXBBQkowaUta?=
 =?utf-8?B?NGVZZnZmOVBaK000TUQzWXk0eG1SazBONFVrYjBuVWcrdmJtK0lQSU80RGpD?=
 =?utf-8?B?YlIwdFZvcTZIMmdyK3diQ25wRWgvV1kzZkZ4U2VyYS84eDBhZHlCYkVPbngx?=
 =?utf-8?B?VUt1WHc0NjNqR0dWM0dEbnZ4cXVscHVlOEF2V2w5Vkw0UnVrNzVjL0h0a1oz?=
 =?utf-8?B?TFlFWWhIWEI3eXFVczlqa2Juc3JZVUZ0ZUtIbHhXWGV6bkloMmw4TXVXK2hm?=
 =?utf-8?B?UDBYQjI4TVB4QlVlcDRQclZ3OFBoeDVPTTNGQnVIZ2VmZE9zcXA0M3M0cHVv?=
 =?utf-8?B?dHRETGgzWFRSQTd1ZHVkRnJiOER6WWFMb2RJbWF1T2RzYXQ1YVd4Zmh3RkFZ?=
 =?utf-8?B?M0NTTVlTdEZmT1FDUm1KRzMwZFh1SWJGMlF2SXpJUmFCTmpEN21jWU90TTNO?=
 =?utf-8?B?OEVTa29FempFTmpYeFdFMTkxa2hrL3hSWUtrUldHZUhxVTRIZVQ4WlhwUUtn?=
 =?utf-8?B?YS92UWZzL21Fc09vRE81TXZaUngzTm93L2tqOENTdHUybUtLYzlPSFozR0NG?=
 =?utf-8?B?VkJZeTlQMHQ2MnVqUEJneFVaNDFEQ3VCdXIvb0dhYnVNcmx4Z2I3dWR2ZWFr?=
 =?utf-8?B?U3FFVHNwb3VmbWxUMUY4TFFCTURWcE1hQmxVUlZzNkJaT241OEJ3Zk5vS2tw?=
 =?utf-8?B?ZlZEU1FmY3BiaG9iUDZIS0lPK1FVTnZOSVU4L2h5bE1qaXZ3ZWYrdXBtMFVw?=
 =?utf-8?B?N2RnT3VrY0Rkc1VYM3BIamw2bDJ1TnRabHlKcXdORXhocDlnWWhBdlBuc0FJ?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09857533-95a6-4ce5-821a-08da588cd147
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 22:31:45.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tff1Ajm5j5IjP8nC+pmHruh1VBM1HYz+iFkTnXnCZrfcWvUa1L/3YXcaJpJFmczORKhoOnLDiSvurI/2Snl4amoFHffRXHppNmqfZrAlNU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3615
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_153154_740433_9D42659E 
X-CRM114-Status: GOOD (  16.57  )
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

R3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0
aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNh
bGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJu
ZWwgY29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFd
IGZvciB0aGVzZQo+IGNhc2VzLiBUaGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVy
by1sZW5ndGggYXJyYXlzIHNob3VsZAo+IG5vIGxvbmdlciBiZSB1c2VkWzJdLgo+IAo+IFRoaXMg
Y29kZSB3YXMgdHJhbnNmb3JtZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOgo+IChsaW51
eC01LjE5LXJjMiQgc3BhdGNoIC0tam9icyAkKGdldGNvbmYgX05QUk9DRVNTT1JTX09OTE4pIC0t
c3AtZmlsZSBzY3JpcHQuY29jY2kgLS1pbmNsdWRlLWhlYWRlcnMgLS1kaXIgLiA+IG91dHB1dC5w
YXRjaCkKPiAKPiBAQAo+IGlkZW50aWZpZXIgUywgbWVtYmVyLCBhcnJheTsKPiB0eXBlIFQxLCBU
MjsKPiBAQAo+IAo+IHN0cnVjdCBTIHsKPiAgIC4uLgo+ICAgVDEgbWVtYmVyOwo+ICAgVDIgYXJy
YXlbCj4gLSAwCj4gICBdOwo+IH07Cj4gCj4gLWZzdHJpY3QtZmxleC1hcnJheXM9MyBpcyBjb21p
bmcgYW5kIHdlIG5lZWQgdG8gbGFuZCB0aGVzZSBjaGFuZ2VzCj4gdG8gcHJldmVudCBpc3N1ZXMg
bGlrZSB0aGVzZSBpbiB0aGUgc2hvcnQgZnV0dXJlOgo+IAo+IC4uL2ZzL21pbml4L2Rpci5jOjMz
NzozOiB3YXJuaW5nOiAnc3RyY3B5JyB3aWxsIGFsd2F5cyBvdmVyZmxvdzsgZGVzdGluYXRpb24g
YnVmZmVyIGhhcyBzaXplIDAsCj4gYnV0IHRoZSBzb3VyY2Ugc3RyaW5nIGhhcyBsZW5ndGggMiAo
aW5jbHVkaW5nIE5VTCBieXRlKSBbLVdmb3J0aWZ5LXNvdXJjZV0KPiAJCXN0cmNweShkZTMtPm5h
bWUsICIuIik7Cj4gCQleCj4gCj4gU2luY2UgdGhlc2UgYXJlIGFsbCBbMF0gdG8gW10gY2hhbmdl
cywgdGhlIHJpc2sgdG8gVUFQSSBpcyBuZWFybHkgemVyby4gSWYKPiB0aGlzIGJyZWFrcyBhbnl0
aGluZywgd2UgY2FuIHVzZSBhIHVuaW9uIHdpdGggYSBuZXcgbWVtYmVyIG5hbWUuCj4gCj4gWzFd
IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+IFsy
XSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjE2L3Byb2Nlc3MvZGVwcmVjYXRl
ZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMKPiAKPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvNzgKPiBCdWlsZC10ZXN0ZWQtYnk6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjJiNjc1ZWMud0tYNkFPWjZjYkU3MXZ0RiUyNWxr
cEBpbnRlbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2
b2Fyc0BrZXJuZWwub3JnPgo+IC0tLQo+IEhpIGFsbCEKPiAKPiBKRllJOiBJJ20gYWRkaW5nIHRo
aXMgdG8gbXkgLW5leHQgdHJlZS4gOikKPiAKWy4uXQo+ICBpbmNsdWRlL3VhcGkvbGludXgvbmRj
dGwuaCAgICAgICAgICAgICAgICAgICAgfCAxMCArLS0KCkZvciBuZGN0bC5oCgpBY2tlZC1ieTog
RGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
