Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76106C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgTQRGvfhC2SxhUAwsAP4c/4Bw4OuFhfWsKdWAv85sY=; b=NX4O0cS6hT43ym
	WUMu2WZW22K6KvSRVRapOyHP8Vl9RL0Y56EKj7Dxwsbkbi8MLcTMoxVOOHJ4r0y7gWtBr545bDc+Q
	DfbeldU3K28hs7Vc1/MKNV1a6buqMrD6wMYmvNCqroq14eH4OV+Hr2HjcSQ+yGttzWHgVBL+h7mMj
	2D7uu2WSScnwPIKBh6MmQO0FZm3+tW+XlgFUEUVXMj+C3PhSUDV5SLQQBJKn9/Lwe+GOyyOGVYf3o
	o8cFLKEavDiZjyItHDZR2cm9ctdOwEvIcpwtaRXq9QJ7Vso/ZBHQoDvV67linUCDJAzS1IhSeu0kQ
	E5i49+gb99qvB+SzgaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3NS-0000000Fltg-3d34;
	Wed, 17 Apr 2024 11:22:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3NQ-0000000Flsp-3qwq
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 11:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6132C6149D;
	Wed, 17 Apr 2024 11:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A379C072AA;
	Wed, 17 Apr 2024 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713352974;
	bh=b9eQVO5DEetlNMd2dejQjvjZNeo8+gjXxwiMgoytLg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=spD+u/L16KVIRaZE4iypYl0pLJKCD7wfCKq26ynKvEfNV5LzwHJR66H0g9Uzf3tBC
	 O3ZEiRTqDndUbewaJpbGy19M7NlkdBW9HyK4lhyZzWqAurdBquw10uwq2nrGY5SUtD
	 hcE8u7rbtxrYk8b76UgxeeDOBgWWG7LPv+6yQNuxgngnvyMS/x2xJ2T+5k25f73cdG
	 2lWlUYJ2CzsIy9bLWMPHG9ZxYcONUnMTtEBpTFqnoXIHx2GuMi5BqdzQy6jTk6F8h2
	 RQB3De8nCGQw4VBFFF2zGbZSyUO0PGmjPpVgru3qglgKYQcaK1yzTHA5c1PZobpXgC
	 jl+32K0O7dpiQ==
From: Christian Brauner <brauner@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
	Ilya Denisyev <dev@elkcl.ru>
Cc: Christian Brauner <brauner@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Fabian Frederick <fabf@skynet.be>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] jffs2: prevent xattr node from overflowing the eraseblock
Date: Wed, 17 Apr 2024 13:22:04 +0200
Message-ID: <20240417-kapern-angegangen-0ac84cd51096@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412155357.237803-1-dev@elkcl.ru>
References: <20240412155357.237803-1-dev@elkcl.ru>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=brauner@kernel.org; h=from:subject:message-id; bh=b9eQVO5DEetlNMd2dejQjvjZNeo8+gjXxwiMgoytLg4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTJb/i5zlVaat5v/hnsXRWbOKbddb9YdNj8zpvUXWefm ARtallj1VHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARoxWMDOf7km0/eViH7L64 bco3V/3PO3tWv2H64FbiPmOLuaGYoTUjw7+PE6pbPjZ0/jyn8vkkm+muDDbj6UH/ZdjrloUEOen vYQQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_042257_025758_319D618C 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, 12 Apr 2024 18:53:54 +0300, Ilya Denisyev wrote:
> Add a check to make sure that the requested xattr node size is no larger
> than the eraseblock minus the cleanmarker.
> 
> Unlike the usual inode nodes, the xattr nodes aren't split into parts
> and spread across multiple eraseblocks, which means that a xattr node
> must not occupy more than one eraseblock. If the requested xattr value is
> too large, the xattr node can spill onto the next eraseblock, overwriting
> the nodes and causing errors such as:
> 
> [...]

I have to say that the rick-roll of your domain doesn't inspire a lot of
confidence though...

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] jffs2: prevent xattr node from overflowing the eraseblock
      https://git.kernel.org/vfs/vfs/c/c6854e5a267c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
