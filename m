Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WG5E-0005Qq-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 12:12:52 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, gleixner@autronix.de
Subject: Re: JFFS2 on NAND flash
Date: Thu, 31 Jan 2002 13:26:02 +0100
Cc: linux-mtd@lists.infradead.org
References: <02013022481901.00763@thomas> <15998.1007200283@redhat.com> <17832.1012472563@redhat.com>
In-Reply-To: <17832.1012472563@redhat.com>
MIME-Version: 1.0
Message-Id: <02013113260208.00763@thomas>
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

On Thursday, 31. January 2002 11:22, David Woodhouse wrote:
> Be careful. You have nothing there to make sure that it doesn't violate the
> constraints on the number of write cycles per page. You have no ECC, you
> have no real chance of it working in the wild.
I know that and i was trying to put a workaround for the write cycle problem 
into the nand driver. I think thats the correct location for this. Are there 
other chips dealing with the same problem or is it related to NAND only ?
My current solutiun would be:
In nand.c the write functions checks the write attempts to a page. If there 
were three writes already to this page, the function reads back the block 
data, erases the block and writes the block data back to the chip. 

Is this also a problem for jffs1 ? I run jffs1 for a couple of weeks on my 
board and had not one problem at all. 

> Also note that the locking in jffs2_garbage_collect_deletion_dirent() is
> broken. We need to lock the erase_completion_lock while we go through the
> list, and drop the lock when we read the nodes.
I'm not deep enough inside this to see the neccecary change. Could you please 
explain more detailed ?

> All the writev stuff was put there for the benefit of NAND flash - so yes,
> nobody's used it yet. This problem had come up recently in the eCos port,
> but the fix hadn't yet propagated to the main tree.
No problem it took only some time to understand what happens there.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
