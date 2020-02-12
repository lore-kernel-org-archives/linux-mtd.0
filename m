Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E3C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AF72082F
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOv0YkAL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4g4lNmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25AF72082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2W5QBh4ClrtaTGsMlHXxTZazlOprSrXTi2zRcNSZjM=; b=SOv0YkALKmGizg
	/xzPpDhSep27+4Qmbxxgyr6NxWXTXzKu/A/1vgKOZH5gsUQ+JK1lmfl+PkOPWqOAXrvMvZ8w0cAM6
	VVXtlNRMELGYlBgm5WWZOHinuiJKPPMu6O+T8Sz/meJiGrREUsUvBWVYtSS9TG65yJtVfSl12ePc+
	AjeUS30ura9g5/oeWHT5h7PXw4YJ6v76cSa0mUBX7DQlEcGh4T+EflBrsk6C0/WIzs6Ejky+TDKWR
	Z8QG9nArjxANVjf2Bai700O9ZLV/4QwPYvTsR2EUL9pDVCuY4bPRdoKJ0xQx8vC3RCnATo8/u2l1M
	B1r6340MFv2HmYC2JyeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1lbi-0008OT-QE; Wed, 12 Feb 2020 06:34:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1lbf-0008O0-87
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 06:34:44 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53335206DB;
 Wed, 12 Feb 2020 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581489282;
 bh=CzRudUeDo+wVwa7/TNw7sOyO0DwUDMqITe6/PlMG8AQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4g4lNmp0zgUEvD5Jg1HZ/pSYEOYUwWzEbd72XucSsanE7PW6E7KaMoizocCC9c/t
 fLsIxOWqbCUmHAYQrB/RRoUcW3yXF6qgwvTwkbZNe8+cBgUnJcRi5dGGEeKdxlXsX9
 ZfevMBE0eHrc3SnIROac5ZH1k6H9MTGLrsW4OB+M=
Date: Tue, 11 Feb 2020 22:34:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v7 2/8] fs: Add standard casefolding support
Message-ID: <20200212063440.GL870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210234207.GJ23230@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_223443_331890_D53A989E 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Daniel Rosenberg <drosen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chao Yu <chao@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2020 at 11:42:07PM +0000, Al Viro wrote:
> On Mon, Feb 10, 2020 at 03:11:13PM -0800, Daniel Rosenberg wrote:
> > On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> > >
> > >
> > > Again, is that safe in case when the contents of the string str points to
> > > keeps changing under you?
> > 
> > I'm not sure what you mean. I thought it was safe to use the str and
> > len passed into d_compare. Even if it gets changed under RCU
> > conditions I thought there was some code to ensure that the name/len
> > pair passed in is consistent, and any other inconsistencies would get
> > caught by d_seq later. Are there unsafe code paths that can follow?
> 
> If you ever fetch the same byte twice, you might see different values.
> You need a fairly careful use of READ_ONCE() or equivalents to make
> sure that you don't get screwed over by that.
> 
> Sure, ->d_seq mismatch will throw the result out, but you need to make
> sure you won't oops/step on uninitialized memory/etc. in process.
> 
> It's not impossible to get right, but it's not trivial and you need all
> code working with that much more careful than normal for string handling.

It looks like this is a real problem, not just a "theoretical" data race.
For example, see:

utf8ncursor():
        /* The first byte of s may not be an utf8 continuation. */
        if (len > 0 && (*s & 0xC0) == 0x80)
                return -1;

and then utf8byte():
                } else if ((*u8c->s & 0xC0) == 0x80) {
                        /* This is a continuation of the current character. */
                        if (!u8c->p)
                                u8c->len--;
                        return (unsigned char)*u8c->s++;

The first byte of the string is checked in two different functions, so it's very
likely to be loaded twice.  In between, it could change from a non-continuation
byte to a continuation byte.  That would cause the string length to be
decremented from 0 to UINT_MAX.  Then utf8_strncasecmp() would run beyond the
bounds of the string until something happened to mismatch.

That's just an example that I found right away; there are probably more.

IMO, this needs to be fixed before anyone can actually use the ext4 and f2fs
casefolding stuff.

I don't know the best solution.  One option is to fix fs/unicode/ to handle
concurrently modified strings.  Another could be to see what it would take to
serialize lookups and renames for casefolded directories...

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
