From: robert@schwebel.de (Robert Schwebel)
Date: Tue, 4 Mar 2003 09:13:46 +0100
Subject: [PATCH] makefile bug and some cleanup
In-Reply-To: <20030302181439.GA31492@wohnheim.fh-wedel.de>
References: <20030302092359.GN15015@pengutronix.de> <20030302105730.GA18324@wohnheim.fh-wedel.de> <20030302181439.GA31492@wohnheim.fh-wedel.de>
Message-ID: <20030304081346.GI15015@pengutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, Mar 02, 2003 at 07:14:39PM +0100, J?rn Engel wrote:
> And they are correct. u_int32_t is typedef'd to be unsigned int on all
> platforms for the linux kernel and in glibc for i386.
> 
> I'd have to check this on a 64bit machine on Monday but I expect
> pretty ugly results. Correct fix would be to remove the 'l' from the
> format string each and every time.
> 
> Robert, do you agree? Is is ok if I commit my proposed patch?

Sounds sane. 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Braunschweiger Str. 79,  31134 Hildesheim, Germany
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
