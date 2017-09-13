Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds4MZ-0008Ri-P0
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 09:53:46 +0000
Date: Wed, 13 Sep 2017 11:53:18 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH mtd-utils v3] nandmarkbad: new util to mark blocks as bad
Message-ID: <20170913095318.nnrbcs5giszgjhd4@pengutronix.de>
References: <20170824152227.30394-1-ukleinek@debian.org>
 <20170830113146.26929-1-u.kleine-koenig@pengutronix.de>
 <184ab056-4ef0-706a-c8df-fa5b0b5998f1@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <184ab056-4ef0-706a-c8df-fa5b0b5998f1@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

On Wed, Sep 13, 2017 at 11:39:31AM +0200, David Oberhollenzer wrote:
> 
> sorry for the late reply. After requesting the initial changes, I caught up on
> the IRC discussion and came under the impression that it was pretty clear to
> everyone that there are a few major issues with this kind of tool.
> 
> First of all, marking a block bad can currently not be undone. The changes this
> tool makes are thus both destructive and irreversible.
> 
> If the MTD contains UBI data, UBI has no way of moving the data somewhere else
> if a block just randomly goes bad completely out of the blue.
> 
> Besides, if the MTD is attached to an UBI device, UBI already takes care of
> detecting blocks that go bad *over time* and takes care of marking them as
> bad after moving the data somewhere else.
> 
> It might be interesting to have such a tool if nand scrub functionality was
> added to the kernel (such as in [1]), allowing the changes done by the tool
> to be undone. But even then, what would be the practical use case for
> such a tool?

I needed it as part of reproducing a problem I was told to fix. I only
used it on a nandsim device for testing. I could imagine though that the
tool could also come handy while developping a mtd driver. But yes, it
would be more useful in combination with a possibility to unmark a bad
block.

In sum: I don't care much if you take it or not. I just thought it might
come handy for someone else and so I shared my work.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
