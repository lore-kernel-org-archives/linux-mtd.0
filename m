Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A0DCE8D40
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD0PElIxNyB638JxcXKEdq47RVfWuzpADaWx3MAb/u8=; b=2gHi8rJMM3QXw2
	+o1AswYy3tkRZr0NxTCXtk57c18n45cpX6dBUzFJ6MHDwVnPgKIvNcBmHtwFYI2vdzUwzTSz/DrFa
	8/YSDetuSF7fIAkK99aHSGFLN9AVXdhdyPKU+pbjYfHsJSYgpt+SXxbziMFuSc+dJoz6Afyt/zmUQ
	xrF4z/vUI14yUx1VQyzfH3su8t6PzK+ES7zNsMzPFwVMtSCnrgPWedOZhCbEB6E0+B5zmcyz+0Pu3
	u9OMQH3Yiw9xKs/S4dvvKtcB4+B+WlVdwQMbnfMaZF+O3mqhPDfna3sZpprgdaArMjLfeiZ+CHu4S
	zQ0t4/Odd75mVLoFNngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvgp-0000000CYLC-2P2x;
	Fri, 14 Nov 2025 15:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvgo-0000000CYL1-1VCD
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VvRjqszoVk+17tn2dfFxpE53PNejpQcUr9D5zeuyduI=; b=q3FD8FHJ6G0RQW7C0eWHSUwECM
	uS/jHCvVatTea747l7RBDmw6909x1tbO7xvPnEzllB/Tq/0VTGeP5e5cUhT0qnnXvBrBfEXMNJ5HO
	k6CzBdcA2h8QvUbzWWBikgNEZwqRTgUu26AzkiJSU0jPA8TfUkVskkxJC6Gru4HltRvDkmp7AxBe1
	EOMTRqbVaYM8wUjFGQOI0390bKWmQXiH1kolkhx77zmw4ftxgXcN13FHkNrcVjSjzfKq2luJrRqEO
	Mmmzl4jO8kiqdJCfw2mYgdgipvXiY3PNvGGJ189qhUuKG9cwbVSfeRgxKrTmK+HthdG4Lw02gEJDi
	Tj806v5w==;
Received: from verein.lst.de ([213.95.11.211])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJup6-00000002om0-19VD
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 14:30:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7A538227A88; Fri, 14 Nov 2025 16:26:11 +0100 (CET)
Date: Fri, 14 Nov 2025 16:26:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 06/14] organgefs: use inode_update_timestamps directly
Message-ID: <20251114152611.GC30351@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-7-hch@lst.de> <4990df3273eb868aa21dde745c1ae2636af4cdd8.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4990df3273eb868aa21dde745c1ae2636af4cdd8.camel@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143048_435657_8EDDB6F6 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, Nov 14, 2025 at 09:06:33AM -0500, Jeff Layton wrote:
> Please do fix the spelling of orangefs in the subject line. It'll be
> hard to grep for otherwise...

Ooops, sorry.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
