Received: from sccrmhc12.comcast.net ([63.240.77.82])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FaqjG-0005wR-Mw
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 04:59:40 -0400
Date: Tue, 2 May 2006 01:50:45 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20060502085045.GA15204@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: RedBoot partition not @ end of flash...
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I've got a board with a 32MiB flash (128K SectorSize) with the redboot table
only covering the first (32MiB - SectorSize) and the rest setup as OTP from
what I understand. What is the proper way to deal with this? What I'm doing 
right now is a heinous hack:

        ixp425_mtd->size -= ixp425_mtd->erasesize;
        /* Try to parse RedBoot partitions */
        npart = parse_mtd_partitions(ixp425_mtd, probes, &parsed_parts, 0);
        if (npart > 0) {
                res = add_mtd_partitions(ixp425_mtd, parsed_parts, npart);
        } else {
                printk("IXP425 Flash: Using static MTD partitions.\n");
                res = add_mtd_partitions(ixp425_mtd, ixp425_partitions,
                                         NB_OF(ixp425_partitions));
        }
        ixp425_mtd->size += ixp425_mtd->erasesize;

I tried setting the window size to (32MiB - SectorSize) before probing
but that failed miserably. One other thought I had was to create a
static partition map dividing the flash and then parse partitions
on the first region. Can the code handle recursive parsing?

I doubt I'm the first one to deal with this...

Tnx,
~Deepak

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

I am not a consumer. My existence on this planet is not defined by my
relationship to a producer of goods.  I was not put on this planet to
consume goods from a company for their profit. - Michael W.
