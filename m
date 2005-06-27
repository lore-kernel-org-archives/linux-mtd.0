Received: from rwcrmhc14.comcast.net ([216.148.227.89])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dn0rS-00042v-Gx
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 17:09:47 -0400
From: Charles Tilbury <charles.tilbury@comcast.net>
To: linux-mtd@lists.infradead.org
Date: Mon, 27 Jun 2005 14:09:42 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506271409.42449.charles.tilbury@comcast.net>
Subject: NAND flash question
Reply-To: charles.tilbury@comcast.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have a bug fix and a question.  

First the bug fix:

There are some NAND flash parts that have an undocumented busy time after an 
address is passed to it.  I am working with the 16M byte x 8 bit Toshiba part 
that has this.  I am using the default "command" function.  In order to get 
it to work, I added a check to see if the part is busy _before_ I try to 
submit a command to the part.  If the part is not busy, then the test just 
falls through.

Now the question:

I am using an ST Micro 64M byte x 8 bit flash part and JFFS2.  It mostly works 
except that when the board reboots, JFFS2 reports CRC error messages when the 
partition mounts again.  The strange part is that there does not seem to be 
any data corruption or lost data.  Also, I do not see any error messages 
while reading and writing.  However, the CRC errors seem to accumulate over 
time.  Is there some way to prevent this from happening?  Repair it?  Should 
I just ignore it?

Thanks in advanse,
Charles Tilbury
Seattle, WA
USA
