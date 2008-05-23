Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzQAS-0006df-TS
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 05:50:17 +0000
Date: Fri, 23 May 2008 07:50:06 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080523055005.GA20264@logfs.org>
References: <20080522151051.GA15015@logfs.org>
	<323976.43299.qm@web36707.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <323976.43299.qm@web36707.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 May 2008 19:47:02 -0700, Alex Dubov wrote:
> 
> > 
> > But nothing below the FTL should ever know about a logical block at all.
> > Why pass it on?
> 
> Media class specific backend must know it, to populate media's oob structure.
> TI's smartmedia adapter, for example, wants to know it itself (it has a
> hardware register for it).

Interesting.  Do you have a spec for that?

I would have expected two kinds of controllers.  "Smart" ones that
essentially export a block device interface and do all FTL work
themselves and dumb ones that allow raw flash access and require and FTL
in software.  Didn't know there were mixtures of the two.

> > We can replace the data pointer with a struct bio_vec.  In fact, I am
> > wondering whether we could just use a struct bio instead of struct
> > mtd_request.
> > 
> 
> Passing the whole struct bio is an overshoot for what we want to support. It
> has plenty of functionality that to my opinion would never be supported by dumb
> flash controllers.

After having a closer look at it I tend to agree.  Nevertheless there
are tons of similarities between block devices and mtd and I would like
them to become as similar as reasonably possible.  So right now I'd
create a struct fio (flash io) and copy any fields that make sense for
both from struct bio. 

> I thought, something simple would be enough, as long as it can handle buffer
> fragmentation and give the backend access to the actual struct page for mapping
> operation. It doesn't matter if this is a scatterlist or bio_vec (they are
> mostly the same). What's matter is an ability to obtain several chunks of the
> buffer in some not too obtrusive way.
> 
> Host controller will get a buffer chunk, and set up a dma into it. When it
> catches dma boundary event, it'll get another chunk, while still in the
> interrupt handler (as much as needed). If controller happens to have a real sg
> dma, it can call mtd_get_buf_sg several times in advance to populate the sg
> table.
> 
> Controllers lacking dma capability can do exactly the same using mtd_get_buf.

Makes sense.  And one hopes that most controllers don't require busy
waits and either send an interrupt or allow setting a timer as a poor
man's interrupt.

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
