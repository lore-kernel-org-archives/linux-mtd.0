Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62602C7EE29
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y55S2yOY3Xpkx4O0M60BVsLloRefOrwp2uH5pAKgdVs=; b=gGEJ25e83n2KWN
	m6NM03rPmxNGSfZSGevT9iwyOu0c5HlluP5nw8tiJqXXFoVaGWRAwRcgh592ap/2u0/+L2opzISjG
	cxVAI/s5JuCsyaOr94AgRCFrpTfYqjj2NnJki9GVbMnAIYbg0LFnncqXmEE5Z1PJkdReXfwCFgWe5
	AoidglLRQ2EP/ot5zlDRJ9PXZYT3xkN9QPTsN0RG7+9jd/wXBWjHXZuEmnLQ9wqaHwBnOwHooAQ8l
	vOz59uEKVXmOjZ1XTPj+nEFI+B0LuJpw1EGwwYmGhX3MG1O2yomt197wsrayz++aoU8rqt/6V9/MR
	eLZjKV3tCgfFYyeWQv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vri-001edY-35;
	Tue, 06 Jun 2023 12:32:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vrh-001ed0-0C
	for linux-mtd@bombadil.infradead.org;
	Tue, 06 Jun 2023 12:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C7m4d9Qn99Rb7YO8T2udnXvOV6EByBtoiD76wfpbXFw=; b=RWzIu63wtcZwg5DWtIjKGKiNaY
	4kxG1H7pZ/xMq07nC7n6B8AQhjr0wTQa+uEN0GjOQAaAic8TXHOBxjHisJSCjNfbkD2iPVo1NegMi
	W43WDZe+pTkFPMeSKVLLsAMQebseUI0eyG/hfcRBqXB+CnxWJqLs00QCtASkeOQEfslgcQnp/yM++
	NL11d4TO0GtM46eOWH4p+LscJMHsn4TK591Egt+CkbJ6bfLeER00MHmP8jSGnYcIlo+cXrcZnBmab
	rnihlMN5tBto6p0ifXc+9trms8ItKlyO12423vO+JXjm14Ngslb2jOlqAyhGq7j8rtjaxyIoKQgU7
	beJ4zT+w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6Vrf-00D8au-BI; Tue, 06 Jun 2023 12:32:43 +0000
Date: Tue, 6 Jun 2023 13:32:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Message-ID: <ZH8na21G0W8kmY5r@casper.infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-5-willy@infradead.org>
 <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at>
 <ZH6mixCMHce1S+vK@casper.infradead.org>
 <406990820.3686390.1686032035024.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <406990820.3686390.1686032035024.JavaMail.zimbra@nod.at>
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

On Tue, Jun 06, 2023 at 08:13:55AM +0200, Richard Weinberger wrote:
> Matthew,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Matthew Wilcox" <willy@infradead.org>
> > len is folio_size(), which is not 0.
> > =

> >        len =3D offset_in_folio(folio, i_size);
> =

> offset_in_folio(folio, i_size) can give 0.

Oh!  There is a bug, because it shouldn't get here!

        /* Is the folio fully inside i_size? */
        if (folio_pos(folio) + len < i_size) {

should be:

        /* Is the folio fully inside i_size? */
        if (folio_pos(folio) + len <=3D i_size) {

right?  Consider a file with i_size 4096.  its single-page folio will
have a pos of 0 and a length of 4096.  so it should be written back by
the first call to do_writepage(), not the case where the folio straddles
i_size.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
