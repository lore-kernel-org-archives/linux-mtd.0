Received: from residential.serv3.aus.datafoundry.com ([209.99.125.37])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ifdd0-0008Dh-TA
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 16:37:46 +0100
Message-ID: <1192030627.470cf1a3b8f28@webmail.texas.net>
Date: Wed, 10 Oct 2007 10:37:07 -0500
From: catboat@texas.net
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: bit flip
References: <1191439970.4703ee62083f1@webmail.texas.net>
	<1191991698.578.92.camel@localhost.localdomain>
In-Reply-To: <1191991698.578.92.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: catboat@texas.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting David Woodhouse <dwmw2@infradead.org>:

> On Wed, 2007-10-03 at 14:32 -0500, catboat@texas.net wrote:
> > A NAND card flipped a bit and caused a data CRC problem in a data node. 
> > When I cat the file, this region is zeroes. cat exits with rc 0.
> 
> On NAND you should have ECC to prevent this failure mode.

We took two bit flips within the same 256 byte subpage. To my knowledge
ECC won't correct it, but should have returned an error.  I think 
UBI handled the error and copied what it could to a new erase block.
After that, the ECC words were correct again, but not the jffs2
CRC check. 

Regarding a change to the code, jffs2 needs to track data nodes 
that have CRC problems instead of marking them obsolete. Maybe a new
node type could represent this and save recalculating CRCs everywhere. 
Until these nodes are rewritten with newer data, I would expect readers 
of the nodes to get EIO.

Monte
