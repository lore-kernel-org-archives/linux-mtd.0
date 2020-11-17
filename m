Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F329EC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:05:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C7922447
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RkH8dYyO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBjGqfkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C7922447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jCrzoK2u5zq/7gXTdvtccsk/yOubKRPQ42jkulhpSK0=; b=RkH8dYyOhgHmRKc5hpnsbkvEI
	n2ytKeUbLbHG/t6xlsZYAYeuQYAOP/gMZKkRbQpmFDApmtYfbIir1QmNu1yznQHSPSDsPtDQ07VXL
	5smLBt1pBt1OdLjGYQCEwnWoi0yzLhcnbJIR0sNHGd4Y1QJx/WJaMZGerzPpJlgd/O3Vad2lHseO7
	Y7YgDoaQyLaWaOyjtYdra7v6as4/LoM1A464fR2som7jWbIGVbnq9BFccpVHfbwmEqLMj3pLov5KB
	H5P2NF+aXM19S5LO+8/a/yyvRlVyy0+/qp9wFDyOCOXOfA1U+KeFftxRzOrBxsHraebDcj3eWXyYj
	jTcgXm/3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4Ov-0000Qj-Ar; Tue, 17 Nov 2020 17:04:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4Ot-0000QG-Vh
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:04:16 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9438122447;
 Tue, 17 Nov 2020 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605632654;
 bh=RI02fUAgmCDGR1I9KhbEZKJySeezxBuuog/z0BglPjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBjGqfkcNFh7VnYo3RQNdBge1TQ+YYC4YKNDLYI8nPndHth5oUkMgNCidgSm2Hu0u
 KLA2crWMx3LsXcgN+T8C26/Kt+F8ujLobWFjlbLjJfxmDID5V1znx5uEEnL0pL3olq
 21GDqIO5jmYr1HGyy4Cx80uxW0RI1rifflYbZMYQ=
Date: Tue, 17 Nov 2020 09:04:11 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v2 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <20201117170411.GC1636127@google.com>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-3-drosen@google.com>
 <20201117140326.GA445084@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140326.GA445084@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_120416_111520_5DE29B5A 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: kernel-team@android.com, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/17, Theodore Y. Ts'o wrote:
> On Tue, Nov 17, 2020 at 04:03:14AM +0000, Daniel Rosenberg wrote:
> > This shifts the responsibility of setting up dentry operations from
> > fscrypt to the individual filesystems, allowing them to have their own
> > operations while still setting fscrypt's d_revalidate as appropriate.
> > 
> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > they have their own specific dentry operations as well. That operation
> > will set the minimal d_ops required under the circumstances.
> > 
> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > since we cannot adjust those later on. This should not result in any
> > change in behavior.
> > 
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> 
> Acked-by: Theodore Ts'o <tytso@mit.edu>

Hi Ted/Richard,

I'd like to pick this patch series in f2fs/dev for -next, so please let me know
if you have any concern.

Thanks,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
