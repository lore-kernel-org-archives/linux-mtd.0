Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ik4u-0003Uh-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 06:56:57 +0100
Received: from pd9e34f90.dip.t-dialin.net ([217.227.79.144] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 17Ik4q-0007NF-00
	for linux-mtd@lists.infradead.org; Fri, 14 Jun 2002 07:56:53 +0200
Date: Fri, 14 Jun 2002 07:41:12 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Plans for 2.4.19
Message-ID: <20020614074112.I4388@schwebel.de>
References: <20020613235324.F4388@schwebel.de> <32738.1024010835@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32738.1024010835@redhat.com>; from dwmw2@infradead.org on Fri, Jun 14, 2002 at 12:27:15AM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, Jun 14, 2002 at 12:27:15AM +0100, David Woodhouse wrote:
> I fed Marcelo most of the latest code for 2.4.19-pre. All that I
> remembered was outstanding was the updated flash driver probe stuff and
> 64-bit support. The plan was to do that in 2.4.20-pre1. What's wrong with
> the DIL/ Net-PC code and can it be fixed without having to update all the
> CFI code?

I'll look at it later today - yesterday I gave 2.4.19-pre9 a try and it
didn't work. Patching it with current CVS works perfectly. 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
