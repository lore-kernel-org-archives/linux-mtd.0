Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6C4C34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 15:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B4F24670
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 15:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVSGF5eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B4F24670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7EHMyUPv2q6yIop752l20HueDe0JniJezXOAylvmSI=; b=hVSGF5eu4UwZ8T
	uvRCB/yRCEcP2FGbR8RxZ4oIS1HOUQLZBI1gBxXM3W+mcbpbg2mEEMDXysqHyLtFTW8r+WgxaLO5W
	71SmOheDxJUfiXhs/COJk8sRnDI9PNnUUTcjRJ4M/iv61snypCoKlAi5SgnEzmx/yvsrgQftKMl5k
	Fz9U+s76AeJKbby71mNB9ofLucgjRZCgV7gby/vOecn7LfAivvItIfO2NPHt7rio9wVUlH9fOIvVC
	g9nJ83kGqirZRyLBrATzoZI3+vdEJILpB3FH3IvL3nFuF9cPw2NWfe3qz6JxW8k64wKAKAh0G4PlS
	e6aB/0ifMALFnuE1SJbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4R0e-0000Xm-HX; Wed, 19 Feb 2020 15:11:32 +0000
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4R0Y-0000UF-OT; Wed, 19 Feb 2020 15:11:26 +0000
Date: Wed, 19 Feb 2020 16:11:13 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 00/44] Manually convert filesystem FS documents to ReST
Message-ID: <20200219161113.41add6e4@kernel.org>
In-Reply-To: <20200219023234.7b704acb@lwn.net>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <20200218040146.GM7778@bombadil.infradead.org>
 <20200218110406.098fdc09@kernel.org>
 <20200219023234.7b704acb@lwn.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Matthew Wilcox <willy@infradead.org>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devel@lists.orangefs.org, Chao Yu <chao@kernel.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Bob Peterson <rpeterso@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Em Wed, 19 Feb 2020 02:32:34 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue, 18 Feb 2020 11:04:06 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Then, do a second pass at files outside the new directories (like
> > admin-guide), in order to better organize things, eventually splitting
> > some files into kAPI, uAPI and/or admin-guide.  
> 
> I'm looking forward to this phase!  Yes it is harder, and it often
> requires selling the idea to skeptical maintainers.  But that is how,
> IMO, we get from where we're at now to something closer to a set of
> coherent kernel docs.

Yeah, fully agreed that this is an important step.

I'm even more anxious for a third phase: filling the gaps. I'm pretty sure
that several important parts of the Kernel aren't properly represented
at Documentation.

Yet, before start writing new things, we should first organizing what we
already have, making them well-organized.

Cheers,
Mauro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
