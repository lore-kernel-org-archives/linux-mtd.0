Received: from pd9eb9213.dip.t-dialin.net ([217.235.146.19] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aGW7-0008M8-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 13:29:12 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Mon, 11 Feb 2002 14:42:57 +0100
Cc: <linux-mtd@lists.infradead.org>, <jffs-dev@axis.com>
References: <Pine.LNX.4.44.0202071703480.11698-100000@lapdancer.baythorne.internal>
In-Reply-To: <Pine.LNX.4.44.0202071703480.11698-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Message-Id: <02021114425704.00764@thomas>
Content-Transfer-Encoding: 8bit
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

On Thursday,  7. February 2002 08:04, David Woodhouse wrote:
> On Thu, 7 Feb 2002, Thomas Gleixner wrote:
> > I mean we should keep the batch write. Thats correct. But we can leave
> > the cleanmarker where it is now and write it without ECC and put the rest
> > of the page with ECC. On small NAND devices we have only 8byte spare area
> > per block. We need 3 byte for ECC and at least 1 byte for flags. Then the
> > cleanmarker area is reduced to 4 bytes. Is that enough ?
>
> Yeah, that's fine. We can do either - I'm not sure it matters too much.

I'm going to merge your current CVS code with my wbuf changes. 
But we should decide what to do with the cleanmarker stuff and the usage of 
the spare area.
On devices with 512 byte pagesize we have a spare area of 16 byte. On smaller 
devices with 256 byte pagesize we have only 8 byte.
We have already some layouts for the spare area:
DOC
Byte 0-5	ECC
Byte 6-7	block used status (0x55,0x55)
Byte 8-15	not assigned

SmartMediaCard 256 Byte pagesize
Byte 0-5	not assigned
Byte 6		bad block status
Byte 7		not assigned

SmartMediaCard 512 Byte pagesize
Byte 0-5	not assigned
Byte 6		bad block status
Byte 7		not assigned
Byte 8-15	not assigned

Raw Nand Chips 256 Byte pagesize
Byte 0-7	not assigned

Raw Nand Chips 512 Byte pagesize
Byte 0-15	not assigned

The bad block status on the SmartMediaCards is programmed to a value 
different to 0xff by the manufacturer. We should use this too. 
Bad blocks on raw NAND chips are marked by values different to 0xff in the 
first two pages of a block. 
I don't know, if there's a similar technique on DOC.

I think the SmartMedia bad block indication is much more convenient than the 
raw NAND solution. May be we can implement a utility to move the bad block 
info into the spare area on raw NAND chips, so the bad block indication would 
be the same. This could also be done at production time or be part of a 
bootloader, because it has to done only once. 
The nand driver should exclude these blocks from erase/write to keep this 
information intact. But then we should read the bad block information at 
mount time too. This can easily be done with the read_cleanmarker_oob 
function. If we detect a bad block during operation, we could mark it the 
same way, so the block is excluded for ever. 

Layout with cleanmarker in spare area:
DOC
Byte 0-5	ECC
Byte 6-7	block used status (0x55,0x55) or bad block (value != 0x55 && != 0xff)
Byte 8-15	cleanmarker

SmartMedia and raw NAND 512 Byte pagesize
Byte 0-5	ECC
Byte 6		bad block status
Byte 7 		page data valid flag
Byte 8-15	cleanmarker

SmartMedia and raw NAND 256 Byte pagesize
Byte 0-2	ECC for even page
Byte 3-5	cleanmarker
Byte 6		bad block status
Byte 7		page data valid flag

Some information about the current state. I ran a 24h test with copying, 
moving, deleting files with random power down. The filesystem is clean and we 
have no data loss except some broken files on powerdown. But nothing in the 
world can help, if we write a new file and loose power before we finished it.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
