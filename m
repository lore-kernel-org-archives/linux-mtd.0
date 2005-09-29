Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvcC-0004lc-MI
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:28:08 -0400
Date: Thu, 29 Sep 2005 12:26:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050929102620.GE18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<20050929101247.GD18741@wohnheim.fh-wedel.de>
	<433BC021.7090409@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BC021.7090409@yandex.ru>
Cc: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 14:21:21 +0400, Artem B. Bityutskiy wrote:
> Jörn Engel wrote:
> >
> >Dummy argument.  Wear levelling is just a means to avoid the real
> >problem - early wear-out of specific blocks.  Spending one erase block
> >for cs is pretty sane, as long as this block doesn't wear-out well
> >before the rest.
> "As long as" is the essential part. If it is true - nice. In general 
> this can't be true. And, anticipating your remark, I agree that it still 
> may have its place. :-)

Agreed.  In general, this patch opens an option for a DoS attack.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
