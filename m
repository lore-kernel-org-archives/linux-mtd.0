Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rRVw-0002Ii-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 00:12:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D87B5DD.59E37F94@bioace.net> 
References: <3D87B5DD.59E37F94@bioace.net> 
To: Carl Przybylek <carlp@bioace.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip & JFFS1/2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Sep 2002 00:12:14 +0100
Message-ID: <31062.1032304334@redhat.com>
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

carlp@bioace.net said:
>  1).  If I download the the latest cvs source of the mtd and patch it
> in with the 2.4.19 kernel the jffs2 support will not compile.
> background.c tells me that recalc_sigpending passed 1 argument but
> takes 0.  JFFS2 support compiles fine from the unpatched source.

Get include/linux/mtd/compatmac.h too.

> 2).  Using the support from the 2.4.19 kernel I got the kernel to
> reconize the diskonchip but I get the following error when trying to
> create a JFFS2 filesystem: ECC needs a full sector write ( addr 400
> size 4c ). What the heck does that mean?  I cant find much expect a
> message post saying disk on chip does not support jffs filesystems. 

You need the latest CVS code and it should mostly work. 

--
dwmw2
