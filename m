Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cALd-0007Hh-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 20:50:29 +0100
Message-ID: <3D5028B7.22893B6E@esteem.com>
Date: Tue, 06 Aug 2002 12:51:19 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Need help getting JFFS2 working with kernel 2.4.19
References: <3D4FFA9B.2C693A02@esteem.com>  <3D4EDA18.C77AEDA@esteem.com> <25573.1028653616@redhat.com>
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

David Woodhouse wrote:
> 
> clark@esteem.com said:
> >
> >       I figured it out. The jffs2 zlib was conflicting with the zlib used
> > bye ppp compresion. I just had to remove zlib.o from the COMPR_OBJS
> > definition in the Makefile.
> 
> There's a better fix in 2.4.20-pre2 and at
> ftp.kernel.org:/pub/linux/kernel/people/dwmw2/shared-zlib/
> 
> Get the latest patch (2.4.19-pre10) and it should apply to most 2.4 kernels.
> 
> --
> dwmw2


I take it that this patch wasn't submitted to Marcelo or Marcelo didn't get
it integrated the final 2.4.19 then?

Is there anything else I need to do or will the patch fix everything?


Thanks

	Conn	


-- 

*****************************************************************
  If you live at home long enough, your parents will move out.
 (Warning they may try to sell their house out from under you.)
*****************************************************************

Conn Clark
Engineering Stooge				clark@esteem.com
Electronic Systems Technology Inc.		www.esteem.com

Stock Ticker Symbol				ELST

"clark@esteem.com" Copyright 2000 By Electronic Systems Technology
 This email address may be used to communicate to Conn Clark
 provided it is not being used for advertisement purposes, unless
 prior written consent is given. This email address may not be 
 sold under any circumstances. All other rights reserved.
