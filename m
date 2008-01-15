Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEm40-0007re-AQ
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 13:42:48 +0000
Date: Tue, 15 Jan 2008 14:33:50 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
Message-ID: <20080115133350.GA22338@lazybastard.org>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 15:24:03 +0300, Alexander Belyakov wrote:
> On Jan 14, 2008 4:28 PM, Jörn Engel <joern@logfs.org> wrote:
> >
> > If it makes a difference whether the block is erasable or erase_pending,
> > we have a bug.  And that bug wants a fix, not a paper bandaid.
> >
> 
> I've posted this bug details almost half year ago.
> http://lists.infradead.org/pipermail/linux-mtd/2007-June/018756.html
> 
> I do agree with your objection. If you have perfect patch ideas please
> let me know.

Right now the important thing is to dig deeper and understand the nature
of this bug.  You can reproduce it, that is good.  We also know that it
makes a difference whether the block is on one list or the other.  But
we don't know yet, what difference exactly it makes.  That should be the
next step.

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
