Received: from albatross-ext.wise.edt.ericsson.se ([194.237.142.116])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qwe0-0008NT-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 14:10:00 +0100
Received: from mbb5.ericsson.se (mbb5.ericsson.se [136.225.151.210])
	by albatross.wise.edt.ericsson.se (8.11.0/8.11.0/WIREfire-1.3) with ESMTP id f99DJ9L25694
	for <linux-mtd@lists.infradead.org>; Tue, 9 Oct 2001 15:19:09 +0200 (MEST)
Received: from CONVERSION-DAEMON by mbb1.ericsson.se (PMDF V5.2-29 #39352)
 id <0GKX00601WZWZ4@mbb1.ericsson.se> for linux-mtd@lists.infradead.org; Tue,
 9 Oct 2001 15:19:08 +0200 (MET DST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb1.ericsson.se (PMDF V5.2-29 #39352)
 with ESMTP id <0GKX006H8WZWF3@mbb1.ericsson.se> for
 linux-mtd@lists.infradead.org; Tue, 09 Oct 2001 15:19:08 +0200 (MET DST)
Date: Tue, 09 Oct 2001 15:19:08 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: Re: Q: Probing for devices > buswidth???
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Message-id: <3BC2F94C.A641360C@inn.ericsson.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
References: <m3y9mljsin.fsf@DLT.linuxnetworx.com> <29886.1002609959@redhat.com>
 <m3wv25gvdq.fsf@DLT.linuxnetworx.com>
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

"Eric W. Biederman" wrote:
> 
> David Woodhouse <dwmw2@infradead.org> writes:
> 
> > ebiederman@lnxi.com said:
> > > Trying to understand some anomolous results I discovered that
> > > gen_probe_newchip is looking for: 16 bit devices on an 8 bit bus. byte
> > > interleaved 16 bit devices on a 16 bit bus. And some really bizare
> > > things for a 32 bit bus.
> >
> > > Is there any good reason for doing it that way?
> >
> > What it's probing for is a 16-bit device in 8-bit mode. This is _different_
> > to an 8-bit device :)
> 
> Just so I understand.  There are chips with a 16-bit interface that
> you can put in a crippled mode such that they pretend use only an 8
> bit bus.  But the id logic is the same as when the are on a 16-bit
> bus?

Yes. I have a pcmcia linear flash device that is using Intel strataflash
28F640xxx. The chips is 16 bit but used as 8bit. To make things interesting
they also interleave the chip so odd bytes goes to one chip and even to the
other.

This makes the effective block size 256KB and with JFFS2 I need 5 blocks free
minimum so I wast 1.2 MB regardless of total flash bank size :( 


I get this rather confusing message from the probe.
Physically mapped flash: Found 2 x16 devices at 0x0 in 16-bit mode


What I have is: 2x16 bit chips on a 16 bit bus in 8 bit mode and interleaved.


-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
