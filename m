Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNBXu-0006fd-BO
	for linux-mtd@lists.infradead.org; Mon, 10 May 2004 15:14:19 +0100
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BNBXd-000Ltd-0U
	for linux-mtd@lists.infradead.org; Mon, 10 May 2004 15:14:02 +0100
Content-Type: text/plain;
  charset="iso-8859-15"
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 May 2004 15:04:58 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <D917588A7DC5@baydel.com>
Subject: New NAND interface
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I explained, recently, on #mtd, that jffs2 was generating bad crc messages 
when running an NAND, smc. It was suggested that I get the latest code from 
CVS. I did this and it has taken me a while to get things going. 

Firstly nand_scan() now checks that data_buf and oob_buf have been assigned. 
Previously I only allocated space for data_buf and I did this after nand_scan 
had, conveniently, filled in some sizes fo me.  

It would seem now that the nand driver needs to select the appropriate sizes.
In some ways I feel this duplicates what nand_scan does the table in 
nand_ids.c.

I was also unsure as to the size of the oob_buf. After looking at nand.c it 
seems that this should be the oobsize * (erasesize / blockize) ?

I guess this makes sense as each block will have it's own oob.

After this I ran into problems with an SSFDC module. This module provides an 
SSFDC compatible block interface. It uses the mtd layer to read/write it's 
own data and oob. I noticed data corruption via this interface and started to 
investigate.

It would appear that the NAND layer now assigns automatic oob placements for 
NAND drivers which do not specify autooob. In my case this meant that when 
the SSFDC module called nand_write oob data was calculated and written. The 
module then called nand_write_oob to write it's own oob. Two writes like this 
could destroy the oob data and data integrity. For the moment I have fixed 
this in my NAND driver by specifying autooob with the useecc field set to 0.

Firstly I am concerned that this might cause problems with other users of the 
NAND driver.  Is there cause for concern ?

Secondly my SSFDC layer will only work with my NAND driver.
I guess what I really need to do is change the SSFDC layer but I am not sure 
how to go about this. I do not simply what to change ECC positions but the 
contents of the oob. 

Can anyone explain how I should do this ?


Cheers

Simon.
