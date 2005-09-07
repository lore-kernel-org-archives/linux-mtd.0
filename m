Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECv0H-0005n4-MR
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 04:10:01 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.66.112])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 7 Sep 2005 08:09:55 -0000
Message-ID: <431EA052.5010303@gmail.com>
Date: Wed, 07 Sep 2005 10:09:54 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0IM4002SYUMFJ8@mmp2.samsung.com>
In-Reply-To: <0IM4002SYUMFJ8@mmp2.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Kyungmin, I'm still not completely clear about your bad block handling, 
sorry for bothering you another time.

In onenand_scan() you call scan_bbt() which calls onenand_memory_bbt() 
  which calls create_bbt() which builds the BBT using OOB data.
Fine so far.

But: the only time onenand_block_checkbad() is called is in 
onenand_erase() before issueing the (erase-)command to prevent erasing 
already scanned bad blocks.

Question: what about reading and writing (onenand_write_ecc(), 
onenand_read_ecc())? There is no onenand_block_checkbad() before 
issueing the write/read command. Shouldn't this be done??
scan_bbt() is only called on initial scan, e.g. device boot. What if 
this happens very rarely and bad blocks due to wear occur; that meant 
you cannot provide data integrity.

I wonder why this is not done in nand_base.c too. I'm afraid I missed 
some BBT stuff to gather in my investigations :-)... So please kindly 
excuse me if I'm wrong with my very limited MTD/OneNAND experience!

Best Regards,
Bernhard
