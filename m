Received: from [216.219.239.237] (helo=www.sensoria.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wAAk-0002H7-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 23:37:22 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Patch to prevent jffs2 from make changes to other filesystems 
Date: Tue, 23 Oct 2001 15:45:08 -0700
Message-ID: <015201c15c14$5e70b2f0$456c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15804.1003874104@redhat.com>
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

Hi David,

I am using kernel 2.4.10 and the older mtd stuff.
I have grabbed the newer mtd from cvs and can
confirm that we no longer have the problem.  The
"Cowardly refusing ..." message was triggered with
no damage to the cramfs.

I apologize for the panic.  We will be moving
forward to 2.4.12 to eliminate this type of
problems.

Regards.
Bao

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of 
> David Woodhouse
> Sent: Tuesday, October 23, 2001 2:55 PM
> To: Bao C. Ha
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Patch to prevent jffs2 from make changes to other
> filesystems 
> 
> 
> 
> 
> baoha@sensoria.com said:
> >  I would like to propose the following patch to temporarily fix the
> > problem of jffs2 making changes to other filesystems stored on MTD
> > partitions. 
> 
> You can't do it like that - you'll get crap on the filesystem 
> sometimes, 
> during normal operation. We have logic in there to abort the 
> mount at the 
> end, if no valid nodes were found, but other data were. Is 
> that failing or 
> are you using an obsolete version?
> 
> Line 147 of scan.c should read:
>  printk(KERN_NOTICE "Cowardly refusing to erase blocks on 
> filesystem with no valid JFFS2 nodes\n");
> 
> Does it? Why doesn't it get triggered?
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
