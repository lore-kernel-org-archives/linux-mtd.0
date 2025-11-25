Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00736CFD315
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I81YtHJGdgTekpAK86OGYYLngfZfwu3vGMxGKla9bx4=; b=BK/xWlC210cJbe
	tF1fTfNPssaXg5wRWpzANewqn0m9KYQ1wIL+xFyaKUnwzatEt9dymkClfwxB/ms90XbVwZR4LtZM0
	Vpkjt+Llm0q+8QXOAFqwEIg5C3gferDHmSFKgHUPL++/G8A3jJxgPCmU0jHykrcBraUy8QmrphlnX
	bkeIPYs6Xee7+8v6xRqY7zkn3fKuCvYSxqonOVmLIQxDEOOTRJ3sh+A2yJxDkmruY07piZlIdnL9s
	H4HfwqbAAqLtnuPIG6Hw5gPARd37Dj90cH2pndoD5GbwYzpCcC5DeSj/rUQp79qtlICAClybUeVuF
	n3bmpgkTnSaVuEIrQkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpC5-0000000D19Z-0ej8;
	Tue, 25 Nov 2025 09:18:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpC3-0000000D19M-2NIL
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 09:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADB946019D;
	Tue, 25 Nov 2025 09:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62470C4CEF1;
	Tue, 25 Nov 2025 09:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764062318;
	bh=U9iYrYsglLkG8TnBDbI9yrwUWiI8plUWD8Oh3w7r1lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sctjiYa/DATKoaFc3hWyAe155qdsmeZ0LOX1jyiLgNBS5DiZw+4snbDy8w3moMIlw
	 qD25hlXOxRpAQw7ks/SOJcVlNOSn2alp+vSe+skncJ9fnv47blkRv/OO1HEnfaLieL
	 Pdfx8nRHNYcPX7bTnyTH+HvgbdCM1/yJVva5Dr3pvCvteXBjjd4kwFh15WUdPqWtXT
	 KDE5JgmgqxTmE7mMVxru75iVNEw+PlMkuj4dLF4KAWCHoOTXoPZcis8CK0XFDtFgFD
	 fKp2aeOAxiijY6s+DoOEPPdvCjJNOF89n2osZI1BVl6VydJ00KKVQTPicDc0+hBj82
	 /u0YfbHQEuJ6g==
Date: Tue, 25 Nov 2025 10:18:32 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, 
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, 
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, io-uring@vger.kernel.org, 
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v2
Message-ID: <20251125-loten-fabuliert-c0fb6b195b53@brauner>
References: <20251120064859.2911749-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120064859.2911749-1-hch@lst.de>
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

On Thu, Nov 20, 2025 at 07:47:21AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> commit 66fa3cedf16a ("fs: Add async write file modification handling.")
> effectively disabled IOCB_NOWAIT writes as timestamp updates currently
> always require blocking, and the modern timestamp resolution means we
> always update timestamps.  This leads to a lot of context switches from
> applications using io_uring to submit file writes, making it often worse
> than using the legacy aio code that is not using IOCB_NOWAIT.
> 
> This series allows non-blocking updates for lazytime if the file system
> supports it, and adds that support for XFS.
> 
> It also fixes the layering bypass in btrfs when updating timestamps on
> device files for devices removed from btrfs usage, and FMODE_NOCMTIME
> handling in the VFS now that nfsd started using it.  Note that I'm still
> not sure that nfsd usage is fully correct for all file systems, as only
> XFS explicitly supports FMODE_NOCMTIME, but at least the generic code
> does the right thing now.

It's a bit too close to the merge window for my taste and we have about
17 pull request topics for this cycle already.

So I'll take this for vfs-6.20.iomap. As usual I'll create that branch
now so that the patches don't get lost and will rebase once v6.19-rc1 is
out.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
