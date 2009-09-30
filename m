Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mt1Dp-00052C-9L
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 15:36:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id A09461362DA
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Sep 2009 17:33:11 +0200 (CEST)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 22199-02-13 for <linux-mtd@lists.infradead.org>;
	Wed, 30 Sep 2009 17:32:59 +0200 (CEST)
Received: from debby.esd (debby.esd [10.0.0.190])
	by comm-neu.esd (Postfix) with ESMTP id CA1421362DC
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Sep 2009 17:32:35 +0200 (CEST)
From: Matthias Fuchs <matthias.fuchs@esd.eu>
To: linux-mtd@lists.infradead.org
Subject: patented FTL format
Date: Wed, 30 Sep 2009 17:32:34 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200909301732.35277.matthias.fuchs@esd.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found this notice in drivers/mtd/ftl.c:

 LEGAL NOTE: The FTL format is patented by M-Systems.  They have
    granted a license for its use with PCMCIA devices:

     "M-Systems grants a royalty-free, non-exclusive license under
      any presently existing M-Systems intellectual property rights
      necessary for the design and development of FTL-compatible
      drivers, file systems and utilities using the data formats with
      PCMCIA PC Cards as described in the PCMCIA Flash Translation
      Layer (FTL) Specification."

    Use of the FTL format for non-PCMCIA applications may be an
    infringement of these patents.  For additional information,
    contact M-Systems (http://www.m-sys.com) directly.


Can anybody tell me what exactly is patended here? The general implementation
of a translation layer to use non-NAND filesystems on top of NAND? 
Or a specific format (as stated) - meaning a data layout - on how or where
to store information on a NAND flash?

Or with other words, does a translation layer (we would also call it differently)
that allows using things like ext3 on a bare NAND chip conflict with any patents?

This is not a technical question about how this could be implemented.

Matthias
