Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PSVx-0004EJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 19:36:38 +0100
Subject: Re: [ANN] Driver for PCMCIA Flash memory cards
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: Simon Evans <spse@secret.org.uk>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <E17PONb-0006pj-00@spoinky.renegade.org.uk>
References: <E17PONb-0006pj-00@spoinky.renegade.org.uk>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 02 Jul 2002 20:35:49 +0200
Message-Id: <1025634949.1046.18.camel@spawn>
Mime-Version: 1.0
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

On Tue, 2002-07-02 at 16:11, Simon Evans wrote:
> 
> Hi,
> 
> I have written an MTD driver for PCMCIA flash memory cards. These are the
> older type of PCMCIA memory cards (usually 4-16MB in size) NOT Compact Flash
> cards. The driver works by mapping out the cards and providing read/write
> routines then calling the chip probe functions. In this way it just acts
> as a mapping driver and doesnt care about the chips used. 

Nice I also did a driver for this but I hardcoded everything so it was
useless for anyone but me(and mostly for me too ).

> 
> It is still quite alpha and should be treated with caution,
> but I have successfully tested it on 2.4.19-rc1,2.4.17(i386) and
> 2.4.17-rmk5(ipaq/arm) with a few different memory cards.
> I have been able to setup jffs2 and transfer files between a laptop and
> Ipaq successfully.

Is arm little endian?? one reason I did not find this so useful for me
was that I have a powerpc target and that is big endian and I could not
use it for jff2 work as the data would not work when moved from a pc to
the target. 

> Once the code is more stable I may put it into the MTD CVS, however I'm
> still figuring out some things with PCMCIA initialisation code so it
> is still subject to large rewrites ;)
> 
> Anyway, if anyone is interested, it is at: http://si.org/pcmciamtd/
> 
> bugs & comments welcome ;) 

Nice you parse the CIS data I never got around to do that. 
Any thought on partitions as I understand it you only get one region.
Perhaps creating a device node and some ioctl could solve that but It's
maybe not that important.

I'm going to test this out but I'm in the middle of some other work so
it has to wait some time. 

-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
