From: dwmw2@infradead.org (David Woodhouse)
Date: 09 Feb 2003 10:21:28 +0000
Subject: Flash C3 Cowardly refusing to erase blocks
In-Reply-To: <001501c2d022$4a99e3e0$0200a8c0@ester>
References: <001501c2d022$4a99e3e0$0200a8c0@ester>
Message-ID: <1044786087.2943.68.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-02-09 at 10:01, Kentropy wrote:
> Hello,
> I am using Fash TE28F320-C3
> I've read various posts into the mail history in linux-mtd and arm-linux
> and I've not yet understood if this C3 flash type is
> properly supported into the kernel-2.4.19 neither 2.5.x.

It is.

> I've got this error and I think I need a patch for C3 flash.

No, it just looks like you don't actually have a JFFS2 image in the
correct place on your flash chip. How did you put it there?

-- 
dwmw2
