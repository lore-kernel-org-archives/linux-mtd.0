Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NHjB-0003ax-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2001 18:36:46 +0100
Date: Thu, 19 Jul 2001 19:44:37 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Tim Hockin <thockin@sun.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002 and writes
In-Reply-To: <3B560DDC.55ECB635@sun.com>
Message-ID: <Pine.LNX.4.21.0107191942320.12985-100000@godzilla.axis.se>
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

On Wed, 18 Jul 2001, Tim Hockin wrote:
> Right, but this is our boot ROM we're dealing with :)  Can you suggest a
> better alternative?  The device is rarely ever loaded, but when it is
> loaded we want to read and re-program the whole thing as safely as
> possible.

If you have the space or can make space, the standard way is to
double-buffer the sector in question. Write a new one at a spare sector
with a checksum and sequence number, then after that erase the first
one. So if it crashes you always have at least one sane copy. 

If your code requires one sector, and you have a flash with at least 3
sectors, put code to choose the sane sector in sector 0 (the one which is
booted) and use sectors 1 and 2 for the boot code itself. And never update
sector 0 :) 

/Bjorn
