Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEQHc-0003lg-4W
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 16:04:21 +0000
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input
	and from file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <h0mppp$7v2$1@ger.gmane.org>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>
	<4A2E98BD.30704@orb.com> <h0mppp$7v2$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Jun 2009 19:03:34 +0300
Message-Id: <1244649814.5847.404.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-06-09 at 16:04 -0700, Jehan Bing wrote:
> -		readlen = meminfo.writesize;
>  
> -		if (ifd != STDIN_FILENO) {
> -			int tinycnt = 0;
> -
> -			if (pad && (imglen < readlen))
> -			{
> -				readlen = imglen;
> -				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
> -			}
> +		{
> +			readlen = meminfo.writesize;
>  

Err, why do you need these spare { } ?

> -			/* Read Page Data from input file */
> -			while(tinycnt < readlen) {
> -				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
> -				if (cnt == 0) { // EOF
> -					break;
> -				} else if (cnt < 0) {
> -					perror ("File I/O error on input file");
> -					goto closeall;
> -				}
> -				tinycnt += cnt;
> -			}
> -		} else {
>  			int tinycnt = 0;

Err, is it normal C do do stuff like
{
	readlen = meminfo.writesize;
	int tinycnt += cnt;

? I think this is C++.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
