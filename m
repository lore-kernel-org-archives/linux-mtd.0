Received: from natwar.webmailer.de ([192.67.198.70] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WI1L-0005ZR-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 14:17:00 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 on NAND flash
Date: Thu, 31 Jan 2002 15:29:17 +0100
Cc: linux-mtd@lists.infradead.org
References: <02013022481901.00763@thomas> <17832.1012472563@redhat.com> <02013113260208.00763@thomas>
In-Reply-To: <02013113260208.00763@thomas>
MIME-Version: 1.0
Message-Id: <0201311529170D.00763@thomas>
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

On Thursday, 31. January 2002 13:26, Thomas Gleixner wrote:
> Is this also a problem for jffs1 ? I run jffs1 for a couple of weeks on my
> board and had not one problem at all.

Stupid question ! It happens on jffs1 too. I built in a check for consecutive
page writes and it happens sometimes. The maximum number of consecutive
writes to a page was 4. But there was never a loss of data or something like
this. Strange !

> I know that and i was trying to put a workaround for the write cycle
> problem into the nand driver. I think thats the correct location for this.
> Are there other chips dealing with the same problem or is it related to
> NAND only ?
> My current solutiun would be:
> In nand.c the write functions checks the write attempts to a page. If there
> were three writes already to this page, the function reads back the block
> data, erases the block and writes the block data back to the chip.

Works, but in case of powerdown between erase and writeback the filesystem is
left corrupted.
There would be a easy solution for this inside the nand-driver. The nand
driver reserves some blocks at the end of the device and uses them to store
the block data. If the data are succesfully stored the concerned block can be
erased safely and data put back into this. In case of reset between erase and
writeback the data is safe. When bringing up the NAND-driver we could check,
if there is a safed block in the buffer and bring it back to the original
location before mounting. This would not bring all this NAND problems into
jffs and jffs2.

Thomas
_________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
