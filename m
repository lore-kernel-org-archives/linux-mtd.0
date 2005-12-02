Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EiJ27-00074V-Aq
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 17:05:37 -0500
Message-ID: <4390C552.60907@mvista.com>
Date: Fri, 02 Dec 2005 14:06:10 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <438FF22A.2060203@ru.mvista.com>
In-Reply-To: <438FF22A.2060203@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
 rid of MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vitaly, my comments...

> +++ util/nanddump.c	2 Dec 2005 06:54:11 -0000
> @@ -163,6 +163,7 @@
>  	struct mtd_oob_buf oob = {0, 16, oobbuf};
>  	mtd_info_t meminfo;
>  	char pretty_buf[80];
> +	uint32_t oobavail;
>  
>   	process_options(argc, argv);
>  
> @@ -179,6 +180,13 @@
>  		exit (1);
>  	}
>  
> +	if (ioctl(fd, MEMGETOOBAVAIL, &oobavail) != 0) {
> +		perror("unable to get NAND oobavail");
> +		close(fd);
> +		exit(1);
> +	}

How about fall back to all 16/64/etc. avail?

For debugging purposes it can be nice to see the raw OOB, in case that 
can be shoehorned in here somehow.

> +++ util/nandwrite.c	2 Dec 2005 06:54:11 -0000

> -	       "  -j, --jffs2  	 	force jffs2 oob layout (legacy support)\n"
> -	       "  -y, --yaffs  	 	force yaffs oob layout (legacy support)\n"

Again, it may be good to keep a legacy mode around during the transition 
period.

>  		if (writeoob) {
>  			/* Read OOB data from input file, exit on failure */
> -			if ((cnt = read(ifd, oobreadbuf, meminfo.oobsize)) != meminfo.oobsize) {
> +			if ((cnt = read(ifd, oobreadbuf, oobavail)) != oobavail) {

This requires the input file to be tailored to the oobavail of a 
specific destination device, reducing the benefit of autoplacement.  It 
may be best to continue to pad input files oob data to the full oobsize, 
much like the data portion is handled.

> +				memcpy(oobbuf, oobreadbuf, oobavail);

No need for oobreadbuf and copy if no OOB layout processing done anymore?


-- 
Todd
