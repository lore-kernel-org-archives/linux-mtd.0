Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F54C00523
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VST6NEf/aoD5mPI0nBzXF/ZG4e5A5XDroL+nLAp0kac=; b=bpiF145tUJ6xEP
	ZaCa9KJuy7fu5HWnlmAH4PUT0ycKY1QYmMw7OVtzhIMOfM3ntQqYfXBfKb+1+td74WhjkDuJLsOQX
	1q9PHecQ+x3Z1FF/d2SLzIUZQces/YbqGzImmuRKf+ZRLlUb94AOccgO33IqRybCDDg3uSqO8XqLu
	YKzY0dgKAjiDNhEhsaSQnBwM3rUZcUrxgpFp5BZupv628Z0c9TtwreQrZoFsvBKekSVBWgvf01S+Q
	XhEMXgoSUOWeOAkw+6xI0HqjvhoNJPjM/LF63qVGzZ4F/ZXV4yKMZOW5V0tG7pBfUnYCtlilfXlIK
	+S/nQUIurCEqALcMjxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz9K-003VLP-00;
	Wed, 20 Sep 2023 15:29:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz9E-003VJK-2x;
	Wed, 20 Sep 2023 15:29:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CB0C3CE168E;
	Wed, 20 Sep 2023 15:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E996C433C7;
	Wed, 20 Sep 2023 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695223789;
	bh=shQOY5YSFRPH4MYjqUKwyU+DkSv5sjGrh2VkaY95KB0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k1nl+EUmAYscMk0MAMW2wOdy5tjaXvnpQu2mWSR498aox4xq7L28RDznbIZh6rShu
	 bXVpJ07+Dr4X3NpXfTZ0f+3K8zQ8Zd6GU7TcRKgE2VVsNXC3Y08ZZyb7CwubbNshsl
	 rm6wzJ/+k25k/ioraZ+0GeLOcb5AuV3QTsiMjdD7WPv7IhViBMRoyEFjeAf8ki2Aj8
	 W8ZdClpH4+zgGo/wL79cSK2jQ4cXV/iem14axjymtw8/HBVWpvEmqX0RCWhOZdTah7
	 KQG1SBOFHqTYAzExj0EvSsQ5z8MaqVyH0lewm2ewDy4wd3OYa7pYLYkwfk2fAVqddy
	 kVlr1oQs66e8A==
Message-ID: <4e6b2d3addc34619e5d2e35ccbd798362a1fb95a.camel@kernel.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Chuck Lever III
	 <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Cc: Bruno Haible <bruno@clisp.org>, Xi Ruoyao <xry111@linuxfromscratch.org>,
  "bug-gnulib@gnu.org" <bug-gnulib@gnu.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
 <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>,  Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, "coda@cs.cmu.edu" <coda@cs.cmu.edu>,  Tyler Hicks
 <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>, Jeffle Xu
 <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, Sungjong
 Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, Theodore Ts'o
 <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos
 Szeredi <miklos@szeredi.hu>, Bo b Peterson <rpeterso@redhat.com>, Andreas
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
 Morton <akpm@linux-foundation.org>, Amir Goldstein <l@gmail.com>, "Darrick
 J. Wong" <djwong@kernel.org>,  Benjamin Coddington <bcodding@redhat.com>,
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
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "cluster-devel@redhat.com"
 <cluster-devel@redhat.com>, Linux NFS Mailing List
 <linux-nfs@vger.kernel.org>,  "ntfs3@lists.linux.dev"
 <ntfs3@lists.linux.dev>, "ocfs2-devel@lists.linux.dev"
 <ocfs2-devel@lists.linux.dev>, "devel@lists.orangefs.org"
 <devel@lists.orangefs.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
  "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Date: Wed, 20 Sep 2023 11:29:41 -0400
In-Reply-To: <20230920-keine-eile-c9755b5825db@brauner>
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
	 <20230920-keine-eile-c9755b5825db@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_082953_294650_C149C9A8 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, 2023-09-20 at 16:53 +0200, Christian Brauner wrote:
> > You could put it behind an EXPERIMENTAL Kconfig option so that the
> > code stays in and can be used by the brave or foolish while it is
> > still being refined.
> 
> Given that the discussion has now fully gone back to the drawing board
> and this is a regression the honest thing to do is to revert the five
> patches that introduce the infrastructure:
> 
> ffb6cf19e063 ("fs: add infrastructure for multigrain timestamps")
> d48c33972916 ("tmpfs: add support for multigrain timestamps")
> e44df2664746 ("xfs: switch to multigrain timestamps")
> 0269b585868e ("ext4: switch to multigrain timestamps")
> 50e9ceef1d4f ("btrfs: convert to multigrain timestamps")
> 
> The conversion to helpers and cleanups are sane and should stay and can
> be used for any solution that gets built on top of it.
> 
> I'd appreciate a look at the branch here:
> git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.ctime.revert
> 
> survives xfstests.

I think that's probably the wisest course of action. I need some time to
ponder the options for this series anyway, and another cycle in next
wouldn't hurt.

The branch itself looks fine, but you might want to reverse the order of
the patches in case someone lands there in the middle of a bisect. IOW,
I think you want to revert the "convert to multigrain" patches before
you revert the infrastructure. 
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
