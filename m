Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h3vz-0005aZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 09:00:15 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1400KVQU7KI2@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 20 Aug 2002 09:59:45 +0200 (MEST)
Date: Tue, 20 Aug 2002 09:59:30 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: No free space left for GC
In-reply-to: <015501c247f3$d13176a0$b30210ac@gv.com.tw>
To: =?UTF-8?Q?=E5=B0=8F?= =?UTF-8?Q?=E6=98=8E?= <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Message-id: <1029830371.22775.150.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: quoted-printable
References: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
 <1029793649.22781.129.camel@thomas.tec.linutronix.de>
 <015501c247f3$d13176a0$b30210ac@gv.com.tw>
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

On Tue, 2002-08-20 at 04:46, =E5=B0=8F=E6=98=8E wrote:
> in our own old nand flash system
> we always keep 1 nand-flash-block for garbage collection in block device
> driver
> (8k/8MB,16k/64MB)
> it never endless gc, but when diskfull,the speed is really slow
> finally we reserved more space(512k) for gc to  make gc faster
> those reversed space is not showed in fs layer
> we report (real size-reserved space) to fs layer
> and we use minix as fs layer
> (we do  bad block management, wear leveling, error correction,
> all in block device driver not in fs layer)
> recently, we need compression , so we try jffs2:)
> i think the design of jffs2 is also better than our old one:)
1. Please keep answers to mailinglist posting on the list. Thanks.

2. The endless gc, which used up all blocks, is fixed now. I will do
some more tests and put a final version into CVS today.

--=20
Thomas=20
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
