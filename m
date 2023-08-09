Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DDAEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1atyNXorY8Zpd0IVeuQ87/FQ3aJDOUuQrbdOcfqtdg=; b=BOAnyaqTqzUfUI
	3NiH0w3b7jRFuhP9fz36ANKZlSD5a7ixjf/MxehmINPUDQugoP7jcJDUNvkq1MuNTLYmOFr3OAuF3
	3iAh1HRE91brdMg/BoBHQZ1YuTtl96DmUrxg9axmGv90V0wVy13HFOJWCIoLAiqg3QoUiGMTRW4m3
	Eon+55S/iXTMK1UtG1Wi9v1sjugFCYSC1PD3F8+el7d7AsSTOLiubeS3EO6mVUgVhQanaEsm+nHJ7
	8AMQ05LiWvyvMMApIupNTfkgkz4z0sdCEuplHmxdqjqijdtFZiCMIMa6fDEFMeyJ820Bek1R1lkU8
	S8pnLtIiKTgJD693Tm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTekk-004Nf0-2M;
	Wed, 09 Aug 2023 08:41:14 +0000
Received: from mail.parknet.co.jp ([210.171.160.6])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeki-004NeX-2g;
	Wed, 09 Aug 2023 08:41:14 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 2BF732055FA1;
	Wed,  9 Aug 2023 17:41:12 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 3798fAMk208573
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 17:41:11 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 3798fAiA140744
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 17:41:10 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 3798f9uW140743;
	Wed, 9 Aug 2023 17:41:09 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner
 <brauner@kernel.org>,
        Eric Van Hensbergen <ericvh@kernel.org>,
        Latchesar
 Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck <linux_oss@crudebyte.com>,
        David Howells
 <dhowells@redhat.com>,
        Marc Dionne <marc.dionne@auristor.com>, Chris
 Mason <clm@fb.com>,
        Josef Bacik <josef@toxicpanda.com>, David Sterba
 <dsterba@suse.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>,
        Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
        Chao Yu
 <chao@kernel.org>,
        Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
        Jeffle Xu
 <jefflexu@linux.alibaba.com>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger
 <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>, Miklos
 Szeredi <miklos@szeredi.hu>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas
 Gruenbacher <agruenba@redhat.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>,
        Trond Myklebust
 <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Mark
 Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi
 <joseph.qi@linux.alibaba.com>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg <martin@omnibond.com>,
        Luis Chamberlain
 <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>, Iurii Zaikin
 <yzaikin@google.com>,
        Steve French <sfrench@samba.org>, Paulo Alcantara
 <pc@manguebit.com>,
        Ronnie Sahlberg <ronniesahlberg@gmail.com>,
        Shyam
 Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
        Sergey
 Senozhatsky <senozhatsky@chromium.org>,
        Richard Weinberger
 <richard@nod.at>,
        Hans de Goede <hdegoede@redhat.com>, Hugh Dickins
 <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Amir
 Goldstein <amir73il@gmail.com>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Benjamin Coddington <bcodding@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
        linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
        codalist@telemann.coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
        linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
        linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
        linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
        ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-mtd@lists.infradead.org, linux-mm@kvack.org,
        linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v7 05/13] fat: make fat_update_time get its own timestamp
In-Reply-To: <87msz08vc7.fsf@mail.parknet.co.jp> (OGAWA Hirofumi's message of
	"Wed, 09 Aug 2023 17:37:44 +0900")
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	<20230807-mgctime-v7-5-d1dec143a704@kernel.org>
	<87msz08vc7.fsf@mail.parknet.co.jp>
Date: Wed, 09 Aug 2023 17:41:09 +0900
Message-ID: <87il9o8v6i.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_014113_095978_92CF6E77 
X-CRM114-Status: GOOD (  11.73  )
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

OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:

> Jeff Layton <jlayton@kernel.org> writes:
>
>> Also, it may be that things have changed by the time we get to calling
>> fat_update_time after checking inode_needs_update_time. Ensure that we
>> attempt the i_version bump if any of the S_* flags besides S_ATIME are
>> set.
>
> I'm not sure what it meaning though, this is from
> generic_update_time(). Are you going to change generic_update_time()
> too? If so, it doesn't break lazytime feature?
>
> Thanks.

BTW, fat is not implementing lazytime now, but it is for future.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
