Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C26C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3BJbKhIzZzGh/w5NPiOkXsexYau4pxOXDX2hJXepbU=; b=dpbsfYhtO6FgIi
	2k4qURu9fpbR6CxfQTF5YZivEb9L8rMbkd3DS0oBKvspeQg62x2IZ2D02k+61R1M6u6TacUnzW2d0
	3LAfa5fXD/vUNcbxsxtN2Pb07UnLaQ0wxvSyQsC/5iKM92tIet1SS43pMBVDGrRpgZMOC8pSNo+vH
	uZ6CPh6tswzBmUFP0Mn2e2IxLP0/YLhhG47W95zVjppPeFLEeXo++cTm24hPf+VvdH6zXP6tfez/w
	SxEa1sN8z/nR1wNVijVCpdBB3w2hR9JkGgUI3PL6oNLx8GWFVh6xRe9AmmsklwD2RvfOQNXPVaukd
	kIjiMfcTTPDVE1uTmsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT08N-000000008kH-3YWy;
	Thu, 25 Jan 2024 13:51:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT084-000000008Vx-1smn
	for linux-mtd@bombadil.infradead.org;
	Thu, 25 Jan 2024 13:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ryyRusqubgiVt3ajbyowWJNy0QQq0jhKr1iynf6CUZQ=; b=VYkBF34lZybR0b9nnU3WwRGi7R
	ZjdMCkA5Vf+yljLgKizM93mBjCizlAWUftJWy/2eFoaQuZkEla1OTUF1NJq5jBZiT/L1a+33X+p5v
	ZrNSxKiol1p6/XlXyVX+NM0MZVe5BlFRXK5BDdtowlqrl9plyYZdnvqbCx1+H8/NwRv+aEGw+WWmo
	v8f1MhEPFZT/tcCT6AJaGBHSTyLc7Sv7rbBsP3qFrhoVhu/AmhnnIAeIrYtV0sq38iS2kI1974+oy
	RkrfkaWb1UgshgtEyG5Ygtj39aSHT7TD+Zgr+EOM87Mr1fRvsytRbQrK0qR3ANywUTXVGnLD1iok4
	PedXGYdA==;
Received: from mail-me3aus01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2818::801] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSyE6-00000005EQD-2ged
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 11:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEjcUuWnDqXgnh22GTvk+3PzfocnO6Kdl7LZmg+jnQkTqHvlBLCMTGW5swKXtWOhAL8ihqBgRw0lKiNVECVdYgHBeeo6WVqoTFIlXdq+DBNxJrD8Zk0UW6aMMjUdisq5viKiJvB3Q0UF8GoBErqMJ57o7j7mYPEJbC6Le/aeCJWDsM3IL+R8lC2Mh/XsvsL2RTYeKzIpi8gR8PHrHWwqR+M8kowyDo4LHyclAxcXaFaiKq4xrXiYL4UqXf0EEYwgl0ihvpoLeLN2yBEufwZxHUJQkB76wcwEQvGKCKtaHp2aZLjEl9ft3N/RghFVxLRRUKyy261qSEEVGcGEVgkzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryyRusqubgiVt3ajbyowWJNy0QQq0jhKr1iynf6CUZQ=;
 b=EL5UOQGMuNHG2aofwfWjgplmIB8tYzWbykWoxF0nw34irlaqvyy6H7wh7jeOrjqkyRj4x46XqhSKpMiIpKyMWz96QY/YKo2x8X5KbMz+Z6Vf+HVI2pZVr93qT/Ld/dCTQYejYsMqiTOen9bFiEY4xCJzoF7zNDkRyF6bzwfboDHzw55RT2WNncbq8BCGZtc6KKUWRgH42Uo/fZ8ZTQhbjz2DPfZKpg7lsB6zCQQjNavHmI/gG2QKzOHpZts9ysRjSuqrFDHB0zlk+qQNQ3ZeNljj3CRcu7o9RXBd/JgxgBxbHT9VNegGi/yPqVaZXNdrx8lBDyf/aqRxFbE25nr7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryyRusqubgiVt3ajbyowWJNy0QQq0jhKr1iynf6CUZQ=;
 b=ZUzdGVPCOkNoFEQREjWYfLMNUy8F3jX9UOefftNGf2/cjRyVJiMvWZ+oZnDaIg3SWi8P8OnrPsAgWmNOMHGPaNtvik1vJGkpka8Vh6uJNA2TVk9+Nadg4f6UaMNZVlBAxL6lzwunhJE/X8joioMSGkkDDQMr18C13/kgXetLAxKXwBjQTwFfKW5u1+Adw65adSyoIkAqrwMpqQ1WPMW7PP/iXwBkSr3zyoGpCnmR27tpgLGUw3O+k694eEFXBV8LsqKbk22EUGT4rc+GuuNrQdZOd/Aav7soRas+jUYo1pO+GpC4uVGX/9tTCwJfg/FOTTHlUW6rVGM8vr/DmZ/t5A==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY7P282MB3851.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 11:48:07 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5c9c:492c:49ad:813a]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::5c9c:492c:49ad:813a%6]) with mapi id 15.20.7228.023; Thu, 25 Jan 2024
 11:48:06 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs: master area fails to recover when master node 1 is corrupted
Thread-Topic: ubifs: master area fails to recover when master node 1 is
 corrupted
Thread-Index: AQHaT3/4KFNTQ257tUeGc3qFkxFolw==
Date: Thu, 25 Jan 2024 11:48:06 +0000
Message-ID: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [aFuxlJ+c9osMubVxmTwgRmO9j9aCoxXK]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY7P282MB3851:EE_
x-ms-office365-filtering-correlation-id: 32eb7aab-2b86-4202-9151-08dc1d9b7ef5
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIubuxOZibnnGY3i7/PeEY6sDJSTYudQtDl4VHqYTFp8gmvfE8oVQnXQb80dqc27Z1SVGypw/xZZ9qThuch/Fuz1rJVWWk+jX8BoXXu8LdBb6oJzo6jkg7zvyPI3pzDY0QPQTdZ4ebRuzeo3ROONMNxwarUbJmGyIe7KZyHE6KOI2jBbD6mjb5FJNIWrHKl3GycBjLGODAbsbR236MQO71nvMKZE0WAHlJaHjArGVhGcP0U6EPBy5QASASYQInoddTITIWPaKzcjxpcdyitP4PCmi+XCj/KdQtqIMY771VPE73FyEfFk7mtljTrR85hv17ooPA7vLP+Yi97aOENJdGhfvvOIpLEmCRBm1m69qWcbgciERZmKqKqsVMqRf0SNEJ0ZePmIlJyAj6/imTk6fw3JgNl6ZDv3ZAr1zTPEmtdCLU7LdQp9XzKNns4hlRaAoZpLwz4wA9QY6IFpJnHXCpmkPDUmPtOjk0OcqsoArWmWLsCnnGGzT2XpA505gpNDBoP0LXbQ5WVIBxZwdh20G7F2VwNAjiM/hbAxrru3J82gDzjgHkm7OTveXO2jOiMN
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mh74mYb9ncvNh8jct3FzgPo60L4+4xua1T3SQQBrBrpSgFwk4QIO6sWymZ?=
 =?iso-8859-1?Q?xaz6pBIPx2FoV3E63ubKEKcG/45ONvZ11FtglkVc0iIMs9huk+H9fio4ek?=
 =?iso-8859-1?Q?5705oa//T2i5obLfCjkbOBz7PCJeN5c7eUPpoGZODzbeh1dN7pgWu2Dkee?=
 =?iso-8859-1?Q?OcwILcmarFCzJ8C8REICZ+8WpiQbU+/CVThtjEHO0Z/Dka75GxiQZa7i49?=
 =?iso-8859-1?Q?OHq+QMd+JLS2uTNymAYt82jRMAKWAM8+5O6RQJRITmw8IfSMqIEOe2DmpD?=
 =?iso-8859-1?Q?yXXFbipd/nqxD6tlj6KwSlBFoif80ejSg4+vn8Q41ihhTeqPOE654pIXNx?=
 =?iso-8859-1?Q?4LYI5YljrTZtXg06VuVsT8vR7yiYmTIkWTRIBJ77nJv5uE1amkPoP3axvY?=
 =?iso-8859-1?Q?s7su/pSjCq4YZZ4fX/9+PRK3G4WH0fmjDyEidKpzEeMFQtV7GFMRcB4cZs?=
 =?iso-8859-1?Q?DSUiIT0Os7+ZTOQwMVeK1gqfYtMJ8X6pcu1Bkunx2jl14DelUg393gYoOT?=
 =?iso-8859-1?Q?ztwacelZ8Ow3Wd1282RhKLeazzBeHvsEa9NumyVWvXMPCSrfF3CWBCbPId?=
 =?iso-8859-1?Q?m3wqa6pr0epWQdYcT7vmw9K1hj4pJX6WKxmiW+pzkIlIxktx2t0gXPGMLb?=
 =?iso-8859-1?Q?jOWwLzT1QHZak6ujoxDilc9c28oOcsE5jVPA42/GiAhXGsHNtYAQLlWKej?=
 =?iso-8859-1?Q?VU/WKzwNO6PYnX3Z8VQ7+UswlwX1V7oYEu5sENZNQFTSlSNRTHK19ajYK8?=
 =?iso-8859-1?Q?yhe6JuFUXfJc0wgkL0F3a11VJ4hrSFlxfcQDlG+leILmo7oDB6/EX2rNbq?=
 =?iso-8859-1?Q?90CoPZ4xpGZWy6ENIhx8eA7y7dA3PnQdF2zvRtjlMzg+y7du33SKZCDOYb?=
 =?iso-8859-1?Q?aAaV0iD1suyzAgqsdWlKrTphX8QNPSpvn8c/viPfU+qj5pQbNGl/3IM22K?=
 =?iso-8859-1?Q?JQm7jkI9rnyjhyGD7W04r4ubrJRlTFIeI02UYj3HUuprJudhS0utFEaJye?=
 =?iso-8859-1?Q?k/LF2F1FEOOBQxvXolD/q7pzkQvwgwS/2nhBhP5WXfA1d75b95Ac+tE7Ks?=
 =?iso-8859-1?Q?5PixdgkHCmLbJP8snbtHNd9P8LNBpAyE0Lp7HKnwXXPUg1Z9/dJxxqfjHQ?=
 =?iso-8859-1?Q?f6VIMvaVc1MpZPLZC+PcrlyUy8kddlvM9hHhA05ypf0fv2EVeGoXVMH0iu?=
 =?iso-8859-1?Q?gv9/w7AlerwYllDcdhCIHQ52ut8fzj7f7gDudU4NXmooMO523Gvsns2GHS?=
 =?iso-8859-1?Q?1VfExMAVZydHKNZWIBFw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eb7aab-2b86-4202-9151-08dc1d9b7ef5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 11:48:06.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_114858_838048_F7F8C6DE 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi,

I just find that master area will always fail to recover while mounting, when master node 1's CRC is corrupted but master node 2 is completely good.  It can be 100% reproduced on Kernel v5.4.233, but it seems a common issue.

How to reproduce it:
1. Corrupt the CRC value of master node 1 (keep master node 2 is good) on ubifs.
2. Mount this ubifs. 

Mount at step#2 will always fail. From the log, it looks master recovering fails, but master recovering is expected to be OK in such case.

Below is the kernel log of this failure:

ubifs_mount:2253: UBIFS DBG gen (pid 10770): name ubi0:test_volume, flags 0x0
ubifs_mount:2274: UBIFS DBG gen (pid 10770): opened ubi0_0
ubifs_read_node:1094: UBIFS DBG io (pid 10770): LEB 0:0, superblock node, length 4096
UBIFS (ubi0:0): Mounting in unauthenticated mode
ubifs_read_superblock:765: UBIFS DBG mnt (pid 10770): Auto resizing from 13 LEBs to 100 LEBs
ubifs_start_scan:131: UBIFS DBG scan (pid 10770): scan LEB 1:0
ubifs_scan:270: UBIFS DBG scan (pid 10770): look at LEB 1:0 (253952 bytes left)
ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 1:0
UBIFS error (ubi0:0 pid 10770): ubifs_scan [ubifs]: bad node
ubifs_recover_master_node:234: UBIFS DBG rcvry (pid 10770): recovery
ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 1:0
get_master_node:163: UBIFS DBG rcvry (pid 10770): found corruption at 1:0
ubifs_scan_a_node:77: UBIFS DBG scan (pid 10770): scanning master node at LEB 2:0
get_master_node:152: UBIFS DBG rcvry (pid 10770): found a master node at 2:0
UBIFS error (ubi0:0 pid 10770): ubifs_recover_master_node [ubifs]: failed to recover master node
UBIFS error (ubi0:0 pid 10770): ubifs_recover_master_node [ubifs]: dumping second master node
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 10772
        magic          0x6101831
        crc            0x3a5c03b2
        node_type      7 (master node)
        group_type     0 (no node group)
        sqnum          9
        len            512
        highest_inum   65
        commit number  0
        flags          0x2
        log_lnum       3
        root_lnum      12
        root_offs      0
        root_len       108
        gc_lnum        11
        ihead_lnum     12
        ihead_offs     4096
        index_size     112
        lpt_lnum       7
        lpt_offs       44
        nhead_lnum     7
        nhead_offs     4096
        ltab_lnum      7
        ltab_offs      57
        lsave_lnum     0
        lsave_offs     0
        lscan_lnum     10
        leb_cnt        13
        empty_lebs     1
        idx_lebs       1
        total_free     753664
        total_dirty    7640
        total_used     440
        total_dead     0
        total_dark     16384
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
