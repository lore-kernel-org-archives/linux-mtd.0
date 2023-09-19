Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04760CD54B7
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcK4yzOKiiEetPcy8cax4sggKmnUKm9CSr6UYmEYYik=; b=evgz8MbDnYwb4H
	AUZScedNVs5t1k/IlLGAaZCB2gpgZymxnx2LEmAXcc0xCfjMHCugD5AJ/6M90xyGUeT2aSgv+1kk4
	/LCD3/zuTGctW2jUVgX8mWrMKjosFjBRjnog11j+XFo4QJchl4o8y2Tn0V+uDxpE3BOIch8jFO0O8
	ckhcIm/xZRq3q6W1xy+0zFyb1NkVJZ5DoVSMAr4uICYXfbgb4jrnvFfS62lX2Ysx5aCUR4R7tCVSD
	aDdz5GtD1KQCT1VfDaw3OCAs3DK3ytPsoKAFBwffWNtWrrDqb9lhkQzioqXx0OI3HeQ6wyRuuUvuu
	pzTUcMG/C5H63hIAeEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYz5-000IWU-2d;
	Tue, 19 Sep 2023 11:33:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYz3-000IUY-0g;
	Tue, 19 Sep 2023 11:33:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D45C8B815DD;
	Tue, 19 Sep 2023 11:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D159EC433C8;
	Tue, 19 Sep 2023 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695123213;
	bh=3M0d3dD3pzePraPqdY5Lb/FSgSUINN1vw73+jr5dq7Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tQh6lksLqcIOBj/Ff0JXOKys/7/S9IytLOiF0JDIywzjJVGnvZkHN89m5sE62mpoB
	 B3YDCwOOxX1gnLmVWc3ePStHNAbvbDg9jgbpVAv5wDbDdw2Vl89GZwZ9qNlNxra4Fg
	 kiXuONNyEoPOCmaTk9QAiioZqeXDdQ8Od2dvXiPB2jbqabD8+vET4rWht6VUqialFl
	 kMESlGGKraI/mfEF5XUwwnyQC7enBkaOr88DrXpjQxZ8vzJOm87lLPeOk13Z2jZZWP
	 +DF8dMCw1HMweouCpDWHzR5OF6xSCTUQlXvt6hjtZ1K1zZoSy0NQYp4mHOMzF7pFix
	 96Omsq9cDaYdg==
Message-ID: <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar
 Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, David Howells
 <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba
 <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,  Jeffle Xu
 <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, Sungjong
 Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, Theodore Ts'o
 <tytso@mit.edu>,  Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos
 Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, Andreas
 Gruenbacher <agruenba@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin
 Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>,  Andrew
 Morton <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Benjamin Coddington
 <bcodding@redhat.com>,  linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,  v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org,  linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,  linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-mtd@lists.infradead.org, 
 linux-mm@kvack.org, linux-unionfs@vger.kernel.org,
 linux-xfs@vger.kernel.org,  bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 07:33:25 -0400
In-Reply-To: <20230919110457.7fnmzo4nqsi43yqq@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
	 <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
	 <20230919110457.7fnmzo4nqsi43yqq@quack3>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_043337_603562_81493537 
X-CRM114-Status: GOOD (  25.01  )
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

On Tue, 2023-09-19 at 13:04 +0200, Jan Kara wrote:
> On Tue 19-09-23 15:05:24, Xi Ruoyao wrote:
> > On Mon, 2023-08-07 at 15:38 -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > > 
> > > For ext4, we only need to enable the FS_MGTIME flag.
> > 
> > Hi Jeff,
> > 
> > This patch causes a gnulib test failure:
> > 
> > $ ~/sources/lfs/grep-3.11/gnulib-tests/test-stat-time
> > test-stat-time.c:141: assertion 'statinfo[0].st_mtime < statinfo[2].st_mtime || (statinfo[0].st_mtime == statinfo[2].st_mtime && (get_stat_mtime_ns (&statinfo[0]) < get_stat_mtime_ns (&statinfo[2])))' failed
> > Aborted (core dumped)
> > 
> > The source code of the test:
> > https://git.savannah.gnu.org/cgit/gnulib.git/tree/tests/test-stat-time.c
> > 
> > Is this an expected change?
> 
> Kind of yes. The test first tries to estimate filesystem timestamp
> granularity in nap() function - due to this patch, the detected granularity
> will likely be 1 ns so effectively all the test calls will happen
> immediately one after another. But we don't bother setting the timestamps
> with more than 1 jiffy (usually 4 ms) precision unless we think someone is
> watching. So as a result timestamps of all stamp1 and stamp2 files are
> going to be equal which makes the test fail.
> 

That was my take too. The multigrain ctime changes are probably causing
nap() to settle on too small a time delta.

> The ultimate problem is that a sequence like:
> 
> write(f1)
> stat(f2)
> write(f2)
> stat(f2)
> write(f1)
> stat(f1)
>
> can result in f1 timestamp to be (slightly) lower than the final f2
> timestamp because the second write to f1 didn't bother updating the
> timestamp. That can indeed be a bit confusing to programs if they compare
> timestamps between two files. Jeff?
> 

Basically yes. When there is no stat() call issued on the file in
between writes, the kernel will use coarse-grained timestamps when
updating it (since no one is watching).


I'm not sure what we can do for this test. The nap() function is making
an assumption that the timestamp granularity will be constant, and that
isn't necessarily the case now.

-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
