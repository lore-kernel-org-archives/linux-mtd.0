Received: from mail.coactive.com ([63.97.71.15] helo=airbag.coactive.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MHH7-0008QQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 23:55:37 +0100
Message-ID: <7118259C3044D311942700508B2CA5BB7412D8@balance.coactive.com>
From: Mike Voytovich <mvoytovich@coactive.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Steve Kranz
	 <skranz@ridgerun.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: MTD/mtdblock.c uclinux 2.0.38? 
Date: Mon, 16 Jul 2001 16:00:37 -0700
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

Hello,

I see this was posted less than a week ago...

Are you now able to build the latest MTD/JFFS2 CVS with uClinux 2.0.38?  I
would also like to get this code working with 2.0.38, although I'm first
trying with a clean 2.0.38 kernel (then will try with uClinux).

I tried the suggested workarounds below, but still have some problems, which
I'm not sure how to resolve.  Perhaps you have resolved them already.  If
not, I am willing to work on this and add a kernel patch to the mtd CVS, if
I can have a little help...

Thanks,
-mike

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Wednesday, July 11, 2001 3:29 PM
To: Steve Kranz
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 



skranz@ridgerun.com said:
> MTD depends on these headers which don't exist within the uclinux
> tree.

Touch them. We can sort out the missing stuff later. You might want slab.h 
to include malloc.h instead of just being empty.


> include/linux/mtd/map.h line 65, generates error: "field `list' has
> incomplete type"

Copy include/linux/list.h from a later kernel.


skranz@ridgerun.com said:
> statements __MOD_INC_USE_COUNT() and __MOD_DEC_USE_COUNT() found in
> various locations with the MTD tree generate these compile errors:
> "structure has no member named `uc'" "structure has no member named
> `flags'" 

Fix the definitions in include/linux/mtd/compatmac.h to match the kernel 
you're using.


--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
