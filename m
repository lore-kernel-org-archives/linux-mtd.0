Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17P1Qg-0002X6-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 14:41:22 +0100
Date: Mon, 1 Jul 2002 14:41:21 +0100 (BST)
From: Jasmine Strong <jasmine@hex.linuxgrrls.org>
To: Iztok Zupet <iz@vsr.si>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: RedBoot from DoC not working quite well
In-Reply-To: <200207011535.01055.iz@vsr.si>
Message-ID: <Pine.LNX.4.33.0207011440090.1800-100000@hex.linuxgrrls.org>
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


On Mon, 1 Jul 2002, Iztok Zupet wrote:

> RedBoot boots fine (int18 or int19). But after formating my DoC with
> nftl_format utility:
>
> 	>>> nftl_format /dev/mtd0 128000
>

You can't start a format from that address.  It's not an erase block
boundary.  (Most DoC devices have 8k erase blocks.  THat means 8192 bytes,
not 8000.)

Try erasing from 131072, rather than 128000.

Jas.
