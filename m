Received: from mail16.syd.optusnet.com.au ([211.29.132.197])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRi7-0003WI-HB
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:29:08 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: michael <trimarchi@gandalf.sssup.it>
In-Reply-To: <48366FF8.5010506@gandalf.sssup.it>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<483668B6.3080507@gandalf.sssup.it>
	<1211526142.6203.24.camel@torchwood>
	<48366FF8.5010506@gandalf.sssup.it>
Content-Type: text/plain
Date: Fri, 23 May 2008 17:28:55 +1000
Message-Id: <1211527735.6203.39.camel@torchwood>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-23 at 09:19 +0200, michael wrote:
> Hi,
> > What kernel, patches and tool chain are you using?
> >
> 2.6.24.4 + preempt_rt patch
> A number recent fix of jffs2 layer and same personal drivers.
> The gcc version is (generated with build root)

> ./arm-linux-gcc -v
> Using built-in specs.
> Target: arm-linux-uclibc

> gcc version 4.2.1

http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2007q1-10-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2

is what I'm using, again recommended by linux4sam.org.  It is GCC 4.2
based, for glibc.  I would have guess this to be fine.

James.
