Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcBmc-0006xW-Ks
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 05:58:48 +0000
Received: by mail-fx0-f209.google.com with SMTP id 1so2161513fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 21:58:42 -0800 (PST)
Subject: Re: [PATCH] mtdchar.c: fix different address space noise
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <201001151125.39100.hartleys@visionengravers.com>
References: <201001151125.39100.hartleys@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 07:58:39 +0200
Message-Id: <1265090319.2517.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-15 at 11:25 -0700, H Hartley Sweeten wrote:
> mtdchar.c: fix different address space noise
> 
> In mtd_ioctl MEMGETREGIONINFO the region_user_info pointer ur
> is cast in __kernel space. This produces a number of sparse warnings
> like:
> 
> warning: cast removes address space of expression
> warning: incorrect type in initializer (different address spaces)
>    expected unsigned int const [noderef] <asn:1>*register __p
>    got unsigned int *<noident>
> 
> Since argp is already a void __user * just use it dirrectly without
> the cast and make ur a __user *.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Pushed this one to my l2-mtd-2.6 / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
