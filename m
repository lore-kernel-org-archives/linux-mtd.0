Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AP9p-00072z-6T
	for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2003 08:04:05 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE3001LOFMATY@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 29 Apr 2003 09:03:47 +0200 (MEST)
Date: Tue, 29 Apr 2003 10:03:10 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030429012200.160431548C@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, Thayne Harbaugh <tharbaugh@lnxi.com>,
 =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304291003.10437.tglx@linutronix.de>
MIME-version: 1.0
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
 <200304290059.34784.tglx@linutronix.de>
 <20030429012200.160431548C@desire.actrix.co.nz>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 29 April 2003 03:23, Charles Manning wrote:
> > If that helps, I'm willing to add this too, conditional, defaulting to
> > zero. I remember a big thread complainig about this overhead, before it
> > was removed. I did this carefully and there is no "maybe a write is
> > interrupted by another thread issue". Only erases can be interrupted, but
> > they are restarted later. And on interruption of erase the reset comand
> > is issued.
>
> There is an overhead which is variable depending on the operation being
> performed. It seems likely to me that the only condition where this is
> likely to improve things is when recovering from some hardware problem (eg.
> signal integrity).
>
> Why do you interrupt erases? It seems to me like potentially an unhealthy
> thing to do on NAND since NAND does not support erase suspend. NAND erases
> quite quickly (say 2mS) so do you gain anything real by doing this?

Toshiba Datasheet:

Reset
The Reset mode stops all operations. For example, in the case of a Program or 
Erase operation the internally generated voltage is discharged to 0 volts and 
the device enters Wait state. The response to an  FFH  Reset command input 
during the various device operations is as follows:

Samsung Datasheet:

RESET 
The device offers a reset feature, executed by writing FFh to the command 
register. When the device is in Busy state during random read, program or 
erase mode, the reset operation will abort these operations. The contents of 
memory cells being altered are no longer valid, as the data will be partially 
programmed or erased. The command register is cleared to wait for the next 
command, and the Status Register is cleared to value C0h when WP is high. 
Refer to table 3 for device status after reset operation. If the device is 
already in reset state a new reset command will not be accepted by the 
command register. The R/B pin transitions to low for tRST after the Reset 
command is written. Reset command is not necessary for normal operation. 
Refer to Figure 10 below.

I have tested this with both chiptypes. The erase is aborted and restarted by 
the erase function.

It would really be interresting, if those problems are in related to an erase 
abort. Can anybody insert some debugging in nand_get_chip, where the abort is  
done?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
