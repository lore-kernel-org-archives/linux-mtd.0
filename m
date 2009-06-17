Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGqWo-0007ON-6y
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 08:30:02 +0000
Subject: Re: how to implement prepare_write, commit_write for ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ivan Chan <ivanming@gmail.com>
In-Reply-To: <d16af8a00906170053p11a4f0e3vd0bbef99d65b9aac@mail.gmail.com>
References: <d16af8a00906170053p11a4f0e3vd0bbef99d65b9aac@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Jun 2009 11:29:24 +0300
Message-Id: <1245227364.9487.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-17 at 15:53 +0800, Ivan Chan wrote:
> Hi all,
> 
> I am porting UBIFS/UBI to 2.6.4 kernel, however, 2.6.4 kernel requires
> prepare_write, commit_write in address_space_operations (defined in
> include/linux/fs.h),
> but it is no longer exists in 2.6.2x kernel.
> 
> How can I rewrite these function for 2.6.4 kernel?
> 
> In 2.6.2x, there is similar function write_begin, and write_end, but
> the API requires
> struct address_space *mapping,  struct page **pagep, void **fsdata,
> 
> Is that possible and how to provide this argument in 2.6.4 kernel?

ATM we support UBIFS back-ports from v2.6.24 to v2.6.30.

The change of the address space operation happened between 2.6.23 and
2.6.24.

In the paste, we also supported UBIFS back-ports for kerneld
2.6.21-2.6.23. But then we dropped them because it became increasingly
difficult to back-port stuff there.

So what would suggest you do is:

a). Start with the old and unsupported 2.6.23 UBIFS back-port which you
may find here: git://git.infradead.org/users/dedekind/ubifs-v2.6.23.git

b). Back-port this UBIFS 2.6.23 stuff to your ancient 2.6.4, it should
be easier to do comparing to back-porting the newest stuff.

c). Back port the rest of the UBIFS changes/fixes from the latest
kernels, e.g., from the UBIFS 2.6.30 back-port.

The back-ports URLS may be found here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

Or just see here:
http://git.infradead.org/

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
