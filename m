Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAFAC77B71
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 07:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2SESw0hKz07LZCu2xN+JGBNvgha1PVsdGL7iWqJNOv0=; b=uhyCPJointi9rF
	MuOjvuVd1UCwvfuTiUFlQfiuzUcNIu1igkkpMEO7ZpVTg7w9oeFUbT3sK7D4kP6LNQTnQPs6p/kV7
	7pHw7ngK7DJq6wa0HBySiBeWQZzjnHsR5XTOx4tZQ8yrdgvj5rA+a28hV6+2+LeWObaO3Bevj/3jZ
	SHcBfvbYVNQdwlgtsetd7DeUfimWN6EGt4HTuC93I6efb2cg9d88OsVkiq2c195lC/hU7R/Iuyqw/
	OLlpA9wkK6FB6H0AJWaTjTZVEeujel97Kkgo1p1zQ1qL4YeXfjcnBSciuCfy40FB7vau8e9N2KT29
	tLNlXKfty4SkfjTxaIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pog9n-001EFn-2L;
	Tue, 18 Apr 2023 07:53:43 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pog9j-001EEh-15
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 07:53:41 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42]) by mx-outbound-ea46-244.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 18 Apr 2023 07:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmAD9HjyDbeYJGV61Yx5Zcw/0GPPdUv9uNwsbK05ikfYmiqsxpiLYBtLpM8+WK5wna8hxQ+gGNg8qk3wO03djgDL1j1B6V7RsOz9O42aIndiKHCG+gsPhYF6JtHbRrMSj19InUtIZf+KOD4n8mQOPpPlVY+HXusKhZe0HWcVoRsCQyu4rc4OwnTMHY0Mtp1hFSoFeJ5X7KVMd4mi6jLJm0NzDOAyIass7iWKOOVFWi8uRekmqJxqhPPj9/tD+St9DlTChRX+gF+lyeT6zVGjfWlD8ZjueXZvmdVFR3uGROpoV8aUyewTyFByiiQCNXR5KElT19RjRZcnNnjdlwil6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt9a06u0SkQYILalWyOLVWZOT5pQGy6XoEmc4JdnWdU=;
 b=jrMGhV/uEftX1awdQet4fxQ/WEW0cvI1Yw8pgISFN9qD9AvN0X95FgoZysIO/c6ClKaNoHm07ZrnonYkXe6IDeSvl5NB4seBfTyILR23xO3x9y/CYTCpphNE6DYVYhhWNapc8+jUsXiSZ1LbDOZelrihpQZtJ20c5Znk30RfPlBSQEtOrDsCMKjMYSMRZAcIWKTE+Phoccbn0h3VKqc/cVmFpZJhDrL6pyVLXEUfJJf7XkN1+8k2r9H6tHmx5n3RQ/y3dx5W9yIm0FvuxYqx0Mma8aobRFxVlrHh85tDkNEHHGP0VDScICiV4QqFL2d/tsyxaJLMCmQmJW6GEDetuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt9a06u0SkQYILalWyOLVWZOT5pQGy6XoEmc4JdnWdU=;
 b=oO3ijkxFV4py4V+Ri1dC62we/nV4pXzjDITZD/MFOPW2NKHzceuKtguXjBm0fcwph+vjrQNvi+xeckhEqHyB+TKU05TnCRSQ1GsUhvFXZqyqPas8eAVaw/nQjMONRwc/1qxyFi7V1HRm/e+HJ/PM8BficmpyL936DqFcIxUb/ccGhgzk/Htrqi3Qf1z/8STCoGWaAGdqcE2/sKZIMhQCo/2R4ml/XQU6EQZU5Idr0hnCcAG17mta/q3KK3jBTpuacPv2Lolk/bYDZc8qXFQMMEkGDS7HEzB1wz3C2zbs9NE1xn38ZztVeAzx9wFO3/BOkWuDsjckPurD6fr9WWya9w==
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by PH7PR10MB7033.namprd10.prod.outlook.com (2603:10b6:510:276::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 07:53:33 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 07:53:32 +0000
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: BUG: Kernel Oops in in_wl_tree() with UBI Fastmap support
Thread-Topic: BUG: Kernel Oops in in_wl_tree() with UBI Fastmap support
Thread-Index: AdlxyiBTtkpMCNQ3Q2yY/BV9fl+VgA==
Date: Tue, 18 Apr 2023 07:53:32 +0000
Message-ID:  <DS7PR10MB49268C3812616F173BF44EAEFA9D9@DS7PR10MB4926.namprd10.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB4926:EE_|PH7PR10MB7033:EE_
x-ms-office365-filtering-correlation-id: 4cb5e48a-1b4f-4155-68cc-08db3fe201ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MVPB1Z2gwhvrDvQqFmYHsqEp3jbjQTFHcO1cR40HnyZs8snvwV4tW0aKvWF7pt4K3mx/xVgo5oleuAz6rLNXZFUWD2OmSnouA7RHYrTvSlBkhxJ2FT3vc9FeNOAi9lVybmYx4EzbV+TGJL9uwMbLdaUID2nUpn1aw3nPUHtQ3+BYNiEWhAn5nyMlMN2V3FHerFz+VhrUqIivxOtRNLZVsEYPVzRxOW58lv5wdx30ip/IQ1+/Jq9DOmA/huXNjy+GiAavUcNNoU3y16lE7uVVbNDVVrwjzyfmfY+uKxz5eUAprF6oD2rGgp3/bFigJ+3vO5wmhkgpKDjKSgNxCwbBvPq9zuZejs4UeUvmMeUWCaI5PlaRP+H8JNqcAQrfIrA5XGBHWYvIKMMPAJ6dJsfE2ve8GpP8rHsa4jQVgeW+9cKK4UIhKYiotTzgPrULiIXGex/0C0NbFy0fa1MKxovyKL9JwN3yihahInRvwXyXd/ksoqlqPUL38eAYox4SuVooxGqP90LL32UqAdFsKDBK82l0/9AVuuOD0FRkmlTHCURelaWk/QXopnP6hnvcnTOZs9YXEwZ9igFWes0m3U+cUDENmGZKWSYU7x2sKeMlt5j0Bt7rlqkOetqm+fBnxBb0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(7696005)(71200400001)(2906002)(33656002)(45080400002)(55016003)(38100700002)(122000001)(478600001)(83380400001)(186003)(6506007)(26005)(9686003)(76116006)(52536014)(5660300002)(316002)(66556008)(6916009)(64756008)(66476007)(66946007)(66446008)(86362001)(41300700001)(38070700005)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Tt/XIN2BBGD4yD0KxJPh/DJVPJiCGSx+fwKwwC0svzbR+iXiNyA4zgsaoQt0?=
 =?us-ascii?Q?siZqcgmntJbVVjDkmq013HhtpO/iygx7mjJ1VbMyOLURiLCDvEHXzNAw0UNj?=
 =?us-ascii?Q?3wKCKWHFjR7MNaPjKYmdObAsJYVxaZ9silNhp2PWWDCbiaot3nYja3ri91DA?=
 =?us-ascii?Q?w9Zi82ueqsz1G4HIhwAae/jgEaTPHPYTPooUbzC9oHqrXJeg2Ef+xKcZ40s2?=
 =?us-ascii?Q?jefLcBAkHeiayUCSicwySbuEmsWEGgeNgjaB1VcHucfwPJ6ibljw/YBKWlhH?=
 =?us-ascii?Q?80IVOMExbQBCMpTu8HEsnydbMrlJjKjHgFM3M0Ce/yz3jgzwPzVBd5Lja2Cy?=
 =?us-ascii?Q?I6gvDUGS7Vt6BSz8Q9Hp7B+XmMu4obfnjp6jcA/ipUJaA/w06z2INYtfVlix?=
 =?us-ascii?Q?0KzZKHwKv1P6jWxj/w3zEGToPmJmdKDev7Usr7+BWWsPJSY6+kKqWqasrx1O?=
 =?us-ascii?Q?Q+9xU5GlWJU0fc09ynq40SY03gk55saV9w1m8lLmfOMeGULAYw3yEpVa7jY5?=
 =?us-ascii?Q?s51Ah81rnw0593s5wA/duwVHi8t7hd8MY4rKu8vArtb+3FyiVUbRIRE5z+vf?=
 =?us-ascii?Q?xiRTBmWnxOv5KBVK41/ryEQWWnhzWvaHT0ZiYTChyf9ScjT7DCGeuBBHM3wk?=
 =?us-ascii?Q?TxHL4cG3tI9VSWflK0S78doctD6FfOhvRJfOZUXOQjxBlHN/cyCa/ZxtK8TR?=
 =?us-ascii?Q?V6lp7RxMe5CTiaDYnn7Cn2L7JVQ2BkQ+Slg6EvhsbGg23TwaX5Dm6qCIPS4G?=
 =?us-ascii?Q?WGeZ0zpjdC4wl/ZPpyzLSqEayytfu9Q8bB3jD+5UQlNeNG06b7ONKZgeCoR9?=
 =?us-ascii?Q?BPDqYl0GvAVtQuoSp6stwM0Y9uxqtjO/3JI73qRT/xwWCOxcXshYfC6bs0uP?=
 =?us-ascii?Q?KLoDTecBgSRx9GGPrtVl8S1W77jhKdYg7wKpvxFaCdG53EJKYcbDvYo81d2t?=
 =?us-ascii?Q?A23xZSnk19obB7LrOoicN52HRJhaxKgSJkekpEhhG3MbVs0r6Z0JgaVB18qK?=
 =?us-ascii?Q?2tDo8igdR1MYF6dc4uLaAmD1Sg9GL9Q0A+76v0/CUETBQzN2FBJszq2g+/pR?=
 =?us-ascii?Q?6T1inPoXcC19exkL4w3UfXFxo7wvdgDqlQPYWxxG4WP+Hvcu9j+viMN2fMxA?=
 =?us-ascii?Q?1Br2TycXCPOQ3eedI24A59foIAi1jl0raxagXXg0jojL8ifkXeUA1FMrxnG/?=
 =?us-ascii?Q?HlOAhGW/VZh7XfHmd5V3hVX7T3TB2v7PBX77Jq8vnLs6LRckWVhnR280DnFB?=
 =?us-ascii?Q?yj3oSZyk79r9OvCzMEbDQocSEr/hpjedpgAlrFSQzCvBy4QRbmA+8HQBcBO0?=
 =?us-ascii?Q?OX077wRy0ZzW0e2ZkIH75TSm3VA6SK6i38oFGZmc28wC3H3e3JNYnAjLPWuZ?=
 =?us-ascii?Q?HfSdZzYSdpqfEDQtYN+Jst6J4DkbEHDKXI3KfMJc7z8z58+DoJNGWJIFCY7a?=
 =?us-ascii?Q?9YPH4lhgzJX/2oPMSVu+j2vcQd7VK2P6d2L59dCkWx7SikyJ1i96UV9R4JwD?=
 =?us-ascii?Q?8yTR2+jjP7ktqaiHxrFVvcwKwCgEhUYTVjMOoX1OCQS1kpYLI84UQvYBZd19?=
 =?us-ascii?Q?MWdNBd/hNj0yQRn37/TGWGjVXUTLslDSk01dDaK5?=
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb5e48a-1b4f-4155-68cc-08db3fe201ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 07:53:32.8142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0xny4I2G4/a8F5A48SCzpaiWMb0mYCENU9J8FzB4qbYsPhUqbzM9IX7hqM8mv7YTscHOqYVSntNc8Owln8PYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7033
X-BESS-ID: 1681804415-112020-18468-201497-1
X-BESS-VER: 2019.3_20230414.1611
X-BESS-Apparent-Source-IP: 104.47.57.42
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVhaGxmZAVgZQMCkx2cDSMtHQyD
	Qp0cLM1MAk2cjS2MI02TgtxczcIMVAqTYWAP/JMxpBAAAA
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.247569 [from 
	cloudscan13-210.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_005339_735769_FBB09EC8 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

We are having randomly the following issue in the boot process on Linux 5.15.67:

[   21.552777] 8<--- cut here ---
[   21.555819] Unable to handle kernel paging request at virtual address 42700010
[   21.563033] pgd = b7fa8ea6
[   21.565681] [42700010] *pgd=00000000
[   21.569270] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[   21.574641] Modules linked in:
[   21.577690] CPU: 0 PID: 453 Comm: mount Not tainted 5.15.67-00008-gddf998a73730-dirty #283
[   21.585888] Hardware name: STM32 (Device Tree Support)
[   21.591050] PC is at in_wl_tree+0x30/0xc8
[   21.595019] LR is at in_wl_tree+0x28/0xc8
[   21.599080] pc : [<c0adafa8>]    lr : [<c0adafa0>]    psr: 200d0013
[   21.605355] sp : c2685c88  ip : c2684000  fp : 00000006
[   21.610519] r10: c21f30a8  r9 : c16cdd0c  r8 : c0ce0d98
[   21.615782] r7 : c16cdccc  r6 : c16cdd74  r5 : c21f30a8  r4 : 42700000
[   21.622360] r3 : 7918c21f  r2 : 0000021c  r1 : 78e9bd99  r0 : 00000015
[   21.628838] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   21.636025] Control: 10c5387d  Table: c25a406a  DAC: 00000051
[   21.641792] Register r0 information: non-paged memory
[   21.646762] Register r1 information: non-paged memory
[   21.651828] Register r2 information: non-paged memory
[   21.656895] Register r3 information: non-paged memory
[   21.661961] Register r4 information: non-paged memory
[   21.667027] Register r5 information: slab fsnotify_mark_connector start c21f30a8 pointer offset 0
[   21.675852] Register r6 information: slab kmalloc-4k start c16cd000 pointer offset 3444 size 4096
[   21.684781] Register r7 information: slab kmalloc-4k start c16cd000 pointer offset 3276 size 4096
[   21.693608] Register r8 information: non-slab/vmalloc memory
[   21.699281] Register r9 information: slab kmalloc-4k start c16cd000 pointer offset 3340 size 4096
[   21.708208] Register r10 information: slab fsnotify_mark_connector start c21f30a8 pointer offset 0
[   21.717129] Register r11 information: non-paged memory
[   21.722296] Register r12 information: non-slab/vmalloc memory
[   21.728070] Process mount (pid: 453, stack limit = 0x6379c0ca)
[   21.733843] Stack: (0xc2685c88 to 0xc2686000)
[   21.738207] 5c80:                   c16cd000 0000021c c16cdd74 c0679238 00000000 0000041b
[   21.746408] 5ca0: 00000006 c0adaedc 00000870 0000000b 0000000b c16cd000 c2745000 0000000b
[   21.754608] 5cc0: c21dbc00 c260c640 00000006 c0ce0038 00000000 c0adaedc 00000000 00001000
[   21.762808] 5ce0: 00000004 ce273000 00000000 c16cd480 c220c000 000007ff 00000006 0000000b
[   21.771009] 5d00: 00001000 c220c000 c260c500 0000000b 00000001 c0672800 00001000 c260c500
[   21.779208] 5d20: 00001000 c220c000 ce273000 c03d5f00 00001000 00000001 00000000 00000000
[   21.787407] 5d40: 00001000 ce274000 00001000 c03ee740 00001000 00000001 ffffffff ce291b04
[   21.795505] 5d60: c260c500 00001000 ce273000 00000800 c220c000 00000001 c220c000 c260c780
[   21.803705] 5d80: c220c890 00000000 c0ca6c8c c220c000 0000000b c03debbc 00000001 c03dda34
[   21.811905] 5da0: 00000000 00000001 00000100 c220c000 ce273000 00000001 ce273000 c260c500
[   21.820106] 5dc0: 00000000 00001000 c260c780 c03ddca4 00000001 00000000 c220c7dc c03eca68
[   21.828305] 5de0: c0d3329c c220c890 00000bef 00000000 00000000 c8603012 c220c000 00000001
[   21.836506] 5e00: c220c000 c260c780 c220c890 00000000 c0ca6c8c c0ca6978 00000000 c03dee0c
[   21.844704] 5e20: 00000032 00000000 c03ea97c c220c000 c220c6ec 00000000 00000000 00000000
[   21.852903] 5e40: 00000000 00008000 bec12c90 c03d3364 c220c6ec c220c000 c24d2400 c0ca5834
[   21.861002] 5e60: c24d2c00 c24d2400 c24d2400 c0248d14 c2685e90 c8603012 00000000 00000000
[   21.869202] 5e80: c220c000 c24d2400 c220c730 00000000 00000000 c03d4610 c247c640 00008000
[   21.877402] 5ea0: c220c000 c24d2400 00000000 c03d4768 c220c000 00000000 c2751900 c03d46b0
[   21.885603] 5ec0: c2685f84 00000020 c247c5c0 c02802a8 c2751900 c2751900 c2685f84 c0248b20
[   21.893802] 5ee0: c0c8caf4 00000002 00000000 0000000b 00000000 00000000 c2751900 c026fab4
[   21.902003] 5f00: 00000000 c8603012 00000000 00008000 00000020 c2685f84 c247c5c0 c247c580
[   21.910201] 5f20: 00000000 00000015 bec12c90 c0270590 c247c5c0 00000000 00000000 c25c7000
[   21.918400] 5f40: 00000000 ffffff9c c2685f84 c8603012 c2684000 c247c580 c247c5c0 00000000
[   21.926499] 5f60: 00008000 00000000 c2684000 00000015 bec12c90 c0271154 00000000 c8603012
[   21.934698] 5f80: 00000000 c101acd0 c1c275d8 c8603012 00000000 00000000 01877388 00000015
[   21.942898] 5fa0: c01002a4 c0100060 00000000 00000000 01877388 01877398 01877358 00008000
[   21.951098] 5fc0: 00000000 00000000 01877388 00000015 b6f5d138 00000001 b6f4450c bec12c90
[   21.959298] 5fe0: b6f5cfc4 bec12af8 b6f2c8cb b6e9eb5a 600f0030 01877388 00000000 00000000
[   21.967498] [<c0adafa8>] (in_wl_tree) from [<c0679238>] (ubi_wl_put_peb+0x224/0x3e4)
[   21.975216] [<c0679238>] (ubi_wl_put_peb) from [<c0adaedc>] (ubi_eba_atomic_leb_change+0x198/0x234)
[   21.984240] [<c0adaedc>] (ubi_eba_atomic_leb_change) from [<c0672800>] (ubi_leb_change+0xbc/0xd4)
[   21.993170] [<c0672800>] (ubi_leb_change) from [<c03d5f00>] (ubifs_leb_change+0x64/0xf0)
[   22.001287] [<c03d5f00>] (ubifs_leb_change) from [<c03ee740>] (ubifs_recover_leb+0x2c4/0x558)
[   22.009801] [<c03ee740>] (ubifs_recover_leb) from [<c03debbc>] (replay_bud+0x508/0x600)
[   22.017812] [<c03debbc>] (replay_bud) from [<c03dee0c>] (ubifs_replay_journal+0x158/0x3c8)
[   22.026024] [<c03dee0c>] (ubifs_replay_journal) from [<c03d3364>] (mount_ubifs+0x430/0x944)
[   22.034439] [<c03d3364>] (mount_ubifs) from [<c03d4610>] (ubifs_fill_super.constprop.0+0x110/0x1b0)
[   22.043456] [<c03d4610>] (ubifs_fill_super.constprop.0) from [<c03d4768>] (ubifs_mount+0xb8/0x160)
[   22.052473] [<c03d4768>] (ubifs_mount) from [<c02802a8>] (legacy_get_tree+0x24/0x48)
[   22.060185] [<c02802a8>] (legacy_get_tree) from [<c0248b20>] (vfs_get_tree+0x24/0xe4)
[   22.068101] [<c0248b20>] (vfs_get_tree) from [<c026fab4>] (do_new_mount+0x164/0x2f8)
[   22.075813] [<c026fab4>] (do_new_mount) from [<c0270590>] (path_mount+0x154/0x814)
[   22.083418] [<c0270590>] (path_mount) from [<c0271154>] (sys_mount+0xf8/0x118)
[   22.090620] [<c0271154>] (sys_mount) from [<c0100060>] (ret_fast_syscall+0x0/0x48)
[   22.098224] Exception stack(0xc2685fa8 to 0xc2685ff0)
[   22.103194] 5fa0:                   00000000 00000000 01877388 01877398 01877358 00008000
[   22.111394] 5fc0: 00000000 00000000 01877388 00000015 b6f5d138 00000001 b6f4450c bec12c90
[   22.119590] 5fe0: b6f5cfc4 bec12af8 b6f2c8cb b6e9eb5a
[   22.124662] Code: e5944000 ebffe4c3 e3540000 0a00001e (e5943010) 
[   22.130821] ---[ end trace 2c44dae2ebc3130e ]---

After investigate the issue, we found that this error is related with the UBI Fastmap support (CONFIG_MTD_UBI_FASTMAP) 
and happens when the function ubi_wl_put_peb() is called twice with the same parameters, below you can find a debug messages when it fails:

[   18.473879] DBG: drivers/mtd/ubi/eba.c on Line 534, check_mapping(): before ubi_wl_put_peb() Called from ubi_eba_read_leb+0x7c/0x478
[   18.621978] DBG: drivers/mtd/ubi/wl.c on Line 1253, ubi_wl_put_peb(): INIT --- PEB 897, lnum = 4, vol_id = 4 --- Called from check_mapping.part.0+0x1d0/0x298
[   18.636282] DBG: drivers/mtd/ubi/wl.c on Line 1253, ubi_wl_put_peb(): INIT --- PEB 897, lnum = 4, vol_id = 4 --- Called from check_mapping.part.0+0x1d0/0x298
[   18.773852] DBG: drivers/mtd/ubi/wl.c on Line 1296, ubi_wl_put_peb(): inside else, erroneous_peb_count=0, free_count=1048
[   18.807695] DBG: drivers/mtd/ubi/wl.c on Line 1296, ubi_wl_put_peb(): inside else, erroneous_peb_count=0, free_count=1048

These are the UBI volumes:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "fsbl1"
mtd1: 00080000 00020000 "fsbl2"
mtd2: 00080000 00020000 "metadata1"
mtd3: 00080000 00020000 "metadata2"
mtd4: 00300000 00020000 "fip-a"
mtd5: 00300000 00020000 "fip-b"
mtd6: 0f800000 00020000 "UBI"
#

We also try to backport several fixes for newer kernel versions, but no patch fixes the problem.

Do you have any clue about the root cause?

Thanks,

Arturo.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
