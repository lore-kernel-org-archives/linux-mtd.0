Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jmGq-0002eV-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 20:45:00 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1I002KHPI59L@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 27 Aug 2002 21:44:30 +0200 (MEST)
Date: Tue, 27 Aug 2002 21:44:06 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: flash file system for production use
In-reply-to: <3D6BCCFD.4090707@goepel.com>
To: Michael Palme <m.palme@goepel.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1030477447.11505.9.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3D6BCCFD.4090707@goepel.com>
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

On Tue, 2002-08-27 at 21:03, Michael Palme wrote:
> hello...
> 
> i've got a strongarm system with 32mb intel strata flash. i need a 
> mechanism for storing configuration files etc in the flashes. for this 
> purpose 20mb of the flashes are free. the performance/ stability thing 
> is very important for me. i cant wait 10 secs fot mounting/ checking 
> etc. i' ve tried jffs2 from CVS and it seems to be "fast" on a nearly 
> empty flash partition, but i have no suggestion about what happens in 
> hard production use, when the flash will be written  over and over again 
> and the wear leveling takes place. the device is never shutdown'ed in a 
> clean way -- always hard power off...
> 
> because i have 20megs free and only small information to store i think 
> there is no need for a complex wear leveling mechanism but im not an expert.
> 
> what the best solution fot my problems???
> 
You have to decide, whats more important stability or preformance. If
you write small but important information and your system has the
possibility of power loss, then you have to use a stable, journalling
flash file system like JFFS2 and accept some performance penalty. The
actual JFFS2 code in CVS is faster than the stable branch. It needs some
serious testing. And there is place for further improvents. You're
heartly intvited to join us and implement some of the things, which are
listed in the TODO file.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
