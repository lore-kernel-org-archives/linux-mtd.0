Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWaza-0000RN-Hg
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 18:04:10 +0000
Received: by wa-out-1112.google.com with SMTP id v33so179263wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 11:04:09 -0700 (PDT)
Message-ID: <6934efce0808221104w1609bea8mbbff54019c261d80@mail.gmail.com>
Date: Fri, 22 Aug 2008 11:04:08 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?UTF-8?Q?J=C3=B6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
In-Reply-To: <20080822171959.GA30977@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	<48AE22F5.3000309@lougher.demon.co.uk>
	<200808221200.26052.arnd@arndb.de>
	<48AEF2A3.7020905@lougher.demon.co.uk>
	<20080822171959.GA30977@logfs.org>
Cc: cotte@de.ibm.com, Arnd Bergmann <arnd@arndb.de>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Elsewhere in this maze of threads Arnd claimed to have tested the
> benefits of metadata compression - and it making little impact.
>
> My guess is that it would make a large impact if metadata would be a
> significant part of the filesystem image.  Usually metadata is close
> enough to 0% to be mistaken for statistical noise.  So compressing it
> makes a significant impact on an insignificant amount of data.

Like I said early it depends on the value you assign to significant.
For a fs sizes I started designing to 16MB-64MB if you have to track a
whole bunch of 8Byte numbers for every symlink, dev node, inode, and
page.  It adds up quickly to a couple of MB, that can translate to
lots of money.  Even at only an extra $0.25 a system * 12Million units
= $3Million.
