Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AI7K2-0001aP-A2
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2003 14:10:46 +0000
From: Simon Haynes <simon@baydel.com>
To: linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Date: Fri, 7 Nov 2003 13:12:54 +0000
MIME-Version: 1.0
Message-ID: <37CC93E8710D@baydel.com>
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8bit
Subject: SFFDC and blksize_size
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have been writing a block driver for SSFDC compliant SMC cards. This stuff 
allocates 16k blocks.  When I get requests the transfers are split into the 
size I specifty in the blksize_size{MAJOR] array. It sems that most things 
set this to 1k. In my case this causes a performance problem  as I have to 
end up doing 16 * (16K write,  16K read, 16k erase)  to write and verify a 
16k block which has been previously written.
 
I increased this size to 4k and now I only need 4 * this lot. !deally I would 
like to do 1. However if I set the block size to 16k the module installation 
crashes when I call register_disk. 

I guess I could deal with the request queue myself but I would just like to 
know if there is a 4k limit or I have some other bug.

Many Thanks

Simon.
