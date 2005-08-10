Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2npE-0002xC-A6
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 06:28:47 -0400
Date: Wed, 10 Aug 2005 12:28:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20050810102854.GB18149@wohnheim.fh-wedel.de>
References: <42F9BA34.6090008@prie.de>
	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de> <42F9C28D.4070206@yandex.ru>
	<42F9C4AF.6030505@prie.de> <42F9C612.2050301@yandex.ru>
	<42F9C980.7030301@prie.de>
	<20050810100557.GA18149@wohnheim.fh-wedel.de>
	<42F9D377.8090700@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42F9D377.8090700@imc-berlin.de>
Cc: Bernhard Priewasser <bernhard@prie.de>, linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 August 2005 12:14:15 +0200, Steven Scholz wrote:
> 
> >The name "JFFS3" ist confusing...
> >
> >JFFS has a strictly log-structured design.  JFFS2 is still
> >log-structured,
> 
> log-structured == journaling ?

Not really, but opinions differ on this subject.

A journal is basically the same as a log.  But a journaled fs has the
journal/log _in addition_ to some other data layout.  A log-structured
fs _only_ has the journal/log.

JFFS2 is log-structured and the name is a bug, imo.  My personal
implementation of a JFFS2 successor is called LOGFS, btw.  It makes
perfect sence, since LOGFS is just as log-structured as JFFS2 is
journaled - not at all. ;)

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
