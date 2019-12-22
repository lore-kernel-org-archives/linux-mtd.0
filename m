Return-Path: <SRS0=F6Bg=2M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23DCC2D0C3
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Dec 2019 02:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50B7206C3
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Dec 2019 02:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MV1bpKu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50B7206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6XxJI2CFe2yPhMTliiK88L+9a6ML3Hbh771Fkv5FHI=; b=MV1bpKu+ZleTei
	XGgWkwsPvvakLB5QHvBTPN3XhHrnSiY+edkoBlS097KBsUWW+BUDwQauyLr5F8RWNZUOQZwU3Y7Vc
	RRNsNpBUVwbjCH7XoweWsMVGk2C1QTCN+YYACX8cwx8Nx38w9BNneH1JXNHnbkMAFwn2l6Gk2YeWb
	Wrzjl80Mn6TzAaR7sDex0Uo73NlydwExH+E+nqHf9e8BXGSJCZCweMct88CHGKYnlkMCp9WcFpvn6
	6yE7eq1CLNZWsL7NXvkXxDPLxl8HOHksLqa1OuOyyDF/KRMxiC2z2cpOg6c982+FeTK+2rBGEPGtd
	IIRUc2Tn8vQqUICKEubA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiqXq-0006il-Al; Sun, 22 Dec 2019 02:00:34 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiqXk-0006i9-ET
 for linux-mtd@lists.infradead.org; Sun, 22 Dec 2019 02:00:29 +0000
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xBM1xvSc030406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Dec 2019 20:59:57 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id DA5AB420822; Sat, 21 Dec 2019 20:59:56 -0500 (EST)
Date: Sat, 21 Dec 2019 20:59:56 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH v3] fs: Fix page_mkwrite off-by-one errors
Message-ID: <20191222015956.GA63378@mit.edu>
References: <20191218130935.32402-1-agruenba@redhat.com>
 <20191218185216.GA7497@magnolia>
 <CAHc6FU7vuiN4iCB3TthLaow+7c41UUS0MYEeiJ5b1iPStT=+sA@mail.gmail.com>
 <20191218192331.GA7473@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218192331.GA7473@magnolia>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191221_180028_655628_50D3B573 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4 <linux-ext4@vger.kernel.org>,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Ceph Development <ceph-devel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 11:23:31AM -0800, Darrick J. Wong wrote:
> *OH*, because we're stuffing the value in ret2, not ret.  Ok, that makes
> more sense.  Er, I guess I don't mind pushing via iomap tree, but could
> we get some acks from Ted and any of the ceph maintainers?

Acked-by: Theodore Ts'o <tytso@mit.edu>

My only nit is the same one Jan raised, which is should
page_mkwrite_check_truncate() be an inline function?

			      	    - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
