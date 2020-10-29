Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29083C4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F3720739
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2YdaJgK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=adva.com header.i=@adva.com header.b="b30jntpP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81F3720739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=adva.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z37jrLvXDuIds82YgB/eSkij0BwL7wn6yweWLlqQf6w=; b=H2YdaJgKZDDd7Wr1FWS/vvsIZg
	sBYWmTEkVj3SAJCfYyJwXkudMlBj7BrwDIMNrkhtfx/aWao5j0oy6EMizZ1O+mnGzvNTWKISlBzyH
	qI/iwXlb53noXko3m6Z/idfm5PDIQrJFSF+0epav6Lo5rWcIdGN9TKKuUbNT4E48DD5fGdDBnnscH
	83jdPAJe3HuBaTeSFlzCbEc9MK2absUJ3yLYZtZTTaejXg6W5TDD+OLd0lJx3uK/MkT6BMw9Hbs43
	ostCf78VNnhez2NyySQyKrxH2Ksz1TeWECGiBTrPxlD/zPHYjVpS+xvX8kQgnRh87jts12DRZwK05
	BnVAJh/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXzrk-0004yt-2p; Thu, 29 Oct 2020 04:48:48 +0000
Received: from mail01.advaoptical.com ([91.217.199.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXzrg-0004xz-UE
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 04:48:46 +0000
Received: from pps.filterd (muc-vs-mailppa1.advaoptical.com [127.0.0.1])
 by muc-vs-mailppa1.advaoptical.com (8.16.0.42/8.16.0.42) with SMTP id
 09T4kPhF007680
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 05:48:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adva.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=dkad20200122;
 bh=i+NWLhoqhXKLtqULSAgD8BzzvpJqVAD0hRoKrayeSGw=;
 b=b30jntpP/GkC4sQeQHcqOZ7NyB85Vr0yQb9pSR0JNYqMat3n1wOWhoZd7jbCa0/1LkvH
 lC4QhmMmjEugSY+VkLMnKc1tZMwDWCnoBOsPCpV49RS4Kk+SQmLhUg4xFCJPXTFIT/jm
 byumetY1CuknFb3Ais9OwjnOvQ8mUQbRM9BM435pAOkcihHk0WL4wso1/67gPhD0GY1J
 +fjMRz22XCbJ8Obptyx3yXVDgopfh/RXZ6SJnn0tKBfUyKVE/iiEMZGKGlAOa+8eacG6
 NqlxZP8Ygqye1Z5WtLwZ6v4I86fPPTTwdj1T+9e3zdATJdpSA95mrFP8IqdIhnQB9eYd RQ== 
Received: from muc-s-ex16d.advaoptical.com ([172.20.1.28])
 by muc-vs-mailppa1.advaoptical.com with ESMTP id 34cabcy1ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 05:48:40 +0100
Received: from MGN-S-EX19B.advaoptical.com (172.25.1.194) by
 MUC-S-EX16D.advaoptical.com (172.20.1.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Oct 2020 05:48:39 +0100
Received: from MGN-S-EX19A.advaoptical.com (172.25.1.193) by
 MGN-S-EX19B.advaoptical.com (172.25.1.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; 
 Thu, 29 Oct 2020 05:48:39 +0100
Received: from MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37]) by
 MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37%7]) with mapi id
 15.02.0721.002; Thu, 29 Oct 2020 05:48:39 +0100
From: Barak Adam <BAdam@adva.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS corruption in empty space during mount
Thread-Topic: UBIFS corruption in empty space during mount
Thread-Index: AdatrnVGUyizTmJwTt+/2sPCJIuVRg==
Date: Thu, 29 Oct 2020 04:48:39 +0000
Message-ID: <a60546366eb049698c7a0b5426361833@adva.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.1.232]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_01:2020-10-28,
 2020-10-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_004845_284880_D89E8BFD 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

We are facing a kernel panic in our legacy switches, similar to one in the following post:

https://patchwork.ozlabs.org/project/linux-mtd/patch/loom.20120319T102527-948@post.gmane.org/


This corruption happens upon root FS mount and thus triggers a kernel panic upon system init.

System description:
=================

Our system is legacy, using Marvell Cetus SOC with a raw 1Gbit NAND of Micron, NAND ECC is 8 bit.

We are using UBIFS, Linux-3.10.70.

NAND driver is "armada-nand" by Marvell (mtd/nand/mvebu_nfc/nand_nfc.c),  based on the PXA drivers/mtd/nand/pxa3xx_nand.c.

Using a script of endless loop of power cycling, we get this panic:
========================================================

UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 3:7571

UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 3:7571

UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 3:7571

UBIFS error (pid 1): ubifs_scan: LEB 3 scanning failed

VFS: Cannot open root device "ubi0:root" or unknown-block(0,0): error -117

Please append a correct "root=" boot option; here are the available partitions:

Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

============================================================


I did read some of the posts about corruption of empty space for UBIFS.

Most of them recommend applying a fix on the lower layers, mtd or nand drivers.



In the past we had similar issues, it was happening during recovery of master node and I applied the following commits:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=730a43fbc135e593cc3de3b1b895e49c05c8e2dc

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40cbe6eee97b706f27bcc4c6aa1018bbe4f1e577

But now I think it is happening during mount, while UBIFS replaying the journal and it is a different scenario.


As far as I understand, this is the call stack now that leading to the panic:

 [<c0015050>] (unwind_backtrace+0x0/0xf8) from [<c00115f4>] (show_stack+0x10/0x18)

[<c00115f4>] (show_stack+0x10/0x18) from [<c0196634>] (ubifs_scan+0x29c/0x378)

[<c0196634>] (ubifs_scan+0x29c/0x378) from [<c0196aa4>] (ubifs_replay_journal+0x104/0x1380)

[<c0196aa4>] (ubifs_replay_journal+0x104/0x1380) from [<c018caf8>] (ubifs_mount+0xe88/0x15c8)

[<c018caf8>] (ubifs_mount+0xe88/0x15c8) from [<c00a0830>] (mount_fs+0x14/0xc8)

[<c00a0830>] (mount_fs+0x14/0xc8) from [<c00b7620>] (vfs_kern_mount+0x4c/0xc4)

[<c00b7620>] (vfs_kern_mount+0x4c/0xc4) from [<c00b992c>] (do_mount+0x1ac/0x8e8)

[<c00b992c>] (do_mount+0x1ac/0x8e8) from [<c00ba0ec>] (SyS_mount+0x84/0xbc)

[<c00ba0ec>] (SyS_mount+0x84/0xbc) from [<c0674ee0>] (mount_block_root+0x104/0x22c)

[<c0674ee0>] (mount_block_root+0x104/0x22c) from [<c06751a4>] (prepare_namespace+0x90/0x194)

[<c06751a4>] (prepare_namespace+0x90/0x194) from [<c0674bf0>] (kernel_init_freeable+0x180/0x1c8)

[<c0674bf0>] (kernel_init_freeable+0x180/0x1c8) from [<c04de5e8>] (kernel_init+0x8/0x154)

[<c04de5e8>] (kernel_init+0x8/0x154) from [<c000dfd8>] (ret_from_fork+0x14/0x3c)


ubifs_scan (fs/ubifs) is called to scan the lebs.

It detects the corrupted empty space, dump the corruption messages as shown above, and return the -EUCLEAN error code that makes the kernel panic.

 ubifs_scan:

--> calls ubifs_start_scan (fs/ubifs)

--> which calls ubifs_leb_read (fs/ubifs)

--> which calls ubi_read (mtd/ubi.h)

--> which calls ubi_leb_read (mtd/ubi)

ubi_leb_read calls lower layer nand driver functions but finally returns with -EBADMSG error code indicating that the MTD driver has detected a data integrity problem (unrecoverable ECC checksum mismatch in case of NAND).

 I am still debugging, looking for any solution / workaround.


Thanks !
Barak

Please see our privacy statement at https://www.adva.com/en/about-us/legal/privacy-statement for details of how ADVA processes personal information.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
