Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1617De-00083d-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 14:28:53 +0000
Date: Tue, 6 Nov 2001 15:38:04 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Message-ID: <20011106153804.C31698@wohnheim.fh-wedel.de>
References: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> <3fab01c166cb$c9155fe0$0a070d0a@axis.se> <20011106152127.B31698@wohnheim.fh-wedel.de> <3fcf01c166cf$b26a5120$0a070d0a@axis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fcf01c166cf$b26a5120$0a070d0a@axis.se>; from johan.adolfsson@axis.com on Tue, Nov 06, 2001 at 03:31:17PM +0100
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

> > 2) Flash is a write-once medium. You cannot overwrite the markers, you
> > have to delete again.
> 
> If you have some bits in the flash zeroed and the data you want to write
> at that position also contains zero bits you should be just fine.
> (assuming an erased flash is all 0xFF's )

Granted. This might be useful for the rw block device driver to save
some delete operations, but is rare enough to just keep things simple
and ignore it. :)

Jörn

-- 
Live a good, honorable life. Then when you
get older and think back, you'll be able to enjoy
it a second time.
