Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D874BC4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:10:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B80420739
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="teCJ2JKs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc7Cr1TW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B80420739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FD9zpU/3D7DzdqvBpPAxGe71B3f6js2sh+QZFC+wphE=; b=teCJ2JKsASb6+DTfu6Qrp3I38
	e+SK9L2ril5z/6D04/b70akxkmON9NnwXRK5NqU7+MDstk//L8yBjezfdQVOF8xAMks0aZpL6TXMF
	OaKiNLCmAN/RrJAQjtSZdTvRM0tmPTUewfBdZLOKqZRKVKw1gSz1pL7Ztkp79OUlB+2ronerckOc3
	TLYf+29MJGVLUXou8iWbRl3envPX3RXpbP7F+mkp4PitlBivF1QFhYlcH8e5ZbhhIwhYgFn5XQYGJ
	gE8D/Bja8s3NQcCycKKbYgJtC4UIj5ExePJUU+S4kICBlC0keJkaFO5v6yRPTE/9Nc48oo9MYemK9
	KD1954jlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKxyG-0003Iv-LE; Wed, 23 Sep 2020 06:09:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKxyB-0003Gu-MX
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 06:09:36 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F30F20739;
 Wed, 23 Sep 2020 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600841374;
 bh=rjWKuYvC72TU64CYHQyAAX1xM5QOixLenvyV0KeM5yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fc7Cr1TWw1F2Gy7YQ+eg4Uql7gHXrzuWWK7Gmm1QnZl4nQc2qIxuRa5x17FtV//kK
 Gv7IlZwRiDUYRuyL5wbNG13Rd4FQfR+8pNAW2s/lLo1dKAIgcBsOSY1maq7fKr4ahl
 9NIfE+GlWzOJjeZRBvT8MLy1WsoerMqdur6RkwhA=
Date: Tue, 22 Sep 2020 23:09:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 4/5] fscrypt: Have filesystems handle their d_ops
Message-ID: <20200923060933.GE9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-5-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_020935_798081_83A30744 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 01:01:50AM +0000, Daniel Rosenberg wrote:
> This shifts the responsibility of setting up dentry operations from
> fscrypt to the individual filesystems, allowing them to have their own
> operations while still setting fscrypt's d_revalidate as appropriate.
> 
> Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> they have their own specific dentry operations as well. That operation
> will set the minimal d_ops required under the circumstances.
> 
> Since the fscrypt d_ops are set later on, we must set all d_ops there,
> since we cannot adjust those later on. This should not result in any
> change in behavior.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Looks good,

Reviewed-by: Eric Biggers <ebiggers@google.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
