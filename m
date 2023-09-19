Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A9CE79A8
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agS6e897vaLov5F1tCeO+E+dvkp6I8JRE4Ldiet7rqY=; b=t/s0RAJvBiTM9J
	bovdXUIZytuxyyWLbK1hnJD9GnsL4oY4rNy2XdGhGbKVfZyOAtI2rOCHztsirZyDaa5vJ6tyVXkN7
	obEk8k04s7IU5tK8ogrEV8189wdreEIGpfbqhCKGpQ6PKanyoP88QJ4YyDe151aaz/e4luMTtEi9I
	EC+EvDFYsgb3hYuhlNyp7P7ku0wa4UK9A4CKHPDjF4ReqN3yD41SVwgmRUPKiv2ziBXRbYpYCRM+7
	PesU/Imo/GlOIWQ4QIuEZw1Jkdn0UcuuD/KGbnrBsRaPOeMqkAZprBaQWZcA8Lap6j807hPXe8FLO
	Zn9X7Gj8x1TRG92Dasrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qihcJ-001FUW-2i;
	Tue, 19 Sep 2023 20:46:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qihcG-001FSo-08;
	Tue, 19 Sep 2023 20:46:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2E59617B9;
	Tue, 19 Sep 2023 20:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A819FC433C9;
	Tue, 19 Sep 2023 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695156393;
	bh=BmRXQZIEgC13FrkspW8zNhSJjLbclay0bgLqEV3Rrl8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=q9KdgZu946MZfw7DxJLZIxiiIbHL9p62pycuILxZHzw8MqP3sd2qzr3E/ZkzfhbEv
	 Sv560WUNQE0HlwP/5rEqpm3bw7jCmrV5akvxgau1zBqN4rLOK+/ZjoboBONeleNI+5
	 6SP6lExUu15oD0xQisxQolfz9bgwYx59X/D7X0LTGvi5p2a+XVoY+oMnByTr4quQRa
	 dZXyYP7t6FAFej2yuwhu+Ce8pxPjyRxtNPk1CXlFaDLgBYYr9H9mjHCggTcasxMD+A
	 UZV+ik47sNRSAwVomJhe40/Ndx/tHAngLhTIM40zYtZFnzpPzdTJ314IhHsCYJFhNI
	 PFuADp6gLFx9g==
Message-ID: <6e6da8a875a0defec1a0f58314995a6a12dca74e.camel@kernel.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
From: Jeff Layton <jlayton@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>, Bruno Haible <bruno@clisp.org>, Jan
 Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>,
 bug-gnulib@gnu.org
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
 linux-fsdevel@vger.kernel.org,  linux-kernel@vger.kernel.org,
 v9fs@lists.linux.dev,  linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev,  devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org,  samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org,  linux-mm@kvack.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Tue, 19 Sep 2023 16:46:25 -0400
In-Reply-To: <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230919110457.7fnmzo4nqsi43yqq@quack3>
	 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
	 <4511209.uG2h0Jr0uP@nimes>
	 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
	 <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_134640_163774_70E288E8 
X-CRM114-Status: GOOD (  29.83  )
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

On Tue, 2023-09-19 at 13:10 -0700, Paul Eggert wrote:
> On 2023-09-19 09:31, Jeff Layton wrote:
> > The typical case for make
> > timestamp comparisons is comparing source files vs. a build target. If
> > those are being written nearly simultaneously, then that could be an
> > issue, but is that a typical behavior?
> 
> I vaguely remember running into problems with 'make' a while ago 
> (perhaps with a BSDish system) when filesystem timestamps were 
> arbitrarily truncated in some cases but not others. These files would 
> look older than they really were, so 'make' would think they were 
> up-to-date when they weren't, and 'make' would omit actions that it 
> should have done, thus screwing up the build.
> 
> File timestamps can be close together with 'make -j' on fast hosts. 
> Sometimes a shell script (or 'make' itself) will run 'make', then modify 
> a file F, then immediately run 'make' again; the latter 'make' won't 
> work if F's timestamp is mistakenly older than targets that depend on it.
> 
> Although 'make'-like apps are the biggest canaries in this coal mine, 
> the issue also affects 'find -newer' (as Bruno mentioned), 'rsync -u', 
> 'mv -u', 'tar -u', Emacs file-newer-than-file-p, and surely many other 
> places. For example, any app that creates a timestamp file, then backs 
> up all files newer than that file, would be at risk.
> 
> 
> > I wonder if it would be feasible to just advance the coarse-grained
> > current_time whenever we end up updating a ctime with a fine-grained
> > timestamp?
> 
> Wouldn't this need to be done globally, that is, not just on a per-file 
> or per-filesystem basis? If so, I don't see how we'd avoid locking 
> performance issues.
> 

Maybe. Another idea might be to introduce a new timekeeper for
multigrain filesystems, but all of those would likely have to share the
same coarse-grained clock source.

So yeah, if you stat an inode and then update it, any inode written on a
multigrain filesystem within the same jiffy-sized window would have to
log an extra transaction to write out the inode. That's what I meant
when I was talking about write amplification.

> 
> PS. Although I'm no expert in the Linux inode code I hope you don't mind 
> my asking a question about this part of inode_set_ctime_current:
> 
> 	/*
> 	 * If we've recently updated with a fine-grained timestamp,
> 	 * then the coarse-grained one may still be earlier than the
> 	 * existing ctime. Just keep the existing value if so.
> 	 */
> 	ctime.tv_sec = inode->__i_ctime.tv_sec;
> 	if (timespec64_compare(&ctime, &now) > 0)
> 		return ctime;
> 
> Suppose root used clock_settime to set the clock backwards. Won't this 
> code incorrectly refuse to update the file's timestamp afterwards? That 
> is, shouldn't the last line be "goto fine_grained;" rather than "return 
> ctime;", with the comment changed from "keep the existing value" to "use 
> a fine-grained value"?

It is a problem, and Linus pointed that out yesterday, which is why I
sent this earlier today:

https://lore.kernel.org/linux-fsdevel/20230919-ctime-v1-1-97b3da92f504@kernel.org/T/#u

Bear in mind that we're not dealing with a situation where the value has
not been queried since its last update, so we don't need to use a fine
grained timestamp there (and really, it's preferable not to do so). A
coarse one should be fine in this case.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
