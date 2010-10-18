Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7ghI-0006xo-PC
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 03:47:42 +0000
Received: by fxm15 with SMTP id 15so309543fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 20:47:38 -0700 (PDT)
Subject: Re: [PATCH 3/3] fs/jffs2/dir.c: Use kmemdup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1010172155240.394@ask.diku.dk>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
	<1287341311-11161-4-git-send-email-julia@diku.dk>
	<1287341849.20968.62.camel@Joe-Laptop>
	<Pine.LNX.4.64.1010172155240.394@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Oct 2010 06:43:34 +0300
Message-ID: <1287373414.1972.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joe Perches <joe@perches.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-10-17 at 21:56 +0200, Julia Lawall wrote:
> Convert a sequence of kmalloc and memcpy to use kmemdup.
> 
> The semantic patch that performs this transformation is:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression a,flag,len;
> expression arg,e1,e2;
> statement S;
> @@
> 
>   a =
> -  \(kmalloc\|kzalloc\)(len,flag)
> +  kmemdup(arg,len,flag)
>   <... when != a
>   if (a == NULL || ...) S
>   ...>
> - memcpy(a,arg,len+1);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  fs/jffs2/dir.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Picked this one and put to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
