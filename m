Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3E606A324
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rb6Xvj2p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=feKNCHTzgV6lYFKDPhwQhKHLWgZc8DU5KAm085yYE24=; b=rb6Xvj2p+6Q3a6rRsKlj8KrMWX
	GAKfOFgqmsUdCzH3BdCidZBH1GANdaOS4xLyOI9jawmHRRunS+yNNeBzknRYkFdExzO2n3poxGrO6
	KGbiRR5ytMwevGglYmqip7RxKEtNDrMWk+2p1hf+FMzX+jirmD7gHfoF6lGZlu+bCmtHyAM6Amnmb
	HS4IWJslv8LryY3u2VvNUuaIaGZvMAZ59uNspDGMTjW3Y5B7mjXuhQuusXz4vtbt4qv87ZiED9KLf
	GOtfjcMdB58FJJsXrBRVaEFhNhghQEOftbTTBB/apqcqTv2bXPzgnBa+nR3yeoJdkwlKPa6Ut/A0q
	i5jHfrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqYt-0000000GOax-3qH2;
	Mon, 02 Nov 2026 11:50:51 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqYq-0000000GOa3-0LLU
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 11:50:50 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jJ94m28Tgz59tjr;
	Mon, 02 Nov 2026 19:50:32 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6A2BoRSc068839;
	Mon, 2 Nov 2026 19:50:27 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 2 Nov 2026 19:50:30 +0800 (CST)
X-Zmail-TransId: 2af96ae87906b1d-7b9b2
X-Mailer: Zmail v1.0
Message-ID: <20261102195030814Aeehrb4WmExc085745ldN@zte.com.cn>
Date: Mon, 2 Nov 2026 19:50:30 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <richard@nod.at>
Cc: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvM10gdWJpZnM6IGZpeCBhbiBhdXRoIG5vZGUgbGVhayBhbmQgdHdvIGVycm9yLWhhbmRsaW5nIGJ1Z3M=?=
X-MAIL: mse-fl1.zte.com.cn 6A2BoRSc068839
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 02 Nov 2026 19:50:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE87908.000/4jJ94m28Tgz59tjr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_035048_280021_FA4F9C03 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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

This series fixes three independent problems in ubifs, all found while
auditing the error paths around the GC write-buffer, xattr creation and
authenticated node hashing.

Patch 1 fixes a leak.  move_nodes() allocates the authentication node for
the GC journal head and writes it into the GC write-buffer; the buffer is
freed only when one of the steps fails.  On an authenticated file system
every GC pass that moves nodes therefore leaks ubifs_auth_node_sz()
bytes, so the loss is unbounded on a long-running system.

Patch 2 fixes state that survives a failed operation.  create_xattr()
sets UBIFS_CRYPT_FL for inodes that carry an encryption context, but its
error path clears the flag whether this call set it or not.  A setxattr()
that fails before anything reaches the journal, for example because its
journal buffer cannot be allocated, therefore leaves the in-memory inode
marked as unencrypted; the next inode write persists that, and after the
next mount the inode is no longer treated as encrypted although its names
and data still are.

Patch 3 stops five call sites from ignoring ubifs_node_calc_hash().  With
authentication enabled a failing crypto operation leaves those callers
using an uninitialised stack buffer as the node hash; it is then stored in
the TNC or in the master node, and the affected nodes fail verification
later.

The three patches are independent and can be applied in any order or as a
subset.  They are listed by severity, not by dependency: the leak first,
then the persistent state loss, then the error propagation.

All three carry Fixes: and Cc: stable.

Testing: the patches apply to next-20261030, pass checkpatch.pl --strict
with 0 errors/0 warnings/0 checks, and fs/ubifs/ builds with
CONFIG_UBIFS_FS_AUTHENTICATION, CONFIG_UBIFS_FS_XATTR and
CONFIG_UBIFS_FS_SECURITY enabled and W=1 without new warnings.  They were
not exercised at runtime: this machine has no UBI/MTD tooling or
emulation, so there is no mount test.  Patch 1 is the easiest to verify by
inspection; patch 2 needs an allocation or I/O failure in
ubifs_jnl_update(); patch 3 needs a crypto failure inside
ubifs_node_calc_hash().

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
