Received: from c000-h001.c000.snv.cp.net ([209.228.32.65] helo=c000.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 163OvW-0003fX-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2001 21:47:34 +0000
Message-ID: <000201c16bc4$dae53120$7f01010a@instant802.com>
From: "Simon Barber" <simon@barber.net>
To: <linux-mtd@lists.infradead.org>
References: <20011105172238.A10542@wohnheim.fh-wedel.de> <20011106133944.A1828@wohnheim.fh-wedel.de>
Subject: Bug in mtdblock_ro
Date: Tue, 6 Nov 2001 05:11:17 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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

the call in mtdblock_request to MTD_READ/WRITE passes nr_sectors, it should
pass current_nr_sectors.

Simon

----- Original Message -----
From: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
To: <linux-mtd@lists.infradead.org>
Sent: Tuesday, November 06, 2001 4:39 AM
Subject: Re: MTD partitioning rewrite finished


> Hi!
>
> Kernel 2.4.14 is out, I adjusted my patches a bit and I found and
> corrected some bugs. None of the bugs were serious, though. You might
> have been unable to compile, but if you were, everything should have
> worked fine.
>
> Jörn
>
> --
> ``Plan to throw one away; you will, anyhow.''
> (Fred Brooks, ``The Mythical Man-Month'', Chapter 11)
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
