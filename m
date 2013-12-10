Received: from lvps176-28-13-145.dedicated.hosteurope.de ([176.28.13.145])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqPvP-0004sR-1L
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 16:12:43 +0000
Received: from dabox.localnet (unknown [62.159.134.146])
 by lvps176-28-13-145.dedicated.hosteurope.de (Postfix) with ESMTPSA id
 A62D31BF5C004
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2013 17:12:18 +0100 (CET)
From: Tim Sander <tim@krieglstein.org>
To: linux-mtd@lists.infradead.org
Subject: ubifs_leb_read crc checks
Date: Tue, 10 Dec 2013 17:12:18 +0100
Message-ID: <2198039.CdnmsTDCCa@dabox>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

As far as i see, ubifs_leb_read does no crc checks? Would it be possible to 
add an unconditional crc check for testing purposes? So far i have not seen an
easy way, as it seems that the crc of ubifs depending on the node type?

Best regards
Tim
