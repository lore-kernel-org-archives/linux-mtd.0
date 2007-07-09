Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I7tBF-0003AN-HW
	for linux-mtd@lists.infradead.org; Mon, 09 Jul 2007 14:21:34 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l69DIu6h005709
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 09:18:56 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l69DItgF194794
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 07:18:55 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l69DIt6E012359
	for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2007 07:18:55 -0600
Subject: Re: write buffer for MTD devices?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Seongsu Lee <senux@senux.com>
In-Reply-To: <20070705043604.GA10478@pooky.senux.com>
References: <20070705043604.GA10478@pooky.senux.com>
Content-Type: text/plain
Date: Mon, 09 Jul 2007 08:18:54 -0500
Message-Id: <1183987134.14824.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-07-05 at 13:36 +0900, Seongsu Lee wrote:
> Hi,
> 
> You know that block devices such as hard disk has write buffer
> in hard disk itself to speed up the write performance.
> (The write buffer speed up when it works in write-back mode.)
> 
> My questions are: (only for NAND flash memory)
> 
> 1) Then, does MTD devices has write buffer in device itself?

The mtdblock driver does.  It caches one eraseblock.  JFFS2 also has a
write buffer.  Other than that, no.

> 2) If ret->mtd->write() returns OK, is the data sent by user
>    successfully written on flash memory media? (not cache or
>    buffer)

Depends.  If the write is being done to an mtdblock, then it is written
to the cache.  If it's being done to a "real" device, then it should be
written to flash.

> Any comments, related matrials or URLs are needed.

It's all in the code.

josh
