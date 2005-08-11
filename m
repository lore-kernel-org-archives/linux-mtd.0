Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E3GnS-0001HP-Ds
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 13:24:57 -0400
Date: Thu, 11 Aug 2005 19:24:45 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050811172445.GA26820@wohnheim.fh-wedel.de>
References: <42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42FB68AE.6070805@inf.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 August 2005 17:03:10 +0200, Ferenc Havasi wrote:
> Jörn Engel wrote:
> 
> >Hmm.  Either way, I'm not happy yet.  What I'd like to see is a patch
> >containing three types of changes:
> > 
> >
> Here is our new patch: 
> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050811-v2.patch
> 
> We did all of the asked transformation - hopefully.

I'll take a closer look over the weekend - which happens to start in
about five minutes.  And just in case you'd get bored without
feedback, you still don't comply to the codingstyle.  Things like 
+	}
+	else {
should completely go away, not just where I complained before.

But it's getting better.  Good.

Jörn

-- 
Admonish your friends privately, but praise them openly.
-- Publilius Syrus 
