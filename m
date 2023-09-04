Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573C8C83F33
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBsPamEClbGOWd/ObWHpq0Yxi2lvYBI8jidYWi/mSsw=; b=BCzIC+1BBDINKV
	agx9bV9zel/uDH4OXq9WwxK+mobMCGEaFu9opEGPVs2SWiImMc2E3ngNePDi7oVAM/Lhhpvd+MCiD
	4HjnU5qMsCzgTL/n3tl3utmj/M0Yewcn4YhOXGk3fo0V7WMV75Zg2lP3bH051SP0chR09A8d0Ph4u
	r0Zv8d7H4zigbGibdLdUcax0J0fkMb1todoWKoby8Bk9z7ARjdUkFdNdSHQCRe1t3ZNr6hYhIxsDR
	FboXj4sWN3JzvWI3UB7UGd160EvS9kPJKGxUfKukDYKWKl9S1NU6TQe0o7+R4C7DShqvuqJvW5+fy
	HJllj/jhX772b1sb8ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6L3-003jkv-0z;
	Mon, 04 Sep 2023 09:57:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd6Kz-003jiz-0M
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 09:57:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2128260110;
	Mon,  4 Sep 2023 09:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2861AC433CA;
	Mon,  4 Sep 2023 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693821459;
	bh=3nBALREBe4uYOQysxhL3FnVqTkdR7jMiX68zU5wvxQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEztgc4TUkd2yfcHxcboc+zDXAcA4KHCmIGSB/gsRgCo9DGA1rLyRBmfivPzAjnOB
	 KKw5j1sjO7veroFTPAfq4w/Dw21tYljOg8WM+sB6xZikYv2ILFdOD928dMMu6jaMTA
	 hsFmv7Cbjvf4C2EEf3kIjrkFy7uHmWrX1TbMwxUdVWRcMpkNca5fPpStkr+O9O9AVs
	 oGtWlPEvUt+phBNKXuy5CCjefBQ9+fHhCcNVb2HuJp7/pDdC8MPGp01mLBBiMVtugi
	 LQHGEf2o9T+0sCa9DBGt1latLMv6pIa/RLJn+fTPda2hnB4Yrxv5cYlj5KyxA/vFa0
	 BGrzmLYXagYqw==
Date: Mon, 4 Sep 2023 11:57:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH v6 00/11] io_uring getdents
Message-ID: <20230904-butterbrot-aufraffen-db483c53eab5@brauner>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_025741_196554_1C4AE5FD 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Sun, Aug 27, 2023 at 09:28:24PM +0800, Hao Xu wrote:

For the future it would be helpful to hold of on sending larger series
that like this until a stable tag is out.

Right now this series is generating a bunch of merge conflicts because
of all the changes to relevant codepaths that got merged. So either we
have to resolve them to see whether things still make sense within the
context of all the changed code or risk that stuff we comment is outdated.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
