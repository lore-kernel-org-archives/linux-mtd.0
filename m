Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FFCC282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 20:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B264B2070D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 20:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhknTAIH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bfxxywEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B264B2070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B82SQ913KMYsBP+74oBenpOiOTthtBRX1l3kl1bCeLU=; b=hhknTAIHXw0GOR
	6XfuBGdQYzo8/0drX8JlifsJIGeErKWe3KCDASjNXPqXKZMjmTaT0cTXg33DMKN2LFMDhORmhgbmO
	R3sQnBtsDM5NT/G8HmHJR7let+bPFZRTrlDDODjzahDXznfk1JxfnHnTt/jk32SQc/JWZjkxBDy6E
	12+DppCl0AbRSvamA1tDO1zXNhyOz1DvzaBETaicmYAiB4/0tA/js0J52wtJPhoJWW3MALSA7m1qv
	VXBrfVJC9SIH+/q/w8mNCII75hQ4Wz3KbuCZXDZFOUg8TvFD2ZazJU0nBWpg0xl4IRK92tKFqZva2
	IK6sg27XctclHMlAGjhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYFvr-0001bT-UZ; Tue, 04 Jun 2019 20:21:19 +0000
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYFvn-0001bB-PX
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 20:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0fe0xkfNpKKGb12Q4O0CvZBC7RoW4aUjY6acvAja0k=;
 b=bfxxywEnBPDRcobTvZd8QiQynDtJpXQA+xKRu91OBmzL1w/6XG2Q2LHq3QGfb5lY4FC1nd1JMSu/HpOP1+CSWhbMhRKOlHL/LRJAqcNN+omlg1oA/epDnpdn3kQ+YxmrawcYvXAG1Q0foBFvQjpCYiIyWlGK/vJrrUuyKll2ik0=
Received: from AM6PR04MB4967.eurprd04.prod.outlook.com (20.177.33.210) by
 AM6PR04MB4152.eurprd04.prod.outlook.com (52.135.168.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Tue, 4 Jun 2019 20:21:09 +0000
Received: from AM6PR04MB4967.eurprd04.prod.outlook.com
 ([fe80::38f3:3b76:990:bf6f]) by AM6PR04MB4967.eurprd04.prod.outlook.com
 ([fe80::38f3:3b76:990:bf6f%4]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 20:21:09 +0000
From: Han Xu <han.xu@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>
Subject: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Topic: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Index: AdUbEX8AXcF5sQkER5GP/4OqThwnUQ==
Date: Tue, 4 Jun 2019 20:21:09 +0000
Message-ID: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=han.xu@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 865f70bc-5d57-4ffc-06b2-08d6e92a2e28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB4152; 
x-ms-traffictypediagnostic: AM6PR04MB4152:
x-microsoft-antispam-prvs: <AM6PR04MB41522CD1976F3BCE6D7CE1FC97150@AM6PR04MB4152.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(396003)(136003)(346002)(189003)(199004)(99286004)(7696005)(6506007)(102836004)(45080400002)(478600001)(476003)(44832011)(26005)(14454004)(186003)(81166006)(81156014)(8936002)(73956011)(316002)(486006)(8676002)(76116006)(55016002)(66946007)(9686003)(66476007)(66556008)(64756008)(66446008)(53946003)(68736007)(6436002)(2906002)(86362001)(25786009)(3846002)(2501003)(110136005)(6116002)(52536014)(30864003)(7736002)(305945005)(74316002)(5660300002)(53936002)(33656002)(66066001)(5024004)(256004)(14444005)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4152;
 H:AM6PR04MB4967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h7IYzmR0yL5et9pfMo5J4H+gu6BNQvUvoudt99mLv/xGJtaAfeVWaf0xUJXHWVIYTcGGxh7ZuGlRlWL6pWHP4FZ/ygY/ayr5u0IhOIMHBcCmkrf0CkxqGUqheY7OrLx2KY4tDwxe3yOcTxXJNIt1bPl6iWtN06Ii50Lmdt9EfrfhDtO32EP2eIxhvDKRbFKzy3KK8w36Se2+XSgxlQuHBNXcAazQHtFyI6Mg0WSyW8V5Ky4KpjMIi7DAEbiUz2ywVRcIeJIHCtXsIsTCO7pw2U0Hei1vcLw9u3ypkmOpMSqJqiwh/psLepaBre+VKDVFxGTXkK6+08JSS5QPHF86hc87bCCevxcbQja4vwQ4YPbecfmmLEaGjQ0zaqpQ7W7FLfnNVZMTCzS9PLEnsIDiK+Z1YMZ7fSoSCQuq0cEEsuY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865f70bc-5d57-4ffc-06b2-08d6e92a2e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 20:21:09.0747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: han.xu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_132115_989434_EB3E83B0 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi Richard,

Found such issue with lock debugging. Running bonnie++ on QSPI with UBIFS.

Erasing 64 Kibyte @ 1ff0000 -- 100 % complete
[  129.575631] ubi0: attaching mtd0
[  129.620067] ubi0: scanning is finished
[  129.623888] ubi0: empty MTD device detected
[  129.723031] ubi0: attached mtd0 (name "30bb0000.spi", size 32 MiB)
[  129.729289] ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
[  129.735994] ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
[  129.742267] ubi0: VID header offset: 64 (aligned 64), data offset: 128
[  129.748915] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
[  129.755026] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[  129.762365] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 445061296
[  129.771508] ubi0: available PEBs: 508, total reserved PEBs: 4, PEBs reserved for bad PEB handling: 0
[  129.781182] ubi0: background thread "ubi_bgt0d" started, PID 516
UBI device number 0, total 512 LEBs (33488896 bytes, 31.9 MiB), available 508 LEBs (33227264 bytes, 31.6 MiB), LEB size 65408 bytes (63.8 KiB)
Set volume size to 33227264
Volume ID 0, size 508 LEBs (33227264 bytes, 31.6 MiB), LEB size 65408 bytes (63.8 KiB), dynamic, name "test", alignment 1
[  132.036227] UBIFS (ubi0:0): default file-system created
[  132.046036] UBIFS (ubi0:0): Mounting in unauthenticated mode
[  132.052526] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 524
[  132.095082] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "test"
[  132.102377] UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 bytes/256 bytes
[  132.111870] UBIFS (ubi0:0): FS size: 32573184 bytes (31 MiB, 498 LEBs), journal size 1635200 bytes (1 MiB, 25 LEBs)
[  132.122423] UBIFS (ubi0:0): reserved for root: 1538511 bytes (1502 KiB)
[  132.129123] UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID 2866BEC7-B74D-4793-8A66-E113C824711F, small LPT model
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...done.
Delete files in sequential order...[  162.282301]
[  162.283809] =====================================
[  162.288514] WARNING: bad unlock balance detected!
[  162.293221] 5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24 Not tainted
[  162.300356] -------------------------------------
[  162.305061] bonnie++/525 is trying to release lock (&(&c->orphan_lock)->rlock) at:
[  162.312643] [<ffff0000104a0774>] ubifs_delete_orphan+0xec/0xfc
[  162.318476] but there are no more locks to release!
[  162.323353]
[  162.323353] other info that might help us debug this:
[  162.329881] 2 locks held by bonnie++/525:
[  162.333890]  #0: 00000000a21aa66e (sb_writers#10){.+.+}, at: mnt_want_write+0x20/0x4c
[  162.341734]  #1: 000000002fe597e5 (&c->commit_sem){++++}, at: make_reservation+0x84/0x3b4
[  162.349919]
[  162.349919] stack backtrace:
[  162.354281] CPU: 1 PID: 525 Comm: bonnie++ Not tainted 5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  162.364107] Hardware name: FSL i.MX8MM EVK board (DT)
[  162.369160] Call trace:
[  162.371610]  dump_backtrace+0x0/0x138
[  162.375274]  show_stack+0x14/0x1c
[  162.378594]  dump_stack+0xcc/0x118
[  162.381999]  print_unlock_imbalance_bug+0xe8/0xec
[  162.386706]  lock_release+0x2b4/0x32c
[  162.390373]  _raw_spin_unlock+0x20/0x54
[  162.394210]  ubifs_delete_orphan+0xec/0xfc
[  162.398308]  ubifs_jnl_write_inode+0x34c/0x480
[  162.402754]  ubifs_jnl_delete_inode+0x44/0xd8
[  162.407113]  ubifs_evict_inode+0x70/0xf8
[  162.411037]  evict+0xa0/0x168
[  162.414006]  iput+0x208/0x2c0
[  162.416977]  do_unlinkat+0x194/0x278
[  162.420555]  __arm64_sys_unlinkat+0x34/0x60
[  162.424742]  el0_svc_common.constprop.2+0xd0/0x178
[  162.429535]  el0_svc_handler+0x20/0x78
[  162.433286]  el0_svc+0x8/0x600
[  162.436445] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:909
[  162.444945] in_atomic(): 1, irqs_disabled(): 0, pid: 525, name: bonnie++
[  162.451715] INFO: lockdep is turned off.
[  162.455700] CPU: 1 PID: 525 Comm: bonnie++ Not tainted 5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  162.465534] Hardware name: FSL i.MX8MM EVK board (DT)
[  162.470590] Call trace:
[  162.473047]  dump_backtrace+0x0/0x138
[  162.476715]  show_stack+0x14/0x1c
[  162.480038]  dump_stack+0xcc/0x118
[  162.483446]  ___might_sleep+0x1fc/0x228
[  162.487287]  __might_sleep+0x50/0x84
[  162.490869]  __mutex_lock+0x5c/0x888
[  162.494449]  mutex_lock_nested+0x1c/0x24
[  162.498379]  ubifs_update_one_lp+0x38/0x12c
[  162.502568]  ubifs_jnl_write_inode+0x368/0x480
[  162.507017]  ubifs_jnl_delete_inode+0x44/0xd8
[  162.511379]  ubifs_evict_inode+0x70/0xf8
[  162.515307]  evict+0xa0/0x168
[  162.518280]  iput+0x208/0x2c0
[  162.521253]  do_unlinkat+0x194/0x278
[  162.524834]  __arm64_sys_unlinkat+0x34/0x60
[  162.529023]  el0_svc_common.constprop.2+0xd0/0x178
[  162.533820]  el0_svc_handler+0x20/0x78
[  162.537574]  el0_svc+0x8/0x600
[  162.540779] BUG: scheduling while atomic: bonnie++/525/0x00000000
[  162.546931] INFO: lockdep is turned off.
[  162.550903] Modules linked in:
[  162.554024] CPU: 0 PID: 525 Comm: bonnie++ Tainted: G        W         5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  162.565248] Hardware name: FSL i.MX8MM EVK board (DT)
[  162.570304] Call trace:
[  162.572761]  dump_backtrace+0x0/0x138
[  162.576430]  show_stack+0x14/0x1c
[  162.579753]  dump_stack+0xcc/0x118
[  162.583161]  __schedule_bug+0x84/0xac
[  162.586829]  __schedule+0x69c/0x764
[  162.590322]  schedule+0x38/0xc8
[  162.593469]  schedule_preempt_disabled+0x20/0x38
[  162.598092]  __mutex_lock+0x268/0x888
[  162.601759]  mutex_lock_nested+0x1c/0x24
[  162.605688]  spi_nor_lock_and_prep+0x28/0x8c
[  162.609963]  spi_nor_write+0x3c/0x168
[  162.613631]  mtd_write_oob+0x84/0xa4
[  162.617211]  mtd_write+0x48/0x74
[  162.620446]  ubi_io_write+0xf8/0x6a0
[  162.624027]  ubi_eba_write_leb+0x84/0x758
[  162.628041]  ubi_leb_write+0xa8/0xcc
[  162.631623]  ubifs_leb_write+0xa0/0x114
[  162.635465]  ubifs_wbuf_write_nolock+0x4d0/0x658
[  162.640087]  write_head+0x6c/0xd8
[  162.643406]  ubifs_jnl_update+0x274/0x6cc
[  162.647420]  ubifs_unlink+0x1ac/0x278
[  162.651089]  vfs_unlink+0x10c/0x1cc
[  162.654582]  do_unlinkat+0x230/0x278
[  162.658163]  __arm64_sys_unlinkat+0x34/0x60
[  162.662353]  el0_svc_common.constprop.2+0xd0/0x178
[  162.667149]  el0_svc_handler+0x20/0x78
[  162.670903]  el0_svc+0x8/0x600
[  162.674066] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
[  162.682858] Mem abort info:
[  162.685656]   ESR = 0x96000006
[  162.688714]   Exception class = DABT (current EL), IL = 32 bits
[  162.694637]   SET = 0, FnV = 0
[  162.697694]   EA = 0, S1PTW = 0
[  162.700838] Data abort info:
[  162.703722]   ISV = 0, ISS = 0x00000006
[  162.707561]   CM = 0, WnR = 0
[  162.710533] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000b1b76000
[  162.716977] [0000000000000080] pgd=00000000b1b86003, pud=00000000b1b24003, pmd=0000000000000000
[  162.725685] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[  162.731262] Modules linked in:
[  162.734326] CPU: 0 PID: 525 Comm: bonnie++ Tainted: G        W         5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  162.745544] Hardware name: FSL i.MX8MM EVK board (DT)
[  162.750601] pstate: a0000085 (NzCv daIf -PAN -UAO)
[  162.755401] pc : pick_next_task_fair+0x70c/0x91c
[  162.760024] lr : pick_next_task_fair+0x870/0x91c
[  162.764644] sp : ffff0000128bb5e0
[  162.767962] x29: ffff0000128bb5e0 x28: ffff80007bb9fec0
[  162.773280] x27: ffff000010d53724 x26: ffff80007186b330
[  162.778598] x25: ffff80007bb9fed8 x24: 0000000000000000
[  162.783915] x23: 0000000000000000 x22: 0000000000000000
[  162.789233] x21: 0000000000000000 x20: ffff80007bb9ff80
[  162.794550] x19: ffff800078800000 x18: 0000000000000000
[  162.799868] x17: 0000000000000000 x16: 0000000000000000
[  162.805185] x15: 0000000000000000 x14: 302e322e35202020
[  162.810503] x13: 2020202020205720 x12: 0000000000000038
[  162.815820] x11: ffffffffffffffff x10: 0000000000000006
[  162.821137] x9 : ffff00001159f808 x8 : 0000000000000000
[  162.826454] x7 : ffff00001012bbb8 x6 : ffff800076f0c018
[  162.831772] x5 : ffff80007733a400 x4 : 00000000000488fd
[  162.837089] x3 : 000000259f12c800 x2 : 0000000000037dbb
[  162.842406] x1 : 0000000000000000 x0 : 000000000015917c
[  162.847724] Call trace:
[  162.850176]  pick_next_task_fair+0x70c/0x91c
[  162.854453]  __schedule+0x15c/0x764
[  162.857946]  schedule+0x38/0xc8
[  162.861093]  schedule_preempt_disabled+0x20/0x38
[  162.865716]  __mutex_lock+0x268/0x888
[  162.869383]  mutex_lock_nested+0x1c/0x24
[  162.873312]  spi_nor_lock_and_prep+0x28/0x8c
[  162.877587]  spi_nor_write+0x3c/0x168
[  162.881255]  mtd_write_oob+0x84/0xa4
[  162.884835]  mtd_write+0x48/0x74
[  162.888069]  ubi_io_write+0xf8/0x6a0
[  162.891650]  ubi_eba_write_leb+0x84/0x758
[  162.895664]  ubi_leb_write+0xa8/0xcc
[  162.899247]  ubifs_leb_write+0xa0/0x114
[  162.903088]  ubifs_wbuf_write_nolock+0x4d0/0x658
[  162.907710]  write_head+0x6c/0xd8
[  162.911030]  ubifs_jnl_update+0x274/0x6cc
[  162.915044]  ubifs_unlink+0x1ac/0x278
[  162.918712]  vfs_unlink+0x10c/0x1cc
[  162.922205]  do_unlinkat+0x230/0x278
[  162.925786]  __arm64_sys_unlinkat+0x34/0x60
[  162.929975]  el0_svc_common.constprop.2+0xd0/0x178
[  162.934772]  el0_svc_handler+0x20/0x78
[  162.938525]  el0_svc+0x8/0x600
[  162.941587] Code: f94037a0 eb13001f 54fffb80 91030018 (f94042b4)
[  162.947688] ---[ end trace 01df3085c486e199 ]---
[  162.952400] note: bonnie++[525] exited with preempt_count 2
[  162.958185] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000088
[  162.966977] Mem abort info:
[  162.969776]   ESR = 0x96000006
[  162.972834]   Exception class = DABT (current EL), IL = 32 bits
[  162.978757]   SET = 0, FnV = 0
[  162.981814]   EA = 0, S1PTW = 0
[  162.984958] Data abort info:
[  162.987842]   ISV = 0, ISS = 0x00000006
[  162.991680]   CM = 0, WnR = 0
[  162.994653] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000b1b76000
[  163.001096] [0000000000000088] pgd=0000000000000000
[  163.005981] Internal error: Oops: 96000006 [#2] PREEMPT SMP
[  163.011557] Modules linked in:
[  163.014623] CPU: 0 PID: 9 Comm: ksoftirqd/0 Tainted: G      D W         5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  163.025928] Hardware name: FSL i.MX8MM EVK board (DT)
[  163.030984] pstate: 60000085 (nZCv daIf -PAN -UAO)
[  163.035786] pc : pick_next_task_fair+0x6b8/0x91c
[  163.040408] lr : pick_next_task_fair+0x6b8/0x91c
[  163.045028] sp : ffff0000122f3cb0
[  163.048346] x29: ffff0000122f3cb0 x28: ffff80007bb7eec0
[  163.053664] x27: ffff000010d53724 x26: ffff800078c2c9e8
[  163.058981] x25: ffff80007bb7eed8 x24: ffff00001159f000
[  163.064298] x23: ffff0000115a2d88 x22: ffff000011572000
[  163.069616] x21: ffff0000122f3dc8 x20: ffff80007bb7ef80
[  163.074933] x19: ffff800078c2c440 x18: 0000000000000000
[  163.080250] x17: 0000000000000000 x16: 0000000000000000
[  163.085567] x15: 0000000000000000 x14: 30322d7478656e2d
[  163.090885] x13: 3163722d302e322e x12: 0000000000000038
[  163.096202] x11: ffff80007827b400 x10: 0000000000000000
[  163.101519] x9 : ffff00001159f808 x8 : ffff800078c2c440
[  163.106837] x7 : 00000000ffffffff x6 : ffff800078c2c530
[  163.112154] x5 : 00000000fffffff7 x4 : ffff000010137720
[  163.117471] x3 : ffff000010d85000 x2 : 0000000000000000
[  163.122788] x1 : 0000000000000000 x0 : 0000000000000000
[  163.128105] Call trace:
[  163.130557]  pick_next_task_fair+0x6b8/0x91c
[  163.134834]  __schedule+0x15c/0x764
[  163.138328]  schedule+0x38/0xc8
[  163.141475]  smpboot_thread_fn+0x1f8/0x2b4
[  163.145576]  kthread+0x104/0x130
[  163.148811]  ret_from_fork+0x10/0x18
[  163.152394] Code: 17ffff09 d2800001 aa1403e0 97ffdb57 (f9404414)
[  163.158495] ---[ end trace 01df3085c486e19a ]---
[  163.163118] ------------[ cut here ]------------
[  163.167743] do not call blocking ops when !TASK_RUNNING; state=1 set at [<0000000041b58022>] smpboot_thread_fn+0x50/0x2b4
[  163.178715] WARNING: CPU: 0 PID: 9 at kernel/sched/core.c:6089 __might_sleep+0x7c/0x84
[  163.186633] Modules linked in:
[  163.189694] CPU: 0 PID: 9 Comm: ksoftirqd/0 Tainted: G      D W         5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24
[  163.200999] Hardware name: FSL i.MX8MM EVK board (DT)
[  163.206054] pstate: 80000085 (Nzcv daIf -PAN -UAO)
[  163.210849] pc : __might_sleep+0x7c/0x84
[  163.214777] lr : __might_sleep+0x7c/0x84
[  163.218702] sp : ffff0000122f38f0
[  163.222020] x29: ffff0000122f38f0 x28: ffff800078c2c440
[  163.227338] x27: ffff000010d53724 x26: ffff800078c2c9e8
[  163.232655] x25: ffff80007bb7eed8 x24: 0000ffffffffffff
[  163.237973] x23: ffff000012267000 x22: ffff0000100f3540
[  163.243290] x21: 0000000000000000 x20: 0000000000000022
[  163.248607] x19: ffff00001121eb40 x18: 0000000000000000
[  163.253925] x17: 0000000000000000 x16: 0000000000000000
[  163.259241] x15: 0000000000000000 x14: 3030303030303c5b
[  163.264559] x13: 2074612074657320 x12: 313d657461747320
[  163.269876] x11: 3b474e494e4e5552 x10: 5f4b53415421206e
[  163.275194] x9 : ffff00001159f808 x8 : 0000000000000000
[  163.280511] x7 : ffff0000101641b0 x6 : 0000000000000000
[  163.285828] x5 : 0000000000000001 x4 : 0000000000000001
[  163.291145] x3 : 0000000000000007 x2 : 0000000000000006
[  163.296462] x1 : f06f279cea113800 x0 : 0000000000000000
[  163.301778] Call trace:
[  163.304230]  __might_sleep+0x7c/0x84
[  163.307810]  exit_signals+0x48/0x2bc
[  163.311390]  do_exit+0xac/0xb68
[  163.314536]  die+0x1c4/0x1d0
[  163.317423]  die_kernel_fault+0x64/0x74
[  163.321264]  __do_kernel_fault+0x84/0xac
[  163.325191]  do_page_fault+0x11c/0x3c4
[  163.328945]  do_translation_fault+0x6c/0x78
[  163.333132]  do_mem_abort+0x3c/0x9c
[  163.336625]  el1_da+0x20/0x94
[  163.339598]  pick_next_task_fair+0x6b8/0x91c
[  163.343873]  __schedule+0x15c/0x764
[  163.347366]  schedule+0x38/0xc8
[  163.350511]  smpboot_thread_fn+0x1f8/0x2b4
[  163.354612]  kthread+0x104/0x130
[  163.357845]  ret_from_fork+0x10/0x18
[  163.361423] irq event stamp: 72552
[  163.364831] hardirqs last  enabled at (72551): [<ffff0000100f4e8c>] run_ksoftirqd+0x48/0x70
[  163.373187] hardirqs last disabled at (72552): [<ffff000010d53048>] __schedule+0xc0/0x764
[  163.381368] softirqs last  enabled at (72550): [<ffff000010082010>] __do_softirq+0x4a8/0x554
[  163.389810] softirqs last disabled at (72545): [<ffff0000100f4e88>] run_ksoftirqd+0x44/0x70
[  163.398162] ---[ end trace 01df3085c486e19b ]---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
