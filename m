Received: from mail.coactive.com ([63.97.71.15] helo=airbag.coactive.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Mdm9-0001Jj-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 23:57:10 +0100
Message-ID: <7118259C3044D311942700508B2CA5BB7412DE@balance.coactive.com>
From: Mike Voytovich <mvoytovich@coactive.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: Steve Kranz <skranz@ridgerun.com>, linux-mtd@lists.infradead.org
Subject: RE: MTD/mtdblock.c uclinux 2.0.38? 
Date: Tue, 17 Jul 2001 16:02:12 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

One big issue is that JFFS2 seems to rely on the dirent cache, which isn't
present in the 2.0.x kernel.  So, I suppose that would have to be backported
from 2.2.x (if that's even a reasonable task).  

I don't know what other kernel dependencies (besides dirent cache) there are
for JFFS2...  I wonder if anyone has been successful in getting JFFS2
working with 2.0.x??  Any feedback would be appreciated...

thanks,
-mike

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, July 17, 2001 12:07 AM
To: Mike Voytovich
Cc: Steve Kranz; linux-mtd@lists.infradead.org
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 



mvoytovich@coactive.com said:
> Are you now able to build the latest MTD/JFFS2 CVS with uClinux
> 2.0.38?  I would also like to get this code working with 2.0.38,
> although I'm first trying with a clean 2.0.38 kernel (then will try
> with uClinux).

I don't even have a 2.0 kernel in the building.

> I tried the suggested workarounds below, but still have some problems,
> which I'm not sure how to resolve. 

Show me.

--
dwmw2
