Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B52C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881192073C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qExD1Uvk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+dAaERO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881192073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=963qpyYRoJZN1k+aZwy2ZkdYH9jyXIumFVMNrMQGfxg=; b=qExD1Uvkr7iMFc
	0SLjr0FCYFtX6a3nFz2h6Do4DyNifQ4dBSPgVolupClZrzfUfLZHE+YfqACMFP2cPxbI6N21qH3Jm
	EZcSm9VCHZ0JEGk11FDXkDwdiJzXDseO2rRnm79gStja8ovPyU4avchUUP2DMo9XWzLa8lHMQ+dEd
	ClCIjaM8/pRQ0ziVfosZt/Z8NbKvS7U1n2OQIAQiBTQ1IEk3IppS0zH3JRVAgMrT7jy7NLVrSJEGn
	fuW+gPTXC+L3x+5TyuneCBCOF0U6ybu/Y6Mbp1LX3XHmn58pIhYlawTujcn02+EjE2Fk5XBqiaUJP
	11zsSos+Pwh6sSGhBhTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1lxs-00081h-6V; Wed, 12 Feb 2020 06:57:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1lxo-00081N-Rx
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 06:57:38 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E34E22073C;
 Wed, 12 Feb 2020 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581490656;
 bh=19SiagyBycCgiJZF31FnbdIK3NQ4MFyvHwRPT//W9JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+dAaEROsZffCQMVY8G50cRWmHjM/wRDc/9JlSSWDsBr6/IAgHBKtnX222ZTx5Q2Q
 H77nJ9ax+MWcXCxYZ+7U/B4M3oavH5FuxwsoOg4BTYZI36prcxXHdxlvNgfXkOy/lv
 avaF1djrLaSPyjJTb1dEC5HGal0mzJPA5odqCW9M=
Date: Tue, 11 Feb 2020 22:57:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v7 2/8] fs: Add standard casefolding support
Message-ID: <20200212065734.GA157327@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk>
 <20200212063440.GL870@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212063440.GL870@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_225736_945810_D82EB58F 
X-CRM114-Status: GOOD (  26.07  )
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

On Tue, Feb 11, 2020 at 10:34:40PM -0800, Eric Biggers wrote:
> On Mon, Feb 10, 2020 at 11:42:07PM +0000, Al Viro wrote:
> > On Mon, Feb 10, 2020 at 03:11:13PM -0800, Daniel Rosenberg wrote:
> > > On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > > >
> > > > On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> > > >
> > > >
> > > > Again, is that safe in case when the contents of the string str points to
> > > > keeps changing under you?
> > > 
> > > I'm not sure what you mean. I thought it was safe to use the str and
> > > len passed into d_compare. Even if it gets changed under RCU
> > > conditions I thought there was some code to ensure that the name/len
> > > pair passed in is consistent, and any other inconsistencies would get
> > > caught by d_seq later. Are there unsafe code paths that can follow?
> > 
> > If you ever fetch the same byte twice, you might see different values.
> > You need a fairly careful use of READ_ONCE() or equivalents to make
> > sure that you don't get screwed over by that.
> > 
> > Sure, ->d_seq mismatch will throw the result out, but you need to make
> > sure you won't oops/step on uninitialized memory/etc. in process.
> > 
> > It's not impossible to get right, but it's not trivial and you need all
> > code working with that much more careful than normal for string handling.
> 
> It looks like this is a real problem, not just a "theoretical" data race.
> For example, see:
> 
> utf8ncursor():
>         /* The first byte of s may not be an utf8 continuation. */
>         if (len > 0 && (*s & 0xC0) == 0x80)
>                 return -1;
> 
> and then utf8byte():
>                 } else if ((*u8c->s & 0xC0) == 0x80) {
>                         /* This is a continuation of the current character. */
>                         if (!u8c->p)
>                                 u8c->len--;
>                         return (unsigned char)*u8c->s++;
> 
> The first byte of the string is checked in two different functions, so it's very
> likely to be loaded twice.  In between, it could change from a non-continuation
> byte to a continuation byte.  That would cause the string length to be
> decremented from 0 to UINT_MAX.  Then utf8_strncasecmp() would run beyond the
> bounds of the string until something happened to mismatch.
> 
> That's just an example that I found right away; there are probably more.
> 
> IMO, this needs to be fixed before anyone can actually use the ext4 and f2fs
> casefolding stuff.
> 
> I don't know the best solution.  One option is to fix fs/unicode/ to handle
> concurrently modified strings.  Another could be to see what it would take to
> serialize lookups and renames for casefolded directories...
> 

Or (just throwing another idea out there) the dentry's name could be copied to a
temporary buffer in ->d_compare().  The simplest version would be:

	u8 _name[NAME_MAX];

	memcpy(_name, name, len);
	name = _name;

Though, 255 bytes is a bit large for a stack buffer (so for long names it may
need kmalloc with GFP_ATOMIC), and technically it would need a special version
of memcpy() to be guaranteed safe from compiler optimizations (though I expect
this would work in practice).

Alternatively, take_dentry_name_snapshot() kind of does this already, except
that it takes a dentry and not a (name, len) pair.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
