Received: from tomts23-srv.bellnexxia.net ([209.226.175.185])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LOfU-000193-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 14:41:40 +0100
Date: Fri, 21 Jun 2002 09:41:36 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Guillaume David <guillaume.david@mensi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem in duplicating DoC2000
In-Reply-To: <003a01c2190f$998b1cf0$280300c0@groenland>
Message-ID: <Pine.LNX.4.44.0206210936030.9587-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Guillaume,

Error 16 is 

   [ERR_FSYS_CORRUPT] = "Inconsistent filesystem structure"

according to GRUB's shared.h and common.c.

Perhaps, the flash programmer is smart enough to move the NFTL payload
around the chip when a bad block is detected.  I wonder what happens when 
the resulting size of the NFTL payload is smaller than the original one.  
In this case there could be a problem with copying the filesystem 
one-to-one.

Ilguiz

On Fri, 21 Jun 2002, Guillaume David wrote:

> I bought the disk-on-chip GANG programmer from M-System to copy easily and
> fast my systems.
> This programmer first copies the source DoC to its own hard disk in an image
> file. Then in a second time, it writes the image file to the target DoC.
