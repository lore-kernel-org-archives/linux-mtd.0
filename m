Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195qa6-0005ue-8M
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 18:20:22 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDG0085E5H77O@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 16 Apr 2003 19:19:56 +0200 (MEST)
Date: Wed, 16 Apr 2003 20:19:50 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <002501c30424$c3fedf20$a10486da@w0a3t0>
To: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>,
 =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304162019.50838.tglx@linutronix.de>
MIME-version: 1.0
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
	<002501c30424$c3fedf20$a10486da@w0a3t0>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: esn@cotas.dk
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Database on JFFS2?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 April 2003 16:30, matsunaga wrote:
> > iirc it used to ignore sync completely so people could potentially get
> > into trouble if they write-sync-poweroff with <2s between write and
> > poweroff.
>
> write - sync -poweroff works on NAND. flush_wbuf is also triggered on
> umount.
>
> I think that sys_sync is not supported yet, as is written in jffs2/Todo,
> right?

Sorry, I mixed this up with fsync. sys_sync is not working, just flushing the 
buffer on umount.

When I brought in the timed flush, I tried to use kupdated 
(superblock->s_dirty) and had a bunch of unwanted flush's during consecutive 
writes, because setting sb->s_dirty is asynchronous to kupdated interval.  
That's why I used the 2 seconds timer. 

I will think about it again.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
