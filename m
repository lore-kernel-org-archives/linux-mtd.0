Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNCrc-00073l-Nn
	for linux-mtd@lists.infradead.org; Mon, 10 May 2004 16:38:44 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: simon@baydel.com,
 linux-mtd@lists.infradead.org
Date: Mon, 10 May 2004 17:32:23 +0200
References: <D917588A7DC5@baydel.com>
In-Reply-To: <D917588A7DC5@baydel.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200405101732.23971.tglx@linutronix.de>
Subject: Re: New NAND interface
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 10 May 2004 16:04, Simon Haynes wrote:
> I explained, recently, on #mtd, that jffs2 was generating bad crc messages
> when running an NAND, smc. It was suggested that I get the latest code from
> CVS. I did this and it has taken me a while to get things going.
>
> Firstly nand_scan() now checks that data_buf and oob_buf have been
> assigned. Previously I only allocated space for data_buf and I did this
> after nand_scan had, conveniently, filled in some sizes fo me.
> It would seem now that the nand driver needs to select the appropriate
> sizes. In some ways I feel this duplicates what nand_scan does the table in
> nand_ids.c.

The ids provide information about the chip and its features. nand_scan is a 
bit more complicated now, as we read the extended id to get more information 
about the chip. This allows us to use one driver setup for different 
chiptypes.

> I was also unsure as to the size of the oob_buf. After looking at nand.c it
> seems that this should be the oobsize * (erasesize / blockize) ?

Yep. I explained this in 
http://lists.infradead.org/pipermail/linux-mtd/2004-April/009632.html

> I guess this makes sense as each block will have it's own oob.
>
> After this I ran into problems with an SSFDC module. This module provides
> an SSFDC compatible block interface. It uses the mtd layer to read/write
> it's own data and oob. I noticed data corruption via this interface and
> started to investigate.
>
> It would appear that the NAND layer now assigns automatic oob placements
> for NAND drivers which do not specify autooob. In my case this meant that
> when the SSFDC module called nand_write oob data was calculated and
> written. The module then called nand_write_oob to write it's own oob. Two
> writes like this could destroy the oob data and data integrity. For the
> moment I have fixed this in my NAND driver by specifying autooob with the
> useecc field set to 0.

Sorry, I was not aware that you have a block driver for SM-FAT. Is this driver 
available anywhere ? 

> Firstly I am concerned that this might cause problems with other users of
> the NAND driver.  Is there cause for concern ?

AFAIK, are JFFS2 and YAFFS the only clients of NAND driver, except your SSFDC 
module.

> Secondly my SSFDC layer will only work with my NAND driver.
> I guess what I really need to do is change the SSFDC layer but I am not
> sure how to go about this. I do not simply what to change ECC positions but
> the contents of the oob.

Yep. Have a look at YAFFS or JFFS2. There we build a oob layout where the ECC 
placement is defined. The useecc member is set to MTD_NANDECC_PLACE, which 
means you define the ECC positions.
The data for the oob area can either be programmed seperately or written along 
with the main area data. See http://linux-mtd.infradead.org/tech/nand.html or 
have a look into the YAFFS code.

If you have more questions feel free to ask or let me have a look into the 
code so I can give you more detailed hints.

Thomas
