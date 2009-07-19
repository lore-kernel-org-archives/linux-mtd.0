Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSPSP-0007Cb-Vt
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 06:01:14 +0000
Subject: Re: block2mtd and ubi are initialized too early when compiled in
	on 2.6.31-rc2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tobias Diedrich <ranma@tdiedrich.de>
In-Reply-To: <20090716142816.GA19523@yamamaya.is-a-geek.org>
References: <20090715115235.GA21888@yamamaya.is-a-geek.org>
	<1247746844.11353.152.camel@localhost.localdomain>
	<20090716142816.GA19523@yamamaya.is-a-geek.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Jul 2009 09:00:59 +0300
Message-Id: <1247983259.11353.214.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-16 at 16:28 +0200, Tobias Diedrich wrote:
> Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Wed, 2009-07-15 at 13:52 +0200, Tobias Diedrich wrote:
> > > On 2.6.31-rc2 the block2mtd drivers module_init is called before any
> > > block devices have been registered.
> > 
> > Hmm, ok. Is this because block devices are registered asynchronously?
> > Could you please point to the code where it is done, just for reference.
> 
> AFAICS yes.
> All module_init()s are called asynchronously from init/main.c:do_initcalls()

They are done in a kernel thread, but sequentially, one after the other.
So there is no real synchronicity there.

I think the real problem is that block-devices are probed/initialized
asynchronously. E.g., see 'ata_host_register()'. They call
'async_schedule()' which is doing the slow initialization in a separate
thread.

Thus, you probably should to try to add something like
'async_synchronize_full()' to the blk2mtd driver and wait for block
devices to initialize. Or indeed 'wait_for_device_probe()' may be what
you need.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
