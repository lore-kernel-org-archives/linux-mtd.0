Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1C606A32C
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MozxOwvG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fJThzyC/Q+7ugc5EbNtEK8XQG9dEOatu2QUHCoMysNo=; b=MozxOwvG5XBEdswCKd+vvfXRML
	GFuz1zhD7XQOeZpVISn5xaEsRrXKpx11c14romCEEbdBClpHQsusgdXalN7syjJEFEpZzYlQYdDjA
	P38SyScl9reZ6f5wmkDHj7w8vDYqYSecTevzO+6drzeifZQkl6GvmyJuGZitp6ftNpVmP1FAxh1NE
	j+b+rytA9GrQtzfkw7A+JdnZVRTrj7UJ8539uZtEzicL/DRtDWnKRP/LeAl22xYE3K/gqM8TjBwc+
	quYnCo8qDarZbzsrHudKk7BI8TVr9qaUw4s5wkqIifj98QuXgDGwHNn8jKHMt+ErzITKW6sY33EF2
	VcbqBbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsM9-0000000GfD2-0lkN;
	Mon, 02 Nov 2026 13:45:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsM1-0000000GfAW-2c33
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 13:45:46 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jJCdS11NSz8XrrJ;
	Mon, 02 Nov 2026 21:45:32 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6A2DjS7c084264;
	Mon, 2 Nov 2026 21:45:28 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 2 Nov 2026 21:45:31 +0800 (CST)
X-Zmail-TransId: 2af96ae893fbe0f-10c10
X-Mailer: Zmail v1.0
Message-ID: <20261102214531231UAVA89ay_BDVcwFmrv8cq@zte.com.cn>
Date: Mon, 2 Nov 2026 21:45:31 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>
Cc: <chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gdWJpZnM6IGhhcmRlbiB2YWxpZGF0aW9uIG9mIG9uLWRpc2sgaW5vZGUgYW5kIG5vZGUgbWV0YWRhdGE=?=
X-MAIL: mse-fl2.zte.com.cn 6A2DjS7c084264
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 02 Nov 2026 21:45:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE893FC.000/4jJCdS11NSz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054541_861382_F3C1C406 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series tightens the checks ubifs performs on the metadata it reads
from flash.  All five patches are about size and accounting fields that
are taken from the image and later used without a range check; an image
whose CRCs and node tags are intact can therefore drive the code into
state it never expects.

Patch 1 rejects inodes whose size does not fit the signed loff_t the size
is stored in.  A 64-bit value with the top bit set becomes negative and
passes the max_inode_sz check, and the read paths then do size arithmetic
with it, for example (i_size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT
in do_readpage() and (i_size - 1) >> PAGE_SHIFT in populate_page().

Patch 2 rejects xattr inodes whose i_size does not match data_len.  ubifs
keeps the two equal for attribute inodes, and ubifs_xattr_get() and
remove_xattr() assert on the invariant; with assert=read-only or
assert=panic a plain getxattr() or removexattr() turns the file system
read-only or panics the kernel.

Patch 3 checks the lower bound of the master node's highest_inum.  Today
only the upper bound is validated, so a value below UBIFS_FIRST_INO is
accepted and ubifs_new_inode() allocates numbers from the range reserved
for special inodes.  With highest_inum == 0 the first new inode gets
number 1, which is UBIFS_ROOT_INO and already in use, and the index ends
up with two inodes sharing a number.

Patch 4 validates inode and data node sizes during replay.  replay_bud()
trusts them, and ubifs_recover_size() may then extend an inode to a bogus
size.  The normal read paths already reject such nodes, and truncation
nodes are checked in replay_bud() as well; do the same here.  The data
node end offset is also computed in 64 bits so that a large block number
cannot wrap.

Patch 5 refuses xattr accounting that cannot be decremented.  On an image
whose counters are already zero or smaller than the entry being removed,
the unsigned counters wrap and ubifs_jnl_delete_xattr() writes the bogus
values back to flash; the next mount then rejects the inode because
xattr_names + xattr_cnt exceeds XATTR_LIST_MAX, so a single removexattr()
makes the image unmountable.

To keep the severity claims honest: mounting such an image needs
CAP_SYS_ADMIN in the mounting namespace (or access to the flash), so none
of these is a non-root attack.  Patch 2 only turns into read-only or panic
with the assert= option; the default action is to report.  Patch 5 is the
one with a persistent effect.  Patches 1-3 are mount-time validation,
patch 4 is in replay, patch 5 is runtime accounting.

The patches are independent, have no inter-patch dependencies and can be
applied in any order or as a subset.  All five carry Fixes: and
Cc: stable.

Testing: each patch applies to next-20261030, passes checkpatch.pl
--strict with 0 errors/0 warnings/0 checks, and fs/ubifs/ builds with
CONFIG_UBIFS_FS_AUTHENTICATION, CONFIG_UBIFS_FS_XATTR and
CONFIG_UBIFS_FS_SECURITY enabled and W=1 without new warnings.  I did not
mount crafted images: this machine has no mkfs.ubifs/ubi tools and no
mtdram or nandsim setup.  I can put together an image for any of the five
if a runtime check would help the review.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
