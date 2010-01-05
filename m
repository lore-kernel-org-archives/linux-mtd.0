Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NS4vI-0003Lt-Tr
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 08:37:57 +0000
Received: by ewy21 with SMTP id 21so8456111ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jan 2010 00:37:50 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: New mtd-utils release?
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<874ontso69.fsf@macbook.be.48ers.dk>
	<1262590935.4512.3.camel@localhost>
	<20100104212543.GO17262@pengutronix.de>
	<1262672489.4512.46.camel@localhost>
Date: Tue, 05 Jan 2010 09:37:46 +0100
In-Reply-To: <1262672489.4512.46.camel@localhost> (Artem Bityutskiy's message
	of "Tue, 05 Jan 2010 08:21:29 +0200")
Message-ID: <87pr5plzfp.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dwmw2@infradead.org, Robert Schwebel <r.schwebel@pengutronix.de>,
	linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

 >> Could you upload a tarball into ftp://ftp.infradead.org/pub/mtd-utils/?
 >> It would make the life of the distribution people easier.

 Artem> No sorry, I do not have access there, and I also think distributions can
 Artem> easily fetch from git trees, which is not a problem at all.

Who does, David?

I DO think normal tarballs is a lot nicer than a tag somewhere in
$VCS. For meta distributions like ptxdist, OE or buildroot tarballs are
easier to use and mirror, and if nothing else it stops people from
missing the new release when they browse
ftp://ftp.infradead.org/pub/mtd-utils/.

-- 
Bye, Peter Korsgaard
