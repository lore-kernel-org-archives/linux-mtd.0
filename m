Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c7HD-0006qv-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 17:33:43 +0100
Message-ID: <3D4FFA9B.2C693A02@esteem.com>
Date: Tue, 06 Aug 2002 09:34:35 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Need help getting JFFS2 working with kernel 2.4.19
References: <3D4EDA18.C77AEDA@esteem.com>
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

Conn Clark wrote:
> 
> Hello all,
> 
>         I am new here and I am having trouble getting the JFFS2 code
> working/compiling with the 2.4.19 kernel . I get multiple definition
> errors when the kernel is linking.
> 
> Many thanks in advance,
> 
>         Conn

	I figured it out. The jffs2 zlib was conflicting with the zlib
used bye ppp compresion. I just had to remove zlib.o from the COMPR_OBJS
definition in the Makefile.

	Sorry for the lack of details. I figured it out yesterday but
mailed this post to myself instead of the list. Sorry again.


Thanks anyways

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
