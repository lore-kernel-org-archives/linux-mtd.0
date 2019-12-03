Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26E9C432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 01:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C1B20684
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 01:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swwXItd2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xah07E77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C1B20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3zg+hjITaEW9Uvc/n12AZ5kOnu0t98ylItIeo+Pj+o=; b=swwXItd2g+TG8f
	UmKgi+5azRY1ros2erVPf60GQJyp7KbG18MOvpEjK8lQA0mJIip0yuq8PC0hno2fl9jjJFqqEcSom
	/fF9mEwS8R8gYR0B/v8ELIsmWwStBD8A3jFnlj1jpPtBy5AWhLSwYdEO/AFJSWNkpMljOsJpSTdsP
	F32PdgTIfbOa2Zlfg3hXnobnu81PQdF9b3x2aUgz1khth3P8r0tZoETOLCuDoDVJpoydbtgrxe6L/
	1mlGDZD594l5o/Fu1ns9TIRBF10gecms2qH8NHLWjVYFHsHX8MwkQB2jizO0Slel8GWJf1Zsv/ee5
	OUWq+UD8z7MXGRZADbzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibxMb-0002um-Fw; Tue, 03 Dec 2019 01:52:29 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibxMY-0002kN-G9
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 01:52:27 +0000
Received: by mail-io1-xd42.google.com with SMTP id s2so1782118iog.10
 for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2019 17:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=;
 b=Xah07E77EL/ykU6H/9fOr3zX6G7oIlWdMl7pW0DtOY4vE5v7mHQywBuRicQbOxpksI
 oVlMR+lFoPd7LKC19a9HB2/wy/+jDp1nqd76VCZFCXYDbcb0C0lFjdfWx07BFtI61NyQ
 ULUpd+qRbkc1lNFMKvsoL6LpvtelvqGIpA+TiKw+pssj6AYPYx8QilsR5BTdNjSgzXV4
 TzOcqVnnTq03A9VJMHGxKZI9llFscQefkxFMrIAIJ8purFDg+fn3Sgw7mITq1bI0VNc4
 ggGt0dKL3T+x/JX3njY7HBts2xJIycvxD925/sF8Btt8swkgBaabvykwCkAgzw+wuURe
 7mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=;
 b=Y9lV9XUBdu3PG7ms9ZCobxPQPu1AzER9N5ybUt0ay6i67QGc078repBLPTcktgRnWh
 bocPmuVqHVXmECSX3S1YH/QYAFr28nbxLfmvT5UDw85pGJ8+hwQHnYo331CegZR8Myv9
 D+t3bh1MHP0PjdUh5sFh0TDMeTJdDG20gb2WpvgcII726gX0XNY4dS1mQs3XN5/UFAxZ
 DIVAnWVYGv67kWze1YcVJZb6ghylinmxvLQCV9qQH4h5aWdrmU9Q1U90l84GSYNvh120
 HuPZc/shGcimUbYZ+O6HoRz7gn8h7Qu/l2XtC/ISs7BTmPhmwRaMmmKPt8HAMZjJ+pua
 Ykeg==
X-Gm-Message-State: APjAAAX0XoMFZl5wNWXSNroOqLjtYyeDLqeGEfmPjVxUNWuFvLEJyymw
 Ftjn/o7t/Zd4FfI+IVyEgJVbVDbO7+ojVvfKIYg=
X-Google-Smtp-Source: APXvYqz/HtSAKmFvtGA3vewcbEqy6GpkXcTpGWeY7zvzD8UPDmBHZYqWa5qgMjPw9AT+xjcV03w5DfEQU74871jze0c=
X-Received: by 2002:a02:a915:: with SMTP id n21mr3314772jam.117.1575337945183; 
 Mon, 02 Dec 2019 17:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20191129142045.7215-1-agruenba@redhat.com>
 <CAHk-=wj5caXKoukPyM7Zc6A0Q+E-pBGHSV64iZe8t98OerXR_w@mail.gmail.com>
In-Reply-To: <CAHk-=wj5caXKoukPyM7Zc6A0Q+E-pBGHSV64iZe8t98OerXR_w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 3 Dec 2019 02:52:13 +0100
Message-ID: <CAHpGcMLe2Qy=RdcyFPav5Rfto9M4S9VdsX6E=b3FEywtUNQdqg@mail.gmail.com>
Subject: Re: [PATCH v2] fs: Fix page_mkwrite off-by-one errors
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_175226_540397_BDEAD270 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ceph Development <ceph-devel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Di., 3. Dez. 2019 um 02:09 Uhr schrieb Linus Torvalds
<torvalds@linux-foundation.org>:
>
> On Fri, Nov 29, 2019 at 6:21 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > +/**
> > + * page_mkwrite_check_truncate - check if page was truncated
> > + * @page: the page to check
> > + * @inode: the inode to check the page against
> > + *
> > + * Returns the number of bytes in the page up to EOF,
> > + * or -EFAULT if the page was truncated.
> > + */
> > +static inline int page_mkwrite_check_truncate(struct page *page,
> > +                                             struct inode *inode)
> > +{
> > +       loff_t size = i_size_read(inode);
> > +       pgoff_t end_index = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>
> This special end_index calculation seems to be redundant.
>
> You later want "size >> PAGE_SHIFT" for another test, and that's
> actually the important part.
>
> The "+ PAGE_SIZE - 1" case is purely to handle the "AT the page
> boundary is special" case, but since you have to calculate
> "offset_in_page(size)" anyway, that's entirely redundant - the answer
> is part of that.
>
> So I think it would be better to write the logic as
>
>         loff_t size = i_size_read(inode);
>         pgoff_t index = size >> PAGE_SHIFT;
>         int offset = offset_in_page(size);
>
>         if (page->mapping != inode->i_mapping)
>                 return -EFAULT;
>
>         /* Page is wholly past the EOF page */
>         if (page->index > index)
>                 return -EFAULT;
>         /* page is wholly inside EOF */
>         if (page->index < index)
>                 return PAGE_SIZE;
>         /* bytes in a page? If 0, it's past EOF */
>         return offset ? offset : -PAGE_SIZE;
>
> instead. That avoids the unnecessary "round up" part, and simply uses
> the same EOF index for everything.

And if we rearrange things slightly, we end up with:

        /* page is wholly inside EOF */
        if (page->index < index)
                return PAGE_SIZE;
        /* page is wholly past EOF */
        if (page->index > index || !offset)
                return -EFAULT;
        /* page is partially inside EOF */
        return offset;

Thanks,
Andreas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
