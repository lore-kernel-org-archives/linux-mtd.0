Received: from penguin-ext.wise.edt.ericsson.se ([194.237.142.110])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qxEU-0008Qi-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 14:47:42 +0100
Received: from mbb5.ericsson.se (mbb5.ericsson.se [136.225.151.210])
	by penguin.wise.edt.ericsson.se (8.11.0/8.11.0/WIREfire-1.3) with ESMTP id f99DuqC01489
	for <linux-mtd@lists.infradead.org>; Tue, 9 Oct 2001 15:56:52 +0200 (MEST)
Received: from CONVERSION-DAEMON by mbb1.ericsson.se (PMDF V5.2-29 #39352)
 id <0GKX00F01YQR3Z@mbb1.ericsson.se> for linux-mtd@lists.infradead.org; Tue,
 9 Oct 2001 15:56:51 +0200 (MET DST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb1.ericsson.se (PMDF V5.2-29 #39352)
 with ESMTP id <0GKX004FQYQQO2@mbb1.ericsson.se> for
 linux-mtd@lists.infradead.org; Tue, 09 Oct 2001 15:56:51 +0200 (MET DST)
Date: Tue, 09 Oct 2001 15:56:50 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: Re: Q: Probing for devices > buswidth???
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Eric W. Biederman" <ebiederman@lnxi.com>, linux-mtd@lists.infradead.org
Message-id: <3BC30222.2476B421@inn.ericsson.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
References: <3BC2F94C.A641360C@inn.ericsson.se>
 <m3y9mljsin.fsf@DLT.linuxnetworx.com> <29886.1002609959@redhat.com>
 <m3wv25gvdq.fsf@DLT.linuxnetworx.com> <21867.1002633721@redhat.com>
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

David Woodhouse wrote:
> 
> kenneth.johansson@inn.ericsson.se said:
> >  Yes. I have a pcmcia linear flash device that is using Intel
> > strataflash 28F640xxx. The chips is 16 bit but used as 8bit. To make
> > things interesting they also interleave the chip so odd bytes goes to
> > one chip and even to the other.
> 
> You have map driver code for PCMCIA devices? Is this a generic PCMCIA
> driver or a platform-specific hack?

Well this is linear flash this means I don't have to know anything about
pcmcia it is directly connected to the bus. This gives max 64Meg memory.

On the other hand it also works as a proper pcmcia device and can be used in
real pcmcia/cardbus environment.

I made a big fuckup when I started to use them and could no get it to work so
I made a small driver for real pcmcia that i used in a x86 laptop just to se
that the chip worked. This driver is way to simple to be usefull as a generic
mapping driver for MTD. But a real driver is not to hard to do. The PCMCIA
subsystem is just a bit confusing and has it's own bulkmem system that needs
to be removed and converted to MTD. 

The fuckup was that every pcmcia linear flash decode the entire 64Meg memory
range. I had 16Meg flash and expected to get 4 views of the same memmory in
that 64Meg rage. This did not happen and it never hit me to try to use the
device in a memory region that was modulo 64Meg so I did only get strange
values out of it:(

I needed the memory to exist from -1 to -16Meg as the memory is used for
booting a PowerPC CPU and they boot from fffffffc.

-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
