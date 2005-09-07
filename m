Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECyNL-0008A7-Ig
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 07:46:05 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IMG000T73AUFA@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 20:44:54 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IMG00LHP3AUMC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 20:44:54 +0900 (KST)
Date: Wed, 07 Sep 2005 20:44:55 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <431EA052.5010303@gmail.com>
To: 'Bernhard Priewasser' <priewasser@gmail.com>
Message-id: <0IMG00LHQ3AUMC@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND: Simple Bad Block handling support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Kyungmin, I'm still not completely clear about your bad block 
> handling, 
> sorry for bothering you another time.
> 
> In onenand_scan() you call scan_bbt() which calls 
> onenand_memory_bbt() 
>   which calls create_bbt() which builds the BBT using OOB data.
> Fine so far.
> 
> But: the only time onenand_block_checkbad() is called is in 
> onenand_erase() before issueing the (erase-)command to 
> prevent erasing 
> already scanned bad blocks.
> 
> Question: what about reading and writing (onenand_write_ecc(), 
> onenand_read_ecc())? There is no onenand_block_checkbad() before 
> issueing the write/read command. Shouldn't this be done??
> scan_bbt() is only called on initial scan, e.g. device boot. What if 
> this happens very rarely and bad blocks due to wear occur; that meant 
> you cannot provide data integrity.
> 
> I wonder why this is not done in nand_base.c too. I'm afraid I missed 
> some BBT stuff to gather in my investigations :-)... So please kindly 
> excuse me if I'm wrong with my very limited MTD/OneNAND experience!
> 

Yes, The bbt scheme is same as NAND does. and OneNAND bbt is subset of NAND
bbt.
IMHO, There's some historical reason. If I was worng. please correct it
MTD only provides basic operations and handles initial badblock.
The rest is the part of FTL or Filesystem. Is it right?

Regards,

Kyungmin Park
