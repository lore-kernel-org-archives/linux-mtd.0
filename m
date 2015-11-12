Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwxVN-0001Xv-MV
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 19:25:58 +0000
Received: by pacdm15 with SMTP id dm15so73557688pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 11:25:36 -0800 (PST)
Date: Thu, 12 Nov 2015 11:25:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabien Proriol <Fabien.Proriol@jdsu.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Paul Barker <paul@paulbarker.me.uk>
Subject: Re: [PATCH] Fix flashcp display
Message-ID: <20151112192533.GE8456@google.com>
References: <545CCCD3.6020006@jdsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545CCCD3.6020006@jdsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 07, 2014 at 01:46:28PM +0000, Fabien Proriol wrote:
> From e65a012df12fa39ed0a6c5a71b5dc952b4c982fc Mon Sep 17 00:00:00 2001
> From: Fabien Proriol <fabien.proriol@jdsu.com>
> Date: Thu, 6 Nov 2014 15:54:20 +0100

s/2014/2015/
and then we're all good, right? :)

> Subject: [PATCH] flashcp: Use %llu to print filestat.st_size
> 
> filestat.st_size type is off_t.
> For some paltforms, off_t can be 32 or 64bit but there is no C99 format specifier for off_t.

Hmm, if you're getting a 32-bit off_t, that means you can't support >4GB
flash.

> The best way to print it with printf is to cast it to long long and print with %llu
> 
> Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
> ---
>  flashcp.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/flashcp.c b/flashcp.c
> index d58c81b..04495bd 100644
> --- a/flashcp.c
> +++ b/flashcp.c
> @@ -296,7 +296,7 @@ int main (int argc,char *argv[])
>  	 * write the entire file to flash *
>  	 **********************************/
>  
> -	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%luk (0%%)",KB (filestat.st_size));
> +	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));

Personally, I don't think this is the absolute cleanest way to do this
all. You're making 32-bit systems do 64-bit arithmetic to get a small
value (in KB), when you could just do the cast afterward (since you only
care about the printing; the casting doesn't actually help the
computation).

Also, the long lines and awkward spacing is all pretty off-putting, but
that's not your fault.

Anyway, applied to mtd-utils.git. Thanks.

Brian

>  	size = filestat.st_size;
>  	i = BUFSIZE;
>  	written = 0;
> @@ -304,10 +304,10 @@ int main (int argc,char *argv[])
>  	{
>  		if (size < BUFSIZE) i = size;
>  		if (flags & FLAG_VERBOSE)
> -			log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
> +			log_printf (LOG_NORMAL,"\rWriting data: %dk/%lluk (%llu%%)",
>  					KB (written + i),
> -					KB (filestat.st_size),
> -					PERCENTAGE (written + i,filestat.st_size));
> +					KB ((unsigned long long)filestat.st_size),
> +					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
>  
>  		/* read from filename */
>  		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
> @@ -325,8 +325,8 @@ int main (int argc,char *argv[])
>  				exit (EXIT_FAILURE);
>  			}
>  			log_printf (LOG_ERROR,
> -					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%lu bytes written to flash\n",
> -					written,written + i,device,written + result,filestat.st_size);
> +					"Short write count returned while writing to x%.8x-0x%.8x on %s: %d/%llu bytes written to flash\n",
> +					written,written + i,device,written + result,(unsigned long long)filestat.st_size);
>  			exit (EXIT_FAILURE);
>  		}
>  
> @@ -335,10 +335,10 @@ int main (int argc,char *argv[])
>  	}
>  	if (flags & FLAG_VERBOSE)
>  		log_printf (LOG_NORMAL,
> -				"\rWriting data: %luk/%luk (100%%)\n",
> -				KB (filestat.st_size),
> -				KB (filestat.st_size));
> -	DEBUG("Wrote %d / %luk bytes\n",written,filestat.st_size);
> +				"\rWriting data: %lluk/%lluk (100%%)\n",
> +				KB ((unsigned long long)filestat.st_size),
> +				KB ((unsigned long long)filestat.st_size));
> +	DEBUG("Wrote %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
>  
>  	/**********************************
>  	 * verify that flash == file data *
> @@ -349,16 +349,16 @@ int main (int argc,char *argv[])
>  	size = filestat.st_size;
>  	i = BUFSIZE;
>  	written = 0;
> -	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%luk (0%%)",KB (filestat.st_size));
> +	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
>  	while (size)
>  	{
>  		if (size < BUFSIZE) i = size;
>  		if (flags & FLAG_VERBOSE)
>  			log_printf (LOG_NORMAL,
> -					"\rVerifying data: %dk/%luk (%lu%%)",
> +					"\rVerifying data: %dk/%lluk (%lu%%)",
>  					KB (written + i),
> -					KB (filestat.st_size),
> -					PERCENTAGE (written + i,filestat.st_size));
> +					KB ((unsigned long long)filestat.st_size),
> +					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
>  
>  		/* read from filename */
>  		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
> @@ -380,10 +380,10 @@ int main (int argc,char *argv[])
>  	}
>  	if (flags & FLAG_VERBOSE)
>  		log_printf (LOG_NORMAL,
> -				"\rVerifying data: %luk/%luk (100%%)\n",
> +				"\rVerifying data: %lluk/%lluk (100%%)\n",
>  				KB (filestat.st_size),
>  				KB (filestat.st_size));
> -	DEBUG("Verified %d / %luk bytes\n",written,filestat.st_size);
> +	DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
>  
>  	exit (EXIT_SUCCESS);
>  }
> -- 
> 2.0.4
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
