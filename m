Received: from ioskeha.hittite.isp.9tel.net ([62.62.156.27])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19icMw-0008DK-Vv
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 17:03:03 +0100
Received: from jennifer (unknown [81.185.32.15])
	by ioskeha.hittite.isp.9tel.net (Postfix) with ESMTP id 8F29717B875
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Aug 2003 18:02:28 +0200 (CEST)
From: "Philippe" <philippe@accuitee.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 1 Aug 2003 18:02:28 +0200
Message-ID: <000001c35846$4ebe3870$6401a8c0@jennifer>
MIME-Version: 1.0
In-Reply-To: <1059731746.19396.30.camel@lapdancer.baythorne.internal>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: RE : DiskOnChip 2000 and CVS Drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
 
> I merged some of that code already; all that remains is the fake
> partitioning, and that should be fairly easy to patch in by hand if
you

I checked it today, as you told me I merged the FAKE_PART_CODE.
Everything seems OK (no compilation troubles etc...)

I'll test it next week. If Everything works as expected, i'll send a
diff against [kernel 2.4.20 + cvs / mtd patch]


> want it -- what did you try and in what way did you fail? That's your
> best option for the moment -- use nftl_format with an NFTL size as you
> desire, and hack the doc2000.c code to register a second partition on
> which you use JFFS2.

Well I had troubles using NFTL, let me explain :

I made two partition :
 - 1 - Boot : grub stuff + kernel + initrd + software
 - 2 - Conf/Save : every file wich may be used by my application

Everything was fine except two things :

a) when I turned off the machine -- when I launch the shutdown (via the
app), I do "sync", "umount" and then shutdown -h now -- Nothing was
saved on the DOC (I do not understand because when I use the same kernel
/ stuff on  my hard drive or on a CF/ide, everything is allright)

b) the sync process is very long (about 30sec)

> Not really. I've been mounting JFFS2 on it -- it doesn't handle
multiple
> NAND devices in a single DiskOnChip yet, and doesn't do hardware ECC
--
> I've been using it with software ECC instead for now. You're unlikely
to
> get NFTL working with it for a while.

Well, I don't mind about NFTL (for the boot partition) because my bootfs
should be read-only (kernel + initrd + tar.bz2)
I just want a Read only partition (bootfs) and a read/write partition
for all the conf files / data

Thank you for your help

See you

Philippe
