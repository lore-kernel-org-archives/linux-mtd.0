Received: from smtp13.mail.yahoo.co.jp ([211.14.15.236])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196BrF-0000ec-38
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 17:03:29 +0100
Message-ID: <002201c304fa$d04abd40$a10486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: <tglx@linutronix.de>,
	=?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: 
	<20030415171123.GH7721@wohnheim.fh-wedel.de><002501c30424$c3fedf20$a10486da@w0a3t0>
	<200304162019.50838.tglx@linutronix.de>
Date: Fri, 18 Apr 2003 01:02:57 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: linux-mtd@lists.infradead.org
cc: esn@cotas.dk
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>; "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Cc: <linux-mtd@lists.infradead.org>; "Holger Schurig" <h.schurig@mn-logistik.de>; <esn@cotas.dk>; "Jasmine Strong"
<jasmine@regolith.co.uk>
Sent: Thursday, April 17, 2003 3:19 AM
Subject: Re: Database on JFFS2?


> On Wednesday 16 April 2003 16:30, matsunaga wrote:
> > > iirc it used to ignore sync completely so people could potentially get
> > > into trouble if they write-sync-poweroff with <2s between write and
> > > poweroff.
> >
> > write - sync -poweroff works on NAND. flush_wbuf is also triggered on
> > umount.
> >
> > I think that sys_sync is not supported yet, as is written in jffs2/Todo,
> > right?
>
> Sorry, I mixed this up with fsync. sys_sync is not working, just flushing the
> buffer on umount.
>
> When I brought in the timed flush, I tried to use kupdated
> (superblock->s_dirty) and had a bunch of unwanted flush's during consecutive
> writes, because setting sb->s_dirty is asynchronous to kupdated interval.
> That's why I used the 2 seconds timer.
>
> I will think about it again.

I understand the sisuation. Asynchronous sync could prevents consecutive writes.
I will wait for it ;-)
Ideally sys_sync while a file is being written should wait for the last wbuf write of the file and flush it...

BR.

__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
