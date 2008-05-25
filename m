Received: from web36705.mail.mud.yahoo.com ([209.191.85.39])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K076l-0004KB-4M
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 03:41:19 +0000
Date: Sat, 24 May 2008 20:41:17 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080524175647.GA7366@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <346401.5675.qm@web36705.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jörn Engel <joern@logfs.org> wrote:

> On Sat, 24 May 2008 06:12:23 -0700, Alex Dubov wrote:
> > 
> > Do UBI and JFFS always operate in terms of whole eraseblocks or they may
> > attempt  partial block writes? Different flash chips have different
> > capabilities in regard to writing and this can be used to some advantage.
> 
> Writes happen in multiples of mtd->writesize.  Which for NAND is
> pagesize.  There are also special cases with subpage writes.  AFAIK only
> UBI exploits that feature.
> 

Most xd cards can only be written a whole PEB in a time (can be handled with
appropriate writesize, I suppose).

Memorystick cards can be written page at a time, but only in progressive
fashion - only if all pages at lower offsets to the current page were written
before. This can be made to work as a useful optimization.

Are there any special tricks with subpage writes or it all amounts to "read
block" -> "merge changes" -> "write block"?





      
