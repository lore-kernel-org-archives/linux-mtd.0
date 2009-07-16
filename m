Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPxb-0004UC-Ih
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 12:21:20 +0000
Subject: Re: block2mtd and ubi are initialized too early when compiled in
	on 2.6.31-rc2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tobias Diedrich <ranma@tdiedrich.de>
In-Reply-To: <20090715115235.GA21888@yamamaya.is-a-geek.org>
References: <20090715115235.GA21888@yamamaya.is-a-geek.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 15:20:44 +0300
Message-Id: <1247746844.11353.152.camel@localhost.localdomain>
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

Hi,

On Wed, 2009-07-15 at 13:52 +0200, Tobias Diedrich wrote:
> On 2.6.31-rc2 the block2mtd drivers module_init is called before any
> block devices have been registered.

Hmm, ok. Is this because block devices are registered asynchronously?
Could you please point to the code where it is done, just for reference.

> Also ubi is initialized pretty early and fails completely if an mtd
> specified on the command line could not be found.

Hmm...

> IMO ubi should at least complete initialization so that attaching
> the mtd later with ubiattach would still work.
> I'm working around this two hacky patches that create a kernel
> thread and retry every second for 20 seconds when the first try
> doesn't work.
> (Obviously this means rootdelay=$somenumber is needed)
> I tried using the async infrastructure, but apparently
> async_synchronize_full is called somewhere between registering the
> async probe thread and the target USB device being registered by the
> USB subsystem, which halts boot until my 20 second timeout, and the
> USB stick is only detected afterwards.
> 
> FWIW I want to use a erasesize aware FS on my USB stick (whose
> builtin FTL has abysmal write performance if writes are less than
> the erasesize) and also be able to use this as my root fs.
> So my setup is usb_storage->block2mtd->ubi->ubifs

Hmm, how other subsystems solve this problem? Any pointer to the code?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
