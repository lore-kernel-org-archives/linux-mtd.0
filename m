Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17fyln-0006Bf-00
	for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2002 09:17:16 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0Z0028QAZWRH@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 17 Aug 2002 10:16:45 +0200 (MEST)
Date: Sat, 17 Aug 2002 10:16:31 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Found ecc verify bug in nand.c
In-reply-to: <0BBECB8C-B15D-11D6-BE50-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Message-id: <1029571384.2142.19.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <0BBECB8C-B15D-11D6-BE50-000393467F1A@arlut.utexas.edu>
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

On Fri, 2002-08-16 at 23:13, Ken Offer wrote:
> This is a compare to see if the ecc has changed.  Unfortunately, 
> data_buf is UNSIGNED char and ecc_code is SIGNED char.  When 
> compiling under gcc 2.95.3 on a powerpc system, the code ends up 
> comparing two identical bytes and fails because one is 
> sign-extended (example: comparing 0xc3 becomes "0xc3 == 
> 0xffffffc3").  I don't know if this makes a difference with the 
> x86 compiler, but it does under powerpc.
It's a problem on other arch's too. It did not happen to me, because I
don't use the NAND_WRITE_VERIFY paranoia check :)
Thanks, fixed in CVS

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
