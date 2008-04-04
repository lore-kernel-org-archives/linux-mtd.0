Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhiJN-0002c8-Uk
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 09:34:18 +0000
Date: Fri, 4 Apr 2008 11:34:00 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
Message-ID: <20080404093359.GA4338@logfs.org>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
Cc: nico@cam.org, haokexin@gmail.com, dwmw2@infradead.org,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 4 April 2008 10:06:59 +0100, Alexey Korolev wrote:
> 
> CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes which lead to kernel panics in JFFS2. 
> We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).
> 
> The following patch fixes the problem. 
> Could you please include it?
> 
> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> 
> diff -aurpp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-02-11 08:51:11.000000000 +0300
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-04 12:46:24.000000000 +0400
> @@ -729,14 +729,14 @@ static int chip_ready (struct map_info *
>  		chip->state = FL_READY;
>  		return 0;
>  
> +	case FL_SHUTDOWN:
> +		/* The machine is rebooting now,so no one can get chip anymore */
> +		return -EIO;
>  	case FL_POINT:
>  		/* Only if there's no operation suspended... */
>  		if (mode == FL_READY && chip->oldstate == FL_READY)
>  			return 0;

Ouch!  I've been bitten by these before.  After I've carefully written
code that takes advantage of missing break; statements, a colleague of
mine reordered the code and missed those subtleties.

Could you add a comment like this where appropriate:
		/* fall through */

It might even have prevented this bug if Kevin had seen such a comment
before writing his patch.

Reviewed-By: Joern Engel <joern@logfs.org>

>  
> -	case FL_SHUTDOWN:
> -		/* The machine is rebooting now,so no one can get chip anymore */
> -		return -EIO;
>  	default:
>  	sleep:
>  		set_current_state(TASK_UNINTERRUPTIBLE);

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
