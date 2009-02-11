Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LX9Yc-0003rw-Hd
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 07:30:57 +0000
Subject: Re: [PATCH v2] ubiformat: make it work on mtd parts > 2GiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20090210103354.GA8405@www.tglx.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<20090210103354.GA8405@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2009 09:30:17 +0200
Message-Id: <1234337417.17790.123.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-10 at 11:33 +0100, Sebastian Andrzej Siewior wrote:
> diff --git a/ubi-utils/new-utils/src/libmtd.c b/ubi-utils/new-utils/src/libmtd.c
> index aab4b0e..69705dd 100644
> --- a/ubi-utils/new-utils/src/libmtd.c
> +++ b/ubi-utils/new-utils/src/libmtd.c
> @@ -189,7 +189,7 @@ int mtd_is_bad(const struct mtd_info *mtd, int eb)
>  	if (!mtd->allows_bb)
>  		return 0;
>  
> -	seek = eb * mtd->eb_size;
> +	seek = (unsigned int)eb * mtd->eb_size;

I believe this should be:

seek = (off_t)eb * mtd->eb_size;

instead.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
