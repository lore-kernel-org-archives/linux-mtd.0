Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSHXL-0006OQ-Kg
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 11:11:05 -0500
Message-ID: <41938F11.3040903@imc-berlin.de>
Date: Thu, 11 Nov 2004 17:10:57 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
In-Reply-To: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jochen Karrer wrote:
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

As far as I can see this bug is still not fixed in 2.6.9!
Is it done in newer versions?

--
Steven
