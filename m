Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTcnZ-0002GO-5p
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2008 12:51:13 +0000
Date: Mon, 25 Feb 2008 13:50:26 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
Message-ID: <20080225125026.GA12429@lazybastard.org>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ I have already written a reply, but somehow that got lost.  Sorry
about the delay. ]

On Fri, 18 January 2008 19:28:08 +0300, Alexander Belyakov wrote:
> On 1/15/08, Jörn Engel <joern@logfs.org> wrote:
> >
> > Right now the important thing is to dig deeper and understand the nature
> > of this bug.  You can reproduce it, that is good.  We also know that it
> > makes a difference whether the block is on one list or the other.  But
> > we don't know yet, what difference exactly it makes.
> 
> Question. What is success criteria for jffs2_garbage_collect_pass() execution?
> 
> Why asking? In the case described above jffs2_find_gc_block() fails to
> find erase block for garbage collection but falling into
> jffs2_flush_wbuf_pad(c) which produces amount of erasing blocks. So
> jffs2_garbage_collect_pass() sees no single block for garbage
> collection, but filesystem still recieves fresh erasing blocks upon
> execution.
> 
> Is it success or failure? Theoretically.

Maybe the best answer to this is in jffs2_do_reserve_space:
        /* this needs a little more thought (true <tglx> :)) */

The exit criterium of jffs2_do_reserve_space() should be one of a)
enough free space was found or b) there is not enough free space.  If
the function returns with b) while there actually is more space to be
freed by calling jffs2_flush_wbuf_pad(), that is a bug.

Is this the case?  If it is, there should be blocks on the
erasable_pending_wbuf_list.  And that case is handled (correctly at
first glance) in jffs2_find_nextblock.

That is about as much digging as I will do.  My personal interest is
more in replacing JFFS2 than hunting arcane bugs in it. ;)

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
