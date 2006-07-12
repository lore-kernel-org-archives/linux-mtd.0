Received: from bay0-omc3-s21.bay0.hotmail.com ([65.54.246.221])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0SRH-0002LX-Bl
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 20:18:54 -0400
Message-ID: <BAY110-F114C65C46990C38A78E522BC690@phx.gbl>
In-Reply-To: <1152658911.25567.83.camel@shinybook.infradead.org>
From: "Han Chang" <posaune@hotmail.com>
To: dwmw2@infradead.org
Subject: Re: File size limitation on JFFS2.
Date: Tue, 11 Jul 2006 17:18:46 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Thanks for the info. I'm using 2.6.14. Moving to a 2.6.18-rc1 will be a too 
big of change for me unless it's absolutely necessary. I'm very interested 
in the knowing how to move to 32KiB node. Could you shed some light on this?

Many thanks!
Han


>From: David Woodhouse <dwmw2@infradead.org>
>To: Han Chang <posaune@hotmail.com>
>CC: linux-mtd@lists.infradead.org
>Subject: Re: File size limitation on JFFS2.
>Date: Wed, 12 Jul 2006 00:01:51 +0100
>
>On Tue, 2006-07-11 at 15:32 -0700, Han Chang wrote:
> > I'm trying to put a file of size 1G on the JFFS2/NAND. I got "Out of 
>Memory"
> > error. Looks like the max size of file I can put on it is 500M, though 
>my
> > NAND has 2G space. This is on Linux. I noticed JFFS2 is using filemap in 
>the
> > Linux mm, where it crashed. Any help?
>
>Yeah, JFFS2 doesn't scale well to that kind of size. Are you using the
>2.6.18-rc1 kernel? That has some improvements to its memory usage.
>
>Another thing that'll help with this is going to 16KiB or 32KiB node
>sizes instead of limiting them to 4KiB.
>
>--
>dwmw2
>
