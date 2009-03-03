Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LeOHN-00020J-Ck
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 06:39:04 +0000
Subject: Re: libubiio : userspace UBI input output library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sidney Amani <seed95@gmail.com>
In-Reply-To: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Mar 2009 08:38:31 +0200
Message-Id: <1236062311.4261.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-03-01 at 15:45 +0100, Sidney Amani wrote:
> Hi list,
> 
> UBIIO library is an user-space library which exports same functions in
> UBI Linux kernel module.
> It provides exactly the same API as the kernel does, that way kernel
> code can be used in user-space without any change.
> The code is widely inspired with libubi source code.
> 
> Documentation can be found at http://uffs.org/api/libubiio.html
> It is obviously the same as UBI kernel API, but there is actually few
> differences in return values.
> 
> The code can be found at http://git.uffs.org/
> 
> We would like to know if you are interested in it and want to include
> it in mtdutils.

Hi, I guess this is useful. Just wonder, if you are targeted to
mtd-utils, why not to develop in there from the very beginning? Use
similar coding style, clean-up current code if needed, etc?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
