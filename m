Received: from [194.249.198.85] (helo=kasica.elsis.si)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17P1ld-0002ZP-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 15:03:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Iztok Zupet <iz@vsr.si>
Reply-To: iz@vsr.si
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Subject: Re: RedBoot from DoC not working quite well
Date: Mon, 1 Jul 2002 16:03:35 +0200
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.33.0207011440090.1800-100000@hex.linuxgrrls.org>
In-Reply-To: <Pine.LNX.4.33.0207011440090.1800-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200207011603.35218.iz@vsr.si>
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

On Monday 01 July 2002 15:41, Jasmine Strong wrote:
> On Mon, 1 Jul 2002, Iztok Zupet wrote:
> > RedBoot boots fine (int18 or int19). But after formating my DoC with
> >
> > nftl_format utility:
> > 	>>> nftl_format /dev/mtd0 128000
>
> You can't start a format from that address.  It's not an erase block
> boundary.  (Most DoC devices have 8k erase blocks.  THat means 8192 bytes,
> not 8000.)
>
> Try erasing from 131072, rather than 128000.
>
> Jas.

 I tried but it still owerwrites or erases my RedBoot.
Size of my redboot_firmware is exactly 123.2K.

Regards
iz
