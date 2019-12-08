Return-Path: <SRS0=+JRa=Z6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9063CC43603
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2019 03:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61432206DF
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2019 03:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bnw0qQVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61432206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w5Awp5FBY1ZZGNDSjwNspz0DSsn/nTvYs0Hxn2XNZM=; b=Bnw0qQVvD3GsjT
	Y5+Ut3PiSRUDNzD/Wc/nU5Va9DGOk5R2cP93BQdXHLZZ9AM8POzBbYyY8aMb86TwS5TKSb0iiyPHU
	9/T9haWDA2DFs5Y05wzEDzPHHHEZKBAWXLWFH5ck5eAs0yWwrUnh2K+uHCKe45AkYVoj+Oaac8B4O
	scAqqJkxO6XfAvF3SYIDLzG5G1GBkbMnmUsbpaCXqVNXzBWZnqJ+7elsbcMwpJWOtiblS+0EooNkw
	TS0ufMou3X/ovxTTR/lPyy7FfkdiWQhXbdSg7vJnUK/xdC3LQGhJYzxvEPdxvF6vKgmghQ2TPPyit
	rXFeYgR0Rd/2YrgobHoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idmsJ-0000PN-2N; Sun, 08 Dec 2019 03:04:47 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idmsE-0000P2-8e
 for linux-mtd@lists.infradead.org; Sun, 08 Dec 2019 03:04:44 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1idmrg-00078U-Lw; Sun, 08 Dec 2019 03:04:09 +0000
Date: Sun, 8 Dec 2019 03:04:07 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH v2 0/6] Delete timespec64_trunc()
Message-ID: <20191208030407.GO4203@ZenIV.linux.org.uk>
References: <20191203051945.9440-1-deepa.kernel@gmail.com>
 <CABeXuvpkYQbsvGTuktEAR8ptr478peet3EH=RD0v+nK5o2Wmjg@mail.gmail.com>
 <20191207060201.GN4203@ZenIV.linux.org.uk>
 <CABeXuvrvATrw9QfVpi1s80Duen6jf5sw+pU91yN_0f3N1xWJQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABeXuvrvATrw9QfVpi1s80Duen6jf5sw+pU91yN_0f3N1xWJQQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_190442_304629_443065E5 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Steve French <stfrench@microsoft.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 ceph-devel <ceph-devel@vger.kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Dec 07, 2019 at 06:04:38PM -0800, Deepa Dinamani wrote:
> On Fri, Dec 6, 2019 at 10:02 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > On Thu, Dec 05, 2019 at 06:43:26PM -0800, Deepa Dinamani wrote:
> > > On Mon, Dec 2, 2019 at 9:20 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> > > > This series aims at deleting timespec64_trunc().
> > > > There is a new api: timestamp_truncate() that is the
> > > > replacement api. The api additionally does a limits
> > > > check on the filesystem timestamps.
> > >
> > > Al/Andrew, can one of you help merge these patches?
> >
> > Looks sane.  Could you check if #misc.timestamp looks sane to you?
> 
> Yes, that looks sane to me.
> 
> > One thing that leaves me scratching head is kernfs - surely we
> > are _not_ limited by any external layouts there, so why do we
> > need to bother with truncation?
> 
> I think I was more pedantic then, and was explicitly truncating times
> before assignment to inode timestamps. But, Arnd has since coached me
> that we should not introduce things to safe guard against all
> possibilities, but only what is needed currently. So this kernfs
> truncate is redundant, given the limits and the granularity match vfs
> timestamp representation limits.

OK...  I've tossed a followup removing the truncation from kernfs;
the whole series looks reasonably safe, but I don't think it's urgent
enough to even try getting it merged before -rc1.  So here's what
I'm going to do: immediately after -rc1 it gets renamed[*] to #imm.timestamp,
which will be in the never-modified mode, in #for-next from the very
begining and safe for other trees to pull.  Current shortlog:

Al Viro (1):
      kernfs: don't bother with timestamp truncation

Amir Goldstein (1):
      utimes: Clamp the timestamps in notify_change()

Deepa Dinamani (6):
      fs: fat: Eliminate timespec64_trunc() usage
      fs: cifs: Delete usage of timespec64_trunc
      fs: ceph: Delete timespec64_trunc() usage
      fs: ubifs: Eliminate timespec64_trunc() usage
      fs: Delete timespec64_trunc()
      fs: Do not overload update_time

Diffstat:
 fs/attr.c            | 23 +++++++++++------------
 fs/ceph/mds_client.c |  4 +---
 fs/cifs/inode.c      | 13 +++++++------
 fs/configfs/inode.c  |  9 +++------
 fs/f2fs/file.c       | 18 ++++++------------
 fs/fat/misc.c        | 10 +++++++++-
 fs/inode.c           | 33 +++------------------------------
 fs/kernfs/inode.c    |  6 +++---
 fs/ntfs/inode.c      | 18 ++++++------------
 fs/ubifs/file.c      | 18 ++++++------------
 fs/ubifs/sb.c        | 11 ++++-------
 fs/utimes.c          |  4 ++--
 include/linux/fs.h   |  1 -
 13 files changed, 61 insertions(+), 107 deletions(-)

[*] right now it's based on v5.4; I don't see anything that would
warrant rebasing it to -rc1 at the moment, but if anything of that
sort shows up tomorrow, s/renamed/rebased to -rc1 and renamed/.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
