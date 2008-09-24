Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KiTPT-0001X6-Q4
	for linux-mtd@lists.infradead.org; Wed, 24 Sep 2008 12:24:04 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8OCMt42024729
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2008 08:22:55 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8OCInZq212658
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2008 08:18:49 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8OCInlH009612
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2008 08:18:49 -0400
Date: Wed, 24 Sep 2008 08:18:42 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Suresh Rajashekara <suresh@mistralsolutions.com>
Subject: Re: Determining if the GC is operating on flash
Message-ID: <20080924081842.5e5bedef@zod.rchland.ibm.com>
In-Reply-To: <20080923194155.ar77clo3dykkgwwc@webmail.mistralsolutions.com>
References: <20080923194155.ar77clo3dykkgwwc@webmail.mistralsolutions.com>
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

On Tue, 23 Sep 2008 19:41:55 -0500
Suresh Rajashekara <suresh@mistralsolutions.com> wrote:

> Hi All,
> 
> Is there any conslusive way of knowing if the JFFS2 GC is operating on  
> the flash? I want to know that during the bootup. I am using JFFS2 on  
> 2.6.16-rc3.

No.

There are two forms of GC in JFFS2.  The first is as-needed.  Which
means that if GC is needed at the time of a process writing to flash,
the GC code will be called on behalf of that process.

The second is the background GC thread, which will do GC if certain
thresholds are reached. This is just an optimization, and the thread can
be killed entirely without effecting overall GC operation.

josh
