Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7JUM-0001O6-GS
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2004 16:01:19 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Jochen Karrer <j.karrer@lightmaze.com>
In-Reply-To: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
Content-Type: text/plain
Date: Tue, 14 Sep 2004 13:41:28 -0600
Message-Id: <1095190893.5442.35.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, steven.scholz@imc-berlin.de,
	linux-mtd@lists.infradead.org
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-26 at 15:11 +0200, Jochen Karrer wrote:
> Hi,
> jffs2 did not work in linux-2.6.8.1 because single word writes at the end
> of a buffer write are done with the wrong address:
> 
> --- /home/jkarrer/kernel/linux-2.6.8.1/drivers/mtd/chips/cfi_cmdset_0002.c
> Sat Aug 14 12:55:20 2004
> +++ cfi_cmdset_0002.c	Thu Aug 26 14:33:42 2004
> @@ -1128,7 +1128,7 @@
>  	if (len) {
>  		size_t retlen_dregs = 0;
> 
> -		ret = cfi_amdstd_write_words(mtd, to, len, &retlen_dregs, buf);
> +		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift), len,
> &retlen_dregs, buf);
> 
>  		*retlen += retlen_dregs;
>  		return ret;


I never saw that this patch was committed.  I didn't do anything with it
because I'm not so familiar with that piece in cfi_cmdset_0002.c (and am
too lazy to read the function).  I did notice that Steven Scholz
confirmed that it fixed problems he was seeing.

Anyone else that cares should comment now or I'll commit it so that it
doesn't get forgotten.
