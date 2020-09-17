Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91C9C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:29:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C7D222C2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1dEI7Tuo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLRXIPMU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C7D222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ube/jFXXziwIlHg9mMneTwwFlUPHxDGia4mZbuMw+bw=; b=1dEI7TuoA2z8a94wXV+2wStnY
	SmIoASJFDDLolkRrz5XyrUt57ZTAw9wiQ6s6vOuoyM19VkaviJbfb8c91vSPkKGVq5cLA9WTamCBk
	NRD6xozYRo2/Rk7wI9fBedpZkZpKOf3cVt+cgZhuYlffmZpmB3bfowDyTop8tR89f4IXd3HQ6jFmc
	YBzrnxNIig9aakbFySzJ0CNO/2syA2Ym0geYa0iRKxH2EOHOZnwOdD/eK0aecAaFsp/ZSi2nVKruW
	Ob9fW9dNwdIMsd1vL6d3/0NCAvPeSCRK4rzlboBUpGrkBMjxtbulDtgzWYsmdqi4gxsRblszebQqC
	c0hOJ6j1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvqR-0005Ez-US; Thu, 17 Sep 2020 15:29:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvqP-0005E3-P6
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 15:29:10 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9F632224A;
 Thu, 17 Sep 2020 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600356549;
 bh=dsrHqCpL2En5vdo8EKO9ihwbSqFxqTvchyF3EQmBx8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLRXIPMU+ebvvDik5sg9LeQLxfPqJ2VfS43CgFM7HSeOTANsZGnTFTJTgezDNSjOp
 JQbxMoBBOjqjx84cP7GtBdk6eGD1U5VV+fNacoBl4rBzEKoFw3oeRWyqZ36HmyXEdw
 DLqkCLEPIBXNzP2ARkC0eEXzCYDCBwGOA5LkiyJw=
Date: Thu, 17 Sep 2020 08:29:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 13/13] fscrypt: make
 fscrypt_set_test_dummy_encryption() take a 'const char *'
Message-ID: <20200917152907.GB855@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200917041136.178600-14-ebiggers@kernel.org>
 <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_112909_931014_1D66A727 
X-CRM114-Status: GOOD (  20.24  )
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

On Thu, Sep 17, 2020 at 08:32:39AM -0400, Jeff Layton wrote:
> On Wed, 2020-09-16 at 21:11 -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > fscrypt_set_test_dummy_encryption() requires that the optional argument
> > to the test_dummy_encryption mount option be specified as a substring_t.
> > That doesn't work well with filesystems that use the new mount API,
> > since the new way of parsing mount options doesn't use substring_t.
> > 
> > Make it take the argument as a 'const char *' instead.
> > 
> > Instead of moving the match_strdup() into the callers in ext4 and f2fs,
> > make them just use arg->from directly.  Since the pattern is
> > "test_dummy_encryption=%s", the argument will be null-terminated.
> > 
> 
> Are you sure about that? I thought the point of substring_t was to give
> you a token from the string without null terminating it.
> 
> ISTM that when you just pass in ->from, you might end up with trailing
> arguments in your string like this. e.g.:
> 
>     "v2,foo,bar,baz"
> 
> ...and then that might fail to match properly
> in fscrypt_set_test_dummy_encryption.
> 

Yes I'm sure, and I had also tested it.  The use of match_token() here is to
parse one null-terminated mount option at a time.

The reason that match_token() can return multiple substrings is that the pattern
might be something like "foo=%d:%d".

But here it's just "test_dummy_encryption=%s". "%s" matches until end-of-string.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
