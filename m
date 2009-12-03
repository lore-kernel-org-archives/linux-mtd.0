Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NG9l7-0004CO-CM
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 11:22:10 +0000
Received: by pzk33 with SMTP id 33so1212808pzk.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 03:22:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091120163744.GB1716@logfs.org>
References: <20091120163744.GB1716@logfs.org>
Date: Thu, 3 Dec 2009 03:22:01 -0800
Message-ID: <6934efce0912030322o270e0adalea41e367d4728b52@mail.gmail.com>
Subject: Re: [PATCH] fio infrastructure
From: Jared Hulbert <jaredeh@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In theory this could address some problems I was contemplating earlier
today.  If J=F6rn vision of large scale flash storage device without the
added FTL overhead is to realized, we'll need this sort of thing.  For
that matter, take the Atom processor line, aren't the newer ones
planning on raw NAND access built in?  If you want to get the
performance a several NAND chips can enable you'd need something like
this, no?

> I really wish I could have tested this with working hardware, but the
> gods are against that idea. =A0So here is a patch anyway.

What is needed, bare minimum, to test this?  Is access to multiple
bare NAND chips enough?
