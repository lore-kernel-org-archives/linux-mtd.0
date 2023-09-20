Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA2FCE79DE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CC3Jd6OZNoD2UuN3Fxp9jV3hBENYSvZCdsYsi8MLZAA=; b=1xIi60xwrXuSgE
	/SqlhxFTJRY11oJJ+tVxpqxdpxJmxZUFD9n5T2GWsDA1N4O+IM9PEA8GFm68xEyxhlC6mSQv7R0I9
	N+d2FYPxjk9WaCLcpPlzHaAsMa/ttCKEp7x39XksVY5X9EBzWNsFq9k+41WzfLRyZRpACLxcvdYs0
	61gxYgLbnK/+kENc4cPKyogYRizxspsSmDZ8kxlW8DQPNdqk9IytcuZV2O2OqYd/5+2v4kEj065PB
	To4jbxvDGy+zh6KGu8Ef43fNSnNccwKMz2XCuybHcHsMs62zH9Xk8jnITu8NRL2a0q1qe5p/x2sKg
	RGWz3FupxCrorLUt9Ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyaN-003Qdm-29;
	Wed, 20 Sep 2023 14:53:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyaJ-003QaJ-1r;
	Wed, 20 Sep 2023 14:53:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F51AB81DCF;
	Wed, 20 Sep 2023 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10CFC433C7;
	Wed, 20 Sep 2023 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695221624;
	bh=pv/mshlnOGkJ5ebR+d6AqRiPt7G4UklH+5Y/YwatjVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUm3CDqBbqdWl1gTcXLfMGrJ4YfO3wokaDGaQDO3xOEWDbllQ4Mfpj/KueremMgA5
	 pBL/JzWz4+0hsTX69O5jnf1yRuwKeufAxYGRi9hiZ4ho9usSCqwyLkEScujErQvTLd
	 pH8R4MxKr1CGxSHyPru+0iqA3gh7pydF57H5YT0p+7Rd0zhQBTnYL0en9hUyWFooe+
	 Mdfj3r0q5YN+5TWuL0JXteBwUKeABbsXdunQnhbthSc1EwQj0hbuY8ac5vX7VekjTf
	 fGOHz5omQ2+B/RCVrXr9woAH7FyctwMygMiv3giawQBEFR5HdvJ9UunmoJQb2brq0N
	 41leRmH4Vm1Jg==
Date: Wed, 20 Sep 2023 16:53:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Bruno Haible <bruno@clisp.org>, Xi Ruoyao <xry111@linuxfromscratch.org>,
	"bug-gnulib@gnu.org" <bug-gnulib@gnu.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>,
	"coda@cs.cmu.edu" <coda@cs.cmu.edu>, Tyler Hicks <code@tyhicks.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bo b Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amir Goldstein <l@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
	"ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
	"devel@lists.orangefs.org" <devel@lists.orangefs.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
Message-ID: <20230920-keine-eile-c9755b5825db@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
 <20230920-raser-teehaus-029cafd5a6e4@brauner>
 <57C103E1-1AD2-4D86-926C-481BC6BDB191@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57C103E1-1AD2-4D86-926C-481BC6BDB191@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_075347_966865_03A51AC5 
X-CRM114-Status: GOOD (  12.41  )
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

> You could put it behind an EXPERIMENTAL Kconfig option so that the
> code stays in and can be used by the brave or foolish while it is
> still being refined.

Given that the discussion has now fully gone back to the drawing board
and this is a regression the honest thing to do is to revert the five
patches that introduce the infrastructure:

ffb6cf19e063 ("fs: add infrastructure for multigrain timestamps")
d48c33972916 ("tmpfs: add support for multigrain timestamps")
e44df2664746 ("xfs: switch to multigrain timestamps")
0269b585868e ("ext4: switch to multigrain timestamps")
50e9ceef1d4f ("btrfs: convert to multigrain timestamps")

The conversion to helpers and cleanups are sane and should stay and can
be used for any solution that gets built on top of it.

I'd appreciate a look at the branch here:
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.ctime.revert

survives xfstests.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
