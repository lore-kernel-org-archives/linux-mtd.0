Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDrF2-0003O8-IL
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 18:21:12 -0400
Date: Sat, 10 Sep 2005 00:20:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050909222040.GA5358@wohnheim.fh-wedel.de>
References: <43008129.2060303@inf.u-szeged.hu> <43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
	<4301A259.3090304@yandex.ru>
	<1126186364.28995.10.camel@hades.cambridge.redhat.com>
	<43203E13.3080204@yandex.ru>
	<20050908184326.GE20668@wohnheim.fh-wedel.de>
	<1126270658.4491.8.camel@windu.rchland.ibm.com>
	<4321894C.8050809@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4321894C.8050809@yandex.ru>
Cc: zhao_fusheng@hotmail.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 September 2005 17:08:28 +0400, Artem B. Bityuckiy wrote:
> Josh Boyer wrote:
> >
> >In any case, would you please bump the overall version of JFFS2 if this
> >change is made?  I don't mean "JFFS3", I mean "JFFS2 version 2.3" or
> >similar.  See super.c line 320 for where I'm talking about.
> Agree, this should be done. I also offered to introduce a version number 
> byte to the erasebloch header. This is somewhat ugly but will help to 
> quickly recognize the JFFS2 image version. In future this will help us.

All right, you win.  Can you bump the version to 2.3?

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
