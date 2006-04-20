Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWZek-0005Gq-9c
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 09:57:41 -0400
Date: Thu, 20 Apr 2006 15:57:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexey Zaytsev <alexey.zaytsev@gmail.com>
Message-ID: <20060420135706.GE4047@wohnheim.fh-wedel.de>
References: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
	<20060420101101.GB4047@wohnheim.fh-wedel.de>
	<f19298770604200558r4b29a4d9ma4156539ca54838f@mail.gmail.com>
	<20060420133500.GD4047@wohnheim.fh-wedel.de>
	<f19298770604200647q467f1ae8w5512ae3d46dd744b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f19298770604200647q467f1ae8w5512ae3d46dd744b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Random fixes for the ixp4xx mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 April 2006 17:47:35 +0400, Alexey Zaytsev wrote:
> >
> > Take a look at the U-Boot source if you don't believe me.
> Ok-ok, agree here.

:)

> Ok, I'll add them to include/linux/mtd/partitions.h, and clean the
> other drivers.

Excellent!

I have a tiny amount of time this weekend, so you can send patches to
me and I'll try to integrate them to git.  "Try" because things are
still quite new and the workflow isn't exactly established yet.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
