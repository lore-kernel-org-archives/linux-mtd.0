Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwWpU-0000JO-3m
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 14:56:57 +0000
Date: Wed, 11 Nov 2015 15:56:30 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: mkl@pengutronix.de
Subject: Re: [PATCH 0/5] mkfs.ubifs: cleanups + extended attribute support
Message-ID: <20151111145630.GA1089@dw-nb.local>
References: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 16, 2015 at 05:15:14PM +0200, Marc Kleine-Budde wrote:
> Hello,
> 
> this series applies to current git master. The first 3 patches are cleanup
> patches, in the 4th adds extended attributes support. Patch 5 adds a option to
> write the used inode number to a extended attribute, so that other offline
> tools like IMA, that process the inode number can work. See description of
> patch 5 for a detailed explanation.
> 
> regards,
> Marc
>

Hi Marc,

I had a quick look at the first 3 patches and they all seem fine, so
feel free to add a reviewed-by from me.

Since there is already a WITHOUT_XATTR build flag (to disable xattr
support) for mkfs.jffs2, would you mind using it for mkfs.ubi as well ?


cheers,

daniel
