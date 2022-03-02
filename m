Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6206C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VFXW5JX46fD8xTrdpT1x+6i8bMKNDmDrVdDEIRSfeM=; b=42f0mUWlcbTNJ6
	zuhQIIXLvYwHsWHQjQgo4OrIKfnPOPl0nSoPmrRzjQcaVwKeDiHGHg6vliZh3d4mdh/19Q9+0aRPV
	l8yRKZsedXRZM8zJCH9uGfrEIoKHO4J9GaQr1NjP2durcFbCuTXe6in6uZ5v7S5xhbe2vfkZKnX5J
	CLnN+Y/v/gdDIVHl09goyGgxCke5hVKfZ2FwjjAJDWCVgmCXfMuf7zjBJ7XLwAIBFezlVLFScGuDN
	x9G/rsB5JyDGVNZ1lzMca3FZJTp3ZdBACaOw0J2Go93DTppnVYlz43UEEwULpYlU4xX0agnolk6Su
	xkBSj+B2Zh+H4ymDiDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLDa-0022Qr-Hz; Wed, 02 Mar 2022 09:24:22 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLDV-0022Pi-MA
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 09:24:19 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 696FD1F39D;
 Wed,  2 Mar 2022 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646213056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clM0yYlLqEX7Y5ui9U1ErugOMUrW/ceVhGC6xR2tAew=;
 b=GxV9t9jA8UzFp10mgfTYqscDn3mqAyjQkUDkNOZ6WudDgkD7fZ24C2xIm1J1lwjPWv5Hqx
 KAwG4h+6/IKc3x4mcMJTcacF5wckqSBifZjASvkwxdtNedohTlXsBSH6VACa8L07DZFfwg
 JNMv0pJ3iN3bsv52RjAy+hn8LSMzPpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646213056;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clM0yYlLqEX7Y5ui9U1ErugOMUrW/ceVhGC6xR2tAew=;
 b=//kv8L4NT9j55yEeAww5drvSB7x88AZTHCxd6ugQ9HVtKzCBWy2rLFVIP1Y5dDzFAPITnN
 yxItsAQPEssSgTCg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 48383A3B87;
 Wed,  2 Mar 2022 09:24:16 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id EBD45A0608; Wed,  2 Mar 2022 10:24:15 +0100 (CET)
Date: Wed, 2 Mar 2022 10:24:15 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard@nod.at>
Cc: Jan Kara <jack@suse.cz>, wuchi zero <wuchi.zero@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 tj <tj@kernel.org>, mszeredi <mszeredi@redhat.com>,
 sedat dilek <sedat.dilek@gmail.com>, axboe <axboe@fb.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 torvalds <torvalds@linux-foundation.org>, linux-mm <linux-mm@kvack.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Different writeback timing since v5.14
Message-ID: <20220302092415.4sikhzup7sorhxgy@quack3.lan>
References: <2104629126.100059.1646129517209.JavaMail.zimbra@nod.at>
 <20220301103218.ulbmakdy4gbw2fso@quack3.lan>
 <719960584.100772.1646147154879.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <719960584.100772.1646147154879.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_012417_890528_100FE50D 
X-CRM114-Status: GOOD (  18.97  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 01-03-22 16:05:54, Richard Weinberger wrote:
> Jan,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Jan Kara" <jack@suse.cz>
> >> Is this expected?
> >> Just want to make sure that the said commit didn't uncover an UBIFS is=
sue.
> > =

> > Yes, I think it is expected. Likely the background threshold for UBIFS =
bdi
> > is very small (probably UBIFS is not used much for writeback compared to
> > other filesystems). Previously, we just used wb_stat() which returned 0
> > (PCP counter inexact value) and so background writeback didn't trigger.=
 Now
> > we use wb_stat_sum() when threshold is small, get exact value of dirty
> > pages and decide to start background writeback.
> =

> Thanks for the prompt reply!
> =

> > The only thing is, whether it is really expected that the threshold for
> > UBIFS bdi is so small. You can check the values in
> > /sys/kernel/debug/bdi/<bdi>/stats.
> =

> BdiDirtyThresh is indeed 0.
> =

> BdiWriteback:                0 kB
> BdiReclaimable:              0 kB
> BdiDirtyThresh:              0 kB
> DirtyThresh:            772620 kB
> BackgroundThresh:       385836 kB
> BdiDirtied:                  0 kB
> BdiWritten:                  0 kB
> BdiWriteBandwidth:      102400 kBps
> b_dirty:                     0
> b_io:                        0
> b_more_io:                   0
> b_dirty_time:                0
> bdi_list:                    1
> state:                       1

Yes, so this looks expected given the BDI wasn't active yet at all...

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
