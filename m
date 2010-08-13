Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ojzzn-0003Ml-Lw
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2010 19:32:53 +0000
Received: by bwz13 with SMTP id 13so62588bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Aug 2010 12:32:49 -0700 (PDT)
MIME-Version: 1.0
From: Shane Volpe <shanevolpe@gmail.com>
Date: Fri, 13 Aug 2010 15:32:29 -0400
Message-ID: <AANLkTim=pAP6T6mvunJJHozJTYhTPaaP5R1ot_dQUCT8@mail.gmail.com>
Subject: CFI when flash chips are not identical
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,
I'm working on a design that uses 2 flash ICs (2x16), one for bits
0-15 and the second for bits 16-31.  We were in the process of
approving 2 versions of Intel's P30 flash die and were doing some
testing when we found out that the newer die version has a larger
buffer so if it is in the 0-15 location then the Linux CFI uses its
buffer size causing flash writes fail since the older die version in
bits 16-31 does not have a big enough buffer.  This got me thinking
even some more, how is the busy bit handled for the flash in the CFI
interface, does it just check the 1st flash in a 2x16 configuration or
does it poll both?  If it does not poll both then could this be a
point of failure?

FYI:  I'm working on kernel version 2.6.23 (yes quite old!), I plan to
look at the latest kernel and see if the MaxBufWriteSize is still only
read from one IC and also compare how both kernels handle the busy
state.
Regards,
Shane
