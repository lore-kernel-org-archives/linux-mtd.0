Received: from pu90.internetdsl.tpnet.pl ([80.55.20.90]
	helo=evo.evopolska.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q3al-0003zu-W0
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 12:16:36 +0100
Date: Wed, 11 Jun 2003 13:18:57 +0200 (CEST)
From: angainor@evo.evopolska.com
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1055325225.2097.38.camel@passion.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.44.0306111257110.10908-100000@evo.evopolska.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Can you dump the contents of the media header using the DOS tools? How
> big is the 'binary' partition? If you comment out that sanity check does
> it actually work? 

thie chip has been formated with

./dformat -win:e000 -y -ipl:IPL0508.BIN -s:DOC514.EXB -bdkf0:VT6027D.018  -first

where VT6027D.018 is 262144 bytes large. That's a BIOS. With your current
CVS updates I get the following. I suspect this behaviour results from the
fact that my DoC is still recognized as 32MiB, where in fact it is a 64MiB 
one. That's why the real number of units does not match the expected one.
And bypassing sanity checks cleared my DoC, including BIOS. nice :))


Jun 11 13:59:17 (none) syslog.warn klogd: INFTL: Media Header ->
Jun 11 13:59:17 (none) syslog.warn klogd:     bootRecordID          = BNAND
Jun 11 13:59:17 (none) syslog.warn klogd:     NoOfBootImageBlocks   = -1
Jun 11 13:59:17 (none) syslog.warn klogd:     NoOfBinaryPartitions  = 1
Jun 11 13:59:17 (none) syslog.warn klogd:     NoOfBDTLPartitions    = 1
Jun 11 13:59:17 (none) syslog.warn klogd:     BlockMultiplerBits    = 0
Jun 11 13:59:17 (none) syslog.warn klogd:     FormatFlgs            = 1
Jun 11 13:59:17 (none) syslog.warn klogd:     OsakVersion           = 0x30343135
Jun 11 13:59:17 (none) syslog.warn klogd:     PercentUsed           = 98
Jun 11 13:59:17 (none) syslog.warn klogd:     PARTITION[0] ->
Jun 11 13:59:17 (none) syslog.warn klogd:         virtualUnits    = 10
Jun 11 13:59:17 (none) syslog.warn klogd:         firstUnit       = 4
Jun 11 13:59:17 (none) syslog.warn klogd:         lastUnit        = 13
Jun 11 13:59:17 (none) syslog.warn klogd:         flags           = 0x20000000
Jun 11 13:59:17 (none) syslog.warn klogd:         spareUnits      = 0
Jun 11 13:59:17 (none) syslog.warn klogd:     PARTITION[1] ->
Jun 11 13:59:17 (none) syslog.warn klogd:         virtualUnits    = 1991
Jun 11 13:59:17 (none) syslog.warn klogd:         firstUnit       = 15
Jun 11 13:59:17 (none) syslog.warn klogd:         lastUnit        = 2047
Jun 11 13:59:17 (none) syslog.warn klogd:         flags           = 0xc0000000
Jun 11 13:59:17 (none) syslog.warn klogd:         spareUnits      = 2
Jun 11 13:59:17 (none) syslog.err klogd: _DoC_WaitReady called for out-of-line wait
Jun 11 13:59:17 (none) syslog.warn klogd: INFTL: Media Header sanity check failed:
Jun 11 13:59:17 (none) syslog.warn klogd:         numvunits (1991) > 
				nb_blocks (1024) - nb_boot_blocks(15) - 2
