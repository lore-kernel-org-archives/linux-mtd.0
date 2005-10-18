Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES0sf-0002go-Ia
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 19:28:32 -0400
Date: Wed, 19 Oct 2005 01:28:21 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Message-ID: <20051018232821.GB20236@wohnheim.fh-wedel.de>
References: <b1c6420f0510142011i28bee950s3827e341452430ba@mail.gmail.com>
	<200510180901.03326.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200510180901.03326.hs4233@mail.mn-solutions.de>
Cc: linux-mtd@lists.infradead.org, Suzuki Takashi <suzuki.takashi@gmail.com>
Subject: Re: [PATCH 1/4] util/jffs2reader compile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 October 2005 09:01:03 +0200, Holger Schurig wrote:
> 
> > Index: Makefile
> > ===================================================================
> > RCS file: /home/cvs/mtd/util/Makefile,v
> > retrieving revision 1.59
> > diff -u -p -r1.59 Makefile
> > --- Makefile	7 Sep 2005 08:34:57 -0000	1.59
> > +++ Makefile	10 Oct 2005 07:31:58 -0000
> > @@ -16,7 +16,7 @@ TARGETS = ftl_format flash_erase flash_e
> >  	jffs2dump \
> >  	nftldump nftl_format docfdisk \
> 
> You did not attach your patch, but put it inline into your e-mail. So you 
> cannot do "Save Attachment", which would do all the de-MIME-ification. If I 
> save the whole e-mail, I get this output:
> 
> Index: Makefile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Same here.  Suzuki-san, can you resend either as an attachment or
preferrably inline without any damages done by the mailer - be it
whitespace corruption, mime encoding or line breaking?

Jörn

-- 
It is better to die of hunger having lived without grief and fear,
than to live with a troubled spirit amid abundance.
-- Epictetus
