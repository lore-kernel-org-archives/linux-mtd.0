Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Vc4l-00058n-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 18:34:15 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8B009NA3NNKY@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 06 Jan 2003 20:04:35 +0100 (MET)
Date: Mon, 06 Jan 2003 20:03:40 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Compile error in mtdblock-core...
In-reply-to: <3E199E9D.8A02D98F@imc-berlin.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301062003.40607.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3E199E9D.8A02D98F@imc-berlin.de>
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

On Monday 06 January 2003 16:19, Steven Scholz wrote:
> -DKBUILD_BASENAME=mtdblock_core  -c -o mtdblock-core.o mtdblock-core.c
> In file included from
> /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blk
>.h:4, from mtdblock-core.c:18:
> /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blk
>dev.h:147: parse error before `struct'
Check in blkdev.h, if the define before the struct contains any control 
characters. Happens sometimes and gcc is not very happy with this. Should not 
be a problem of mtd, because mtd does not modify blkdev.h.
 
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
