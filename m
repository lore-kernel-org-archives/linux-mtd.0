Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B72FC3A59F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 02:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328CE21897
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 02:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYzFeh6T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUiSI+Km"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328CE21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UqveKg3BEn4h2b+wWUu/H6fRloXfBIBTrX51CT4GS4=; b=SYzFeh6TADmTIg
	uerPRXOFv9oh+/qOczSJxalzu5vg4PdNU5H285vhGxrtDwqNaW6KVcUhf8QOlddQ0K+NGSaFyQd6+
	Lzak+KvBNHDcwZfkYyteaG2gPOUkiX78EpdEU7ARv+z4x5eRsXZFDxkWYTPRcgqxQxCRKcjo2lH3Z
	KOQgvFb1UqzvVyxwFOGaxO5tyDcEWcN/54R50J6JlGuVNe+T3dtdleek80araeMVCSQxLuknjWX8/
	3b5/xL5v1uufzljkEJKeSEH4fV3ZLaOLd13qr9om3svfL7azFxwTs8RHcuFKwiPxiboV1R9PkTPg7
	Vtxynis8zGAAjRo+oTdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3WFF-0001Zc-Da; Fri, 30 Aug 2019 02:02:33 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3WFC-0001Z5-2Y
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 02:02:31 +0000
Received: by mail-io1-xd42.google.com with SMTP id o9so10987087iom.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2019 19:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=SUiSI+Km3m50gBNp/Vf1kQ5Znt7t2xjJr9IjLemKNMiLxz2yhpZsbK/DLZC4L9urNb
 gDxuG7f7XtiecI937GfbQdq+jdln7Z3Fb+8kZnJxwlPpeYQImuMwhjHoDEP857mW1lVb
 NZHRIybWwFHnsioflZzUdQfkXgsEf/TexqY+05N8IO8NvnMnQftjfJ9hFazxqlx7VQO+
 BZ2rZ7/dbzo90ZAvtO0lvvso+7mGgwA9kdlEC7uFLAulP9R+MYUVIvG8IxPGPXul5/em
 IvII12CYogidxhoNLSBGFsf9ZguQCTMWCWKe+z44xwiHPHukomi7gttk607Xpy0ogB0G
 kuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=pCJ/ch7LoKckiezuy30VWVrIZ/0JCRvkO4cQrgwgWC6h/vu29rdPbVX3xIJCMRUDn2
 +q93/5UJH/5k6SXcoZ0/mIhSc0kdIZGiZzyms2ayTCUoB86ivopy/6p8dBs75esXSXfD
 i4owZBUrmGX1JXH9h/Pd89KbR4HqZ3+38qdGN30hMlRXxRYfe5LSevKfn8i1X565T6eq
 4wEI2Rwt6v1g1GWMSaES55YKsHJFRrPETSbKmDoxuK82l45+9aL7UJ0FZ+dvcyroKlfH
 IzXJYnRu0FrFtKYe0hiFbz/Vlw7TpRzLNX+2/Ha6z+UaJ+EtMlR/gw70dha2FNqCFnEI
 lsqQ==
X-Gm-Message-State: APjAAAXMa6LLEJ5kU4EJzpaW4mG36BmynmQZXbijqNUGo/m7EDSo/2bd
 QRVFBh/HFci+dPlGvnTk5D4dEZox+eTgp8iAATo=
X-Google-Smtp-Source: APXvYqzBsNh7crucvVXKqn/eA6ggQob01fCf1ZKTT3BSHFJDqk3FlwYnF1wm6BwegRm/uQfEg9JQEGStTj+fA+RuGsU=
X-Received: by 2002:a5d:8599:: with SMTP id f25mr9602181ioj.265.1567130545941; 
 Thu, 29 Aug 2019 19:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
In-Reply-To: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 29 Aug 2019 19:02:13 -0700
Message-ID: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Mike Marshall <hubcap@omnibond.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_190230_157895_48985817 
X-CRM114-Status: GOOD (  17.68  )
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
 Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net,
 Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net, yuchao0@huawei.com,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>,
 coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Van Hensbergen <ericvh@gmail.com>,
 Jan Kara <jack@suse.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 aivazian.tigran@gmail.com, phillip@squashfs.org.uk,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 luisbg@kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
>
> Hi Deepa...
>
> I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> on orangefs and got a regression... generic/258 failed
> with: "Timestamp wrapped"...
>
> # cat results/generic/258.out.bad
> QA output created by 258
> Creating file with timestamp of Jan 1, 1960
> Testing for negative seconds since epoch
> Timestamp wrapped: 0
> Timestamp wrapped
> (see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
that orangefs does not support negative timestamps.
And, the reason was pointed out in the commit text:

----------------------
Assume the limits as unsigned according to the below
commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
in https://github.com/waltligon/orangefs

Author: Neill Miller <neillm@mcs.anl.gov>
Date:   Thu Sep 2 15:00:38 2004 +0000
--------------------

So the timestamp being wrapped to 0 in this case is correct behavior
according to my patchset.
The generic/258 assumes that the timestamps can be negative. If this
is not true then it should not be run for this fs.

But, if you think the timestamp should support negative timestamps for
orangefs, I'd be happy to change it.

> Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
> and 258 passed... then added the patch series back and the failure returned...
>
> Also.... when I was using "git am" to apply the patch series, the ceph patch
> failed, so I "git skipped" it...

My series applies cleanly against linux-next as of yesterday.

-Deepa

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
