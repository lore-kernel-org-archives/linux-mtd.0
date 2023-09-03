Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA86C83F2D
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Sep 2023 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6TZsXsnHLOviHeLJdYkHlRveBL2BmXAbUuY/jQY7Rs=; b=OGMlpgdf2wa+Tt
	k/1V9wbqR+upGNHBu5hwve+BeTu+xfnY37vAhfZJ3ZzSQO7Ngu++/AMLd/UugGLIStJRLKFWFw6Ox
	VsqRbhtnUJP1wNCih1FoB4b1yqgl15L6ZpCZqbtmmZ6RQ2eMz8Y9s9oUsNBdkCGPaf6cOOwmgA0pe
	jlOUVlknTqNul08xweMz5CXnwFq1laszMYV7QZqagWPNab3NRsJjqA//rfedLykPF62DuMdCBPpfu
	D2yFRWZ8Lh+pLxVBffXdBHTCdGNDlKdDZEvhVEYIsJM0l/SrymY+6xJa/OedZrMp+w8oya0Ns4Kh/
	s1Qx4+9AdWNOLAGDxlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcvcR-002yeQ-2g;
	Sun, 03 Sep 2023 22:30:59 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcvcO-002yd5-2u
	for linux-mtd@lists.infradead.org;
	Sun, 03 Sep 2023 22:30:58 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1cc87405650so783576fac.2
        for <linux-mtd@lists.infradead.org>; Sun, 03 Sep 2023 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693780255; x=1694385055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=;
        b=0+DZoLs9c5+qE4vLVl7zitinAjxl0NNHFVUeDeIu23jS2sTICFMRCh/PzAHecwUQTb
         2cg5mxNWb9XxoiI/CX2r8XY+uMeVcNz/vg7t8MyolseoL3Mg1mXctLKbxjHwnMJgckVy
         6mszj8v9+NPg1wCYNXnv/kg81jLZGJtcrhk4ZcUP1ksjRNasSsGZ4/FNxSlTwZ8OutM9
         CG3O3j7BE000ObFFMfXLIMfNaiOlDpWBIj9tg1vvxxiRMK3lihbQdnbD7ov50FzrPgSO
         6wFaYxeKOl7NSWkZe29N5U/KTGo5mHu3U4I37oFi6qKAc7G7J5ySCFNk/vdn7BciavXU
         GibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693780255; x=1694385055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=;
        b=AwFelz45Ner8Dxe9U42Sc43uQ7lBVL1nq+hn8ij7nVLqjTb6hQFFDpYrXNVAZ5jFhR
         TV3Hi+ZyHaIwZy5IhsdmpQxxhUdDcG5ekNGyOOCeSoSecDvMHXsqh4Uuf2GCpgLxJkJS
         Y+OytGWF+kZvAxKMC3NwGOfS8fQi0p7xsJs4heAA5RE9FGnZKgtC1cPFacnjbtOr6UtB
         AL8LQsZLqOJ95EUwbxaUfJjmtSlE3o//RxqcFS0FxSV25t9zKTyUrShQP+4GgDUmI7Q8
         S4pzbIsGZYdS6pAwo4RatHjNxIUUCxHp/LslSuXY7NlCfUE0QJ47O6mWEE+Tf/1SVO5z
         kmJw==
X-Gm-Message-State: AOJu0YwgVQAk71z57qs9Q3TyYfS2MnjDTQVehOWDvejBqPzUAm0vYMx3
	UfEJthaUUyUImfCVC1/8Gs14tQ==
X-Google-Smtp-Source: AGHT+IGLu9Ypqvz2HQH6Ke2apJHDtGTD5ZHmV6+9u1MT+8XuCmbNG2jkA6AQg79Zc5mY+kWQOWShIA==
X-Received: by 2002:a05:6870:568d:b0:1be:c8e2:3ec3 with SMTP id p13-20020a056870568d00b001bec8e23ec3mr11536784oao.14.1693780255066;
        Sun, 03 Sep 2023 15:30:55 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b00565e96d9874sm5648132pgo.89.2023.09.03.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 15:30:54 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qcvcK-00ASFy-0F;
	Mon, 04 Sep 2023 08:30:52 +1000
Date: Mon, 4 Sep 2023 08:30:52 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Message-ID: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_153056_942029_4FE67043 
X-CRM114-Status: GOOD (  26.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
> On 8/29/23 19:53, Matthew Wilcox wrote:
> > On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> > > On 8/28/23 05:32, Matthew Wilcox wrote:
> > > > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > > > From: Hao Xu <howeyxu@tencent.com>
> > > > > 
> > > > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > > > Currently it is true only with io_uring as its initial caller.
> > > > 
> > > > So why do we need to do this as part of this series?  Apparently it
> > > > hasn't caused any problems for filemap_read().
> > > > 
> > > 
> > > We need this parameter to indicate if nowait semantics should be enforced in
> > > touch_atime(), There are locks and maybe IOs in it.
> > 
> > That's not my point.  We currently call file_accessed() and
> > touch_atime() for nowait reads and nowait writes.  You haven't done
> > anything to fix those.
> > 
> > I suspect you can trim this patchset down significantly by avoiding
> > fixing the file_accessed() problem.  And then come back with a later
> > patchset that fixes it for all nowait i/o.  Or do a separate prep series
> 
> I'm ok to do that.
> 
> > first that fixes it for the existing nowait users, and then a second
> > series to do all the directory stuff.
> > 
> > I'd do the first thing.  Just ignore the problem.  Directory atime
> > updates cause I/O so rarely that you can afford to ignore it.  Almost
> > everyone uses relatime or nodiratime.
> 
> Hi Matthew,
> The previous discussion shows this does cause issues in real
> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
> 

Then separate it out into it's own patch set so we can have a
discussion on the merits of requiring using noatime, relatime or
lazytime for really latency sensitive IO applications. Changing code
is not always the right solution...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
