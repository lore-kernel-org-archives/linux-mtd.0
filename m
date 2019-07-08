Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EA2C606AC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAA52064B
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQjIu1eb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="cdWDhOBB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FAA52064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+xv9VT6aTij0xJK2oJyKG5AsNOov0hl3DpQSzcskFds=; b=OQjIu1ebfCVxo3
	mB2pGRKcBjqU9SlYoO8z1GPHP/VnpXzP6oCEg3CHnJ/vABbRqxuKdLdqGS4vgegGn5SLPciP6eMHu
	CfEEJXxPWjnogNgBs8mVDNOD7+hkAnHFEZ8tE2Jo+Pg25DOh4jEgG0e8BxFPrKcsEilGYELJsxiM1
	GXngOPhaTOp1mskTJokmE+ji0Ok6OUUuZ64tFky4GXZ5Wmsg0LAjtIiLDnjOho1lLM7WgpsnLrRpA
	MnSa7LRsvo4jgVxdxicUShfkzfjjrQKlQn1gaS0lbEhzCTQyxWHQkNsT0YAzup613DRYhgsfE5NnW
	ixoLw9qIWI7WNH0tF6Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkTKf-0002QW-Ru; Mon, 08 Jul 2019 13:05:25 +0000
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkTKc-0002Hy-TI
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 13:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJP6TtGaiAUpY/MxsWraHwK63q4SJ2XGBvfnhGdwgI0=;
 b=cdWDhOBBbMO0zHDwcdK6bDlFuE+2NrRJ9EAC4tfpen/9dRSiwlfMHjns6IM/FhgfdSGmZG6Qd5i+8r+UoYLJdhyPImrE0B5GNLzPYCmZOWOxjdzKv3u7eBbtLUW/LRJlzr7hvMkDHFXpR1zt8Q3/lvIG7/0hDMShwn9dY68XSP4=
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com (52.134.7.143) by
 VI1PR0502MB4077.eurprd05.prod.outlook.com (52.134.18.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 13:05:10 +0000
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::edbc:bd02:11d7:aa6a]) by VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::edbc:bd02:11d7:aa6a%3]) with mapi id 15.20.2052.010; Mon, 8 Jul 2019
 13:05:10 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [REGRESSION] ubifs: Don't leak orphans on memory during commit
Thread-Topic: [REGRESSION] ubifs: Don't leak orphans on memory during commit
Thread-Index: AQHVNY3F90AlETdzv0al4GI8EIQzeQ==
Date: Mon, 8 Jul 2019 13:05:10 +0000
Message-ID: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2754d902-7500-49e8-1fa5-08d703a4e86d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0502MB4077; 
x-ms-traffictypediagnostic: VI1PR0502MB4077:
x-microsoft-antispam-prvs: <VI1PR0502MB407745828F5DF8B70FE741D6FBF60@VI1PR0502MB4077.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(199004)(189003)(5640700003)(118296001)(81166006)(8936002)(8676002)(81156014)(6512007)(2906002)(36756003)(6916009)(6436002)(53936002)(316002)(68736007)(305945005)(6486002)(54906003)(71190400001)(2351001)(71200400001)(14444005)(3846002)(6116002)(256004)(7736002)(478600001)(2616005)(25786009)(44832011)(14454004)(4326008)(486006)(476003)(45080400002)(102836004)(26005)(86362001)(6506007)(73956011)(66066001)(76116006)(186003)(99286004)(2501003)(66446008)(91956017)(66946007)(5660300002)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB4077;
 H:VI1PR0502MB3648.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sZF6bl1dnqEEgg8In7XRy9/yNN499iRRhc1LlztywLwqtXaL5vQAkKUDI3gP/DshIUC0Mwe+0Ea1MNT5J2Wk6LUt2WCtpKxbSSn9UBvwnRP3PU8Ysb1KiTxJTTr5bYSVea9IqZ1wOhfbdf1on4ykhI0ZfZEcoXuAF7SH4+t2clg+B7udYWMZoI6zVnxpjh6JoxXOgSSYgy2Hlsh2qmfoMU9SN+du7oEOIf/9BOU3tg9IDnPoZo+GIqQtti2RLYuSWXbx8mpoQozngF7/jU7KYBHv0RgoGK+8UzPc2x+3MA0RBuKZmxALpFhgsUMP1/8f6FOnC9HnE3xwFFTDO+fHZr4cQ2raXtzfHfaDZ1PuY7pVmcQsJIo/0+FGh+wBmem7MLYr2iUyUMxXcoQWwCIlcuVQen53Ar/E1S09gwzRhrc=
Content-ID: <C77934ED65982F4EAC77EAA10446A1BE@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2754d902-7500-49e8-1fa5-08d703a4e86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 13:05:10.3241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_060523_278826_998FF36B 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "richard@sigma-star.at" <richard@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there

I'm currently investigating a strange UBIFS rootfs crash issue seen on
Colibri T20 aka on top of the tegra_nand driver. I bisected it to the
following commit c16e73587ad6 ("ubifs: Don't leak orphans on memory
during commit") and indeed just reverting that one even on top of
today's latest -next makes it work again. The following is what I get
during boot if that commit is included:

[   14.443253] 8<--- cut here ---
[   14.446515] Unable to handle kernel paging request at virtual
address 6b6b6b6b
[   14.453779] pgd = 021022d0
[   14.456535] [6b6b6b6b] *pgd=00000000
[   14.460131] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[   14.465488] Modules linked in:
[   14.468612] CPU: 1 PID: 311 Comm: lxdm-binary Not tainted 5.2.0-rc7-
next-20190704-dirty #24
[   14.477030] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   14.483377] PC is at ubifs_delete_orphan+0x7c/0xd4
[   14.488215] LR is at 0x6b6b6b6b
[   14.491397] pc : [<c03e26f0>]    lr : [<6b6b6b6b>]    psr: 600f0113
[   14.497715] sp : d1da1ee8  ip : d1de4ac0  fp : d27b29b8
[   14.502985] r10: 00000002  r9 : d23396cc  r8 : 00000000
[   14.508260] r7 : d23390ac  r6 : d2339000  r5 : 000063d8  r4 :
d1de4a80
[   14.514841] r3 : 6b6b6b6b  r2 : f344aa0d  r1 : 1213d000  r0 :
d1de4a80
[   14.521426] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  
ISA ARM  Segment none
[   14.528619] Control: 10c5387d  Table: 11f2404a  DAC: 00000051
[   14.534421] Process lxdm-binary (pid: 311, stack limit = 0x3e65b56c)
[   14.540829] Stack: (0xd1da1ee8 to 0xd1da2000)
[   14.545247] 1ee0:                   d27b29b8 d2339000 00000000
d23390ac 00000000 ffffff9c
[   14.553510] 1f00: 00000002 c03ca804 d27b29b8 d2339000 00000000
00000000 00000000 c03d1f90
[   14.561772] 1f20: d27b29b8 d27b2a70 c0b24f68 d1da1f68 00000000
c028ed8c d27a2648 00000000
[   14.570036] 1f40: d1f83000 c0283b34 d1da1f68 d1da1f58 600d0013
c1004c48 00000000 00000000
[   14.578300] 1f60: d2c86010 d25baaa8 1af1325a 0000000c d1f83019
d1da1ed4 00000000 f344aa0d
[   14.586563] 1f80: 0000ecd4 0000ecd4 00000000 0000b1e4 0000000a
c0101204 d1da0000 0000000a
[   14.594826] 1fa0: 00000000 c0101000 0000ecd4 00000000 0000f5cc
bed86e64 bed86e6c 0000ae15
[   14.603087] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
00000000 b6f2efac 00000000
[   14.611350] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc 600d0010
0000f5cc 00000000 00000000
[   14.619648] [<c03e26f0>] (ubifs_delete_orphan) from [<c03ca804>]
(ubifs_jnl_delete_inode+0xdc/0xe0)
[   14.628801] [<c03ca804>] (ubifs_jnl_delete_inode) from [<c03d1f90>]
(ubifs_evict_inode+0x78/0xf4)
[   14.637774] [<c03d1f90>] (ubifs_evict_inode) from [<c028ed8c>]
(evict+0x98/0x168)
[   14.645350] [<c028ed8c>] (evict) from [<c0283b34>]
(do_unlinkat+0x228/0x298)
[   14.652483] [<c0283b34>] (do_unlinkat) from [<c0101000>]
(ret_fast_syscall+0x0/0x54)
[   14.660294] Exception stack(0xd1da1fa8 to 0xd1da1ff0)
[   14.665408] 1fa0:                   0000ecd4 00000000 0000f5cc
bed86e64 bed86e6c 0000ae15
[   14.673669] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
00000000 b6f2efac 00000000
[   14.681919] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc
[   14.687038] Code: e1a01004 e1a00006 ebffff80 e594301c (e413201c)
[   14.693353] ---[ end trace f81be27f6c9911d4 ]---

Has anybody any clue what may be going on? If you need any more
information do let me know.

Thanks!

Cheers

Marcel
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
