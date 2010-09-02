Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrDn5-0001Nx-VK
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:41:36 +0000
Received: by eye22 with SMTP id 22so536490eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:41:33 -0700 (PDT)
Subject: Re: mkfs.ubifs gives corrupt images/crc errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTi=XuMVcfBLnyUAKN7WcBDnH0eH+J5Dcy28ZkEJ5@mail.gmail.com>
References: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
	<1282465361.16502.53.camel@brekeke>
	<AANLkTi=XuMVcfBLnyUAKN7WcBDnH0eH+J5Dcy28ZkEJ5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 20:40:53 +0300
Message-ID: <1283449253.1694.5.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-02 at 19:28 +0200, Leo Barnes wrote:
> Sorry for not answering earlier, I was on vacation without internet
> access. I have not tested the absolutely latest commits, but I have
> now identified the problem.
> 
> In commit 2d40ed7b415bcb6a358c9f221160c4a419f01f19, the
> crc-calculation function changed from being an inline function to a
> linked function called crc32. There already exists a crc32 function
> with the same arguments in ZLIB, which does not seem to give the same
> checksums as the mtd-utils crc-function. After the mentioned commit,
> mkfs.ubifs seems to use the ZLIB crc32-function instead of the
> mtd-utils version which is what gives the faulty checksums.
> 
> I managed to fix this in two simple ways:
> 1. Change the order of linking in the makefile so that libmtd comes
> before libz. This might possibly break ZLIB (I have not tried this
> when using ZLIB).
> 2. Change the name of the mtd-utils crc32 function.
> 
> Changing the name of the function is probably the preferred option.

Right, another guy reported the same issue a couple of days ago and I
fixed this.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
