Received: from f88.law11.hotmail.com ([64.4.17.88] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eG4L-0001Gt-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 14:53:33 +0000
From: "Brian Peterson" <purdue1996@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 read only file system
Date: Thu, 30 Jan 2003 09:21:35 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F88wVN7miR9Odutox7n00006a28@hotmail.com>
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

Is this a bug or is there something I did incorrectly?
or is there a utility I can use to correct this at runtime?

Thanks,
Brian


----Original Message Follows----
From: David Woodhouse <dwmw2@infradead.org>
To: "Brian Peterson" <purdue1996@hotmail.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 read only file system
Date: Thu, 30 Jan 2003 10:50:13 +0000


purdue1996@hotmail.com said:
 >  During some testing of power loss scenarios, I lose the ability to
 > use the  device. The kernel boots and after it cleans up from the
 > unclean unmount, I  receive kernel messages indicating "Argh! No free
 > blocks found!..."

We should be able to fix this.

 > What level of confidence is there that the read only partition would
 > be  protected from this problem. In other words, can the data located
 > in the  Read only partition be trusted?

The data on the read only partition cannot be trusted any more than the
data in the read-write partition. It's all in one big pseudo-filesystem,
the partitioning is purely cosmetic.

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
