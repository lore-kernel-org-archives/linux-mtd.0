Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1176C52D7C
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2024 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyvPFhvZKN8x7ZvG1eW1rVCBaGMIrPQ4e+2SplkHYRw=; b=ZxYHOxmT3s2+Tk
	YCQ8VMwzAXX2Vbk2ablyk3i01OoTaeQXFk6AQOVrKnKO7JmKDaCcNQtHfPkT4u1KQPJFLdnHK1zuX
	V0zwj4Jd5Vtik1WwMIpX3OC8IbBIuTrx75UhXEO8Pe+uFlfnf5N07E/dUa+qHRy2+b9HYhd74U8PM
	F28/ppIbKa/JbNHY3XiFqMNCawJ2w9sOl+nY1alLNeHO+Y+d3J6Pgh6vQbN4CAGBWQt8OlhB51VaE
	JAb5P7pIEEZrIrvDyKVkkq5gY5cCJV6naFJYBbQ9HqUBNOzTBP5o/AaCeXbmW4Z0PHyOh4BlAOqTt
	LxrF8xquoKchwD5e43gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRLg-0000000Bg5B-0nUe;
	Fri, 09 Aug 2024 15:16:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRLa-0000000Bg2c-442j
	for linux-mtd@lists.infradead.org;
	Fri, 09 Aug 2024 15:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7160616F0;
	Fri,  9 Aug 2024 15:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3575C32782;
	Fri,  9 Aug 2024 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723216565;
	bh=QzbMMXohX/nbFUDAv2G2AVoMhu56MDJK2QCsx8awg/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fTVUuXbArCav3KJVsl+eSc5AkhIRDvwX3uQS+sX0twaDYoS4G1Bb3AUiSFynlLqcL
	 gEermTVfi66DEOhk3SG1IHPzSHW5i8qj0tXO6o6OcQwoGNiA8JwaUtKpWVXjVc0SBq
	 S9TdtIMrJ6cQyHpPTxqaeYOMXcJ9Iugr5uLLuvio9ohPakgXzuFEaz5kYTNTwLmNXu
	 JJ3CGcCEiY6NpxGgg/RcWkxIv7uAs8PLryiMOQpg/Zv08B1/MIsHylABygWZKa0GPY
	 J5lror6LoFp1Guh0FkH4MAUO5t1xgQBqgoodSuTC2juW+AvUyfGhY4W14iVLFGO5vG
	 J+/M0xWh0CUGg==
From: Christian Brauner <brauner@kernel.org>
To: Zhihao Cheng <chengzhihao@huaweicloud.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com,
	yi.zhang@huawei.com,
	wangzhaolong1@huawei.com,
	yangerkun@huawei.com,
	mjguzik@gmail.com,
	viro@zeniv.linux.org.uk,
	error27@gmail.com,
	tahsin@google.com,
	rydercoding@hotmail.com,
	jack@suse.cz,
	hch@infradead.org,
	andreas.dilger@intel.com,
	tytso@mit.edu,
	richard@nod.at
Subject: Re: [PATCH v2] vfs: Don't evict inode under the inode lru traversing context
Date: Fri,  9 Aug 2024 17:15:36 +0200
Message-ID: <20240809-neuanfang-recyceln-b3d99596e98f@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809031628.1069873-1-chengzhihao@huaweicloud.com>
References: <20240809031628.1069873-1-chengzhihao@huaweicloud.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=brauner@kernel.org; h=from:subject:message-id; bh=QzbMMXohX/nbFUDAv2G2AVoMhu56MDJK2QCsx8awg/A=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRtM1pzas0xLi7eKXOP/jVYMOvYsu3syX8WfDZ7quSVm OqmJR95raOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAipzgZGa46OBQseXPG6PAJ sx6Vtkc/Vv2ZuPfFZf78ZbsKBVbtVU1h+KfJt6xlhYCouNXlpCmZxkdKT298+0Os1m67NcODPtO l0ZwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_081607_100888_0E43AA82 
X-CRM114-Status: GOOD (  11.29  )
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

On Fri, 09 Aug 2024 11:16:28 +0800, Zhihao Cheng wrote:
> The inode reclaiming process(See function prune_icache_sb) collects all
> reclaimable inodes and mark them with I_FREEING flag at first, at that
> time, other processes will be stuck if they try getting these inodes
> (See function find_inode_fast), then the reclaiming process destroy the
> inodes by function dispose_list(). Some filesystems(eg. ext4 with
> ea_inode feature, ubifs with xattr) may do inode lookup in the inode
> evicting callback function, if the inode lookup is operated under the
> inode lru traversing context, deadlock problems may happen.
> 
> [...]

I've replaced the BUG_ON() with WARN_ON().

---

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] vfs: Don't evict inode under the inode lru traversing context
      https://git.kernel.org/vfs/vfs/c/24b0ba4e047d

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
