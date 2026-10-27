Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A936606A31F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGHqZhjF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Euk0E9oDLGCoJ2GuGIRO5U1qZ1w/TJdg8XfooBNrUIQ=; b=PGHqZhjFz0qa1vKpsChisbp96N
	WB13WY2IO+X85rNziJmA58ICx1zpc9ufIgZtKY92A/ty/rDA23MfLhJ6XnLw9+Y10PkyMYSadCA7s
	skoANTdd0JQV82pTQ/Q0A3Nuy/ugL1/ruX/20roo2VTo/yJ55bXGj6YBHX2009cxsaO8oOOwMQRm7
	Asn3Xizp8r0NQr4omgKtfKOdUNB2v5wcjr2dZJi+tT2J3qH3CDsVNkrZWqRu2R46UAq1+LhyKw7Ee
	w4GcH4GqKRoB0QlMYue1SbYAP2WV7ztDtxmbHrZ0NsYrvyp+RF2VLkqWw5p8MuUP5sBZO1OUDEHQX
	E3LxpTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLaXr-00000003pUT-0LlH;
	Tue, 27 Oct 2026 06:20:27 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLaXk-00000003pTr-40sb
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 06:20:25 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69R6K1MB052305;
	Tue, 27 Oct 2026 14:20:01 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 4F8F12284EA5;
	Tue, 27 Oct 2026 14:23:22 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Tue, 27 Oct 2026 14:20:00 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <sashiko-bot@kernel.org>
CC: <chengzhihao1@huawei.com>, <lin.nan@h3c.com>,
        <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
        <zhou.kete@h3c.com>
Subject: [PATCH v4] ubifs: zero stale data beyond EOF before file size grows
Date: Tue, 27 Oct 2026 14:12:26 +0800
Message-ID: <20261027061226.3506517-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <sashiko-outbox-185311@kernel.org>
References: <sashiko-outbox-185311@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam01-ex.h3c.com 69R6K1MB052305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_232024_045300_38BBEB4E 
X-CRM114-Status: GOOD (  15.84  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index e73c28b12f97f..6f2c83b6f4333 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -202,6 +202,45 @@ static void release_existing_page_budget(struct ubifs_info *c)
>>  	ubifs_release_budget(c, &req);
>>  }
>>  
>> +/**
>> + * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
>> + * @inode: inode whose size is about to grow
>> + * @new_end: new end of the file, only used to bound the tail
>> + *
>> + * Zero the cached folio containing the old EOF for [old EOF,
>> + * min(folio end, @new_end)) so a size extension does not expose stale
>> + * data left beyond EOF by mmap writes.
>> + *
>> + * Must be called with inode_lock(inode) held and without ui->ui_mutex held:
>> + * we block on the old-EOF folio lock, and ->writepage() and ->page_mkwrite()
>> + * hold that folio lock while taking ui_mutex; the reverse order deadlocks.
>> + */
>> +static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
>> +{
>> +	loff_t old_size = i_size_read(inode);
>> +	size_t from, to;
>> +	struct folio *folio;
>> +
>> +	if (new_end <= old_size)
>> +		return;
>> +
>> +	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
>> +	if (IS_ERR(folio))
>> +		return;
>> +
>> +	from = offset_in_folio(folio, old_size);
>> +	if (!from)
>> +		goto out;
>> +	to = folio_contains(folio, new_end >> PAGE_SHIFT) ?
>> +	     offset_in_folio(folio, new_end) : folio_size(folio);
>> +	if (to > from)
>> +		folio_zero_range(folio, from, to - from);
>> +
>> +out:
>> +	folio_unlock(folio);
>> +	folio_put(folio);
>> +}
>
>[ ... ]
>
>> @@ -1433,11 +1476,46 @@ static int update_mctime(struct inode *inode)
>>  
>>  static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>  {
>> -	int err = update_mctime(file_inode(iocb->ki_filp));
>> -	if (err)
>> -		return err;
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +	ssize_t ret;
>> +
>> +	if (iocb->ki_flags & IOCB_NOWAIT)
>> +		return -EOPNOTSUPP;
>> +
>> +	inode_lock(inode);
>> +
>> +	ret = generic_write_checks(iocb, from);
>> +	if (ret <= 0)
>> +		goto out;
>> +
>> +	ret = kiocb_modified(iocb);
>> +	if (ret)
>> +		goto out;
>>  
>> -	return generic_file_write_iter(iocb, from);
>> +	/*
>> +	 * UBIFS sets S_NOCMTIME on all inodes, so VFS's file_update_time_flags()
>> +	 * short-circuits and never calls ubifs_update_time() for mtime/ctime.
>> +	 * We must call update_mctime() explicitly here.
>> +	 */
>> +	ret = update_mctime(inode);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/*
>> +	 * If the write position is beyond EOF, zero the stale tail of the
>> +	 * old-EOF folio first.  generic_write_checks() has already resolved
>> +	 * O_APPEND/RWF_APPEND and rejected invalid writes, so iocb->ki_pos
>> +	 * is the final write position.
>> +	 */
>> +	if (iocb->ki_pos > i_size_read(inode))
>> +		ubifs_zero_eof_hole(inode, iocb->ki_pos);
>> +
>> +	ret = generic_perform_write(iocb, from);
>
>[Severity: High]
>Can stale mmap data still be exposed when generic_perform_write() encounters a
>short or zero-byte copy in copy_folio_from_iter_atomic()?
>
>Suppose a file has a non-page-aligned size old_size and a shared mmap writes
>beyond EOF, leaving the old-EOF folio uptodate with stale data in
>[old_size, folio_size(folio)).
>
>When a subsequent write() or pwrite() starts at pos >= old_size within that
>same folio, ubifs_write_iter() skips ubifs_zero_eof_hole() if pos == old_size,
>or only zeroes [old_size, pos) if pos > old_size, leaving [pos, folio_size(folio))
>containing the stale mmap data under the assumption that the write will
>overwrite [pos, pos + len).
>
>However, if copy_folio_from_iter_atomic() copies fewer than len bytes (for
>example, copied == 0 due to an unmapped user buffer returning -EFAULT, or an
>unfaulted user page when a signal is pending), ubifs_write_end() only takes
>the short-copy bailout when !folio_test_uptodate(folio), and otherwise extends
>i_size to end_pos = pos + len rather than pos + copied:
>
>fs/ubifs/file.c:ubifs_write_end() {
>	loff_t end_pos = pos + len;
>	int appending = !!(end_pos > inode->i_size);
>	...
>	if (unlikely(copied < len && !folio_test_uptodate(folio))) {
>		...
>		goto out;
>	}
>	...
>	if (appending) {
>		i_size_write(inode, end_pos);
>		ui->ui_size = end_pos;
>		...
>	}
>}
>
>Because the old-EOF folio is already uptodate, wouldn't ubifs_write_end()
>advance inode->i_size and ui->ui_size to pos + len even when copied < len,
>exposing the unzeroed stale mmap data in [pos + copied, pos + len)?
>
>By comparison, ext4_block_zero_eof() zeroes the entire tail of the old-EOF
>folio from old_size to folio_size(folio), and ext4_write_end() only advances
>i_size to pos + copied. Should ubifs_zero_eof_hole() also zero to the end of
>the folio (or be called whenever the write extends past i_size), or should
>ubifs_write_end() avoid extending i_size past pos + copied?

Valid concern. I think the short-copy issue is best handled separately
since it involves write_end() budget semantics and affects all buffered
writes, not just extending ones. Note that the i_size advance to pos + len on
short copies is pre-existing UBIFS behavior, not introduced by this patch. 
Worth a dedicated analysis/patch but outside the scope of this fix.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
