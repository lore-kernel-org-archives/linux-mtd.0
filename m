Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195T4u-0001bV-Az
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 17:14:36 +0100
Date: Tue, 15 Apr 2003 18:14:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jasmine Strong <jasmine@regolith.co.uk>
Message-ID: <20030415161442.GF7721@wohnheim.fh-wedel.de>
References: <20030415153934.GD7721@wohnheim.fh-wedel.de>
	<F3B9D6B6-6F5C-11D7-B468-000393AD6294@regolith.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3B9D6B6-6F5C-11D7-B468-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: Esben Nielsen <esn@cotas.dk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 April 2003 17:11:44 +0100, Jasmine Strong wrote:
> On Tuesday, Apr 15, 2003, at 16:39 Europe/London, Jörn Engel wrote:
> >
> >On NOR, there is absolutely no point in avoiding many writes.
> 
> Unless it would cause many erases, which would slow things down a lot...
> If data integrity is the crucial issue (which it usually is) there's no 
> way to avoid
> this, though.

Erases get triggered by garbage collection, which depends on the
amount of data written, not the chunk size.

> The only other issue I can foresee is the overhead of the jffs 
> structures at the
> start of each write;  if there are only a few bytes being written each 
> time, it
> quickly becomes very significant.

Correct. iirc, node header was 70 Bytes, so writes below 700 Bytes
will have significant overhead (10% in my book). Point taken.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
