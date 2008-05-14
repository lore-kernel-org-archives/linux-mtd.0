Received: from smtp-out3.atlngahp.sys.nuvox.net ([70.43.63.20]
	helo=smtp03.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwM5Y-0007oA-IR
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 18:52:32 +0000
Message-ID: <38698.137.237.242.42.1210791136.squirrel@webmail.nuvox.net>
In-Reply-To: <Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
References: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net>
	<Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
Date: Wed, 14 May 2008 14:52:16 -0400 (EDT)
Subject: Re: Porting to Intel P33 flash
From: jkimble@one.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: akorolev@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thank you very, very much! At least that gives me a place to start from
with my 2.6.10 kernel.

James

>
>
> There are two versions of P33 one has version of CFI 1.4 another version
> 1.5
>
> P33 with CFI 1.4 works Ok starting 2.6.17
> P33 with CFI 1.5 works Ok starting 2.6.24
>
> Since the difference between P33 with CFI 1.4 and P33 with CFI 1.5 are
> minor applying the following very simple patch:
> http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=b1c9c9be6da010510459aca93f5754efb19695ff
> should solve the problem for linux >= 2.6.17.
>
> Thanks,
> Alexey
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
