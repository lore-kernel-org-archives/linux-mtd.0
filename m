Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HKAHJ-0006lF-IG
	for linux-mtd@lists.infradead.org; Thu, 22 Feb 2007 04:30:20 -0500
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1M9Rqtu030776
	for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2007 11:28:01 +0200
Message-ID: <45DD6259.8010504@nokia.com>
Date: Thu, 22 Feb 2007 11:28:57 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: OneNAND: Rate of write errors
References: <e167438e0702211621i2eadbf15s33db7c34dc989bb2@mail.gmail.com>
In-Reply-To: <e167438e0702211621i2eadbf15s33db7c34dc989bb2@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Julianne C. wrote:
> We are still struggling to understand and manage the OneNAND part on a
> LogicPD PXA270 board.  We are using the mtd development snapshot build
> of 2-15-07 for the fs and device layers.  Our requirements lead us to
> use JFFS2 as the file system.
> 
> What we are seeing is that when we write to a file system that is
> freshly erased and mounted using the command:
>> mount -t jffs2 /dev/mtdblockx /mnt
> and then performing some operation like tar or rsync to place files in
> the new fs, we see about 5 to 8 "write errors" of the form per MB:
> 
> onenand_write: verify failed -74
> Write of 2663 bytes at 0x007a6e14 failed. returned -74, retlen 0
> Not marking the space at 0x007a6e14 as dirty because the flash driver
> returned retlen zero

Note that verify errors will not occur if you have ECC turned on because
you will get ECC errors instead, in which case I would say the block
is bad.  Possibly you have inadvertently removed a bad block marker.

The other possibility is that the data is not making it to OneNAND
correctly in the first place.  By default this is done by
onenand_write_bufferram.  You could add a comparison to be sure.

Also I guess jffs2 would be happier if the length was returned
when the verify fails, say like this:

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 1a38414..8fc1570 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1238,6 +1238,8 @@ static int onenand_write(struct mtd_info
 			break;
 		}
 
+		written += thislen;
+
 		/* Only check verify write turn on */
 		ret = onenand_verify(mtd, (u_char *) wbuf, to, thislen);
 		if (ret) {
@@ -1245,8 +1247,6 @@ static int onenand_write(struct mtd_info
 			break;
 		}
 
-		written += thislen;
-
 		if (written == len)
 			break;
 



> Is this common to see this many errors in that amount of page writes?

Not in my experience with OneNAND.
