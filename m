Received: from web37704.mail.mud.yahoo.com ([209.191.87.102])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZriF-0004Mc-HR
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 12:55:00 -0400
Message-ID: <20070406164818.7863.qmail@web37704.mail.mud.yahoo.com>
Date: Fri, 6 Apr 2007 09:48:18 -0700 (PDT)
From: Iyer <maseriyer@yahoo.com>
Subject: RE: Magic bitmask 0x1985 messages,
	while attempting to mount a JFFS2 filesystem on dataflash
To: Jeff Fellin <jeff.fellin@coredgenetworks.com>,
	linux-mtd@lists.infradead.org
In-Reply-To: <005601c777cd$65287620$0b00a8c0@CoreEdgeNJ4>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jeff Fellin <jeff.fellin@coredgenetworks.com>
wrote:


> 
> >> Are you sure you entered the correct erase block
> size and padding options
> for the dataflash? 

Yes, I guess the erase block size and padding options
could be right, 

This is the result of mtd_debug info /dev/mtd4

-bash-3.1# mtd_debug info /dev/mtd4
mtd.type = (unknown type - new MTD API maybe?)
mtd.flags =
mtd.size = 2440944 (2M)
mtd.erasesize = 528
mtd.oobblock = 528
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

 The JFFS2 image was created with the options -e 528
 -n --pad= 777744 (a multiple of 528) for mkfs.jffs2
 (erase size:528 for the AT45DB321)

-iyer


 
____________________________________________________________________________________
The fish are biting. 
Get more visitors on your site using Yahoo! Search Marketing.
http://searchmarketing.yahoo.com/arp/sponsoredsearch_v2.php
