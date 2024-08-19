Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC3DC5320E
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1uKFKCgN1il4JYJjxWyk4HZv20X66rENfwveD44e00=; b=OCyBccwI8cwasC
	STdpKDNBIoQJzABS7WkWDsgkuMCMlML5c+btHgt7pJuVaYqGNT8RJfiNFdzO4mkTZRLgWZ5x2b7jT
	VlDpF9r5nxwpfubfM0VcV/tLt6Es8DtQvtd84bhgQmUbD+7XkoCf7FZ0i8HeEqtIistUqmuefv4ZT
	HHiRvvvTd/zHAHVqlu0TDNYoC89S4Ndzp6GzZdW6vINDTQnmjMWm2sTaO4YgY4j4yLMUfyY61MtqZ
	8g+G2dLN8VHqxwoZ5fT9ZuyEVNiJf+FT4PHh8NVV5gULkfow42T/JU2XDks/Dgq26DFbBOTzyHCfC
	ko3kNXIVZxVzLDany9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0lJ-00000001Fth-2TVE;
	Mon, 19 Aug 2024 11:41:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0l7-00000001FqC-10wM
	for linux-mtd@lists.infradead.org;
	Mon, 19 Aug 2024 11:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A826C60C04;
	Mon, 19 Aug 2024 11:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A517EC32782;
	Mon, 19 Aug 2024 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724067672;
	bh=ii3fHtLFGH2xK/PWkbrHcwHF/9cIc0M6iS4QAUDypYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rSCyYUNCYXksJ43siohPDtD9YBNBexAGhkQprRmYMhC+m7rz9dd3CXYK9qctFlOSs
	 /l+ERTL9/Q+QywGQUtkLygjef5wY3EqEl0rJoUaQByrhZ35QFpUAyGk2yRv/TG+G22
	 YqBUYIeKNwYaNyU7VqL+NfpjLHR4qet+Xc259a0JDJsgzjFg7aanBlFPa7ZjcwuOCb
	 BYC0xxlIaiWAFx/HVh9k7vNM9wBXrUs9BCABnAqQ8Rc0SNSylzpzwDHh3D+7eqKSEO
	 GGX1Gv4rzuwGjQ2oDzIih5N9cIpVJH077lMc5gEpLvQQqqTmQM9UOu/pV+Q1r6obLi
	 mmqf2wEHVsoqw==
From: Christian Brauner <brauner@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] Finish converting jffs2 to folios
Date: Mon, 19 Aug 2024 13:41:03 +0200
Message-ID: <20240819-kursgewinn-koexistieren-489bc246a7df@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814195915.249871-1-willy@infradead.org>
References: <20240814195915.249871-1-willy@infradead.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=brauner@kernel.org; h=from:subject:message-id; bh=ii3fHtLFGH2xK/PWkbrHcwHF/9cIc0M6iS4QAUDypYY=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQd1g964v5Y3T+7a8Ghps5ne141zLzHYLAzl+HQNK7Fc kkxN+dFdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzk3Q6GP5zZO6wOH7/Xf0TX uLR30pUV3pt91Zoc3xz5P7X+1Mz47HCGfypLxa8q7FdlqP95n2vH37iN1373c71hc5ow6febJ+v K9rEBAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_044113_376791_604D348A 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, 14 Aug 2024 20:59:11 +0100, Matthew Wilcox (Oracle) wrote:
> This patch series applies on top of fs-next.  I suggest it goes through
> Christian's tree.  After applying these two patches, there are no more
> references to 'struct page' in jffs2.  I obviously haven't tested it at
> all beyond compilation.
> 
> Matthew Wilcox (Oracle) (2):
>   jffs2: Convert jffs2_do_readpage_nolock to take a folio
>   jffs2: Use a folio in jffs2_garbage_collect_dnode()
> 
> [...]

Applied to the vfs.folio branch of the vfs/vfs.git tree.
Patches in the vfs.folio branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.folio

[1/2] jffs2: Convert jffs2_do_readpage_nolock to take a folio
      https://git.kernel.org/vfs/vfs/c/bcc7d11e6c09
[2/2] jffs2: Use a folio in jffs2_garbage_collect_dnode()
      https://git.kernel.org/vfs/vfs/c/2da4c51a66cd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
