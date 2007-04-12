Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hc0x6-0002rQ-RE
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 11:11:14 -0400
Subject: Re: Strange flash errors starting to appear, SOLVED
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1176365807.12080.112.camel@gentoo-jocke.transmode.se>
References: <1175700307.12080.67.camel@gentoo-jocke.transmode.se>
	<1176365807.12080.112.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Apr 2007 17:11:05 +0200
Message-Id: <1176390665.12080.118.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-12 at 10:16 +0200, Joakim Tjernlund wrote:
> On Wed, 2007-04-04 at 17:25 +0200, Joakim Tjernlund wrote:
> > Just got this on two boards(lots of them):
> > TMCU Flash Map Info: Waiting for chip to be ready timed out. Status c320
> > Write of 52 bytes at 0x0771392c failed. returned -5, retlen 0
> > Not marking the space at 0x0771392c as dirty because the flash driver returned retlen zero
> > 
> > Status c320 varies between boots. Seen
> > 7574, 3034 and 5f32
> > 
> > Kernel 2.6.20, no summary, Powerpc, cfi_cmdset_0001(Intel P30, 16 bits wide)
> > I have removed SUMMARY support from my kernel recently.
> > 
> >  Ideas?
> 
> Got some more info about this problem now.
> get_chip() in cfi_cmdset_0001 thinks the flash is in FL_STATUS and
> keeps querying the chip for status and eventually times out. Looking
> closer at the the chip I found that the real state is READY so  
> status = map_read(map, adr); actually reads flash contents instead.
> If I force the flash into status mode inside the timeout code, it
> recovers:
> 	if (time_after(jiffies, timeo)) {
> 				printk(KERN_ERR "%s: Waiting for chip to be ready timed out. Status %lx\n",
> 				       map->name, status.x[0]);
> 				map_write(map, CMD(0x70), adr); /* force into status */
> 				status = map_read(map, adr);
> 				if (map_word_andequal(map, status, status_OK, status_OK)) {
> 					printk(KERN_ERR "Status(%lx) OK for adr:%lx\n", status.x[0], adr);
> 					//BUG();
> 					break;
> 				}
> 				return -EIO;
> 			}
> 
> 
> uncommenting the BUG(), I get these traces which shows that the error
> appers in do_write_buffer() as it calls get_chip()
> 
> All this makes me think there is a race somewhere that puts the flash 
> into READY mode, but I am unable to find the cause. I really need some
> help one this one.

OK, this turned out to be an error in the userspace app which did a
direct access to the flash and thereby confusing the driver.

   Jocke
