Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79047C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:34:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FCE214D8
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DvIfHzK2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU1pP6hg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FCE214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZY+lruuMZOQbB0Xl4APTbz0WmwHSfk7+ksTQKVXLktI=; b=DvIfHzK2/J3zpsUIffJHhXAHd
	jh2xXLP3kaOE22LlQe4z7ux/TZpWb8IiXvHh1xFlYXfIZhjKp68lOW+s56fJk/T1QSVMTkQC2NNap
	GU7Y7VSUhgWP2NXFEf5MfoyP3xIrrtvuyyp7cNJ5oAJ3twwEjO4KqNm0McXWGowu1MuSCitePE5nc
	SsIR5PK0bg5vUjHx8aWg5zWChC+tHWvk/AXONO6cmP//HwxlWexMDamQuDa8sk5Z+JMXXw+h9Kl+m
	konHmFh6CwGSSh0si6kYuMgujQcDC9zeprOtUggHx/IRgjMs9FVOtfyfC2nHG6oHZtH+Wry+hR6fd
	e/7RQrnjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIwqi-0003y3-IE; Thu, 17 Sep 2020 16:33:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIwqg-0003xZ-E3
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 16:33:31 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C27D2214D8;
 Thu, 17 Sep 2020 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600360408;
 bh=64guTUZ7EKPT2qpTc7D0yaFTflRcH4pcyFWo+xuAOGU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eU1pP6hgmXz25xyBg9bazb9fKAso0aXmNP2dVveMx2ztmBwOjVdBVik39B9/dsfyi
 l7B1BELQj4b0ud+U4UFntHF3lCMR/Rq5xrFwpLL3OBQuZckdLAshp7dwLe0wC59tkq
 GBid0tzn4y03cySN4r38Z/i9cVEe43zaJsX5UFUA=
Message-ID: <197468586b4a9b933755d2f9a462a234d654e280.camel@kernel.org>
Subject: Re: [PATCH v3 13/13] fscrypt: make
 fscrypt_set_test_dummy_encryption() take a 'const char *'
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 17 Sep 2020 12:33:26 -0400
In-Reply-To: <20200917152907.GB855@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200917041136.178600-14-ebiggers@kernel.org>
 <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
 <20200917152907.GB855@sol.localdomain>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_123330_543586_1327AE9A 
X-CRM114-Status: GOOD (  24.06  )
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-17 at 08:29 -0700, Eric Biggers wrote:
> On Thu, Sep 17, 2020 at 08:32:39AM -0400, Jeff Layton wrote:
> > On Wed, 2020-09-16 at 21:11 -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > fscrypt_set_test_dummy_encryption() requires that the optional argument
> > > to the test_dummy_encryption mount option be specified as a substring_t.
> > > That doesn't work well with filesystems that use the new mount API,
> > > since the new way of parsing mount options doesn't use substring_t.
> > > 
> > > Make it take the argument as a 'const char *' instead.
> > > 
> > > Instead of moving the match_strdup() into the callers in ext4 and f2fs,
> > > make them just use arg->from directly.  Since the pattern is
> > > "test_dummy_encryption=%s", the argument will be null-terminated.
> > > 
> > 
> > Are you sure about that? I thought the point of substring_t was to give
> > you a token from the string without null terminating it.
> > 
> > ISTM that when you just pass in ->from, you might end up with trailing
> > arguments in your string like this. e.g.:
> > 
> >     "v2,foo,bar,baz"
> > 
> > ...and then that might fail to match properly
> > in fscrypt_set_test_dummy_encryption.
> > 
> 
> Yes I'm sure, and I had also tested it.  The use of match_token() here is to
> parse one null-terminated mount option at a time.
> 
> The reason that match_token() can return multiple substrings is that the pattern
> might be something like "foo=%d:%d".
> 
> But here it's just "test_dummy_encryption=%s". "%s" matches until end-of-string.

Got it. Thanks for explaining!
-- 
Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
