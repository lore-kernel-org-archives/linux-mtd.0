Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JozMy-0006wO-Sd
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 11:12:05 +0000
Date: Thu, 24 Apr 2008 13:11:52 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
Message-ID: <20080424111152.GA25465@logfs.org>
References: <fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
	<1208964656.9212.811.camel@pmac.infradead.org>
	<fe810cf0804240017v7069d6fdx6e7d03459d7d5503@mail.gmail.com>
	<1209022137.9212.942.camel@pmac.infradead.org>
	<fe810cf0804240048w783fbdc0sa701fc7c59b3d06f@mail.gmail.com>
	<1209023484.9212.960.camel@pmac.infradead.org>
	<fe810cf0804240314w70364639nb2ba38cd10cd7b46@mail.gmail.com>
	<1209033162.9212.1031.camel@pmac.infradead.org>
	<fe810cf0804240342r35d0ecf8s9ee159a2980a83c3@mail.gmail.com>
	<1209035103.9212.1051.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1209035103.9212.1051.camel@pmac.infradead.org>
Cc: Alexander Belyakov <abelyako@mail.ru>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 24 April 2008 12:05:03 +0100, David Woodhouse wrote:
> On Thu, 2008-04-24 at 14:42 +0400, Alexander Belyakov wrote:
> > I was checking this on Sibley-like parts, not NAND. Sorry for
> > confusion.
> 
> Oh, so you have an inline cleanmarker? That makes sense. You'll lose
> c->cleanmarker_size from c->free_size for every block you erase.

And I believe that is rather large on sibley - 1024 bytes or so.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
