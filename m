Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MuPV-0000hV-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 18:47:26 +0100
Received: from p50861125.dip.t-dialin.net ([80.134.17.37] helo=pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 17MuPP-0004i6-00
	for linux-mtd@lists.infradead.org; Tue, 25 Jun 2002 19:47:20 +0200
Date: Tue, 25 Jun 2002 19:21:18 +0200
From: Robert Schwebel <robert@schwebel.de>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: OpenSSH/OpenSSL is too big... any alternatives?
Message-ID: <20020625192118.X21675@schwebel.de>
References: <1025014199.2220.3.camel@beamer.servat.com> <1025016211.25773.14.camel@moses.outpostsentinel.com> <20020625145011.DB9EF6B3F4@zachs.place.org> <1025017476.2200.8.camel@beamer.servat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1025017476.2200.8.camel@beamer.servat.com>; from gonzalo@linuxaus.com on Wed, Jun 26, 2002 at 01:04:36AM +1000
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

On Wed, Jun 26, 2002 at 01:04:36AM +1000, Gonzalo Servat wrote:
> (ftp.uk.linux.org/pub/linux/Networking/netkit) but getting it to compile
> vs uClibc is tricky. I still get errors to do with 'rpc'. I've decided
> to just use telnet for the time being (until I can get a bigger DOC) but
> even this task is looking doubtful :(
> 
> Has anyone had any success compiling netkit (inetd & telnet server)
> against uClibc?

If telnet is enough for you you can use utelnetd

  http://www.pengutronix.de/software/utelnetd_en.html

For LSH I'll have a look - be a little bit patient, I'm hopelessly flooded
with other work right now, but it's definitely in the pipeline. 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
