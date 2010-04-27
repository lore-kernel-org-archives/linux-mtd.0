Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6hDq-0002Ye-HR
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 09:36:54 +0000
Received: by wyg36 with SMTP id 36so2615510wyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Apr 2010 02:36:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100427092934.GH27497@kernel.dk>
References: <20100423205518.GB7008@logfs.org> <20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk> <20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
	<20100427091650.GG27497@kernel.dk>
	<r2l4aa525de1004270226r40c3dd1ctd09e716f47deca39@mail.gmail.com>
	<20100427092934.GH27497@kernel.dk>
Date: Tue, 27 Apr 2010 11:36:52 +0200
Message-ID: <n2t4aa525de1004270236mfa841e6bna8adaacc53d599c2@mail.gmail.com>
Subject: Re: [PATCH 2/2] [MTD] Call bdi_init() and bdi_register()
From: Paolo Minazzi <paolo.minazzi@gmail.com>
To: Jens Axboe <jens.axboe@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Just to be on the safe side - without the patch, does it work or not?
>
> --
> Jens Axboe

Without the patch for me means the standard 2.6.34rc5.
In this case :
- enabling logfs I have an oop in fs/write-back.c:157 before kernel calls init.
- disabling logfs I can do normal mount my root /dev/mtdblock1

This is my experience.

Paolo
