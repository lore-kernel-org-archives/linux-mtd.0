Received: from fep02-mail.bloor.is.net.cable.rogers.com ([66.185.86.72])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rmcb-0001Nb-RM
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 23:49:05 +0100
Received: from server ([65.48.183.29])
	by fep02-mail.bloor.is.net.cable.rogers.comESMTP
	<20030826224807.CSNX367241.fep02-mail.bloor.is.net.cable.rogers.com@server>
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Aug 2003 18:48:07 -0400
Received: from ilgiz by server with local (Exim 3.36 #1 (Debian))
	id 19rmbR-00014u-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 18:47:53 -0400
Date: Tue, 26 Aug 2003 18:47:53 -0400
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20030826224753.GA4135@ei.homeip.net>
References: <1578.10.10.13.147.1061881336.squirrel@mail.bpltelecom.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578.10.10.13.147.1061881336.squirrel@mail.bpltelecom.com>
Sender: Ilguiz Latypov <ilgiz@ei.homeip.net>
Content-Type: text/plain; charset=us-ascii
Subject: Re: cramfs:wrong magic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, Aug 26, 2003 at 12:32:16PM +0530, Vidya Srinivas wrote:

> root=/dev/mtdblock3 rootfstype=cramfs init=/sbin/init
>
> At the time of FS mounting, the kernel is throwing this error:
>
> cramfs : wrong magic

I know Debian (http://debian.org/) has a kernel patch to correctly
support cramfs root file system.  Debian maintainers provide this patch
for a long time.

I understand /dev/mtdblock3 can also be verified against the original
image.

--
Ilguiz Latypov
 
tel.  +1 (519) 569-7193
31 Oprington Drive, Unit D3
Kitchener, Ontario N2N 3G3
