Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ISxZo-0002ag-NZ
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 12:18:06 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l85GHlW4018871
	for <linux-mtd@lists.infradead.org>; Wed, 5 Sep 2007 12:17:47 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l85GHiKt269798
	for <linux-mtd@lists.infradead.org>; Wed, 5 Sep 2007 10:17:46 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l85GHinU014295
	for <linux-mtd@lists.infradead.org>; Wed, 5 Sep 2007 10:17:44 -0600
Date: Wed, 5 Sep 2007 11:17:43 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Andy Kennedy <akennedy@techmoninc.com>
Subject: Re: backtrace.S & printk()
Message-ID: <20070905111743.0313e6b1@weaponx.rchland.ibm.com>
In-Reply-To: <46DED5D3.7080502@techmoninc.com>
References: <46DED5D3.7080502@techmoninc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 05 Sep 2007 11:14:11 -0500
Andy Kennedy <akennedy@techmoninc.com> wrote:

> Russel:
> 
> While attempting to build a kernel without printk in it, I ran across an 
> error in your backtrace.S file.  It appears that you are assuming that 
> all arm kernels will be built with printk().  What is your reason for 
> this?  What are the ramifications of me taking out those three sections 
> of code?

Erm... wrong list?  This is the MTD list, not the ARM list...

josh
