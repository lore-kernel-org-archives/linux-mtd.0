Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7UyV-0003Kv-Rk
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2004 04:17:14 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Wed, 15 Sep 2004 10:16:54 +0200
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<1095190893.5442.35.camel@tubarao>
In-Reply-To: <1095190893.5442.35.camel@tubarao>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200409151016.54931.gruber.m@utanet.at>
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 14. September 2004 21:41 schrieb Thayne Harbaugh:
> On Thu, 2004-08-26 at 15:11 +0200, Jochen Karrer wrote:
> > Hi,
> > jffs2 did not work in linux-2.6.8.1 because single word writes at the end
> > of a buffer write are done with the wrong address:
> >
> > ---
> > /home/jkarrer/kernel/linux-2.6.8.1/drivers/mtd/chips/cfi_cmdset_0002.c
> > Sat Aug 14 12:55:20 2004
> > +++ cfi_cmdset_0002.c	Thu Aug 26 14:33:42 2004
> > @@ -1128,7 +1128,7 @@
> >  	if (len) {
> >  		size_t retlen_dregs = 0;
> >
> > -		ret = cfi_amdstd_write_words(mtd, to, len, &retlen_dregs, buf);
> > +		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
> > len, &retlen_dregs, buf);
> >
> >  		*retlen += retlen_dregs;
> >  		return ret;
>
> I never saw that this patch was committed.  I didn't do anything with it
> because I'm not so familiar with that piece in cfi_cmdset_0002.c (and am
> too lazy to read the function).  I did notice that Steven Scholz
> confirmed that it fixed problems he was seeing.
>
> Anyone else that cares should comment now or I'll commit it so that it
> doesn't get forgotten.

At my point this patch works good for my AMD flash, i dont get timeouts now.

Hope it helps regards manfred
