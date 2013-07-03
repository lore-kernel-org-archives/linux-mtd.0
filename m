Received: from antispam02.maxim-ic.com ([205.153.101.183]
 helo=antispam02.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuIky-0004vW-6K
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 08:49:44 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [Q] Using Micron 4-bit on-die ECC with v2.6.36 kernel?
Date: Wed, 3 Jul 2013 10:49:17 +0200
Message-ID: <2540574.yn0MEqSsGa@laclwks004>
In-Reply-To: <CACwUX0O37px3-cDAScXaFdQPahtnTayN0HKD_dz7U6dD69EURw@mail.gmail.com>
References: <17588192.75Agdljyqk@laclwks004>
 <CACwUX0O37px3-cDAScXaFdQPahtnTayN0HKD_dz7U6dD69EURw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19-June-2013 14:40:45 David Mosberger-Tang wrote:
> Attached is a patch relative to 2.6.27.y.   We use it with a 16-bit
> wide Micron part needing 4-bit ECC.  It works for us, YMMV.  I'm
> pretty sure the raw access is broken badly but we are not using that
> so it's not a problem from us.  The patch assumes that on-die ECC is
> enabled in the bootstrap loader.

David,

 Thanks!  I've been working on getting our kernel and Das U-Boot
 up to a common baseline w.r.t. the NAND-handling (including a
 on-die compatible BBT layout in the OOB and other details), so
 I had not looked too closely at your Patch until now-ish....

 In examining it, I may have spotted an oddity:  When counting
 bit-flips, you only count them in the main-data area and in
 the ECC-area (in the OOB).  What you do not count are any in
 the on-die ECC-protected bits in the OOB (which, in fact,
 happens to be all of .oobfree).

 Whilst not necessarily wrong, it does mean you may under-count
 the true number of ECC-detected bit-flips, under-reporting the
 number of corrections, and hence (inadvertently?) fooling the
 system into thinking the block is in better health than it
 really is.

 Or I may mis-understanding something here....

cheers!
	-blf-
-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
