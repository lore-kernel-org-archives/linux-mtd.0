Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4D2C3A5A4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 13:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3491223426
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 13:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/OOoJ0+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3491223426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2e7P29cJ9zPqg5nveRhvWWgROpV+H4zOe97fI39+mM=; b=n/OOoJ0+CyWYW0
	ZplduH7UbmsaOSpQcO7SKDyNS4w5L82WeEhnCxBOPwQTuJvUzb9cZeRv0YBvFyeV7oeWqwDnP+X9+
	NzyGDQcrM4EICeYqycyEoijDzf2M4i3O+vpAMqksJxlBUuCCtj4/Nj6RToIilDJ8mG2MM1Fb0fquG
	X9i60Mg7cHlMKcdlr0UNqOU7BlIYLaKnYbFC3TXBrf+tsXsrCtSV2BsXgfhma9t0Dc3vY21fANgN4
	ysYclp8a2II6vmJUUKTQVN7/iLFNDmh2nbQXwcEHvfkT2H+XI0q5B7qvANQGkvjB/+qBfPKB+PoFi
	50PDLKp0HSx9WQ/p/OpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3hQZ-0004MC-CW; Fri, 30 Aug 2019 13:58:59 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3hQU-0004LI-CE
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 13:58:56 +0000
Received: by mail-qk1-f193.google.com with SMTP id d23so6207605qko.3
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2019 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZh0lrnnbveFd2ktjNoW+9Y7+KeLBrFI15hkdhrfg8w=;
 b=GEFzxvK761M5W3Z7B9HhK3t4Dtg7Zsiq9h0kf5JR91lmvQ6srxaE1F5Aj9UwmqDRNM
 U4oOZ5sLF4V/Apa10nsg+7sPmWbEnxYaNnRYJTjEdk4n9qBGnxLKmbj8jRCVer8ok3KP
 ZdJ4mJjhFza9JYsOUoDwSTUByL6Xk891F0ULXuhaA+GCaWaUJ2W4Jlz2y5C2ZLuZvyLk
 DoPm/gxXGW0KA26RgG5pN4mUi99XUuNIzOSMny5N9/q8EVlYy+KkWqKZ859qM4Za4iy/
 ot6UwWAVLzy6yHu2I7eUWPfbS4KptKpuoC/V21w9lLQp2lhypJT+Cy3DLXuknc6z4pC/
 7HsQ==
X-Gm-Message-State: APjAAAUsZuP3X/R+cqxqxOQ8FTvxz0H42TRO7e7r8KP0Zff5PjpoTZM1
 MlsskK9X/Hpo2B7DDjbPu8pVsGKuVWlF4wAXn3I=
X-Google-Smtp-Source: APXvYqwLJSfUvFHYpnCbLtQwiLesqk6Up0F09OxCEWeJS/zvGXm8TGjLQauibK2uyX+MPGtGJJXtticB+OlivKMyzRQ=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr15306907qka.3.1567173532434; 
 Fri, 30 Aug 2019 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
In-Reply-To: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 15:58:35 +0200
Message-ID: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Deepa Dinamani <deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_065854_422916_B4D88DCB 
X-CRM114-Status: GOOD (  25.90  )
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
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
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
 Alexander Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 Greg KH <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 4:02 AM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
> >
> > Hi Deepa...
> >
> > I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> > on orangefs and got a regression... generic/258 failed
> > with: "Timestamp wrapped"...
> >
> > # cat results/generic/258.out.bad
> > QA output created by 258
> > Creating file with timestamp of Jan 1, 1960
> > Testing for negative seconds since epoch
> > Timestamp wrapped: 0
> > Timestamp wrapped
> > (see /home/hubcap/xfstests-dev/results//generic/258.full for details)
>
> Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
> that orangefs does not support negative timestamps.
> And, the reason was pointed out in the commit text:
>
> ----------------------
> Assume the limits as unsigned according to the below
> commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
> in https://github.com/waltligon/orangefs
>
> Author: Neill Miller <neillm@mcs.anl.gov>
> Date:   Thu Sep 2 15:00:38 2004 +0000
> --------------------
>
> So the timestamp being wrapped to 0 in this case is correct behavior
> according to my patchset.
> The generic/258 assumes that the timestamps can be negative. If this
> is not true then it should not be run for this fs.
>
> But, if you think the timestamp should support negative timestamps for
> orangefs, I'd be happy to change it.

I think it's unclear from the orangefs source code what the intention is,
as there is a mixed of signed and unsigned types used for the inode
stamps:

#define encode_PVFS_time encode_int64_t
#define encode_int64_t(pptr,x) do { \
    *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
    *(pptr) += 8; \
} while (0)
#define decode_PVFS_time decode_int64_t
#define decode_int64_t(pptr,x) do { \
    *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
    *(pptr) += 8; \
} while (0)

This suggests that making it unsigned may have been an accident.

Then again,  it's clearly and consistently printed as unsigned in
user space:

        gossip_debug(
            GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
            llu(s_op->attr.mtime), llu(resp_attr->mtime));

A related issue I noticed is this:

PVFS_time PINT_util_mktime_version(PVFS_time time)
{
    struct timeval t = {0,0};
    PVFS_time version = (time << 32);

    gettimeofday(&t, NULL);
    version |= (PVFS_time)t.tv_usec;
    return version;
}
PVFS_time PINT_util_mkversion_time(PVFS_time version)
{
    return (PVFS_time)(version >> 32);
}
static PINT_sm_action getattr_verify_attribs(
        struct PINT_smcb *smcb, job_status_s *js_p)
{
...
    resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
...
}

which suggests that at least for some purposes, the mtime field
is only an unsigned 32-bit number (1970..2106). From my readiing,
this affects the on-disk format, but not the protocol implemented
by the kernel.

atime and ctime are apparently 64-bit, but mtime is only 32-bit
seconds, plus a 32-bit 'version'. I suppose the server could be
fixed to allow a larger range, but probably would take it out of
the 'version' bits, not the upper half.

To be on the safe side, I suppose the kernel can only assume
an unsigned 32-bit range to be available. If the server gets
extended beyond that, it would have to pass a feature flag.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
