Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQScP-0002GV-4h
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 13:14:42 -0400
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX500LD9P6BTKC0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 13:13:23 -0400 (EDT)
Date: Mon, 03 Apr 2006 13:13:23 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <001e01c64a28$a55fe3f0$6601a8c0@IT0010600>
To: Jason Chen <jason_chen@usish.com>
Message-id: <Pine.LNX.4.64.0604031311150.2550@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <001e01c64a28$a55fe3f0$6601a8c0@IT0010600>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI 1.4 intel cmdset in linux-2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 18 Mar 2006, Jason Chen wrote:

> Hi, all,
> 
> I am trying to use cfi 1.4 in linux-2.4.21(use Intel P30 strata flash), as I
> find in datasheet, Intel extended query structure is almost the same in CFI
> 1.3 & 1.4. 
> 
[...]
> 
> What happened? What should I do to solve this issue?

Upgrade to a later kernel where this is known to be fixed, or backport 
the latest MTD snapshot to your old kernel (but then you're on your 
own if you do so).


Nicolas
