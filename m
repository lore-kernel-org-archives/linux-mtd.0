Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16176g-00082S-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 14:21:39 +0000
Message-ID: <3fcf01c166cf$b26a5120$0a070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: =?iso-8859-1?B?SvZybiBFbmdlbA==?= <joern@wohnheim.fh-wedel.de>,
   "Johan Adolfsson" <johan.adolfsson@axis.com>
Cc: <joakim.tjernlund@lumentis.se>, <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> <3fab01c166cb$c9155fe0$0a070d0a@axis.se> <20011106152127.B31698@wohnheim.fh-wedel.de>
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Date: Tue, 6 Nov 2001 15:31:17 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> 2) Flash is a write-once medium. You cannot overwrite the markers, you
> have to delete again.

If you have some bits in the flash zeroed and the data you want to write
at that position also contains zero bits you should be just fine.
(assuming an erased flash is all 0xFF's )

/Johan
