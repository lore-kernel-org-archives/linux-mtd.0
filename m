Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWod-00067w-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:35:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110030044530.481-100000@lisa.rhpk.springfield.inwind.it> 
References: <Pine.LNX.4.33.0110030044530.481-100000@lisa.rhpk.springfield.inwind.it> 
To: Cristiano Paris <c.paris@libero.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD newbie 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:44:21 +0100
Message-ID: <14553.1002534261@redhat.com>
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

> netconsole: network logging started up successfully!
> jffs2_lookup()
> jffs2_create()
> jffs2_reserve_space(): Requested 0x44 bytes
> jffs2_reserve_space(): alloc sem got
> jffs2_do_reserve_space(): Giving 0xfffffffc bytes at 0x206004

It's already broken by this point. The free space in this block is -4 bytes. 
Can you start the console logging before mounting the filesystem?

--
dwmw2
