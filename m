Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189UUe-0003SS-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 18:01:34 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700131E386@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: seeking help on JFFS2 
Date: Wed, 6 Nov 2002 13:26:25 -0500 
MIME-Version: 1.0
Content-Type: text/plain
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

Thanks a lot. That one-line change worked, now under my cp/rm stress test,
JFFS2 doesn't
crash anymore, but I still crashed finally when I overflowed the file
system. My boss just asked
me to work on something else first, when I come back, I will generate the
dump for the new
oops.

Also, shouldn't unpoint() in mtd.h take four params? and MTD_UNPOINT() macro
doesn't seem
to be used by anyone.

Thanks everyone

- Junping

> -----Original Message-----
> From:	David Woodhouse [SMTP:dwmw2@infradead.org]
> Sent:	Wednesday, November 06, 2002 11:15 AM
> To:	Junping Zhang
> Cc:	linux-mtd@lists.infradead.org
> Subject:	Re: seeking help on JFFS2 
> 
> 
> JZhang@erinc.com said:
> > 0xc00e0008 is in do_read_onechip (cfi_cmdset_0001.c:473).
> > 473         if (!(((struct
> cfi_pri_intelext*)cfi->cmdset_priv)->FeatureSupport & 2))
> 
> Why didn't you say so before? :)
> 
> cvs up
> 
> 
> --
> dwmw2
> 
