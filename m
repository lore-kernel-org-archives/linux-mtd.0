Received: from moutvdom00.kundenserver.de ([195.20.224.149])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vgCF-00089c-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 15:36:55 +0100
Received: from [195.20.224.219] (helo=mrvdom03.schlund.de)
	by moutvdom00.kundenserver.de with esmtp (Exim 2.12 #2)
	id 15vgLC-00075p-00
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2001 16:46:10 +0200
Received: from pd9e358af.dip.t-dialin.net ([217.227.88.175] helo=comm.esd-electronics.com)
	by mrvdom03.schlund.de with esmtp (Exim 2.12 #2)
	id 15vgK5-0000V0-00
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2001 16:45:01 +0200
Message-ID: <3BD43008.3A7C27D7@esd-electronics.com>
Date: Mon, 22 Oct 2001 16:41:12 +0200
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: filesystem for battery-buffered SRAM
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,

I have to setup an embedded Linux box that uses 1MB of battery buffered
SRAM to store nonvolatile data.
This memory is directly mapped into ma addressspace and needs no magic
things to read or write to it.

What might be the best choice for a filesystem for this memory and is it
possible to setup file access with MTD.
With other words: Is MTD able to access normal RAM devices (no FLASH,
but SRAM) ?

Are there other ways to setup a filesystem in a SRAM ?

Matthias


-- 
--------------------------------------------------------------------------

                             _/_/_/_/   Matthias Fuchs
                            _/_/_/_/   Dipl.-Ing.
                           _/_/_/_/   matthias.fuchs@esd-electronics.com

       _/_/_/   _/_/_/_/_/_/_/      esd electronic system design gmbh
     _/   _/  _/             _/    Vahrenwalder Str. 207
    _/   _/    _/_/_/   _/   _/   D-30165 Hannover
    _/             _/  _/   _/   Phone: +49-511-37298-0
     _/_/_/_/_/_/_/   _/_/_/    Fax:   +49-511-37298-68

--------------------------------------------------------------------------
