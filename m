Received: from orngca-mls01.socal.rr.com ([66.75.160.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1TR-0002NJ-QC
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:00:54 +0100
Received: from [192.168.2.4] (66-75-241-113.san.rr.com [66.75.241.113])
	h5B8wdM26459	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 01:58:39 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1055118239.10424.49.camel@localhost3.localdomain>
References: <1055118239.10424.49.camel@localhost3.localdomain>
Message-Id: <1055322085.31819.31.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 11 Jun 2003 02:01:25 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with using doc2001 module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ok. just for kicks. i booted into DOS using M-SYS's tffs_5.1.4_DOS_TOOLS
and dinfo and dformat refused to find the DiskonChip even after
specifing it's address of 0xfff00000.

something isn't right here.  it's obviously something with the code.  I
also get the same results on a duplicate 440BX motherboard.

arrrghh.

On Sun, 2003-06-08 at 17:23, roger wrote:
> For the past couple of days and using every available option with
> docprobe (kernel compile time options), I have not been able to get the
> several DiskOnChips-2001 recognized by kernel 2.4.20.
> 
> by a fluke accident, i've gotten the DOC recognized.
> 
> I'm on a 2x750P3 SMP Tyan Tiger 1832dl and induced a "kernel oops" on
> cpu1 by trying to insmod ./bios.o
> (http://www.openbios.info/download/index.html
> devbios-0.3.2.tar.gz).
> 
> the docprobe.o is compiled with "Physical Address = 0" and no other
> options for docprobe.o.  ... using doc2001.o
> 
> i've attached dmesg output below of the oops condition  when trying to
> insmod bios.o and then after the kernel-oops occurred, modprobed
> mtdcore, mtdchar,dos2001,dosprobe doc_config_location=0xfff00000. 
> (unknown if the doc_config_location is needed...have yet to try without
> as i've only duplicated 3 times.)
> 
> (i've been advised that there might be a "hidden write enable" problem -
> i.e. there is a special GPIO line used to control write enable in
> addition to the normal mechanism.)
-- 

Roger
http://www.eskimo.com/~roger/index.html
