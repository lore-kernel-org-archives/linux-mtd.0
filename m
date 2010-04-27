Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6j0T-0007Ve-EU
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 11:31:14 +0000
Received: by wwg30 with SMTP id 30so587928wwg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Apr 2010 04:31:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100427111759.GA13859@logfs.org>
References: <20100422203358.GB30749@logfs.org>
	<20100423205518.GB7008@logfs.org> <20100426094810.GE27497@kernel.dk>
	<20100426143253.GB4364@logfs.org> <20100426143803.GM27497@kernel.dk>
	<20100426144532.GN27497@kernel.dk> <20100426163050.GC4364@logfs.org>
	<20100426163126.GD4364@logfs.org>
	<x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
	<20100427111759.GA13859@logfs.org>
Date: Tue, 27 Apr 2010 13:31:11 +0200
Message-ID: <h2h4aa525de1004270431hd98c271ag61462bdb778f7769@mail.gmail.com>
Subject: Re: [PATCH 2/2] [MTD] Call bdi_init() and bdi_register()
From: Paolo Minazzi <paolo.minazzi@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Jens Axboe <jens.axboe@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you add "rootfstype=3Dromfs" to the command line, does the problem
> still exist?
>
> J=F6rn

Jorn , you are right.
It seems work....
please wait....
