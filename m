Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154PK5-0005VT-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 May 2001 16:52:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B12A202.3040409@niisi.msk.ru> 
References: <3B12A202.3040409@niisi.msk.ru>  <3B0EE8CF.7040502@niisi.msk.ru> <20010526000119.A23273@suse.de> 
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 May 2001 16:36:15 +0100
Message-ID: <26581.991064175@redhat.com>
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


andreev@niisi.msk.ru said:
>  It may happen that one  CPU is reading and other CPU is writing data
> at the same time. So, the  flash memory can return status value
> instead of data, for example. Does  the chip->mutex lock provides
> necessary synchronization?

Yes. The flash driver is required to make that work correctly. The (blkdev)
request functions aren't required to be reentrant anyway, I believe.

> I look at the other block device drivers code and found, that
> io_request  handlers do sti() in some cases. If you still don`t want
> to do it, we  could use a softirq. In the do_fd_request(), the "bottom
> halves" is used  for example. We could use a "bottom halves" or even a
> tasklet in our  case. What do you think about this?

Take a look at the way it's done by the mtdblock device, with a kernel 
thread.

--
dwmw2
