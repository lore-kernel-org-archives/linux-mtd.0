Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197gso-0003YS-BA
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 20:23:18 +0100
Message-Id: <5.1.1.5.2.20030421121805.014ebf68@mail.arc.nasa.gov>
Date: Mon, 21 Apr 2003 12:24:21 -0700
To: lhl <lhl@phy.ccnu.edu.cn>
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <E196oiY-0000Qz-Kq@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: Re: DFORMAT ERROR " IPL block is bad."on DiskOnChip 2000?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ihl,
         The IPL (initial program loader) block contains the BIOS extension 
used by the BIOS to boot the chip during startup.  In your case, it is a 
small block of code that appears at 0xDC00:0 during boot.  If the IPL block 
really is bad, your DOC can't boot because that code can't be written by 
DFORMAT.

Ted Hildum

At 05:48 PM 4/19/2003 +0800, you wrote:
>When I use the DOC5.1.4 DOS utilities'
>DFORMAT /WIN:DC00 /S:DOC514.EXB /FIRST
>
>ERRORS
>
>DiskOnChip 2000 found in 0xdc000.
>64M media, 16K unit
>Virgin card rebuilding unit map.
>Media has been scanned
>ERROR - IPL block is bad.
>Error formatting DiskOnChip.
>Status code is 119 (flUnknow status) received from flFormatPhysicalDrive.
>Format failed.
>
>What's the matter with it?
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
