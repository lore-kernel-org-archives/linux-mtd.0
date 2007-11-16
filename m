Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IspCx-0007ch-I7
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 19:37:25 -0500
Date: Fri, 16 Nov 2007 01:32:22 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] adding physical address to point()
Message-ID: <20071116003221.GC13834@lazybastard.org>
References: <473CE5EC.9040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <473CE5EC.9040902@gmail.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 15 November 2007 16:35:56 -0800, Jared Hulbert wrote:
> 
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -82,8 +82,8 @@ static struct mtd_info *cfi_intelext_setup (struct 
> mtd_info *);
> static int cfi_intelext_partition_fixup(struct mtd_info *, struct 
> cfi_private **);

Word-wrapped again.  Mutt on lazybastard.org works, you know? ;)

Jörn

-- 
There are 10^11 stars in the galaxy.  That used to be a huge number.
But it's only a hundred billion.  It's less than the national deficit!
We used to call them astronomical numbers.  Now we should call them
economical numbers.
-- Richard Feynman
