Received: from adsl-203-134.38-151.net24.it ([151.38.134.203]
	helo=mail.gnudd.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAlyC-0002h7-Tz
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2004 09:30:09 +0100
Date: Tue, 6 Apr 2004 10:31:06 +0200
From: Alessandro Rubini <rubini@ar.linux.it>
To: kalasani@sena.com, linux-mtd@lists.infradead.org
Message-ID: <20040406083106.GA19715@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini@ar.linux.it
In-Reply-To: <ACEDKFIMODAHBNCONGOHGELCCCAA.kalasani@sena.com>
References: <ACEDKFIMODAHBNCONGOHGELCCCAA.kalasani@sena.com>
Subject: Re: How to support both 16MB and 8MB partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


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
