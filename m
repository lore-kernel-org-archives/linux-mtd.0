Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcRQ8-0001HK-7g
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 11:45:37 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay02.plus.net with esmtp (Exim) id 1CcRQ2-0006Tt-MU
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 16:45:30 +0000
Received: from squizzey.bult.co.uk (squizzey.bult.co.uk [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id CD03E1D32C4
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Dec 2004 17:54:59 +0000 (GMT)
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <41B8534E.7090105@yandex.ru>
References: <1102598324.21453.20.camel@squizzey.bult.co.uk>
	<41B8534E.7090105@yandex.ru>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 16:45:48 +0000
Message-Id: <1102610748.23214.0.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: problems with "JFFS2 write speed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Urm, no I wanted compression ... but a 2.4G celeron should be able to do
> 29k/sec !

Using priority ..

Q: I have an erasesize of 128k (and consequently a sector size of 128k)
because the memory in question is 256Mb.
(JFFS2 modifies sizes to fit within a malloc [fs.c])

Could this be the problem ?

tia
Gareth.

On Thu, 2004-12-09 at 16:29 +0300, Artem B. Bityuckiy wrote: 
> Did you try disable compression? Which compression mode do you use 
> (size, priority) ?
> 
> Gareth Bult (Encryptec) wrote:
> > Hi,
> > 
> > I'm using JFFS2 on a USB key. (using mtdblock)
> > 
> > Works well, read speed is blinding ..
> > 
> > If I use ext2, the write speed is measured in Mb/sec ..
> > Using jffs2 it's 29k / sec ..
> > 
> > Running Linux 2.6.9 ..
> > 
> > Anyone got any ideas re; speedups ?
> > 
> > tia
> > Gareth.
> > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
