Received: from skynetaccess.skynetaccess.net ([65.18.154.155])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALSjh-0000mf-M1
	for <linux-mtd@lists.infradead.org>; Sun, 16 Nov 2003 19:39:16 +0000
Sender: train@skynetaccess.skynetaccess.net
Message-ID: <3FB6E4AA.27A7AAE1@earthlink.net>
Date: Sat, 15 Nov 2003 21:44:58 -0500
From: Phil Wilshire <philwil@earthlink.net>
MIME-Version: 1.0
To: Russ.Dill@asu.edu
References: <3FA7AB8B.A287F4@earthlink.net>
	<1068937683.17897.21.camel@localhost>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 write Error
Reply-To: philwil@earthlink.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Russ Dill wrote:
> 
> On Tue, 2003-11-04 at 06:37, Phil Wilshire wrote:
> > Hi Guys,
> >
> > I am seeing a frequent error
> >
> > on an ARM7TDMI  system
> >   uClinux version 2.4.20-uc0
> >
> > Processor: Atmel AT91M40xxx revision 0
> > Architecture: EB01
> >
> > physmap flash device: 200000 at 1600000
> > Found: Atmel AT49BV32XA
> > number of JEDEC chips: 1
> 

I have found my original problem.

The 
   do_write_oneword 
routine in 
  cfi_cmdset_0002.c 

was being given values for datum wider than the 16 bits
we are allowed to write to the device.
The readback being limited to 16 bits, of course , failed to match


The data was being given to do_write_oneword by gc.c 

Here is the error output

Last[3] is 66, datum is 8000066 addr 3028c
Write of 49 bytes at 0x00030264 failed. returned -5, retlen 40
jffs2_write_dirent in garbage_collect_dirent failed: -5

As you can see 8000066 is impossible to write to a 16 bit device.



I put an extra check on the word size in do_write_oneword and the error just went away.

regards  
   Phil Wilshire

-- 
SDCS -- System Design & Consulting Services LLC, http://www.sysdcs.com
** Embedded Linux Training **  email me for details  
630 Springhouse Sq., Leesburg VA 20175 t: 703 669 9766 f: 703 669 9768
