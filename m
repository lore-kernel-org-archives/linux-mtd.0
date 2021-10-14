Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7074C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 15:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0EBD603E5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0EBD603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTuBpa11k/rW63CKlNbr2w1LL5bxY1WEVbGe1V2kYbk=; b=2u7K/jmCzG+0po
	J2s2M7zHXpr5tipes4Ba1pcFxeWn+HjDSR/KZV7OQZmomCMyrkUu7azPaCbtw8LYowj+iwVjRrhAa
	of94baXWB6fWITWSYxIpH0u7geNjy4RiZ3lgdi5QbIl8rtH79EHAuV4SBbbN8pt6NkmgPOvmroTuq
	JGFkCxgQZvkvnm/evtz6iO0nRM+nv52DQMnV0wdNtB+mzOEslCDStCKtXuK96dQwmrObbWihuVWgN
	fyArVIUHZGjc6Nf6ahwYRyAPSBjElpVZrR+BPp4xo3ffHhrVR5/FkxhOUmDDgpJ8qzSXNPxd5biD2
	C1NDLxlwlQ71umOG3ulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb2RK-003bJL-CY; Thu, 14 Oct 2021 15:14:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb2RG-003bGK-Ay
 for linux-mtd@lists.infradead.org; Thu, 14 Oct 2021 15:14:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id c4so4391859pls.6
 for <linux-mtd@lists.infradead.org>; Thu, 14 Oct 2021 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kk58q1N6iOKJV9MmXM4g94KiVUwgBacQdDgb8dq+Hqc=;
 b=mlZB9Nj4m8jk1JFv+iCH7Znrwanh3CDPQczVzomtmeQ5BLbFN1inwmhXkfQwL1sdEQ
 hih7m3SNinxkOxv1CMzByR9lFDUUB4oAxo3E3cDYo/S67L6xZfuz5zRsWVJKP1+73Scy
 QCwjhJQjGzKf7SNt+QV8U3nYErgEHf4yODN/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kk58q1N6iOKJV9MmXM4g94KiVUwgBacQdDgb8dq+Hqc=;
 b=cNRsdQamdojRfzj5CktXUbtIb+nPVV7+l01TTQlw0EjHejFsS9T7efhT0UhbMvtAVC
 4A5+GiWboenA8fVALn8jfODd+Wh1bDF3D1JVY8DUv5DzY0mMoUNDCYWLEupVRE/S5BBV
 7Zq5S1OcbN8A+NktibdaJbNFOjFNpJppQ5eXBbkqAiW8gtjuHl46YDhhaM7JummxJXGu
 fwScnLlz+kzLVFaJSJW3Q7IIx3C+BhTMhGWLfX+7oLuzO5MmVBFVeke1aeeYN/tjqSby
 sU5Pah1gIZIefupVI09yrh1i6iO6FtM2F7tw6EhPiUTaqRo6p5J6bduW4sBu9wSPjKc+
 tnjA==
X-Gm-Message-State: AOAM533OGjiAJzxb4nKjq2gLSSbrbkp/c3WhqG2FARHpBKrcrYoNTYTr
 9Qmx8xkHKJ8W6oABCPBT11mz6Q==
X-Google-Smtp-Source: ABdhPJz+A28iMSsGMew00w4bTffNulDM4PlP1p1A1+RouZBKHQoPJUsZrDvvxCBzVTavFWwP5kdepA==
X-Received: by 2002:a17:90a:86:: with SMTP id
 a6mr20774739pja.190.1634224472530; 
 Thu, 14 Oct 2021 08:14:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w4sm2822114pfb.3.2021.10.14.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:14:32 -0700 (PDT)
Date: Thu, 14 Oct 2021 08:14:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Anton Altaparmakov <anton@tuxera.com>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
 Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Theodore Ts'o <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>, 
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>, 
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>
Subject: Re: don't use ->bd_inode to access the block device size
Message-ID: <202110140813.44C95229@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211014062844.GA25448@lst.de>
 <3AB8052D-DD45-478B-85F2-BFBEC1C7E9DF@tuxera.com>
 <a5eb3c18-deb2-6539-cc24-57e6d5d3500c@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5eb3c18-deb2-6539-cc24-57e6d5d3500c@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_081434_395531_A29891DB 
X-CRM114-Status: GOOD (  25.42  )
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

On Thu, Oct 14, 2021 at 08:13:59AM -0500, Dave Kleikamp wrote:
> On 10/14/21 4:32AM, Anton Altaparmakov wrote:
> > Hi Christoph,
> > 
> > > On 14 Oct 2021, at 07:28, Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > On Wed, Oct 13, 2021 at 07:10:13AM +0200, Christoph Hellwig wrote:
> > > > I wondered about adding a helper for looking at the size in byte units
> > > > to avoid the SECTOR_SHIFT shifts in various places.  But given that
> > > > I could not come up with a good name and block devices fundamentally
> > > > work in sector size granularity I decided against that.
> > > 
> > > So it seems like the biggest review feedback is that we should have
> > > such a helper.  I think the bdev_size name is the worst as size does
> > > not imply a particular unit.  bdev_nr_bytes is a little better but I'm
> > > not too happy.  Any other suggestions or strong opinions?
> > 
> > bdev_byte_size() would seem to address your concerns?
> > 
> > bdev_nr_bytes() would work though - it is analogous to bdev_nr_sectors() after all.
> > 
> > No strong opinion here but I do agree with you that bdev_size() is a bad choice for sure.  It is bound to cause bugs down the line when people forget what unit it is in.
> 
> I don't really mind bdev_size since it's analogous to i_size, but
> bdev_nr_bytes seems good to me.

I much prefer bdev_nr_bytes(), as "size" has no units.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
