From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 2 Mar 2003 19:14:39 +0100
Subject: [PATCH] makefile bug and some cleanup
In-Reply-To: <20030302105730.GA18324@wohnheim.fh-wedel.de>
References: <20030302092359.GN15015@pengutronix.de> <20030302105730.GA18324@wohnheim.fh-wedel.de>
Message-ID: <20030302181439.GA31492@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2 March 2003 11:57:30 +0100, J?rn Engel wrote:
> 
> First looks trivial. The second feels wrong.
> 
> >  		printf("\rPerforming Flash Erase of length %lu at offset 0x%lx",
> > -				erase.length, erase.start);
> > +				(unsigned long)erase.length, (unsigned long)erase.start);
> 
> People (including me) are easily lured into fixing the warnings, which
> are only symptoms, instead of the real causes. And this looks exactly
> like a symptom fix.

Here are the warnings:
erase.c: In function `region_erase':
erase.c:66: warning: long unsigned int format, u_int32_t arg (arg 2)
erase.c:66: warning: long unsigned int format, u_int32_t arg (arg 3)
erase.c: In function `non_region_erase':
erase.c:103: warning: long unsigned int format, u_int32_t arg (arg 2)
erase.c:103: warning: long unsigned int format, u_int32_t arg (arg 3)
erase.c:109: warning: long unsigned int format, u_int32_t arg (arg 2)

And they are correct. u_int32_t is typedef'd to be unsigned int on all
platforms for the linux kernel and in glibc for i386.

I'd have to check this on a 64bit machine on Monday but I expect
pretty ugly results. Correct fix would be to remove the 'l' from the
format string each and every time.

Robert, do you agree? Is is ok if I commit my proposed patch?

J?rn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
