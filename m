Received: from [62.154.254.10] (helo=chaingun.noernet.de ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rSEZ-000337-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 23:53:51 +0100
Date: Thu, 11 Oct 2001 01:01:15 +0200 (CEST)
From: dennis noermann <dennis.noermann@noernet.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 performance
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEHNEPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.33.0110110058180.22291-100000@chaingun.noernet.de>
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


On Wed, 10 Oct 2001, Joakim Tjernlund wrote:

> Hi all
>
> I am wondering how JFFS2 performance(primarly read performance) is affected by compression.
> There are basically 3 types of (de)compression NONE, ZLIB and RTIME. Does it matter which
> one is used w.r.t read performace?

i am using ZLIB , and it is slow :(
on a mpc823 with 66Mhz with 2 Intel 28F320 interlaced (32 Bit) with
kernel 2.4.2 it takes 70 seconds to mount a 8Mb uge jffs2 Partition :(

an the read a write actions are slow :( ...

but a 640k partition is mountet realy fast :)

dennis
