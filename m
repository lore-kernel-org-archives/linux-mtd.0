Received: from mailout1.echostar.com ([204.76.128.101])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1QD2-00063e-Uw
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2004 13:26:49 +0000
Message-ID: <C86A9402F6A07E47B2F50A302DFA9BAE044BA2@alm-exch.europe.echostar.com>
From: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 11 Mar 2004 06:26:17 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: timing problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently working on getting the nand driver to work on a conexant/arm
based platform running at 250 MHz, with a samsung
K9F2808UOC-YCB0 nand chip and I have been running into problems when
mounting (all kinds of strange errors). 

I have been able to get the whole thing working by adding a delay of 500 ns
in the 'nand_command' function in nand.c, right here:


 /* This applies to read commands */
 default:
  /*
   * If we don't have access to the busy pin, we apply the given
   * command delay
  */
      ndelay(500);
      if (!this->dev_ready) {
    udelay (this->chip_delay);
         return;
      }


In my opinion the problem seems to be that without the delay the busy pin is
checked before the nand chip is able to lower the
r/b-pin, i cannot fully explane why I need a delay of 500 ns to get it to
work because looking at the spec I would say Twb=150 ns (WE high to busy
low) should be enough, or otherwise 3*Twp+2*Twh+Talh+Twb=315 ns, but that
also still gives errors (less eventhough).

My question is: shouldn't there be a default hardware specific delay added
to the nand_chip structure (like this->chip_delay, but then specifically for
being called in the default case for read commands). I wrote a nand driver
myself a year ago for a non-linux platform and i then also had to put in a
delay (then 204 ms on a 200 MHz platform) at this place.

Another thing i ran into is this:

I turned on the write check in 'nand_write_page' (the code between '#ifdef
CONFIG_MTD_NAND_VERIFY_WRITE') and this was reporting errors all the time
when i copied somewhat bigger files to the flash. I found the error wasn't
in the data on flash, but rather in the check code which always uses
NAND_CMD_READ0, even if the col value is bigger than 256. This cannot work
since the column address is a byte. I changed this line:

 /* Send command to read back the page */
    this->cmdfunc (mtd, NAND_CMD_READ0, col, page);

to this:

 /* Send command to read back the page */
   if (col < 256)
      this->cmdfunc (mtd, NAND_CMD_READ0, col, page);
   else
      this->cmdfunc (mtd, NAND_CMD_READ1, col-256, page);

..and everything worked fine.

Please give me some feedback on the timing issue,

Sieme Teuling
