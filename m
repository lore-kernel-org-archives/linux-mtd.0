Received: from mtagate3.de.ibm.com ([195.212.29.152])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HXIHD-00014z-W4
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 15:40:29 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id l2UEeH8M036872
	for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2007 14:40:17 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2UEeHZh2142328
	for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2007 16:40:17 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2UEeHhD001751
	for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2007 16:40:17 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com
Subject: Re: [RFC] [PATCH] UBI: refine wear leveling logic
Date: Fri, 30 Mar 2007 16:40:06 +0200
References: <200703281547.18851.alexs@linux.vnet.ibm.com>
	<200703291359.25593.alexs@linux.vnet.ibm.com>
	<460D015F.6080305@nokia.com>
In-Reply-To: <460D015F.6080305@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703301640.07170.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 30 March 2007, Artem Bityutskiy wrote:
> > If so then i propose to make get_peb() wait until the bgt produces a free
> > peb and not mix synchronous/asynchronous operations, as this would make
> > the code easier, IMO.
> 
> It already does this AFAIK.

In the current code, wl_get_peb() calls produce_free_peb() if the
free tree is empty and thereby performs a synchronous work (even if the
bgt is enabled). This is what I meant with "mixing" sync/async.

So I think making the user thread wait for the wl thread to free a peb
(e.g. by sleeping while waiting for a semaphore) could lead to a better
performance as the wl thread will likely finish its work before the user
thread has performed a whole work.

Regards,
Alex
