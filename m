Received: from tomts22.bellnexxia.net ([209.226.175.184] helo=tomts22-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eGsP-0004RC-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 16:13:01 +0100
Date: Mon, 12 Aug 2002 11:12:57 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: nur <nurpinar@e-kolay.net>
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: DOC millenium doesnt work anymore 
In-Reply-To: <009601c24205$690cc730$3064000a@nurpinar>
Message-ID: <Pine.LNX.4.44.0208121108380.31365-100000@server.superbt.com>
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

On Mon, 12 Aug 2002, nur wrote:

> Using configured DiskOnChip probe address 0ex8000
> Possible Diskonchop with unknown ChipID FD found at 0xe8000
> No recognised Diskonchip devices found
> 
> Anyone has faced such a problem?

The BIOS might have configurable chip selects.  You may need to associate
a certain chip select number with the DoC memory window in the BIOS
configuration screen.

I included a sample BIOS setup for the MZ104 board below.

Ilguiz

==================================================================

  Main
    Boot Drive Order:  Floppy Disk
    Boot through RFD:  No [Removable Flash Disk?  The RFD thing is
                          confusing because it doesn't apparently
                          refer to DiskOnChip]
  Advanced
    Onboard RFD:            Disabled
    Installed O/S:          Other   [are these two relevant
    Large Disk Access Mode: DOS      to DiskOnChip startup?]

    Console COM Port Address  Disabled
      Console Baud Rate            115.2K
      ...Continue C.R. after POST: Off

  IO Devices
    Serial Port A: Enabled
    Serial Port B: Enabled
    Infrared Port: Disabled
    Parallel Port: Enabled
    Floppy disk controller: Enabled
      Base I/O address: Primary
    Local Bus IDE adapter: Primary

  Memory Windows
    Memory Window - mem_cs3
      Window Size:   1h
      Window Base:  D0h
      Window Page: F30h
      Data width:  8-bits

  I/O Windows
    all disabled

==================================================================
