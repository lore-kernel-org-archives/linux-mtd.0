Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ds49G-0000BN-WE
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 09:40:01 +0000
Subject: Re: [PATCH mtd-utils v3] nandmarkbad: new util to mark blocks as bad
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170824152227.30394-1-ukleinek@debian.org>
 <20170830113146.26929-1-u.kleine-koenig@pengutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <184ab056-4ef0-706a-c8df-fa5b0b5998f1@sigma-star.at>
Date: Wed, 13 Sep 2017 11:39:31 +0200
MIME-Version: 1.0
In-Reply-To: <20170830113146.26929-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


sorry for the late reply. After requesting the initial changes, I caught up on
the IRC discussion and came under the impression that it was pretty clear to
everyone that there are a few major issues with this kind of tool.

First of all, marking a block bad can currently not be undone. The changes this
tool makes are thus both destructive and irreversible.

If the MTD contains UBI data, UBI has no way of moving the data somewhere else
if a block just randomly goes bad completely out of the blue.

Besides, if the MTD is attached to an UBI device, UBI already takes care of
detecting blocks that go bad *over time* and takes care of marking them as
bad after moving the data somewhere else.

It might be interesting to have such a tool if nand scrub functionality was
added to the kernel (such as in [1]), allowing the changes done by the tool
to be undone. But even then, what would be the practical use case for
such a tool?


Thanks,

David


[1] http://patchwork.ozlabs.org/patch/764978/
