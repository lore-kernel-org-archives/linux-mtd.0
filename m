Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDiSD-0005nw-86
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 08:58:17 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j89Cw3AG028722
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:58:03 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j89Cw3P3091934
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:58:03 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j89CvohZ020729
	for <linux-mtd@lists.infradead.org>; Fri, 9 Sep 2005 08:57:50 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050908184326.GE20668@wohnheim.fh-wedel.de>
References: <42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru>
	<43008129.2060303@inf.u-szeged.hu> <43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
	<4301A259.3090304@yandex.ru>
	<1126186364.28995.10.camel@hades.cambridge.redhat.com>
	<43203E13.3080204@yandex.ru>
	<20050908184326.GE20668@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 09 Sep 2005 07:57:38 -0500
Message-Id: <1126270658.4491.8.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, zhao_fusheng@hotmail.com,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-08 at 20:43 +0200, Jörn Engel wrote:
> On Thu, 8 September 2005 17:35:15 +0400, Artem B. Bityuckiy wrote:
> > David Woodhouse wrote:
> >
> > >Should it? I wonder if it should silently upgrade, instead? Or at least
> > >have a mount option to make it upgrade? We want to leave the old format
> > >behind...
> >
> > That would be spiffy to leave it behind and save a lot efforts.
> > But in this case new JFFS2 binaries will reject mounting old JFFS2 images.
> > If this is accaptable - fine. Personally I don't care, but people may.
> > :-)
> 
> Current strategy is to push the effort to the user.  Not perfect, but
> it is necessary to inform the users about the problem anyway.
> 
> What we could additionally do is detect nodes that span several erase
> blocks.  Whenever such a thing comes up, refuse the mount and error
> out.

In any case, would you please bump the overall version of JFFS2 if this
change is made?  I don't mean "JFFS3", I mean "JFFS2 version 2.3" or
similar.  See super.c line 320 for where I'm talking about.

That will at least give the users some indication that things have
changed.  Or rather, it will give the JFFS2 developers a hint when users
report problems and they can use a canned response in the FAQ ;).

josh
