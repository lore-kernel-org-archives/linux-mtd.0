Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A440CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z5rAMuSLiR/BxL732bDp0mFoVLSvNo654asjPppj6NY=; b=pHgIRogb0mi3GcftO7qEiOdMe1
	ayOLPH23IGxer0zrO8oaJzV8Z21rw48EttIvXS2NEDIFwkorSOhE3RtbNfTfI+zNpxN63+6vkAzPH
	+RGTVYbvNgt8kbODHBP46j0E1ObZS4npq21o7DsBTCnKVqS0MWrAYhpqZ5XlyppU09GSW4hgUjZJn
	oAlvHWwMvEPBP5TdYI31MdfkuK5aAPJKMYr2FejhbV/77ncn6hviC4ylyZWZHXz9nYFAwYI7sh6KB
	AzUWVFIL8HSmOtiWLcIC5fgWT14yo6Fo/lkEvODsJTFebeBxdqFELySFJF7eW0EBBDa5RyEg7Z101
	HGKy6goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM8Y-0000000BQkQ-3MQz;
	Mon, 12 Oct 2026 19:56:42 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM8V-0000000BQjb-41Xf
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 19:56:41 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791834979; bh=suzyxHEwPNR4eX+WAHR3lNn
	UOrfGQSownd3tU1/1O5g=; b=w3nqMXLT9Mr6Dxu6KK7T+0tmnP6tjX6Zz91gqBjw6+1tHPCWB+
	GVdftQnYAhxUDMuQRvfboR8BE22nILVMCLAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791834979; bh=suzyxHEwPNR4eX+WAHR3lNn
	UOrfGQSownd3tU1/1O5g=; b=HuheKo65C9HsmI7xfVlhSdUF5kppcP58tDXwRU8M5baQpodS6D
	j9JcE37HvE80Mv2EzYFB9NVO3ih0Ax0XnY3Ylh6GAhei+wE9DfZIOkbtl/wRIR3ddkBDCeV/8AK
	rPOYtCMl0s3d+9+fJYisC17/eocSHzNXuRlDxt4xW6qgjHKdysxdZxFf2wCpJ2kvCKogF9aUGuK
	Tey779BtFD44vgkfDqXYl8cBO+mAwqS3pTJGiIgsp0ZjY+nd0uIJx21TtohQdeJX/e/iaaqZRGs
	nRDif2vMrm5Ycrled/69Hy/Kt5mRAemy371F7zFRcSY0qaMStUhvGxxXnzGXQSbn0oQ==;
From: "Richard Weinberger" <richard@nod.at>
To: "Nan Lin" <lin.nan@h3c.com>, <chengzhihao1@huawei.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: AW: [PATCH] ubifs: fix host inode TNC offset when deleting an xattr
Message-ID: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
In-Reply-To: <20261012075046.1268480-1-lin.nan@h3c.com>
References: <20261012075046.1268480-1-lin.nan@h3c.com>
Date: Mon, 12 Oct 2026 19:56:19 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_125640_169998_22F1A3AF 
X-CRM114-Status: GOOD (  22.46  )
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

Am Mon, Oct 12, 2026, 09:58 schrieb Nan Lin <lin.nan@h3c.com>:
> When ubifs_jnl_delete_xattr() deletes an extended attribute, it writes
> a group of three nodes to the base head: the xent node, the xattr
> inode node and the host inode node. The host inode node is actually
> packed at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but the
> position registered into TNC is computed backwards as
> xent_offs + len - hlen. The two differ by the group tail padding,
> ALIGN(hlen, 8) - hlen.
> 
> Whenever the host inode's data_len is not a multiple of 8, the offset
> registered in TNC points 1 to 7 bytes past the real node header. The
> wrong offset gets committed into the on-flash index, and on the next
> mount read_znode() fails the offs & 7 alignment check, returns -EINVAL
> and switches the filesystem to read-only mode, reporting
> "bad indexing node ... error 2".
> 
> Which inodes are affected depends on data_len:
>  - block/character devices always carry data_len = 4 and are always
>    affected;
>  - symlinks carry data_len = strlen(target) and are affected unless
>    the target length happens to be a multiple of 8;
>  - regular files, FIFOs and sockets carry data_len = 0 and are
>    unaffected.
> 
> The bug reproduces by setting an xattr on a symlink with attr -Rs and
> removing it with attr -Rr: after unmount and remount, readlink()
> fails, the index node is rejected with error 2 (bad branch offset) and
> the filesystem turns read-only.
> 
> Fix the offset computation by accumulating the group layout forward
> instead of subtracting from the total length: register the host inode
> at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, which matches the
> packed position exactly. The host node length hlen is already correct
> and stays unchanged.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org

> Signed-off-by: Nan Lin <lin.nan@h3c.com>
> ---
>  fs/ubifs/journal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Good catch!

Please ask your LLM to write less wordy commit messages.
How about something like that:

ubifs: fix host inode TNC offset when deleting an xattr

ubifs_jnl_delete_xattr() writes a group of three nodes: the xent, the
xattr inode and the host inode. The host inode is packed at
xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but its TNC position is
computed backwards as xent_offs + len - hlen. Since len includes the
group's tail padding, ALIGN(hlen, 8) - hlen, the two differ whenever
the host inode's inline data length is not a multiple of 8. This
affects symlinks and device nodes.

The unaligned offset ends up in the on-flash index and the next mount
rejects the index node, turning the filesystem read-only.

> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 40a95a2fad50..1a32d641e658 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1943,7 +1943,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
>  
>  	/* And update TNC with the new host inode position */
>  	ino_key_init(c, &key1, host->i_ino);
> -	err = ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, hash);
> +	err = ubifs_tnc_add(c, &key1, lnum,
> +				xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ,
> +				hlen, hash);

How about adding a new variable instead of open coding the offset?
The offsets are already super hard to understand, more magic doesn't
make it better.

e.g.
host_offs = xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ;

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
