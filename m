Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuusP-0002ru-1o
	for linux-mtd@lists.infradead.org; Sat, 29 Jan 2005 10:51:10 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0TFp7ZW017333
	for <linux-mtd@lists.infradead.org>; Sat, 29 Jan 2005 10:51:07 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0TFp7vO070718
	for <linux-mtd@lists.infradead.org>; Sat, 29 Jan 2005 10:51:07 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0TFp6xB007499
	for <linux-mtd@lists.infradead.org>; Sat, 29 Jan 2005 10:51:06 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1106998793.17802.3.camel@sauron.oktetlabs.ru>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Sat, 29 Jan 2005 09:51:00 -0600
Message-Id: <1107013860.10670.5.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-01-29 at 14:39 +0300, Artem B. Bityuckiy wrote:
> > This concept extends to any sort of "binary" data that one would want on
> > the device.  To access the data contained in said eraseblocks, one could
> > write a device driver that understood the data and presented it to the
> > user via a MTD device.
> Josh,
> 
> Am I correct that you are thinking about the idea to have "binary" data
> on flash which does not belong to JFFS2 and JFFS2 should just move it
> iact from time to time reusing their blocks for better wear-leveling?
> 

Not necessarily.  I was actually thinking of having JFFS2 just "ignore"
such eraseblocks.  Essentially treating them as bad blocks perhaps.

However, such blocks could be scattered across the entire device rather
than contained within a certain address range on the chip.  Updating the
data would be a bit tricky, which is why I said a driver would need to
be created in order to deal with it.

josh
