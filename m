Received: from intranet.asianux.com ([58.214.24.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxEn9-0004lB-Cb
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 10:39:56 +0000
Message-ID: <50FD1B22.1020906@asianux.com>
Date: Mon, 21 Jan 2013 18:40:34 +0800
From: Chen Gang <gang.chen@asianux.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v4] fs/ext*,f2fs,jffs2,reiserfs: give comments for acl
 size and count calculation
References: <50DD20B2.6040204@asianux.com> <50E646BC.2090201@asianux.com>
 <50E64A4E.7010408@asianux.com> <50E64BFD.6090000@asianux.com>
 <20130107192016.GD13659@quack.suse.cz> <50EFD427.8060100@asianux.com>
 <50FB9696.7090702@asianux.com> <20130121102428.GA5588@quack.suse.cz>
In-Reply-To: <20130121102428.GA5588@quack.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Theodore Ts'o <tytso@mit.edu>, torvalds@linux-foundation.org,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 paul.gortmaker@windriver.com, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk.kim@samsung.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, dwmw2@infradead.org,
 ebiederm@xmission.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年01月21日 18:24, Jan Kara 写道:
>   Al Viro (you have him on CC list) is the right guy to merge this patch.
> But he's not very responsive at times... You can also check whether he just
> didn't silently merge your patch into his tree -
> http://git.kernel.org/?p=linux/kernel/git/viro/vfs.git
> I don't see the patch there right now, last update to the tree has
> happened 3 weeks ago. Maybe he's on vacation...

  thank you very much for your patient details replying.

  sorry, it is my fault for my original mail address not including Viro 
    so it is necessary to wait additional week for getting his response.

  next time, I need only use ./script/get_maintainers.pl to get mail address.

  :-(


-- 
Chen Gang

Asianux Corporation
