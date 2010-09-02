Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrDaA-0006LN-Hs
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:28:15 +0000
Received: by pzk3 with SMTP id 3so252339pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:28:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282465361.16502.53.camel@brekeke>
References: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
	<1282465361.16502.53.camel@brekeke>
Date: Thu, 2 Sep 2010 19:28:02 +0200
Message-ID: <AANLkTi=XuMVcfBLnyUAKN7WcBDnH0eH+J5Dcy28ZkEJ5@mail.gmail.com>
Subject: Re: mkfs.ubifs gives corrupt images/crc errors
From: Leo Barnes <barnes.leo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I cannot reproduce this. Does this still happen for you? Does cloning
> the mtd-utils git tree anew help?
>

Hello!

Sorry for not answering earlier, I was on vacation without internet
access. I have not tested the absolutely latest commits, but I have
now identified the problem.

In commit 2d40ed7b415bcb6a358c9f221160c4a419f01f19, the
crc-calculation function changed from being an inline function to a
linked function called crc32. There already exists a crc32 function
with the same arguments in ZLIB, which does not seem to give the same
checksums as the mtd-utils crc-function. After the mentioned commit,
mkfs.ubifs seems to use the ZLIB crc32-function instead of the
mtd-utils version which is what gives the faulty checksums.

I managed to fix this in two simple ways:
1. Change the order of linking in the makefile so that libmtd comes
before libz. This might possibly break ZLIB (I have not tried this
when using ZLIB).
2. Change the name of the mtd-utils crc32 function.

Changing the name of the function is probably the preferred option.

Best regards,
//Leo
