Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1YY3-00085z-UZ
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 13:56:51 +0000
From: Richard Weinberger <richard@nod.at>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
Date: Mon, 09 Oct 2017 15:56:56 +0200
Message-ID: <13583464.gMdCSCRoQZ@blindfold>
In-Reply-To: <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
References: <20170626111947.17092-1-richard@nod.at>
 <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
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

Am Montag, 9. Oktober 2017, 15:49:56 CEST schrieb Marc Kleine-Budde:
> On 06/26/2017 01:19 PM, Richard Weinberger wrote:
> > Creating an xattr is an independent journal transaction and the xattr
> > code assumes that there is always a valid host inode present when a new
> > xattr is created. This assumption is not correct for LSM and now
> > fscrypt, for these users UBIFS creates the xattr before the host inode
> > is created and visible to the user. Since these are two journal
> > transactions it can happen that due to a power-cut only the xattr is
> > present but not the host inode nor the directory entry for it. As result
> > of this UBIFS will lose free space and can run out of space at some
> > time.
> > It is also not possible to create the xattr after the host inode because
> > this would violate LSM and fscrypt model. After a power-cut we could end
> > up with a inode without security context.
> > 
> > This is an intermediate fix that can go into -stable, as long term
> > solution we have to make sure that creating the xattr and the host inode
> > is a single journal transaction. But to achieve this the journal code
> > need some rework first.
> > 
> > Cc: Subodh Nijsure <snijsure@grid-net.com>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Ben Shelton <ben.shelton@ni.com>
> > Cc: Brad Mouring <brad.mouring@ni.com>
> > Cc: Terry Wilcox <terry.wilcox@ni.com>
> > Cc: Gratian Crisan <gratian.crisan@ni.com>
> > Cc: stable@vger.kernel.org
> > Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> What happended to this patch? It's not on mainline (and thus not on the
> stable branches). Was there a better fix?

Since the patch is non-trivial I hoped to get a review or tested-by.
Therefore I didn't merge it so far.

Thanks,
//richard
