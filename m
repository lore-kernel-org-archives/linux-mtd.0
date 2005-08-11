Received: from mta071a.interbusiness.it ([85.37.17.71])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3ENZ-0006YQ-AJ
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 10:49:58 -0400
Received: from gianlinux.eptar.com (massimo.eptar.com [192.168.143.6])
	by eptar.com (8.11.6/8.9.3) with ESMTP id j7BEgxG20454
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 16:42:59 +0200
From: Gianluca <gianlucarenzi@eptar.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 11 Aug 2005 16:42:29 +0200
References: <42FAFEC9.1090306@mail.ru>
	<1123748971.16052.65.camel@sauron.oktetlabs.ru>
	<ddf6hr$pfn$1@sea.gmane.org>
In-Reply-To: <ddf6hr$pfn$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200508111642.29720.gianlucarenzi@eptar.com>
Subject: Re: jffs2 and nand mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
we are working on an embedded system, but the only kernel it supports it is=
=20
2.4.x series (microblaze based)
It has nand flash we are just wrote our drivers, but if mtd support for 2.4=
=2Ex=20
lacks, we cannot use them with any filesystem.

> > The best would be if you would adopt the *latest* MTD snapshot to your
> > kernel. Martin Egholm Nielsen <martin@egholm-nielsen.dk> recently ported
> > the latest MTD snapshot to a 2.4 kernel. You may ask him for a
> > patch/help.
>
> I'll help - I don't think I can create a patch that'll work directly, so
> let's see if we can get CVS HEAD up and running - step by step...
We are very glad if you "DIFFed" your harddrive mtd 2.4 sources, so it will=
 be=20
much simpler for us using them directly instead of downloading the latest=20
release, then using the older macros... is it error prone doing in the=20
following way?

>
> 1 )Start by fetching the source from CVS
> (http://www.linux-mtd.infradead.org/source.html)
>
> 2) Patch it in - enter the patches directory and run the patchin.sh
> script...
>
> 3) Configure the kernel for JFFS2
>
> ( 3=BD) If "non-standard" board, change the "proper" (vague - I know) mtd
> Makefile to include the flash-driver for your system...)
>
> 4) Try making a new kernel - this will certainly fail, since many of the
> macro's checking (and fixing) for kernel less than 2.6 has been removed...
>
> To fix the many errors in 4), you can actually compare the complaining
> files from HEAD with the ones from 2005-03-04. Many, if not all, the
> required macro's are there.
> Otherwise, I can try to see if I can create a patch/diff output stating
> the differences.
> Or, finally, you can post the errors here, or privately (not so noisy,
> but others may benefit - even if 2.4 is abandoned :-)), and we can
> fix'em together...
Anyway we will feel a lot of better if 2.4 support will NOT be abandoned at=
=20
all, expecially for small footprint project like embedded system.

Best regards,
=2D-=20
Gianluca Renzi
Eptar s.r.l.
Via Celletta 8/B
40026 Imola (BO) ITALY
Tel.:	+39-0542-609060
=46ax.:	+39-0542-609054
