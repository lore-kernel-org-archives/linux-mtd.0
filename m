Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Z3Ck-0006u6-Er
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 07:40:58 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h666fCD59510	for <linux-mtd@lists.infradead.org>;
	Sat, 5 Jul 2003 23:41:12 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: Gregg C Levine <hansolofalcon@worldnet.att.net>
In-Reply-To: <000001c34351$aa810520$239efea9@who5>
References: <000001c34351$aa810520$239efea9@who5>
Message-Id: <1057473735.2659.247.camel@localhost>
Mime-Version: 1.0
Date: 05 Jul 2003 23:42:15 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: File systems and Disk on Chips
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-07-05 at 17:00, Gregg C Levine wrote:
> Hello from Gregg C Levine
> I have here a 2 Megabyte Disk on Chip device, plugged into a carrier
> board. It is now wearing the GRUB based firmware. How when I bring up
> my system, the DOC device complains about the lack of a file system.
> Any ideas as to how I could put a file system on this device?
> Preferably as a native Linux format.

Basically, you put a block filesystem on top of NFTL that grub
understands. Grub does not at this point understand YAFFS or JFFS2 on
NAND flash, but I'm sure there a lot of people who are looking for that
and it wouldn't be difficult to do.

-- 
Russ Dill <Russ.Dill@asu.edu>
