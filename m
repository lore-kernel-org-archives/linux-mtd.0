Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEC3h-00029p-6Q
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 19:57:57 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
 linux-mtd@lists.infradead.org
Date: Thu, 15 Apr 2004 20:52:32 +0200
References: <a06002006bca469e103ce@[130.161.115.44]>
In-Reply-To: <a06002006bca469e103ce@[130.161.115.44]>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404152052.32923.tglx@linutronix.de>
Subject: Re: NAND bad blocks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 April 2004 18:39, J.D. Bakker wrote:
> Hi all,
>
> There's a slight discrepancy between what mtd and mkyaffs consider a bad
> block.
> ...which would indicate that even one bit set to zero would mark the
> block bad. However, mkyaffs.c has this code:
>
>    /* Read the OOB data to determine if the block is valid.
>     * If the block is damaged, then byte 5 of the OOB data will
>     * have at least 2 zero bits.
>     */

Thats hard to say, as the datasheets tell different stories.
But most of them say, that any bit set to zero marks the block bad

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
