Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C16FC282EC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 02:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QS4QRjm/D44p2jK4oNZ0UzhWz8D1yEVd7U5e5KMtwmg=; b=FhmowYrrh8hPPO
	9n0aZ44bhIpKlvFI8TnQ2vouRq6ik9pUUsvgkqX8aFXNMr5WCQZ8nl27f9RuTwyq+g0Rz5xTozD8l
	byP2N+TsO8oLeQcj7SxUCKFMpqPpoK+9eR5J41OdehnaUdkrb0jZiCPeY6aKXducRamKfGU7/bu9t
	OgPXRft4q+ROqlhHMdTJZp1bBfWHq1aMDX6Jgdad5huxn9ZEIxsJ5iiCKalKCcehKOEtxlq9x0tnT
	nzy3UD9ujjYedArPeTYCaUP0U+XT6krjFOJeRjHcFwOVQHq6vlCFyOVCDeencltc/upMAXMPQUaD5
	1opgy0L7+GdvkSOpI3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujT0-00000007pHb-41pc;
	Wed, 19 Mar 2025 02:47:38 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujSa-00000007p9C-3Qt4
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 02:47:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZHY3K5H2Yz1R7Cv;
	Wed, 19 Mar 2025 10:45:17 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D06C71A016C;
	Wed, 19 Mar 2025 10:47:01 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 19 Mar
 2025 10:47:01 +0800
From: Wang Zhaolong <wangzhaolong1@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [RFC 0/1] fs/jffs2: Deadlock in write buffer recovery path
Date: Wed, 19 Mar 2025 10:46:59 +0800
Message-ID: <20250319024700.10364-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg500010.china.huawei.com (7.202.181.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_194713_214848_8BEA6366 
X-CRM114-Status: GOOD (  21.21  )
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

## Introduction

I discovered a potential deadlock in the JFFS2 file system when an error
occurs during the write buffer flush. The issue is an AA-deadlock where
the same lock (c->wbuf_sem) is acquired twice in a nested manner by the
same thread. The attached patch attempts to fix this issue, but I'm
concerned about a potential recursive stack overflow problem that could be
introduced by the fix.

## Problem Analysis

The deadlock occurs in the following execution path:

```
jffs2_write_end
  jffs2_write_inode_range
    jffs2_write_dnode
      jffs2_flash_writev
        down_write(&c->wbuf_sem)            # first hold lock
        __jffs2_flush_wbuf
          mtd_write()                       # return error
          jffs2_wbuf_recover
            jffs2_reserve_space_gc
              jffs2_do_reserve_space
                jffs2_flush_wbuf_pad
                  down_write(&c->wbuf_sem)  # AA deadlock
```

When an error occurs during mtd_write() in __jffs2_flush_wbuf, the error
handling code calls jffs2_wbuf_recover to attempt recovery. This function
eventually calls jffs2_reserve_space_gc and jffs2_do_reserve_space. If the
write buffer is dirty, jffs2_do_reserve_space will call jffs2_flush_wbuf_pad,
which tries to acquire the wbuf_sem again, resulting in a deadlock since
the thread already holds this lock.

## Problem Reproduce

### kernel config:

```
CONFIG_MTD=m
CONFIG_MTD_PARTITIONED_MASTER=y
CONFIG_MTD_NAND_CORE=m
CONFIG_MTD_NAND_ECC_SW_HAMMING=m
CONFIG_MTD_RAW_NAND=m
CONFIG_MTD_NAND_NANDSIM=m

CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_SUMMARY=y
CONFIG_JFFS2_FS_XATTR=y
CONFIG_JFFS2_FS_POSIX_ACL=y

CONFIG_FAULT_INJECTION=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAIL_FUNCTION=y
CONFIG_FAIL_MAKE_REQUEST=y
```

### Reproduce step

```shell
ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB
modprobe nandsim id_bytes=$ID parts=200
flash_erase /dev/mtd1 0 0
modprobe jffs2
mount -t jffs2 mtd1 /mnt
dd if=/dev/urandom of=/mnt/testfile bs=1M count=1


# Injecting function failure
mountpoint -q /sys/kernel/debug || mount -t debugfs nodev /sys/kernel/debug
FAILTYPE=fail_function
FAILFUNC=mtd_write
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -5 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
# There is a 90% probability that triggering fails.
echo 90 > /sys/kernel/debug/$FAILTYPE/probability
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

#  Overwrite the file until the process stops responding.
while true; do dd if=/dev/urandom of=/mnt/testfile bs=1M count=1; done

## The solution I can think of

The approach in the attached patch is to add a new parameter (wbuf_sem_held)
to jffs2_reserve_space_gc and jffs2_do_reserve_space functions, indicating
whether the calling context already holds the wbuf_sem lock. When jffs2_wbuf_recover
calls jffs2_reserve_space_gc, it passes wbuf_sem_held=1 to indicate the
lock is already held.

Then in jffs2_do_reserve_space, when the buffer is dirty and wbuf_sem_held is set,
we call __jffs2_flush_wbuf directly instead of jffs2_flush_wbuf_pad to avoid trying
to acquire the lock again.

## Alternative Solutions Considered

1. Lock-free recovery path: Completely redesigning the recovery path to not
   require locks. This would be a major change with high risk.

2. Using trylock: Replace down_write() with down_write_trylock() in
   jffs2_flush_wbuf_pad, and handle the case where it returns 0. This approach
   is problematic because we can't tell if the lock is held by our thread or
   another thread.

3. Release and reacquire lock: Release wbuf_sem before calling jffs2_wbuf_recover
   and reacquire it after. This could lead to consistency problems because another
   thread might modify the write buffer state in between.

4. Introduce an additional global state:

## Potential Issue: Recursive Stack Overflow

While the patch fixes the deadlock, it introduces a potential recursive stack
overflow problem. If mtd_write() consistently fails, we could have this recursive
path:

```
__jffs2_flush_wbuf
  mtd_write()                       # return error
  jffs2_wbuf_recover
    jffs2_reserve_space_gc
      jffs2_do_reserve_space
        __jffs2_flush_wbuf          # with wbuf_sem_held=1
          mtd_write()               # return error again
          jffs2_wbuf_recover
            ...  # and so on
```

Each failure and recovery attempt adds another level to the call stack. If the
errors persist, this could lead to a stack overflow. Unfortunately, this is the
original trigger for the problem, because there is some unknown hardware exception
that returns -EIO for any write request,

## Request for Guidance

I'm seeking feedback on how to address both the deadlock.

1. Is my analysis of the deadlock correct?
2. Is the current patch approach sensible, or would a different solution be better?
3. How should we prevent the recursive stack overflow problem?
   - One possibility is to clear c->wbuf_len in error paths in jffs2_wbuf_recover
   - Another option is to detect recursion in jffs2_do_reserve_space and avoid
     calling __jffs2_flush_wbuf when already in an error recovery path

I'd appreciate any feedback or suggestions on how to best address these issues while
maintaining the reliability of the JFFS2 file system.

Wang Zhaolong (1):
  fs/jffs2: Avoid a possible deadlock in jffs2_wbuf_recover

 fs/jffs2/gc.c       | 12 ++++++------
 fs/jffs2/nodelist.h | 12 +++++++++++-
 fs/jffs2/nodemgmt.c | 16 ++++++++++------
 fs/jffs2/os-linux.h |  1 +
 fs/jffs2/wbuf.c     | 13 ++-----------
 fs/jffs2/write.c    |  4 ++--
 fs/jffs2/xattr.c    |  4 ++--
 7 files changed, 34 insertions(+), 28 deletions(-)

-- 
2.34.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
