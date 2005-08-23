Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7aDY-0002yA-Rh
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 10:57:39 -0400
Date: Tue, 23 Aug 2005 16:57:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <priewasser@gmail.com>
Message-ID: <20050823145720.GB2398@wohnheim.fh-wedel.de>
References: <43098213.1020807@prie.de> <43099109.3050609@inf.u-szeged.hu>
	<430993B1.5010502@yandex.ru>
	<20050822094433.GA10958@wohnheim.fh-wedel.de>
	<430B3706.7080208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430B3706.7080208@gmail.com>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 August 2005 16:47:34 +0200, Bernhard Priewasser wrote:
> 
> > I did that for ramtd.  Allocate an array of pointers and then lazily
> > allocate memory for those pointers.
> 
> Did anyone do something similar for mtdram too?
> I tried it quick & dirty, but didn't work :-) If there's a solution for 
> mtdram I would be grateful, otherwise I had to try further. 
> mtdram's/vmalloc()'s total size limit indeed is rather low for extensive 
> testing.

Ramtd was supposed to replace mtdram.  There were the usual problems
with parameter parsing, and writing a new one was easier than fixing
the old.

Jörn

-- 
He who knows that enough is enough will always have enough.
-- Lao Tsu
