Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C637C3A5A6
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 16:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F272342B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 16:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jl1+Q286"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F272342B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqYl4HvVMreMJ2uEY6Z5nmP6RmHyINStpbtmK6wd1u4=; b=jl1+Q286sy4SJz
	WLO1JDMcDqU3qUsOoNxqMUdT++sIbxuQMZpQLYLbUvY4LynOrsTSmyudFSx3Gg5BHA6PMC++944YM
	EJl6AF+LSKLv4+djUElnPhUf4B8K7TVhgGjIzwGSxIKnJoTNFTFCuxFd9U28LMzXC86qm6Uy01P3z
	lrDFmrVakWYycAIWisEd+Fzf32wlE2SnT4g/tajp2baTHpY8RmiPhtYu7KrNq6leoXJIKzvEUlNKo
	A4SJFAsQ3HbpWY65xYls1ANDAdHRsCtMmKlN4sprWbED9FUNi+9EV2iTsSt4SDZy1kl9NjeHTQ+Cj
	v1yCPi0ClIOeJJX9udyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3jh2-0004Gk-23; Fri, 30 Aug 2019 16:24:08 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3jgx-0004Fp-3T
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 16:24:04 +0000
Received: by mail-qt1-f195.google.com with SMTP id z4so8224256qtc.3
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2019 09:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=;
 b=jE8jz9WVrThAsd5erGlEShnGPM6nKQo7zW6UY3VwqPzqVROlLZxgwpfCMfrwohjXgh
 PHVO+PCu46uiZsTjaumetSCdAKal67QwhNwJWwgC6O/KX/b5mg6HLmib/gncjQiNGagg
 pCNpcnQBYraHx2+R1gMB0WO/oaPSsoOIUMQsPpiYF1I8f3XWB4IE5Dq9NW4eEAPFCyd2
 qwYOJoXcGpI8Vc9+GC0Cx0KWQDLx2q8vr7kaGdUeJoygMbLP+9FBwCD1L8k33+B6fCEW
 sm5TnDBtvw1BAmZQfuZN5AZD2bgTjC9O+a6FdlX1C948MNDYFepsp2HJBp/91wuxt2m7
 rKgQ==
X-Gm-Message-State: APjAAAVChEXnzLb47P26Qp7poMSZwTYH5LqGXLbeNkLvJ4Lv65SZa+QS
 +TDd79aJ148hzfwxfxnLcVZxylbCssaloNdr4xU=
X-Google-Smtp-Source: APXvYqx1Qvswft0K3BgJsYOtSdZQVwjHx2AQF9skYad3Rr5MY9B9bcWDDXL/X1Cpj9GrJMiBQ1QnvNUru+BTr0FLkYc=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr2652509qtn.204.1567182239864; 
 Fri, 30 Aug 2019 09:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
 <20190830154744.4868-1-deepa.kernel@gmail.com>
In-Reply-To: <20190830154744.4868-1-deepa.kernel@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 18:23:43 +0200
Message-ID: <CAK8P3a3WUmeewmNscdKpUf3fB3eLV1X=YdLQt8cvS_tqq7OroQ@mail.gmail.com>
Subject: Re: [GIT PULL RESEND] vfs: Add support for timestamp limits
To: Deepa Dinamani <deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_092403_146699_DE0BD9FF 
X-CRM114-Status: GOOD (  12.22  )
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
 Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>,
 Chao Yu <yuchao0@huawei.com>, Bob Copeland <me@bobcopeland.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, mikulas@artax.karlin.mff.cuni.cz,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 Zheng Yan <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu,
 Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu,
 V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 gregkh <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 phillip@squashfs.org.uk, David Woodhouse <dwmw2@infradead.org>,
 "Anna.Schumaker@Netapp.com" <anna.schumaker@netapp.com>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 5:48 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> [resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Dropped orangefs until the maintainers decide what its limits should be.

I've merged this into my
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git y2038
branch. Since you did not include a tag description, I took the text from
the last patch series as the commit text, with a link to the pull request
on lore.kernel.org.

Al, let me know in case you have any objections to this going through
the y2038 branch, and you would rather take it through vfs.git.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
