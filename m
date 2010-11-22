Received: from nm8-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.194])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKeJA-0005aJ-OR
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 21:52:22 +0000
Message-ID: <327178.68946.qm@web180303.mail.gq1.yahoo.com>
Date: Mon, 22 Nov 2010 13:52:17 -0800 (PST)
From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
To: Alexis RODET <alexis.rodet@bvs-tech.com>
In-Reply-To: <4CEA7AF0.6000804@bvs-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: spi-devel-general@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--- On Mon, 11/22/10, Alexis RODET <alexis.rodet@bvs-tech.com> wrote:

> > And this patch doesn't touch machine or driver code,
> so it's incomplete.
> Look at the patch in previous mail attachment and you'll
> see it does.


Couldn't do that.  Submit another patch, or
combine it with this one.  Either way,  once it
merges, "git bisect" needs to work"...


> > How about a patch that does the full rename??
> What do you mean ?

Apply the patch and everthing builds and works;
and if it's a series, "git bisect" also works".
