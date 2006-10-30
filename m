Received: from o-hand.com ([70.86.75.186])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gea91-0000pl-1o
	for linux-mtd@lists.infradead.org; Mon, 30 Oct 2006 11:37:58 -0500
Subject: Re: [PATCH] Allow variable block sizes in mtd_blkdevs
From: Richard Purdie <richard@openedhand.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1161955354.7638.55.camel@shinybook.infradead.org>
References: <1161936573.5019.55.camel@localhost.localdomain>
	<1161955354.7638.55.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Mon, 30 Oct 2006 16:37:33 +0000
Message-Id: <1162226254.6962.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-27 at 16:22 +0300, David Woodhouse wrote:
> On Fri, 2006-10-27 at 09:09 +0100, Richard Purdie wrote:
> > Currently, mtd_blkdevs enforces a block size of 512, even if the drivers
> > can seemingly request a different size. This patch fixes mtd_blkdevs so
> > block sizes other than 512 work correctly. 
>
> Could/did you test this with FTL on mtdram?

I'd tested with mtdblock and I just tested with FTL on mtdram and that
seems to work fine too (I could write, umount, mount and read back with
the correct checksums).

Regards,

Richard
