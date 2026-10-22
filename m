Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AE606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxQy0o93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFLJ19f+rMhx9Nnoa9hz0VTwHRpYQROApmFyQ4cLUQY=; b=kxQy0o93uOhpdP
	QnHJ42teaMdEYl/QVyz+iT1wnJG770dnfar0yfmxgWhJJtVyapzKmKwh7UncUreD8/KYohmfPQWYE
	1WCUON5oSEueYs3ynowVq7eQRx/y8q+nw2LUwboNFtYo1jJLv8TeNzzh239tk4PNW1+8VEXnkRKrY
	c5tihx8QaxJ17Vn3Y/YY/t31NZaSqvVBBK032LI80KN34WZXJC35nn+tBP9snoOp2lFz1E5nYnYu7
	mfK9ugz+5ytLdwYyzmBmDxVVxm2Dv3n/xXkL4Ibk53eJGCwnksbyc0tdVwv2siSCeNaU4WRSv3Yyu
	z8+HXhBy5S9ZkUQ9/pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjRs-0000000DH8a-3yNK;
	Thu, 22 Oct 2026 03:26:36 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjRp-0000000DH87-2cP1
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 03:26:35 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69M3Q5dx034063;
	Thu, 22 Oct 2026 11:26:05 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id CEDD1200920D;
	Thu, 22 Oct 2026 11:29:15 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Thu, 22 Oct 2026 11:26:04 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <chengzhihao1@huawei.com>
CC: <lin.nan@h3c.com>, <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
        <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: Re: [PATCH v2] ubifs: zero stale data beyond EOF before file size grows
Date: Thu, 22 Oct 2026 11:18:14 +0800
Message-ID: <20261022031814.2735650-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <9a775528-0259-2b88-d592-08c58b366253@huawei.com>
References: <9a775528-0259-2b88-d592-08c58b366253@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam01-ex.h3c.com 69M3Q5dx034063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_202634_004581_901AD304 
X-CRM114-Status: GOOD (  23.44  )
X-Spam-Score: 0.6 (/)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cheng,

Thanks for the detailed review. My responses are inline.

> The filemap_lock_folio gets folio with FGP_LOCK, I think we should use
> 'FGP_WRITEBEGIN | FGP_ACCESSED' just like ext4_load_tail_bh() does,
> because the folio may not exist in ram when calling do_setattr().

ext4_load_tail_bh() needs FGP_CREAT because in Ext4 the block behind an
unwritten/delayed extent holds garbage on disk, so the zeroing must
reach the media. UBIFS does not have this problem -- stale data can
only live in the page cache, never on flash:

  writeback:  ubifs_writepage() zeroes the straddling folio on every
              invocation and skips folios fully beyond i_size, so
              stale tails never reach the media.
  read-in:    do_readpage()/read_block() zero the tails of holes and
              short data nodes, so a folio loaded from flash is always
              tail-clean.

So when the EOF folio is absent from the cache, there is nothing to
zero anywhere: FGP_CREAT would merely allocate a fresh (already zero)
folio to zero it again. Returning early on IS_ERR() is the correct and
cheaper equivalent of Ext4's path.

> Why skipping 'from == 0'? What if a user writes begin from
> offset-X(0<X<4096) to a new file(isize = 0)? Ext4 zero the range by
> ext4_block_write_begin->folio_zero_segments(folio, to, block_end,
> block_start, from), but ubifs not handle it.

from == 0 means the old EOF is folio-aligned, so the EOF folio has no
bytes beyond EOF and there is no hole in it:

  from != 0:  |/////valid/////|stale|   <- zero [from, to)
  from == 0:  |/////valid/////|         <- nothing beyond EOF here

For the i_size == 0 case: a zero-size file cannot hold a polluted
folio. mmap cannot create one (page_mkwrite returns SIGBUS when
folio_pos >= i_size), and write() followed by ftruncate(0) invalidates
the folio. The [0, X) part of the write folio itself is zeroed by the
existing do_readpage() path ("block >= beyond" ->
folio_zero_range()), which is UBIFS's counterpart of
ext4_block_write_begin()'s folio_zero_segments() -- the work happens
at folio read-in because UBIFS's block size always equals the page
size.

> The ext4 protection check is ext4_write_checks->ext4_block_zero_eof,
> I think we can add the zero hole check in ubifs_write_iter().

Agreed. This mirrors ext4_write_checks() -> ext4_block_zero_eof() and
runs once per syscall instead of once per write_begin() iteration.
Will move it there in v3. 

> If the program enters into this branch, the ubifs file's isize is not
> zero, ubifs_read_folio has already zerod tail, do we still need this
> folio_zero_range?
> Oh, there is one case, UBIFS file has isize without data nodes(eg.
> isize = 3, the first block is a data hole), ubifs_read_folio won't
> zero the page tail, we still need folio_zero_range().

Right -- and one more case on top of the hole-inode one: mkwrite also
runs on already-cached folios, and earlier mmap stores may have
re-dirtied the tail after ubifs_read_folio() cleaned it (only folios
fully beyond EOF get SIGBUS; the straddling folio stays writable
across its whole length). So the tail must be re-zeroed on every
(re-)fault, and the folio_zero_range() stays.

For reproducibility I have attached a small single-writer reproducer.
It covers both size-extending paths (S1: pwrite beyond EOF ->
write_begin/write_end, S2: ftruncate up -> do_setattr) against a
polluted old-EOF folio. 

Build: gcc -O2 -Wall -o eof_hole_test eof_hole_test.c
Run:   ./eof_hole_test <mountpoint>/eof_hole.bin

-----------------[ eof_hole_test.c ]-----------------
/*
 * eof_hole_repro.c -- repro for "stale data in hole" bug
 *
 * Reproduce:
 *   1. pwrite data to [0, 0x2000)          - full page 0 and 1
 *   2. ftruncate DOWN to 0x1100            - VFS zeroes page-1 tail
 *   3. mmap page 1; write junk into [0x1100, 0x1200) via the mapping
 *      (MAP_SHARED, past EOF)              - pollutes the cache tail,
 *                                            i_size unchanged, legal
 *   4. pwrite at 0x3000 (beyond EOF)       - i_size jumps; UBIFS's
 *                                            ubifs_write_end() does NOT
 *                                            zero [0x1100, 0x3000)
 *   5. pread [0x1100, 0x3000): must be all zero.
 *      Non-zero bytes = stale mmap junk exposed = bug reproduced.
 *
 * Scenario 2 uses ftruncate UP instead of pwrite to exercise
 * do_setattr() instead of write_end().
 *
 * Build: gcc -O2 -Wall -o eof_hole_test eof_hole_test.c
 * Run:   ./eof_hole_test /mnt/flash/eof_hole.bin
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/mman.h>

#define PS       4096
#define OLD_EOF  (PS + 0x100)   /* 0x1100: old EOF mid-page-1 */
#define NEW_END  (3 * PS)       /* 0x3000: hole end */
#define JUNK_LEN 0x100          /* 256 bytes of pollution */

static int check_hole(int fd, off_t off, size_t len, const char *what)
{
	unsigned char buf[512];
	size_t n, i;

	while (len) {
		n = len > sizeof(buf) ? sizeof(buf) : len;
		if (pread(fd, buf, n, off) != (ssize_t)n) {
			printf("FAIL: %s: pread error: %s\n", what,
			       strerror(errno));
			return 1;
		}
		for (i = 0; i < n; i++) {
			if (buf[i] != 0) {
				printf("FAIL: %s: byte 0x%02x at offset 0x%llx "
				       "(hole offset +%zu)\n",
				       what, buf[i],
				       (unsigned long long)(off + i), i);
				return 1;
			}
		}
		off += n;
		len -= n;
	}
	printf("PASS: %s\n", what);
	return 0;
}

/* Create a file with EOF mid-page-1, then pollute the page-cache tail
 * beyond EOF via an mmap write (the only path that skips zeroing). */
static int make_file(const char *path)
{
	unsigned char junk[PS];
	void *map;
	int fd;

	memset(junk, 0x5a, sizeof(junk));

	fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
	if (fd < 0) {
		perror("open");
		return -1;
	}

	/* page 1 full of junk, durable */
	if (pwrite(fd, junk, PS, PS) != PS) {
		perror("pwrite");
		goto bad;
	}
	fsync(fd);

	/* shrink: VFS zeroes page-1 tail [OLD_EOF, 0x2000) itself */
	if (ftruncate(fd, OLD_EOF)) {
		perror("ftruncate");
		goto bad;
	}

	/* re-pollute [OLD_EOF, OLD_EOF+JUNK_LEN) through a shared
	 * mapping. This goes through ->page_mkwrite() which does no
	 * zeroing. */
	map = mmap(NULL, PS, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PS);
	if (map == MAP_FAILED) {
		perror("mmap");
		goto bad;
	}
	memcpy((char *)map + 0x100, junk, JUNK_LEN);
	munmap(map, PS);
	return fd;

bad:
	close(fd);
	return -1;
}

int main(int argc, char **argv)
{
	const char *path = argc > 1 ? argv[1] : "./eof_hole.bin";
	unsigned char junk[JUNK_LEN];
	int fd, fail = 0;

	memset(junk, 0x5a, sizeof(junk));

	/* ---------- S1: buffered write beyond EOF ----------
	 * exercises ubifs_write_end() appending branch            */
	fd = make_file(path);
	if (fd < 0)
		return 1;
	if (pwrite(fd, junk, JUNK_LEN, NEW_END) != JUNK_LEN) {
		perror("pwrite");
		return 1;
	}
	fsync(fd);
	fail |= check_hole(fd, OLD_EOF, NEW_END - OLD_EOF,
			   "S1 write_end: hole [0x1100,0x3000)");
	close(fd);

	/* ---------- S2: ftruncate UP ----------
	 * exercises do_setattr() ATTR_SIZE branch                  */
	fd = make_file(path);
	if (fd < 0)
		return 1;
	if (ftruncate(fd, NEW_END)) {
		perror("ftruncate");
		return 1;
	}
	fail |= check_hole(fd, OLD_EOF, NEW_END - OLD_EOF,
			   "S2 do_setattr: hole [0x1100,0x3000)");
	close(fd);

	unlink(path);

	if (fail) {
		printf("\n===> BUG REPRODUCED: stale data visible in hole\n");
		return 1;
	}
	printf("\n===> OK: hole reads as zeros on both paths\n");
	return 0;
}
------------------------------------------------------

--
Nan Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
