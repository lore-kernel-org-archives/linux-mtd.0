Received: from smtp12.mail.yahoo.co.jp ([211.14.15.235])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 195nwT-0005H7-Ln
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 15:31:18 +0100
Message-ID: <002501c30424$c3fedf20$a10486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: <tglx@linutronix.de>,
	=?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
	<200304161335.50367.tglx@linutronix.de>
	<20030416111353.GE25858@wohnheim.fh-wedel.de>
	<200304161605.33119.tglx@linutronix.de>
Date: Wed, 16 Apr 2003 23:30:44 +0900
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

Hi.

On Wednesday 16 April 2003 13:13, Jörn Engel wrote:
> On Wed, 16 April 2003 13:35:50 +0200, Thomas Gleixner wrote:
> > [lots of good information]
> >
> > JFSS2 does no write on fsync, as data are already written.
>
> This is true for NOR, but how about the wbuf for NAND? How does that
> respond to sync/fsync?
Sync triggers flush_wbuf.
NAND uses a writebuffer of page_size, which is 256 / 512 Byte depending on the
chip type.

> iirc it used to ignore sync completely so people could potentially get
> into trouble if they write-sync-poweroff with <2s between write and
> poweroff.
write - sync -poweroff works on NAND. flush_wbuf is also triggered on umount.

I think that sys_sync is not supported yet, as is written in jffs2/Todo, right?

__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
