Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiIp-0000GT-N5
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:47:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F320400.3000002@hectrix.com>
References: <3F320400.3000002@hectrix.com>
Message-Id: <1060253236.25209.44.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:47:16 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: "init not found" after booting GRUB on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 08:47, Selwyn Tang wrote:
>  The kernel loaded successfully but it ended with a kernel panic of
> "no init found".

> I have busybox's init in /sbin and I also tried adding "init=/sbin/init"
> to the above statement but with the same result.
> 
> The NFTL driver is built-in and it correctly detects my DOC. The kernel 
> also successfully mounts the root filesystem (ext3).

Sounds like a problem with the _contents_ of your file system. Does it
boot if you use 'init=/bin/sh', and if so, can you then run /sbin/init?


-- 
dwmw2
