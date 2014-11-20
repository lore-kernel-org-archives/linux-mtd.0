Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrWWT-0008L5-3J
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 18:32:05 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so3515467pdi.41
 for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2014 10:31:43 -0800 (PST)
Date: Thu, 20 Nov 2014 10:31:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roland Kletzing <devzero@web.de>
Subject: Re: please consider removing netsc520 driver from drivers/mtd/maps/
Message-ID: <20141120183140.GG24364@ld-irv-0074>
References: <trinity-73ac0136-01d6-4251-acb9-e48ca8ce1273-1416498438753@3capp-webde-bs05>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-73ac0136-01d6-4251-acb9-e48ca8ce1273-1416498438753@3capp-webde-bs05>
Cc: dwmw2@infradead.org, fengguang.wu@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 20, 2014 at 04:47:18PM +0100, Roland Kletzing wrote:
> every now and then i stumble across this "broken" module, and wonder if this 
> cannot be removed in 2014. I`m quite sure nobody will be missing that one in 
> 3.18+ kernels.

Probably not.

> it`s still being shipped as a module by popular distros like recent debian or
> ubuntu. waste of diskspace and compile time, imho.

Yep. But that's partly the distro's fault.

> there are even chances that these driver being accidentally statically linked
> into kernels, e.g. https://lkml.org/lkml/2013/9/25/666 (cc fenguang wu because 
> of this)
> 
> also see
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=10840
> ---
> This is a driver for an obscure embedded demonstration board. It's also one where
> there doesn't seem to be a good way to sanity check before probing. Quite why any
> standard PC distro would ship it is beyond me

Yeah, this driver sucks and is probably redundant. It looks like you
could probably just get by with the physmap.c driver instead.

> ps:
> not subscribed to this list - hope this list allows for unsubscribed posting 
> like lkml

...

Does this help you?

  https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3579ad4113dd6102866abb0ac7b8f329e7d41e4e

  commit 3579ad4113dd6102866abb0ac7b8f329e7d41e4e
  Author: Jean Delvare <jdelvare@suse.de>
  Date:   Fri Mar 14 18:14:20 2014 +0100

      mtd: Fix Elan SC520 dependencies

It means that most distros should not be shipping it any more, since it
depends on CONFIG_MELAN.

I'm also not opposed to dropping the driver entirely.

Perhaps we can mark the Kconfig entry CONFIG_BROKEN (i.e., depends on
BROKEN), and then remove it entirely if no one complains after a while.

I'll take a patch from you that does ths, if you want to write a little
bit of context in a commit message.

Thanks,
Brian
