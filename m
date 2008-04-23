Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
	<1208882833.9212.629.camel@pmac.infradead.org>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 12:32:30 +0100
Message-Id: <1208950350.9212.791.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 15:31 +0400, Alexander Belyakov wrote:
> On Tue, Apr 22, 2008 at 8:47 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > On Fri, 2008-01-18 at 19:28 +0300, Alexander Belyakov wrote:
> >  >
> >  > Question. What is success criteria for jffs2_garbage_collect_pass() execution?
> >  >
> >
> >  It depends. There are two callers of jffs2_garbage_collect_pass().
> >
> >  For jffs2_flush_wbuf_gc() it's not progress, so it should be handled
> >  like failure.
> >
> >  For jffs2_reserve_space(), we can treat it as success... or we can have
> >  a special case which calls jffs2_erase_pending_blocks() right away to
> >  wait for the block to erase.
> >
> >  How about this... does it solve the problem for you?
> >
> 
> I like this special case for jffs2_reserve_space(). It solves the problem.

I'm playing with it now, with the intent of committing it. Can you show
me how to reproduce the problem?

-- 
dwmw2
