Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuoU2-0008FZ-SJ
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 13:52:10 +0000
Date: Fri, 17 Apr 2009 14:51:49 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090417135149.GA7129@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<1239860798.3390.205.camel@localhost.localdomain>
	<20090416213400.GA10578@shareable.org>
	<1239958593.3390.293.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1239958593.3390.293.camel@localhost.localdomain>
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Jamie, thanks for feedback!

Thanks for the new sections in the UBI FAQ!
> Yeah...
> 
> >    That makes the range of parallel writes, and so
> >    corruption-on-power-loss, even larger than max(N * strip_size, N *
> >    block_size).  The range is as large as the whole write, if one chip
> >    is writing much faster than the others, so it cannot be represented
> >    by a small number.
> 
> Then I guess we should just introduce mtd->max_corruption ? This would
> mean maximum amount of bytes corruption may span in vase of power cuts?

With that name maybe whoever implements striping will remember think
about parallelism and limit it :-)

  /* Max size of corrupted block when a write command is interrupted
     by reset or power failure. */
  u32 max_write_corruption;

-- Jamie




> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
