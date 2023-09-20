Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE980CE79D4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/a5CuxKHrykFEAKjnM5RMDRX3czq7ogGDcJmHhTmE4=; b=H9GtcGwHHvt3Jg
	7d+3KfQaBXg49xbDDTxeAlhFpjw03zVWI/g9av7fbAau1K/3qt5oeNZMcnq0IHfdQagcKachFkCoZ
	bKwEi3MkbrDzyQEgOWddTzKv2UMK+xwdsCfKmSjHRJ7l/Qyp/J8QOQ986rJJruVqQUTChzjiiEibu
	dH5iG2vioCj+dB7XfFV7Iw0ytLb8euevvZM6+cnnb/HvftC+MbCxH3FGBrZqMhz/hYq9SrRHOI0RE
	W5Z4/AiL0HrcVcinfsFJhXcGvzT6LK1pcoBuQMxnhofRmn6dqnG1ccR36mbnSGnJ2PZil9/BgPBx4
	kuj1UDn1+pRazCRDKKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwHs-003121-0X;
	Wed, 20 Sep 2023 12:26:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwHo-00311Y-1x;
	Wed, 20 Sep 2023 12:26:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF45061BBB;
	Wed, 20 Sep 2023 12:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B116FC433C7;
	Wed, 20 Sep 2023 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695212791;
	bh=j2Ujv7mECWiiyepGgcf7cYeq2b5uXg4j5WSf8WCGJGw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RVJi3YJ93nkGdme97CPVZyKVsXRompHSEpqtPgjg5IXZpeeoDKXr4+/N/2g8SazNs
	 PTMXfjbLyVcmcMlPWK9gkCUtPoVL08D+8T05skUSNXNcqojDYuKIJ3D4iWsQcQ6/p1
	 nd9CYh7ZGv0mecri9lQNu6T+URWU12zhbzr3m2+MF994QE4TOTY30oj8CIGcHrjPaV
	 p5eQQYHK9EbLKwSLlRiXFpn887zwMtzAwEYy9X3/fczshcnuzqpR2PcPdvzsvp+Nwj
	 nUXi4yVYSv9CkblAa+vVWETbd39smzugtkni9XuKQCezFNMIk6+brCA9QPeH9rNHQP
	 PWQ6YJSMI9mJw==
Message-ID: <08b4e3275bad93ed99ea2892bd1950ff401ab912.camel@kernel.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Bruno Haible <bruno@clisp.org>, Xi Ruoyao <xry111@linuxfromscratch.org>,
  bug-gnulib@gnu.org, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van
 Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>,  David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>,  Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,  Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bo b Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
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
Date: Wed, 20 Sep 2023 08:26:23 -0400
In-Reply-To: <20230920-kahlkopf-tonlage-ab6ca571465e@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230919110457.7fnmzo4nqsi43yqq@quack3>
	 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
	 <4511209.uG2h0Jr0uP@nimes>
	 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
	 <20230920-leerung-krokodil-52ec6cb44707@brauner>
	 <20230920101731.ym6pahcvkl57guto@quack3>
	 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
	 <20230920-raser-teehaus-029cafd5a6e4@brauner>
	 <35c28758a9cc28a276a6b4b4ae8a420a1444e711.camel@kernel.org>
	 <20230920-kahlkopf-tonlage-ab6ca571465e@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_052632_730717_605016D6 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, 2023-09-20 at 14:08 +0200, Christian Brauner wrote:
> > I wasn't proposing to do that work for v6.6. For that, we absolutely
> > either need the mount option or to just revert the mgtime conversions.
> 
> This sounds like you want me to do a full-on revert of your series but
> why? The conversion and changes support an actual use-case and are fine.
> It's a matter of whether we unconditionally expose it to users or not.
> 

I don't, actually. I'm just mentioning that it's possible if we find the
mount option to be unpalatable.

> @Jan, what do you think?
> 
> > My plan was to take a stab at doing this for a later kernel release.
> 
> Ok.

If it works out, then we may be able to eventually remove the mount
option, but that is a separate project altogether.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
