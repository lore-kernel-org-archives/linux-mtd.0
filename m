Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eTqY-0005pU-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2002 06:03:58 +0100
Message-ID: <3D5893DA.F0BE2B16@opersys.com>
Date: Tue, 13 Aug 2002 01:06:34 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Linux-MTD <linux-mtd@lists.infradead.org>
Subject: Latest Grub CVS results in UnitSizeFactor problems
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

I've been playing around with the latest Grub code from CVS
on a 32MB DOC 2000. There was no way to get the NFTL code in
MTD to recognize the DOC once the firmware image was written
using: doc_loadbios /dev/mtd0 grub_firmware
I always got the following message when loading the nftl module:
Sorry, we don't support UnitSizeFactor 0x6e

When using Grub 0.92, however, everything works fine (except
that I had to steal the configure.in, stage1/Makefile.am and
stage2/Makefile.am from the CVS to get 0.92 to build because
I have the latest automake/autoconf versions).

I tried digging around the Grub source code to see where the
problem originates from so that I could fix it, but I don't
have the time to become a grub-internals guru. I can see that
the "ANAND" character string has something to do with the
position where the media header is being looked for, but the
only place I can find this string is in a C call to strcmp().
Beats me how this can be used as a marker.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
