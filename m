Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPtT-0000nn-F6
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:42:51 +0000
Message-ID: <48036D43.6070307@ru.mvista.com>
Date: Mon, 14 Apr 2008 18:42:11 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] mtd/cmdlinepart.c: don't compare pointers with 0
References: <20080414142004.GR6695@cs181133002.pp.htv.fi>
In-Reply-To: <20080414142004.GR6695@cs181133002.pp.htv.fi>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Adrian Bunk wrote:

> Sparse spotted that 0 was compared to pointers.

> While I was at it, I also moved the assignments out of the if's.

> Signed-off-by: Adrian Bunk <bunk@kernel.org>

> 32de76e83f37322dd85eaecf126e7b17327f606f diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index b44292a..3e09043 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -119,7 +119,8 @@ static struct mtd_partition * newpart(char *s,
>  		char *p;
>  
>  	    	name = ++s;
> -		if ((p = strchr(name, delim)) == 0)
> +		p = strchr(name, delim);
> +		if (!p)
>  		{

    Wouldn't it be nice to join the standalone brace to if () while it?

>  			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
>  			return NULL;

WBR, Sergei
