Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U6yH-0003AH-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 14:04:49 +0000
Date: Fri, 25 Jan 2002 14:15:51 +0000 (GMT)
From: kira brown <kira@hex.linuxgrrls.org>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: Ramya Ravichandran <rrhsin@yahoo.co.in>,
	<linux-mtd@lists.infradead.org>
Subject: Re: Cf Card vs DiskOnChip
In-Reply-To: <020601c1a5aa$9962b1d0$0a070d0a@axis.se>
Message-ID: <Pine.LNX.4.33.0201251414150.16833-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Fri, 25 Jan 2002, Johan Adolfsson wrote:

> I assume you need the storage for some large logs then?
> To get a basic embedded Linux system doing serial communication
> and networking 2MB flash should be enough.

Webview does five PLC protocols, ppp, http, ftp, telnet, ssh, full shell,
copy of bash and vi, *and* runs Java out of an 8Mbyte DiskOnChip and has
three megabytes of free space.  If you add the X and video stuff that
drops to 500k though.

kira.
