Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7563C04FF8
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEpb2L+7saRGeO4cYu0YbLiGDL98XX/xL218PvvCzJE=; b=tP4kOiWinHgNPl
	Epb0AavK4wYROZ9r20x7RACk7nZLmF0ZM0zwZksGZ1MShe89BZOoto28B7U/HgTRGf/vL2IznEFeH
	SdB2H/GsO+onbIYpgPF59UEQP62mQR+khlKN6k1MFZV7bDoGQ16GguVgwYJdpoD5P3yEioR02Fu7D
	E96VRqZzH2/da7kRTKdFhhF5e0MjtlPqV2OYBKZ1rldBwWoGs3jNIFiw+kKvvNrOQuetzjDLzwyYd
	CAW+0h/vF2Bkc4pmg4WQlc5MxSn2vqVwF22GzsM2gWJy4U7SDvVFLn5xV/Cb3uxgmqMkSEnp/mDZj
	uB9Gldo04mcGDr71pZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNK5-00000008gpr-1bzV;
	Mon, 15 Apr 2024 14:28:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNK1-00000008gnQ-1uSD
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 14:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE966CE0C45;
	Mon, 15 Apr 2024 14:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C7C2BD10;
	Mon, 15 Apr 2024 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713191315;
	bh=1Lhv9gLnAifLjYx3xN6adWho72EkGtzNAUVNZL+CwHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4HBXHySCrkcr2Q1hwU29Jas5uax9lJqJeQnF9N0zydMyaB6+dbYy7RMgbuCiuWEm
	 6Ej3YRkCLBhkYj+f3eYOpbnDEQxEGw5lxee4IpQGPc2XHVQv9iIElkH92kLjpkTleI
	 uRR/ntEQc6x0jiA68DPCywOWHvt6i1Vo1jBqappSEsYLywFaMbKyRNqOcyURcr/ncf
	 3Ohm0GuJ4fp6QBkyGl/AggTpUxZCtQEh31VTo+ZFfsYbAma3/fJ69zkyleRuEmw862
	 QWnmqfzb1KDj6AeUtB7W02pvKGky47M4Tb+yjdXx1vuljxwlRRmMEebrlEvtp4gZKH
	 Eg1EPfd5H35ow==
Date: Mon, 15 Apr 2024 16:28:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: Ilya Denisyev <dev@elkcl.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Fabian Frederick <fabf@skynet.be>, Nick Desaulniers <ndesaulniers@google.com>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, KaiGai Kohei <kaigai@ak.jp.nec.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] jffs2: prevent xattr node from overflowing the eraseblock
Message-ID: <20240415-anspielen-gelyncht-d2f0efd6569e@brauner>
References: <20240412155357.237803-1-dev@elkcl.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412155357.237803-1-dev@elkcl.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_072837_892949_7E8F34B2 
X-CRM114-Status: GOOD (  20.53  )
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

On Fri, Apr 12, 2024 at 06:53:54PM +0300, Ilya Denisyev wrote:
> Add a check to make sure that the requested xattr node size is no larger
> than the eraseblock minus the cleanmarker.
> 
> Unlike the usual inode nodes, the xattr nodes aren't split into parts
> and spread across multiple eraseblocks, which means that a xattr node
> must not occupy more than one eraseblock. If the requested xattr value is
> too large, the xattr node can spill onto the next eraseblock, overwriting
> the nodes and causing errors such as:
> 
> jffs2: argh. node added in wrong place at 0x0000b050(2)
> jffs2: nextblock 0x0000a000, expected at 0000b00c
> jffs2: error: (823) do_verify_xattr_datum: node CRC failed at 0x01e050, 
> read=0xfc892c93, calc=0x000000
> jffs2: notice: (823) jffs2_get_inode_nodes: Node header CRC failed 
> at 0x01e00c. {848f,2fc4,0fef511f,59a3d171}
> jffs2: Node at 0x0000000c with length 0x00001044 would run over the 
> end of the erase block
> jffs2: Perhaps the file system was created with the wrong erase size?
> jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
> at 0x00000010: 0x1044 instead
> 
> This breaks the filesystem and can lead to KASAN crashes such as:
> 
> BUG: KASAN: slab-out-of-bounds in jffs2_sum_add_kvec+0x125e/0x15d0
> Read of size 4 at addr ffff88802c31e914 by task repro/830
> CPU: 0 PID: 830 Comm: repro Not tainted 6.9.0-rc3+ #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS Arch Linux 1.16.3-1-1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xc6/0x120
>  print_report+0xc4/0x620
>  ? __virt_addr_valid+0x308/0x5b0
>  kasan_report+0xc1/0xf0
>  ? jffs2_sum_add_kvec+0x125e/0x15d0
>  ? jffs2_sum_add_kvec+0x125e/0x15d0
>  jffs2_sum_add_kvec+0x125e/0x15d0
>  jffs2_flash_direct_writev+0xa8/0xd0
>  jffs2_flash_writev+0x9c9/0xef0
>  ? __x64_sys_setxattr+0xc4/0x160
>  ? do_syscall_64+0x69/0x140
>  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
>  [...]
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: aa98d7cf59b5 ("[JFFS2][XATTR] XATTR support on JFFS2 (version. 5)")
> Signed-off-by: Ilya Denisyev <dev@elkcl.ru>
> ---
>  fs/jffs2/xattr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> index 00224f3a8d6e..9509b33f7675 100644
> --- a/fs/jffs2/xattr.c
> +++ b/fs/jffs2/xattr.c
> @@ -1110,6 +1110,9 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
>  		return rc;
>  
>  	request = PAD(sizeof(struct jffs2_raw_xattr) + strlen(xname) + 1 + size);
> +	if (request > c->sector_size - c->cleanmarker_size)

Can this overflow? I.e. can c->sector_size be smaller than c->cleanmarker_size?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
