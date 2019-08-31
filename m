Return-Path: <SRS0=VSS2=W3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89929C3A5A6
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 22:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5164823405
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 22:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIYJ52es";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXcTp5OR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5164823405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9XUuHrXL5ApSonS+wdC57zm5uae6MdgrZfXECeECT8=; b=GIYJ52esqy0anP
	i5d71lDLEF45CeWP4oTtZCOJU1ey3wq2Rsh+ONwKluFnvZ5zQLI1BGFuh4SmZdubsa+ZSw9GSra+g
	OsycexcTUsKtAIs6GmURKnVKrMReZX8M9NqDbJ1xC77n/CBQxzP9YV6IN0oykjkqS7KKrdUthssfc
	bhWjzKaGDTZoi+NEWMvgcsV1+JNqojSLnQ/TzKfu9zJY92kw4SjTdS2OsbS+6H5vQutWRwFPNmEPt
	xTGyeN4IS3y84x4Tc0JBnkZ+wHYdJINZ+HxSTsyTAds9PwhpF//L2/Zt0a9xeTOCHKwhsOHUTcJ6J
	Cb1i82qd2BAovtO9HZgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4CCQ-0006DL-5l; Sat, 31 Aug 2019 22:50:26 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4CCM-0006Cx-M4
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2019 22:50:24 +0000
Received: by mail-io1-xd44.google.com with SMTP id d25so19319650iob.6
 for <linux-mtd@lists.infradead.org>; Sat, 31 Aug 2019 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=;
 b=aXcTp5ORUJ9v6lvzIgnO3kFSbLpXDiwrjmF8wY+g2guepKA06q9bi3Rm9msLfVfOjQ
 KNRvWmw8ak6S3NwzAdmSxBIeG1Sb4eSNm5e0ZjmAgk9ZlM4k21SSALJLCNoiAvHUizK4
 zOmrFrhQJgVIgE1sjux3jaSKnzRaF/6H90IkDMl/BMTaq8C/TCYMXEN7O4ZJQQtSqb0a
 GFuX6/WoU+ZaNaNKXJ3mYccQ7I8pJ4ma0YPOCysvVSCuZ0omHUn2dF26yyXMeNNj0vzq
 AXHMjcuekyx7LGzDWacrH+K9/2E8bcBn8KFkWIoTNCkGetG/vTsXGmlPsdXHkSwFh3F/
 GYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=;
 b=TxxiHJMbmXu6rTRBuPFBXD1CbA9rWJAYoAiRX8CZa+af/QZIDJI/N4if4Np+O969Jl
 9XpD8D+tIa6YXn1x++QRCnnIHmnYREG0EyBvN2UEltbLhc9WPd99KPRoODGYG1mYGFzw
 M0FKB+CKav46xxzWCbYeUaCqmaL6c72pyv91KkkLS9tngTXkks5MYo3R48ivRpT7CT+V
 q4CCH/8cRxgQMPXPztJltrlHotkPM4+6NfLDgrgOqTn94eUGpe2EDGBvM2yj/ADUY7Jq
 uBGbyFHhtLI+ALvHNQRS+cCEFxUNY6wwUuL9GIGSEAsqfwW3XrFkFIBUik6Fftgfc5CV
 l6KQ==
X-Gm-Message-State: APjAAAWCL5R/616jEvECp7sB0NJjJdmUClrMcfMm8T/s6Pf4/ZyQDPmb
 7/Aly+biKMs6Z7sRrNvC6sJzjrNO2irEVqA8nFs=
X-Google-Smtp-Source: APXvYqyTRG8TWby1CMDSb8c+t9UhDYnpFv7cJIBGTaHwW7d+/cTfJvK+wGxNxwIJlNTmqmGSFTPf1WR9NOkPmivvWCA=
X-Received: by 2002:a02:904d:: with SMTP id y13mr12652386jaf.139.1567291820141; 
 Sat, 31 Aug 2019 15:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
 <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
In-Reply-To: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sat, 31 Aug 2019 15:50:08 -0700
Message-ID: <CABeXuvrm76iKnFrd7Wo=z4d0v7i7xT+Ta37D-mwVwy7-P3YyUg@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_155022_753412_E6F2AF76 
X-CRM114-Status: GOOD (  20.00  )
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

> I think it's unclear from the orangefs source code what the intention is,
> as there is a mixed of signed and unsigned types used for the inode
> stamps:
>
> #define encode_PVFS_time encode_int64_t
> #define encode_int64_t(pptr,x) do { \
>     *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
>     *(pptr) += 8; \
> } while (0)
> #define decode_PVFS_time decode_int64_t
> #define decode_int64_t(pptr,x) do { \
>     *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
>     *(pptr) += 8; \
> } while (0)
>
> This suggests that making it unsigned may have been an accident.
>
> Then again,  it's clearly and consistently printed as unsigned in
> user space:
>
>         gossip_debug(
>             GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
>             llu(s_op->attr.mtime), llu(resp_attr->mtime));

I think I had noticed these two and decided maybe the intention was to
use unsigned types.

> A related issue I noticed is this:
>
> PVFS_time PINT_util_mktime_version(PVFS_time time)
> {
>     struct timeval t = {0,0};
>     PVFS_time version = (time << 32);
>
>     gettimeofday(&t, NULL);
>     version |= (PVFS_time)t.tv_usec;
>     return version;
> }
> PVFS_time PINT_util_mkversion_time(PVFS_time version)
> {
>     return (PVFS_time)(version >> 32);
> }
> static PINT_sm_action getattr_verify_attribs(
>         struct PINT_smcb *smcb, job_status_s *js_p)
> {
> ...
>     resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
> ...
> }
>
> which suggests that at least for some purposes, the mtime field
> is only an unsigned 32-bit number (1970..2106). From my readiing,
> this affects the on-disk format, but not the protocol implemented
> by the kernel.
>
> atime and ctime are apparently 64-bit, but mtime is only 32-bit
> seconds, plus a 32-bit 'version'. I suppose the server could be
> fixed to allow a larger range, but probably would take it out of
> the 'version' bits, not the upper half.

I had missed this part. Thanks.

> To be on the safe side, I suppose the kernel can only assume
> an unsigned 32-bit range to be available. If the server gets
> extended beyond that, it would have to pass a feature flag.

This makes sense to me also. And, as Arnd pointed out on the IRC, if
there are negative timestamps that are already in use, this will be a
problem for those use cases.
I can update tha patch to use limits 0-u32_max.

-Deepa

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
