Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K64DQ-0008Ef-Pe
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 13:48:49 +0000
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Subject: Re: CFI-0002 NOR flash blocking CPU on status register reads
Date: Tue, 10 Jun 2008 15:48:40 +0200
References: <20080610130945.GB28565@shareable.org>
In-Reply-To: <20080610130945.GB28565@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806101548.40059.hs4233@mail.mn-solutions.de>
Cc: =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>,
	Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Won't the CPU read the initial boot instructions from this
> flash, get programming status bytes instead of CPU
> instructions, and thus get confused?

The bootloader could/should make sure that every block is in the 
correct state for Linux.
