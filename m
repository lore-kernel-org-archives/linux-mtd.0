Received: from [63.144.37.162] (helo=mh02.bioace.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rSBr-0002NI-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 00:55:35 +0100
Received: from bioace.net (unknown [192.168.10.179])
	by mh02.bioace.net (Postfix) with ESMTP id 420AD40230
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 19:54:57 -0400 (EDT)
Message-ID: <3D87C0D0.2D3B7BEF@bioace.net>
Date: Tue, 17 Sep 2002 19:54:57 -0400
From: Carl Przybylek <carlp@bioace.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip & JFFS1/2
References: <3D87BB3E.703F200@bioace.net>  <3D87B5DD.59E37F94@bioace.net> <31062.1032304334@redhat.com> <31523.1032305608@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

seems the jffs2 directory was left out of the patchin.sh file
if you run into this just add
ln -sf $TOPDIR/fs/jffs2/*.[ch] fs/jffs2
ln -sf $TOPDIR/fs/jffs2/*akefile fs/jffs2
ln -sf $TOPDIR/include/linux/jffs2*.h include/linux

to the file to fix it.
Thanks for the help
Carl Przybylek


David Woodhouse wrote:

> sunil.r.atri@intel.com said:
> >  Why does the compatmac.h redefine recalc_sigpending if background.c
> > just calls it as is
>
> > //background.c
> > recalc_sigpending(current);
>
> It doesn't. You're looking at an old version of background.c.
>
> --
> dwmw2
