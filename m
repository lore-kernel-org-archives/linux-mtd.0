Received: from [66.232.140.120] (helo=nsGotta.gotta.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BB4KT-0005fz-0f
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 05:06:21 +0100
From: "Prabhakar Kalasani" <kalasani@sena.com>
To: <rubini@ar.linux.it>
Date: Wed, 7 Apr 2004 13:06:57 +0900
Message-ID: <ACEDKFIMODAHBNCONGOHEELLCCAA.kalasani@sena.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040406083106.GA19715@mail.gnudd.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: How to support both 16MB and 8MB partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you rubini,

I have created two different static tables for two flash and made it to
work.

Regards,
Prabhakar

-----Original Message-----
From: rubini@ar.linux.it [mailto:rubini@ar.linux.it]
Sent: Tuesday, April 06, 2004 5:31 PM
To: kalasani@sena.com; linux-mtd@lists.infradead.org
Subject: Re: How to support both 16MB and 8MB partition table



> I had to support the partition table for 16MB and 8MB AMD Flash chip
> in same kernel.  can we do it , if yes please let me know how can ?

Just have two static tables. Probe the flash for the bigger size
and check what the probe found. You can find an example in
ftp://gnudd.com/pub/tattile/kernel/patch-2.4.19-rmk4-ds2-mck1-tat2 .

This is the important code from that patch (this is 4M or 8M):

+               parts = tat_partitions4;
+               nb_parts = NB_OF(tat_partitions4);
+               if (mymtd->size == 8<<20) {
+                       parts = tat_partitions8;
+                       nb_parts = NB_OF(tat_partitions8);
+               }

/alessandro
