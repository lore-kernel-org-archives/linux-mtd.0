Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B37CD128A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4o+FVJyteGpORtX1Ftr/1qIH17Ln40sBziBopd4ZLk=; b=RIXEdsaXs4FUQ8
	LCE93e3WuB3RXflIP41OW61mWgxwpM7+wA5WUkdulWoVkKPkz3Da925kRE/VGI+udQekfwakuzb/L
	IAlNuTXu7PDBpiBWIRjDOWDS8Ijm3YrQQKc5sJe5VxC6AuD2F5FJjVhUJEhbgZPxJQktgX3Na4XhE
	J1Ii85RmQW8gO/AhIp4vBVwAjl+Y5ZYkf6StDycjgF/qo6VK3TXW8HQQH3s5/qUanMhCntYc8i9Ec
	hM4voUgKKsBXaz7FHydpHMOGS763HimXdBV977JHIKorKCwPM+lUWoaynYDUSifPlXxtejCUzQxKo
	J5gASkqHzfXqoD60Gl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucQK-00000008Qgl-2ecH;
	Wed, 10 Apr 2024 18:11:52 +0000
Received: from mail-southcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c10e::] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucQF-00000008QeD-0Ifc
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 18:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdL4c7dlfouedviT7HSxpB+4IKX4XYQcVurB1iYUhtggoolzhWoSn280LYg/bjeY2YkFkTf2SLb/3jpL3yJaKGaPf87t2eVZaQ0QBfIPfj9uhgeRKEEOcReCc/5UUGPdrSYM0cpQYcjy949IAi7hpQ3KCtfGMoCyRoZfV4qJ99mVXuwdRJqivo9GRWEVFA3yHObZfN5ZB1i1LT+t0uOQuyt9RerhxJ0tN3ulAR57yufQN6G32nrcUgEooOLGEanEA4s5IMHS8U2nm7SQpWLFsFw8i4GsN6TvJqq67Qzcf7ZvhKeonnh1Q88ZbIrzLxm6mOTBbvF8mTWRam3kfnwXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6hu2P3+aYtejuyZVvXR8LzHdgzlDMuX1KYWHVJiNtc=;
 b=ZjfkiEmmNPDU3j5PkbzvAX0lBwxq8wxwO+/hOK068bYT6puImYB7YNPQg2K1Tl01w6w4ea1z2a587Z0f0piPIgrXMhq3+KfVofHO5Dk3fQjzCpdxVEBH6ajIvMb/UGCWiRPfxWfxawGpKRJtxVGyEUhELiMxcj48hDeGrn2YD5WF9H6nPhMpPfxDkbMhXykP1bgWAgYALpM9FmBawEPgAqWOCnLsHHdPiTxjmnSbBeqBVeYWzjLXzSB4cALBzFlmpoBRCHBNKE2lo2k2F3kYeSGdZ2POCKyQr2x6FukAUzTW+9OqYTF2ZKpG+H8brx4evTTGrVziM6vRkHgJyUw4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flightsystems.net; dmarc=pass action=none
 header.from=flightsystems.net; dkim=pass header.d=flightsystems.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5447408.onmicrosoft.com; s=selector1-NETORG5447408-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6hu2P3+aYtejuyZVvXR8LzHdgzlDMuX1KYWHVJiNtc=;
 b=y7Z1U0PnI958sA9urY+VfsVR5XOCI5E2/quW6ZLv2fSYkN38YTXGX1ziIXSZfB3HlH+VUds7L48n+VghQmGSxfRJnEBP2X8cFxGMfz+kjCQUyYiMGiAn2nUxXusS7xLzq44YUHud2eLeEW4JVow74hXN042GjC0tCyOsInnUziU=
Received: from DM6PR05MB4506.namprd05.prod.outlook.com (2603:10b6:5:97::17) by
 BY3PR05MB7907.namprd05.prod.outlook.com (2603:10b6:a03:363::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 18:11:41 +0000
Received: from DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::3db7:1825:d936:33e0]) by DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::3db7:1825:d936:33e0%6]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 18:11:41 +0000
From: Steven Seeger <steven.seeger@flightsystems.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "ada@thorsis.com" <ada@thorsis.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>
Subject: NAND parameter page read fails with bitflip and no column change
 support
Thread-Topic: NAND parameter page read fails with bitflip and no column change
 support
Thread-Index: AQHai3HIa8ir8AUCL0ehOwUDoMRk7g==
Date: Wed, 10 Apr 2024 18:11:41 +0000
Message-ID: <DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR05MB4506:EE_|BY3PR05MB7907:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t19R0IHW6aUeQgo/rv86++1jRdicavarvKHa9x7dOzQfbPIkXKbJkOzECGOu6NEY9VNpNteUzdEJwuXhl4jmm4BCHHoEiUi1oK/pFnd2DEEAJupX6BB08Gk9Gwir7veGLBc4VhOdaoxfjRlD5pYO9Q9qr2/H8yV1QSD5cvTt9gFJdztiwgeZgDhupUD3leJnbPrHLA0TGUrBB6Id7btYQ35VuAJzLx8zD/4/U6WxFcYK3mEcKBCUE8dvILAK+u268gjrAPLxNHOzS9LjRny2lDnqCsqbttCXBIM8tBcSNkd15drJpG0YCSaHnn7yv47QhieZ1D1R8ozahZL//C3T89+l/lZB9Dg/JwhlyVJgHXA1kjGAcG7b1IcwbX7EmWHp9kqA8UMLPS44JpmFfHzh5zhRjH206Mzz6R6+Jso4Qhw5/mJqgYk3nFjNxr60LZG6GeMFb5y9DZRTWZZlo3ETswj+CybZuTIW+uaDcEcC+sCshNqIFCgF4ZgJ1E+Ry4jrb4tNfZmQSNyQKwqaMZuhGyi53dLH92Qf96dBNXBK+67BjtN+MNFJIUlfx/NTkrkZmynP8gE9L+XzSnxqRODtNV2N6pDZnKOxa9raPmQ8CXB6+0WwYUk2REPE0yXfkLvNqGf9V1Kqcfnkl/doaYT2NZw0tv0ZkliBK1ez7kYvKAk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR05MB4506.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H7QNvpk1bAZRkzOTBnD98/fYS5+DqdV4K88VhP99augLfkS4WcsfEaax2l?=
 =?iso-8859-1?Q?jmN1O8A3+vc8kYt+RHv+mkUpoXbTagxvZZbgI/ev9DmBoq4TQFdDCQgxVH?=
 =?iso-8859-1?Q?X43upBiqLBUavf8U4YmdKANdY3k+X3NDGlT8/cbqTowU5Em5cn/uSObmAK?=
 =?iso-8859-1?Q?mWqLmyFiyys9oKZZ080wmCqOeo3uX4c5LLJxs1Z4bVOJyn8x0yWlszofK7?=
 =?iso-8859-1?Q?aheLeBvylQ41F1KxgehzxdRqYohEDXwfkWLdrDbWaapzgCYkFsP36lHILw?=
 =?iso-8859-1?Q?DrpV22M6bMa/g6XzP5yMjQ3S32ZAYJDiUcoCS1A4wPGnWiF3rmi+BxdDYE?=
 =?iso-8859-1?Q?iWSpo8xGCGHIZlkceRy71hpO1bhc8PMXT0kk9LkkiXxHP5fGo/wLBaoCzG?=
 =?iso-8859-1?Q?fxoxVRft4r+ET49+wjUBr6jg/9gJDAN93AgiMiksE4FH4+Vw7+pUkTL2Ux?=
 =?iso-8859-1?Q?rdWNU8uPm3TKQfgMyVqT4b47fMC07AGtIJhuLPAC9k3b4DBa4PhJ8vND5E?=
 =?iso-8859-1?Q?aQkkedwIzUb2wDZKWbbFkFtqgxclBFHk+JW91bWscsJbtPr6YE5ZEMbNtg?=
 =?iso-8859-1?Q?yFtLcEhFyNpoUyQJs0VKtt+4T6w0Z9sF61czdZ1AVMl+nPcAUY0ndUc3yq?=
 =?iso-8859-1?Q?0iAz2vPgpKXV4z0nqCpdIfSf4peCgH4j9Wmfoor0WHGgBLCzjDsJJCf7kj?=
 =?iso-8859-1?Q?fPvRRiWApe35LVuysfy6cOrX9GiL3rOy0CAnJ9l1H1JuMTCUwB/B2sawM4?=
 =?iso-8859-1?Q?2bVHjJj21OWQtAXcLTZDqIMKP6clmdX5Ed7w8fTWvTwNaBhlDR+5r31o1y?=
 =?iso-8859-1?Q?R9ssYpf8PV55MOUMOEhABon1C6YwQ8v0Uh3ZsW1NuB6+8jJj+aygEo+Ek9?=
 =?iso-8859-1?Q?x9ZL8k4aj21/OOP6J18MDTzGDLskS10ktK3oJjoUmiipgBVXkfrPsgIHwC?=
 =?iso-8859-1?Q?UmgNyCm2h8G/IJ+AgX5edVSQ/cStD6TXEA9hAXWH2X5YF0Wf0/LO0Y5TEP?=
 =?iso-8859-1?Q?f2DGmmsFJ9GjPKZxUENATDIp0iEZ0INIMTRm2N4wj9or1Sb8CxCfTH/LQD?=
 =?iso-8859-1?Q?hUAVdwp3utJLKuu4MyEkJ9bjdPJw/Cq/D3O+gKDMLTu/nY7tBPWd62nY/V?=
 =?iso-8859-1?Q?YCsI/dzBVOpFR9UTvh+O6ibgcUS3eOVIu24PYXgEOzirHXi+fo0d4ePpUK?=
 =?iso-8859-1?Q?d3FXFGr62ZBcbKa/45xv9QewFhAG1abWN+tAF8sOUTuR8vdD54/729jVxj?=
 =?iso-8859-1?Q?kHYqaFsFpc/y8C7bmCqpFzY/RPEkJH2Z1RAFa5PJagFT2ZLtNN0eknja21?=
 =?iso-8859-1?Q?PvAM1iqkOBmZCLnWnUydKOGdX92rqslbpONkZRuaxxcb5LJSnPwvZY+1rt?=
 =?iso-8859-1?Q?rGjrF6rGMoljCU3AtmpTgg5a5efjl4f0edtOp8tu662qvm6hvAUWHLwGDR?=
 =?iso-8859-1?Q?UL7Aa064qVLxwg4GEZi4JHdDpNuDxsqTyS2iRY81WUKnzbkGpdM7d9m+ai?=
 =?iso-8859-1?Q?BaURxtoSLIOXFntF45XoGULe7vkzggAN7ZmZVVDwK5WhebVpfmO8ejGpkX?=
 =?iso-8859-1?Q?O4OpGtCkhAGRbEzrCSloJg7LD3+L6riYyZ9k3ze9TZf93FssupmolnZC3H?=
 =?iso-8859-1?Q?F813kUTqkWdQD3d2gwc/fBA2NOc6Bmx49On+AKEJ8uYKQ1ATNTqgdYpw?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: flightsystems.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB4506.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bf05ad-004c-48fe-22ed-08dc5989ac29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 18:11:41.2996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc3d8032-d019-412f-a0a3-ce7bb88962c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4Or5U1uuBChYc1aQQzJdWdRA16xRWNLx5OQiBywTRi8Cb1lNyt65+U/zfIKpy0QANKSGTJ+sJAqKQiclO54j/p7r1Bo0erqnjCyPQ4eOHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB7907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_111147_148095_C16D8A41 
X-CRM114-Status: GOOD (  17.35  )
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

Hello list.

I have an interesting board with 8GB of NAND, and the first of 8 chips has a bitflip in the first ONFI 256 bytes of the ONFI parameter page. My driver did not support column change operations, and this worked fine with linux 5.x kernels. I noticed this problem with a 6.6 kernel, and the fix was to add column change support to my driver. Without it, the NAND layer always reads the first 256 bytes of the parameter page. As my hardware is an FPGA that abstracts some of the direct NAND access away, and ECC Is done on-die, the driver is a bit of a hybrid between the newer exec operation API and providing functions like nand_read_page, nand_read_page_raw, etc. So the parameter page read upon module load uses the data in instructions in the exec command, while page and OOB reads and writes are done through the driver-supplied functions.

Adding support for column change operations fixed this issue, but it seems that this support should not be necessary. It  didn't use to work that way.

I had reached out to Miquel privately with this issue, only due to the desire to help inform maintainers of the issue. I was too busy at the time to join the list and write up something more formal. Miquel provided a small patch for me that did not work at the time, and then I lost access to the board for a while. Now I have a little time and a board, so I am here to report the issue and make it public.

I am fine continuing my work with my driver that supports column change operations, but also happy to use a previous commit of it to do any additional testing with any patch provided as long as I have a board.

From my original email to Miquel:

Your commit 9f820fc0651c32f8dde26b8e3ad93e1b9fdb62c4 I think has a small bug.

In rawnand_check_data_only_read_support(), you call nand_read_data_op() with a NULL buffer, which causes nand_read_data_op() to return -EINVAL, therefore the value for data_only_read is never set.

Apologies to the people on CC for sending this a couple of times due to errors.

Thanks,
Steven


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
