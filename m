Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9CEC2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 20:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42402071E
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 20:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dz0j6mqZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1ag7/2DS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42402071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZ6ASmsaqSYqvnLotYtfdgfOsnq5hYRxrysS406lvFw=; b=dz0j6mqZttO/ug
	QLXTHDanPVTJgJzHNvLRSDr72CVE/eDxa4NxzMACeCdC240eY0YMrFWDnSSHidjH5evm/ymWdO5Rr
	l99uIx1iW0KJgUhZMVaeDsHdg6ePBaegVI1vWqNRnCXZRCw/xXZo2p5RjWegDzM2/wHUA1w4duzhu
	v3hr6IMn36oIIXY4xGVgL+4ee09wQO3vimM8Qwsg4iU/9lR0lK/C4zh0SR8Wivvm3plJY9O9FiUpb
	YYott5ikx0CKWGNrci5ObgWCGaORFMjQ42LgfOpXJz1ue2Oy6yXCoUSzoIKOtk2h/y+w/ze4Q4hIw
	pQIe8wCn46A6RfN8rgrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv5LG-0008OQ-EB; Fri, 24 Jan 2020 20:14:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv5LC-0008NP-KT
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2020 20:14:07 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8CF2071E;
 Fri, 24 Jan 2020 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579896844;
 bh=BXwKT7PuUAxXdQBtcYCaPasA/6uX1OMir4E6yh0LA3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1ag7/2DSoxG5KYU0EMVWB64o75K0btoF+qRMCO5k9cTMqUywqJBdCg/sUprpKIHv/
 9MepeQSjc6pe8xJdw8+LoNAgcQY5x8NUgXg6RHWOLoXD7dmmnthVG6ewye8WF1rbAv
 53XYtcyTT0ewAW3ULL2QSG0sBV/ytCRp6aZzLJeA=
Date: Fri, 24 Jan 2020 12:14:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 4/6] ubifs: don't trigger assertion on invalid no-key
 filename
Message-ID: <20200124201317.GC41762@gmail.com>
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-5-ebiggers@kernel.org>
 <20200122003014.GA180824@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122003014.GA180824@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_121406_696075_92D8416F 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 04:30:15PM -0800, Eric Biggers wrote:
> On Mon, Jan 20, 2020 at 02:31:59PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > If userspace provides an invalid fscrypt no-key filename which encodes a
> > hash value with any of the UBIFS node type bits set (i.e. the high 3
> > bits), gracefully report ENOENT rather than triggering ubifs_assert().
> > 
> > Test case with kvm-xfstests shell:
> > 
> >     . fs/ubifs/config
> >     . ~/xfstests/common/encrypt
> >     dev=$(__blkdev_to_ubi_volume /dev/vdc)
> >     ubiupdatevol $dev -t
> >     mount $dev /mnt -t ubifs
> >     mkdir /mnt/edir
> >     xfs_io -c set_encpolicy /mnt/edir
> >     rm /mnt/edir/_,,,,,DAAAAAAAAAAAAAAAAAAAAAAAAAA
> > 
> > With the bug, the following assertion fails on the 'rm' command:
> > 
> >     [   19.066048] UBIFS error (ubi0:0 pid 379): ubifs_assert_failed: UBIFS assert failed: !(hash & ~UBIFS_S_KEY_HASH_MASK), in fs/ubifs/key.h:170
> > 
> > Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
> > Cc: <stable@vger.kernel.org> # v4.10+
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Richard, can you review the two UBIFS patches in this series, and if you're okay
> with them, provide Acked-by's so that we can take them through the fscrypt tree?
> They don't conflict with anything currently in the UBIFS tree.
> 

Richard, any objection to us taking these patches through the fscrypt tree?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
