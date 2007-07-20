Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBgPV-0003TZ-H7
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 20:31:58 -0400
Date: Fri, 20 Jul 2007 02:28:21 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Tobias Simon <tobias.simon@sp-ss.de>
Subject: Re: flashcp
Message-ID: <20070720002820.GA28538@lazybastard.org>
References: <200707192046.47340.tobias.simon@sp-ss.de>
	<20070719221339.GC27750@lazybastard.org>
	<200707200055.29457.tobias.simon@sp-ss.de>
	<200707200123.46618.tobias.simon@sp-ss.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200707200123.46618.tobias.simon@sp-ss.de>
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 July 2007 01:23:46 +0200, Tobias Simon wrote:
> 
> I just saw the following line, which is part of the original source:
> "if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;"
> 
> ... or left there in conjunction with your "rounding down" code:
> 
> 
> --- flashcp_old.c       2007-07-20 01:15:28.000000000 +0200
> +++ flashcp_b.c 2007-07-20 01:14:02.000000000 +0200
> @@ -257,9 +257,12 @@
>  #warning "Check for smaller erase regions"
> 
>         erase.start = 0;
> -       erase.length = filestat.st_size & ~(mtd.erasesize - 1);
> -       if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
> -       if (flags & FLAG_VERBOSE)
> +
> +   erase.length = (filestat.st_size / mtd.erasesize) * mtd.erasesize;
> +       if (filestat.st_size % mtd.erasesize)
> +      erase.length += mtd.erasesize;
> +
> +   if (flags & FLAG_VERBOSE)
>         {
>                 /* if the user wants verbose output, erase 1 block at a time 
> and show him/her what's going on */
>                 int blocks = erase.length / mtd.erasesize;

Maybe something like this:
#define ODD_ALIGN(n, align) ((((n) + (align) - 1) / (align)) * (align))
...
	erase.length = ODD_ALIGN(filestat.st_size, mtd.erasesize);

But I should really disengage now.  I don't even know what flashcp is
supposed to do.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
