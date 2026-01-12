Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E3D26D97
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygR2I3ooGnD3Eso8ZzJN5YZ0L/xDGKX3JHuwmwNEo5A=; b=SWZVeUg8j/wMbW
	klo0PU+xsePOMkSN8Ar8T7McGa3kcaXHhR+lJId5p+t25FIFUghIqACvfcjQ2VLSaZOnDhX0PxiYk
	q5svAxgrwuYN6XotvrXz+8GSA7iO6v2PCm33KMKV+f1fcQdNUmfRw9cwadrb5m1uvPKXm4IA68gqE
	lvTPDcViWM7+TMDYeIS6S6V5vEYIc2S+BUoVzJyruEwKsCRL+OiY5drz3iPNUz2kVHs46cMzpISEX
	pbdgegdgLbrcja+xKi1HnbwSM0kJcDKwnTNMIded4oh4e0XFUEgjXIrBJevWgd8BKwGqDVNFOEb68
	y3MFeMDlOlVVgecfMTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEmf-000000057am-3C3F;
	Mon, 12 Jan 2026 10:04:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEme-000000057ag-3NDI
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 10:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA1E760159;
	Mon, 12 Jan 2026 10:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B727C16AAE;
	Mon, 12 Jan 2026 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768212263;
	bh=AkmUv9RHQQCP7czZn+JPAkCEz9sqfQvYmWRULDwKJ1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcA+4sQZdXRGTPbk3jl7RSZxEdWcJV1w2GrIiyTNmdt3uczv3CsnKSct2x6hj4TGr
	 PnztyirMSb20Eu+vut63R/4+QU+fqqO/FI4zbel7cgYFXcFiYB+qXvnj9TkAsuzpp6
	 TPekQge7W7dmN6BL/kHHJXcoj9IEqJckUodmzBr7Z7FecfsmB3GCnbeRI82GcaEj2y
	 HIIuBlIHYuSaPoUFeTg964kp/cbdm9WIdKQR5vNO4Qipc8NSB/LCv+0EEOdfimbScy
	 JP+2olI4hfgixDmUOGjhjK0aO+qDbNU+rtP9vlSIawrDn3jJWfnWmkVlcutpmjPnLk
	 +Hl8iGkypbiTw==
Date: Mon, 12 Jan 2026 11:04:17 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, 
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, 
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, io-uring@vger.kernel.org, 
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v4
Message-ID: <20260112-adelstitel-propaganda-ef80e3d2f8ca@brauner>
References: <20251223003756.409543-1-hch@lst.de>
 <20251224-zusah-emporsteigen-764a9185a0a1@brauner>
 <20260106062409.GA16998@lst.de>
 <20260106-bequem-albatros-3c747261974f@brauner>
 <20260107073247.GA17448@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107073247.GA17448@lst.de>
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

On Wed, Jan 07, 2026 at 08:32:47AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 06, 2026 at 10:43:49PM +0100, Christian Brauner wrote:
> > > Umm, as in my self reply just before heading out for vacation, Julia
> > > found issues in it using static type checking tools.  I have a new
> > > version that fixes that and sorts out the S_* mess.  So please drop
> > > it again for now, I'll resend the fixed version ASAP.
> > 
> > It has never been pushed nor applied as I saw your mail right before all
> > of that.
> 
> Thanks.  But maybe you can fix up the applied messages to be more
> specific?  We had various issues in the past with them, where they
> were sent, but things did not end up in the tree for various reasons.

What are you thinking of exactly?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
