Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE05C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 00:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SGx2YF3LZM2LVg0k1hQmfkCds67eKpXeEhO/w3qcP10=; b=WUhkoIDqFrf/Ls
	CHe8/u0pobBvkEsoHJeUTY3tzKWaLYkQh5qV/M+T1PzqFsGVEjC7RX9oAfUWPp2OwBYp9ASAtWCK9
	CJVg7Cpgz1vVJGARxWCbCMHjoWY0t5Dv3CJETx5ZB9Bd/SRJhGiFyRIkfZ8upqtGM2FK9WLOr291Q
	tef0bHGZ1k7JrjLHCndiajs6ncoD2uOqK7wJ6j7YGZZV3nYfegJmRWGuBgjScJOPzmSnOgVmj3XUu
	ARdaC0bPqDQQCTxzWindv8Y4fTNvBl5OoNPzvyrMQswfAz9q8YWDn48nguWWhU/GO3ISLwnLXzTAn
	mPV/V+D2FxyFrmgPoEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy0EM-0035fM-CS; Thu, 24 Nov 2022 00:36:42 +0000
Received: from mail-mw2nam04on20723.outbound.protection.outlook.com ([2a01:111:f400:7e8c::723] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy0EI-0035dp-3l
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 00:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C45/cpltXO6jbEknftMO2cM7nt1f4piODMdbFZTuvEFtdHAlKXIr8ps5/IJ6Jy8OkTMJsxlzwzHOq/rKGsL4H9pFtPUz2t89TgzIXdAB5txH/j5Oz7GVIUVyHqLFbLFSs0/nMuDWdT7S3sWiST5RO93H3d69uQQ46Ihip4Dv5Mf3qWtI75m8LastQsMHopkv7X14y1f73Cy5HIQAUPyJBcO6V/dymo2g5VdKbVTQLQWl+fnfxwVY48RevMgYDwnluF8/+VSjq3YCiiVr0EFH0pN7vkO6TB2Ip337LQmGQZuvWti0CqL+5S53OuQIol1S2TctFTrBWIHBjAiOQk9XZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLz3a++1K5u6NDIkMr2zsz+RqH2Ut13DramPYMYaLRM=;
 b=HMAdNVvrgMV08to1Axi3bmpyShEpdA6YldrLWDXHOFhHFr0SwCSwpwXOK3k1DSxd11zd4BJVwmzDAPTIda2rfkgLs+znvukuppHc8pamKqCKv22OchpXrhu4lGyiFbMZfPPf2uUtuJyEgZx7X3RdnmRWG0r55S8L/dqO5tzQu1uoZho/dhyYxtnNbaxoQq5HEGe4/GL3IbBzRHwngKF0pMeFvkKtYU3/nKidPLVNB6DcQhp7y2JK3SsX/wpp9vDYI77u6L6nkJt6awIPLxKjFwd5xMicc2V5jP96eaJD4+UgZwceYsU6IBbuv4THCXCW1V89ENK8d1bMrkNQRHDl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLz3a++1K5u6NDIkMr2zsz+RqH2Ut13DramPYMYaLRM=;
 b=fFpuUUwsWTHcIwV8ENxpSiUdc7fi9QwEPVfT7Zras5AKK4TIMzmhHCcJpexU2SAGhIfC9AvovquR1NGFrlKjgiJ+1GP4NQdAQQ2r5LVzMSKD62mmC67F+fMiQYnQNNzjgsRqt5Bpm5GczZAAMKlaYPhPZNTXGj9seSrOAoWkILo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SJ0PR10MB4784.namprd10.prod.outlook.com
 (2603:10b6:a03:2d4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Thu, 24 Nov
 2022 00:36:31 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c%4]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 00:36:31 +0000
Date: Wed, 23 Nov 2022 16:36:26 -0800
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-mtd@lists.infradead.org
Subject: Intermittent MTD attachment failures
Message-ID: <Y368imULL0IN/WwU@colin-ia-desktop>
Content-Disposition: inline
X-ClientProxiedBy: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|SJ0PR10MB4784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf82b5d-fc90-4ca5-669d-08dacdb3ee7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FmvI1XzB+dnYjBNg2JemfE2bVkXA87NLNWOUnP22aSyHAts9oNFgEAxHaPrap2pC1rvjO6jVPuLFeNNHDRQbX9LP7V5VT9A4r2CoUZFS+bNb0iB2UF5w8lZx6ZBvWIlt3GH9MxCHSGLjfSYN96LpqDVqsweW47CrhhY4MI/YpSpvtRS1PTxO/IKXbFq34Y6THokye5RcV+oNUIkxPIUYsKNv6pa1QKXRSkL4rCWy+iefv1arbPVn8BeZu46Lf3F1z4uc+NqY1F+tbQs9xnsFQRJzfU36wJa/cUQccA+WcVGrBubQQsiC2IdwmRceA2rfDIz0K7CJoN82UiwQ7b6bm6BYAjkVYoYzTU8Em0Pdqc7MPfbrSc+oyB7UOocA/8Z0UvOYjN+gnQ7lhlw8i2bBOgP67SSsP5g6rLZMmy4ocLqeLeiZin/fehCCtRKxfrlHi8UNa3u6cQBjOspxtkYplGCpyquzvzl2SzilyZwyNR4r2W1Zg79tVKkQ7HrL3LQJrFOqqp1Vyjkqn2sqbKGKHsvzRlMri2hdBoxsEo2ccti9Wm6SZrEMhVHUfZkOA9PY5rHZlJi3BmDbg8UWIH5YADewavHCH9onxs5bHmkiR1s1foulJcTRvHRB6WzBPQSHn2ihykYjiiMJnYNgr6CFAA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(376002)(39840400004)(366004)(396003)(136003)(451199015)(86362001)(6506007)(6916009)(26005)(6666004)(6486002)(30864003)(5660300002)(478600001)(44832011)(8936002)(41300700001)(2906002)(316002)(8676002)(66476007)(66556008)(66946007)(3480700007)(38100700002)(186003)(6512007)(9686003)(66899015)(83380400001)(33716001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VO8Itt75BH1exVkvxHGqtxGxDj0hXUkMGb1+9zVRy4bjhmmpEQCDgcAabsVo?=
 =?us-ascii?Q?9YVvBRCFvpJ08eVjZ7wNHWvWUKqivdBpTRjq8cn+KlKNTTN0UUZiBfrFB/do?=
 =?us-ascii?Q?vvnoCmtE2Z4uyYBWHL+Cp9mAeZ8Hz3AnFQ5XcFhZ6NnlowWnGjSNC6Np30cX?=
 =?us-ascii?Q?hJhqUrUTikphmctVrcm63QFoXx1KmTtCJEixeoVC/DQprO3isbJiT0Yses+Y?=
 =?us-ascii?Q?2PE3cI2i+AfVw0oN/mSxxGcPzbaBeS28BgdLv6rSDM03ivEWrMoPEoUXdOVm?=
 =?us-ascii?Q?L6/NUPyrq3DWort/tkDo2gdXw2geKt39h6BQiC7gyAJvcHNyDlV/95GzcM2w?=
 =?us-ascii?Q?qxnqsRoLD05NNPtDyN04pCvcjRFzvByGxUahY0NSHIU8OvBVp8SNUnJIm0TU?=
 =?us-ascii?Q?3DX9G9VIaDKmJqvNMOIr1ViNnl/nkRbQCIEOSx1crXijmmueb+z8EN7gRDeb?=
 =?us-ascii?Q?D4GWKdmvU8zisQAvJ5xpN8LnLOy1JRYML5MjCE8gvsa+/5U8yrp3mFUzlKgT?=
 =?us-ascii?Q?VscdW0trS0ny1FgZDq3l2iZqjGqybRKCE4QSXrTdrDx51w9DhfRIXtVA5v0T?=
 =?us-ascii?Q?Zx2FRuIzL3rbvnmSAM9+lE+dvegzm/6ZAOvuxxye9pmyHlO9yY15yTi72Wwg?=
 =?us-ascii?Q?4/ONo/mC8HfbXkUcikQB7ClfwqMnxIpcQvnq+X4OdCsbDdc4g5lEh/+I3xoV?=
 =?us-ascii?Q?h4p/GalJT4+nXi13v8TeWjK5fsYPTTFgUr4/c1O+UvlzuETyvriuu54hD/jo?=
 =?us-ascii?Q?KBLprLnj3wr2iVtGHZb8RTSyaCJqemrOZTom+kR7tS4gnWPOkk/AVwdf7TcQ?=
 =?us-ascii?Q?EBfHxZmbUbdyq33CdJE5xsL/Z/UI/9iJ/Mnsi6CQ2JGHcUBJowdj23b+KKdl?=
 =?us-ascii?Q?ntpdIZePEPqaKRKNz8kjAVIuQ2G0RVp5OjAlvtrjqnMWVyPnc687yoTcviSE?=
 =?us-ascii?Q?CoTCUJCOBAhlID+j+PjJHQnCZyWdTJRRVfHhr8zaqvqgpDiejrtosa/KoQTg?=
 =?us-ascii?Q?M6Ff6hpBjqGfdV9KreMPdBGfeoSH9eZjsQ6SwssrqVb+0cxBh1ZPSvkvKOCK?=
 =?us-ascii?Q?UyAqsI/k/+HeDTyuweET5UVqiLuxpe0pAfoyKlPx7i5Qbud7nIKY6jHXJU0w?=
 =?us-ascii?Q?FTa1XdotD/Ezgg5sNMsez4Ci5u2a7GM2Zxl0ysg4urEDQIeAjI7l/eoYAVDU?=
 =?us-ascii?Q?9wUArImtEVe8p5uH1PH4LhtFqG8sTSdw6V5sqkF1nnF4r8kUqKKiG61X+MZ1?=
 =?us-ascii?Q?eI2Lz5HXm0RZNtGUq+r96+7XACClz6t1od4PWFZaILMmvBnea70IXDxxwPGk?=
 =?us-ascii?Q?KflonMYp9PwDdBj1N0QkrR4Y9VM6FosN5pbN1EMk7p8MB7e9Rtqo3X3yuNe5?=
 =?us-ascii?Q?K+dOK3DL7IlUiI8rKvQP6p5VkDn3HmiuxMuC2BAQ75I01q9NpcHnGDBUZvhB?=
 =?us-ascii?Q?CRVMc3wj3CI85vP+dBIG9pY08PCyCmZ0Uha5e2OvLZglMhHQuwwpN6DTKJWe?=
 =?us-ascii?Q?ApbcA50ScKw5LPogI8/sg48KHn3vpwMJXgiugbWemZ/lRQjYLTRboI2t+9cm?=
 =?us-ascii?Q?l0acPM56VWTE1pmJtwpZe2ANCR4pYTh+yp2SfU3BcbwmpYrLXsZavxoiQiZH?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf82b5d-fc90-4ca5-669d-08dacdb3ee7b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 00:36:31.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJfYHLsPL0iVvjpQGSfIrMWokTzVh8g5bQgewkoC0hWxqu4sMLf57Bps8l3N0vro3/dGPJ56fnjoLKavjswd6RFlLm/62Vc9J4j764LlHQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_163638_364518_155FE2F4 
X-CRM114-Status: GOOD (  14.93  )
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

Hello MTD mailing list world,

I'm getting up and running with an MTD / UBI / UBIFS NAND device on a
Phytec PCM049 SOM running an OMAP 4460. A vendor BSP was offered in the
3.4 kernel era, and I'm trying to bring this into the new age.

I'm seeing intermittent failures to attach my MTD device. My hunch is
that I'm doing something horribly wrong... that has been the case
historically. But I'm not sure what.


I'm using U-Boot (MLO and u-boot.img in raw NAND) with RAUC, and a
redundant U-Boot environment partition pair, along side an A/B
partition in the UBI.

Every once in a while, the kernel panics because it can't find a root
filesystem. Interestingly, U-Boot doesn't seem to have an issue. I'm
curious why that might be.


Is there something that I'm doing that might cause this error to be
happening, and is there something I can do to avoid it? Boot logs below.




From a bad boot cycle, U-Boot comes up as I'd expect:

U-Boot 2022.10 (Nov 22 2022 - 11:57:31 -0800)

CPU  : OMAP4460-GP ES1.1
Model: Phytec PCM-959 Eval Board
Board: OMAP4 PCM959
DRAM:  1 GiB
Core:  111 devices, 10 uclasses, devicetree: separate
NAND:  device found, Manufacturer ID: 0x2c, Chip ID: 0xb3
Micron MT29F8G16ADBDAH4
1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
1024 MiB
MMC:   OMAP SD/MMC: 0
Loading Environment from UBI... Scanning device for bad blocks
Bad eraseblock 1027 at 0x000008060000
ubi0: attaching mtd4
ubi0: scanning is finished
ubi0: attached mtd4 (name "main", size 508 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
ubi0: VID header offset: 512 (aligned 512), data offset: 2048
ubi0: good PEBs: 4070, bad PEBs: 1, corrupted PEBs: 0
ubi0: user volume: 4, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 461569733
ubi0: available PEBs: 779, total reserved PEBs: 3291, PEBs reserved for bad PEB handling: 159
Read 262144 bytes from volume env1 to bde841c0
Read 262144 bytes from volume env2 to bdec4200
OK
Net:   No ethernet found.
Hit any key to stop autoboot:  0
Found valid slot B, 5 attempts remaining
UBI partition 'main' already selected
UBIFS (ubi0:3): UBIFS: mounted UBI device 0, volume 3, name "rootfs-b", R/O mode
UBIFS (ubi0:3): LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:3): FS size: 199987200 bytes (190 MiB, 1550 LEBs), journal size 9033728 bytes (8 MiB, 71 LEBs)
UBIFS (ubi0:3): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:3): media format: w4/r0 (latest is w4/r0), UUID 27C99F76-8955-49A0-81C5-115DDE0BC3D8, small LPT model
Saving Environment to UBI... UBI partition 'main' already selected
Writing to redundant UBI... done
OK
Loading kernel
Loading file 'boot/zImage' to addr 0x82000000...
Done
Loading file 'boot/omap4-phytec-pcm-959.dtb' to addr 0x88000000...
Done
Unmounting UBIFS volume rootfs-b!
Kernel image @ 0x82000000 [ 0x000000 - 0x6e0670 ]
## Flattened Device Tree blob at 88000000
   Booting using the fdt blob at 0x88000000
   Loading Device Tree to 8ffe6000, end 8ffffa63 ... OK

Starting kernel ...



The kernel comes up with this command line:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.1.0-rc6 (colin@colin-ia-desktop) (arm-buildroot-linux-uclibcgnueabihf-gcc.br_real (Buildroot 2022.05.1) 10.3.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT Tue Nov 22 14:14:49 PST 2022
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Phytec PCM-959 Eval Board
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created CMA memory pool at 0x98000000, size 8 MiB
[    0.000000] OF: reserved mem: initialized node dsp-memory@98000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x98800000, size 112 MiB
[    0.000000] OF: reserved mem: initialized node ipu-memory@98800000, compatible id shared-dma-pool
[    0.000000] cma: Reserved 16 MiB at 0xbf000000
[    0.000000] OMAP4: Map 0xafe00000 to (ptrval) for dram barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   HighMem  [mem 0x00000000afe00000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   node   0: [mem 0x00000000b0000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] On node 0, zone HighMem: 512 pages in unavailable ranges
[    0.000000] OMAP4460 ES1.1
[    0.000000] percpu: Embedded 16 pages/cpu s34708 r8192 d22636 u65536
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 259908
[    0.000000] Kernel command line: console=ttyS2,115200 mtdparts=nandflash:0x20000(xload_raw),0x180000(u-boot),0x180000(u-boot-2),0x1fce0000(main) ubi.mtd=3 root=ubi0:rootfs-b rootfstype=ubifs rw rauc.slot=B


And shortly thereafter, I see an error -110 (EMULTIHOP?) while checking
if a PEB is bad:


[    2.165771] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xb3
[    2.165771] nand: Micron MT29F8G16ADBDAH4
[    2.176239] nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    2.176239] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    2.189483] 4 fixed-partitions partitions found on MTD device omap2-nand.0
[    2.196624] Creating 4 MTD partitions on "omap2-nand.0":
[    2.196624] 0x000000000000-0x000000020000 : "xload_raw"
[    2.209533] 0x000000020000-0x0000001a0000 : "u-boot"
[    2.216369] 0x0000001a0000-0x000000320000 : "u-boot-2"
[    2.225128] 0x000000320000-0x000020000000 : "main"
[    2.454742] ubi0: attaching mtd3
[    3.195129] ubi0 error: ubi_io_is_bad: error -110 while checking if PEB 4037 is bad
[    3.205230] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -110
[    3.205230] UBI error: cannot attach mtd3
[    3.223907] l4-secure-clkctrl:0038:0: failed to disable
[    3.229705] VFS: Cannot open root device "ubi0:rootfs-b" or unknown-block(0,0): error -19
[    3.238159] Please append a correct "root=" boot option; here are the available partitions:
[    3.238159] 0100           16384 ram0
[    3.246582]  (driver?)
[    3.246582] 0101           16384 ram1
[    3.246582]  (driver?)
[    3.258972] 0102           16384 ram2
[    3.259002]  (driver?)
[    3.265197] 0103           16384 ram3
[    3.265197]  (driver?)
[    3.265197] 0104           16384 ram4
[    3.271362]  (driver?)
[    3.277496] 0105           16384 ram5
[    3.277496]  (driver?)
[    3.281311] 0106           16384 ram6
[    3.283691]  (driver?)
[    3.283691] 0107           16384 ram7
[    3.289855]  (driver?)
[    3.296051] 0108           16384 ram8
[    3.296051]  (driver?)
[    3.296051] 0109           16384 ram9
[    3.302215]  (driver?)
[    3.302215] 010a           16384 ram10
[    3.302215]  (driver?)
[    3.314636] 010b           16384 ram11
[    3.314636]  (driver?)
[    3.320892] 010c           16384 ram12
[    3.320922]  (driver?)
[    3.327178] 010d           16384 ram13
[    3.327178]  (driver?)
[    3.327178] 010e           16384 ram14
[    3.333435]  (driver?)
[    3.339691] 010f           16384 ram15
[    3.339691]  (driver?)
[    3.346038] 1f00             128 mtdblock0
[    3.346038]  (driver?)
[    3.352630] 1f01            1536 mtdblock1
[    3.352630]  (driver?)
[    3.356872] 1f02            1536 mtdblock2
[    3.356872]  (driver?)
[    3.365844] 1f03          521088 mtdblock3
[    3.365844]  (driver?)
[    3.365844] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.372436] CPU0: stopping
[    3.383483] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.1.0-rc6 #1
[    3.383483] Hardware name: Generic OMAP4 (Flattened Device Tree)
[    3.389709]  unwind_backtrace from show_stack+0x18/0x1c
[    3.395751]  show_stack from dump_stack_lvl+0x58/0x70
[    3.395751]  dump_stack_lvl from do_handle_IPI+0x320/0x378
[    3.411682]  do_handle_IPI from ipi_handler+0x1c/0x28
[    3.411682]  ipi_handler from handle_percpu_devid_irq+0x9c/0x1ec
[    3.411682]  handle_percpu_devid_irq from handle_irq_desc+0x24/0x34
[    3.411682]  handle_irq_desc from gic_handle_irq+0x74/0xa8
[    3.434692]  gic_handle_irq from generic_handle_arch_irq+0x48/0xa8
[    3.434692]  generic_handle_arch_irq from __irq_svc+0x90/0xd4
[    3.434692] Exception stack(0xc1001e98 to 0xc1001ee0)
[    3.446716] 1e80:                                                       c0898bcc 00000000
[    3.446716] 1ea0: 2e4bb000 600001d3 00000000 c100fe00 00000000 c56d0372 ef462d38 00000000
[    3.460021] 1ec0: 00000000 00000000 00000001 c1001ee8 c025d168 c0898bd0 60000153 ffffffff
[    3.460021]  __irq_svc from cpuidle_enter_state+0x358/0x4b8
[    3.482086]  cpuidle_enter_state from cpuidle_enter_state_coupled+0x174/0x484
[    3.489288]  cpuidle_enter_state_coupled from cpuidle_enter+0x44/0x5c
[    3.489288]  cpuidle_enter from do_idle+0x1ec/0x2c4
[    3.500701]  do_idle from cpu_startup_entry+0x20/0x24
[    3.505798]  cpu_startup_entry from rest_init+0xbc/0xd8
[    3.511077]  rest_init from arch_post_acpi_subsys_init+0x0/0x18
[    3.511077] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---



I simply reboot, and the next time the kernel mount succeeds:

[    2.108001] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xb3
[    2.108001] nand: Micron MT29F8G16ADBDAH4
[    2.118957] nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    2.127044] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    2.131225] 4 fixed-partitions partitions found on MTD device omap2-nand.0
[    2.139617] Creating 4 MTD partitions on "omap2-nand.0":
[    2.145416] 0x000000000000-0x000000020000 : "xload_raw"
[    2.152923] 0x000000020000-0x0000001a0000 : "u-boot"
[    2.159606] 0x0000001a0000-0x000000320000 : "u-boot-2"
[    2.167480] 0x000000320000-0x000020000000 : "main"
[    2.397064] ubi0: attaching mtd3
[    3.143463] ubi0: scanning is finished
[    3.159973] ubi0: attached mtd3 (name "main", size 508 MiB)
[    3.165618] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
[    3.172546] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[    3.179321] ubi0: VID header offset: 512 (aligned 512), data offset: 2048
[    3.186157] ubi0: good PEBs: 4070, bad PEBs: 1, corrupted PEBs: 0
[    3.192291] ubi0: user volume: 4, internal volumes: 1, max. volumes count: 128
[    3.199584] ubi0: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 461569733
[    3.208709] ubi0: available PEBs: 779, total reserved PEBs: 3291, PEBs reserved for bad PEB handling: 159
[    3.218383] ubi0: background thread "ubi_bgt0d" started, PID 173
[    3.232025] l4-secure-clkctrl:0038:0: failed to disable
[    3.237823] UBIFS (ubi0:3): Mounting in unauthenticated mode
[    3.245208] UBIFS (ubi0:3): background thread "ubifs_bgt0_3" started, PID 174
[    3.279571] UBIFS (ubi0:3): UBIFS: mounted UBI device 0, volume 3, name "rootfs-b"
[    3.279571] UBIFS (ubi0:3): LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    3.300415] UBIFS (ubi0:3): FS size: 199987200 bytes (190 MiB, 1550 LEBs), max 2048 LEBs, journal size 9033728 bytes (8 MiB, 71 LEBs)
[    3.312530] UBIFS (ubi0:3): reserved for root: 0 bytes (0 KiB)
[    3.318420] UBIFS (ubi0:3): media format: w4/r0 (latest is w5/r0), UUID 27C99F76-8955-49A0-81C5-115DDE0BC3D8, small LPT model
[    3.329925] VFS: Mounted root (ubifs filesystem) on device 0:16.
[    3.336700] devtmpfs: mounted
[    3.345489] Freeing unused kernel image (initmem) memory: 1024K
[    3.352996] Run /sbin/init as init process


The bootloader was able to attach rootfs-b to get the kernel and
devicetree, but the kernel fails to do so. Nothing should have
written anything, so I feel there shouldn't have been an opportunity to
corrupt anything. Any suggestions on where to look?



Thank you very much,

Colin Foster

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
