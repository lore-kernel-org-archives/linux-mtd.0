Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFzd8-0001Uq-Ab
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 14:38:15 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vijay Sampath <Vijay.Sampath@aktino.com>
In-Reply-To: <02DAE179D5CEED4C992055C823ED90FF114CD2@ex1>
References: <02DAE179D5CEED4C992055C823ED90FF114CD2@ex1>
Content-Type: text/plain
Message-Id: <1097260202.11402.1690.camel@thomas>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 20:30:02 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel BUG at nodemgmt.c / Raw node at ... wasn't in node
	lists for ino...
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-08 at 20:06, Vijay Sampath wrote:
> Hi,
> 
> We are using Timesys Linux on our embedded system based on Linux kernel
> version 2.4.18. We have been running the JFFS2 filesystem on our flash
> drives for a while now without problems, but lately have begun to see
> kernel crashes/warnings related to file system access (see traces 1 and
> 2 below).

> I tried upgrading the JFFS2 version to the latest, but it appears that I
> need the 2.6 kernel or atleast something newer than 2.4.18 (which is
> what we are using.)
> 
> So the question is, is this a known problem that has gone away in later
> releases? Also what is the easiest way to upgrade JFFS2 without
> upgrading the kernel? What other things can be done to prevent the error
> from occurring?

http://www.linux-mtd.infradead.org/#kernelversions

tglx
