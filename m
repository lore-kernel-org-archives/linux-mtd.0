Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma4NO-000284-Dl
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 09:07:43 +0000
Date: Sun, 9 Aug 2009 11:07:26 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH V7] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090809090726.GA28293@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <1249802002.9157.57.camel@localhost>
References: <1249802002.9157.57.camel@localhost>
	<20090729165156.GA1471@mail.gnudd.com>
Cc: linux@arm.linux.org.uk, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com,
	STEricsson_nomadik_linux@list.st.com, vimal.newwork@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy:
> I wanted to put this to my l2-mtd-2.6.git tree, but the patch cannot be
> applied because it does not seem to be a standalone patch, e.g.,
> arch/arm/configs/nhk8815_defconfig does not exist in my tree.

I think it's best for it to go through rmk, as it actually is a single
patch (platform data in one file, driver elsewhere and a config change
as otherwise it will miswork.  Splitting it for two maintainers would
break any future bisect if merges from the mtd and rmk won't be
applied in the right order.

thanks
/alessandro (offline since tomorrow, so I probably won't follow up again)
