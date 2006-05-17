Received: from web37913.mail.mud.yahoo.com ([209.191.124.108])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgMUh-00033R-VK
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 09:55:24 -0400
Message-ID: <20060517134838.73136.qmail@web37913.mail.mud.yahoo.com>
Date: Wed, 17 May 2006 06:48:38 -0700 (PDT)
From: syed khader <sk.syed@yahoo.com>
To: "J�rn" Engel <joern@wohnheim.fh-wedel.de>,
  syed khader <sk.syed@yahoo.com>
In-Reply-To: <20060517131918.GB22457@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: zlib compression is failing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  yeah that is an option. but till the time we move to
2.6 we should support 2.4 and have to resolve this
problem.
  Probably looking into the changes would help.
Thanks
syed


--- J�rn Engel <joern@wohnheim.fh-wedel.de> wrote:

> On Wed, 17 May 2006 04:22:39 -0700, syed khader
> wrote:
> > 
> >   I have uClinux2.4.24(which corresponds to 2.4
> > kernel). It originally had jffs2.1. Since 2.1 was
> > quite slow, we moved it to jffs2.2 by applying
> patch
> > from mtd cvs as follows:
> > 
> >    cvs -d
> :pserver:anoncvs@cvs.infradead.org:/home/cvs
> > login (password: anoncvs)
> >    cvs -d
> :pserver:anoncvs@cvs.infradead.org:/home/cvs
> > co mtd
> >    cd <mtd-path>/patches
> >   sh patchin.sh -c -j <kernel-path> 
> > 
> >   The CVS tag was D2004.05.11.18.30.00
> 
> All of that is quite old.  1.5 years for the
> mtd/jffs2 and 2.5 years
> for 2.4.24.
> 
> Can you reproduce the same problem with current
> code?  Either 2.6.16
> or 2.4.32?
> 
> J�rn
> 
> -- 
> More computing sins are committed in the name of
> efficiency (without
> necessarily achieving it) than for any other single
> reason - including
> blind stupidity.
> -- W. A. Wulf 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
