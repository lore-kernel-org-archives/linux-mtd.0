Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUvqc-0005pt-1Z
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 05:32:54 +0000
Received: by fxm22 with SMTP id 22so27532333fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 21:32:48 -0800 (PST)
Subject: Re: [PATCH]drivers/mtd/chips/cfi_probe.c:18 remove unneeded comment
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Ren=E9?= Bolldorf <xsecute@googlemail.com>
In-Reply-To: <4B465DA1.6010300@googlemail.com>
References: <4B465DA1.6010300@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Jan 2010 07:32:45 +0200
Message-Id: <1263360765.3445.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-01-07 at 23:18 +0100, René Bolldorf wrote:
> --- ./drivers/mtd/chips/cfi_probe.c     2009-12-28 21:09:46.638828686 +0100
> +++ ./drivers/mtd/chips/cfi_probe.c     2010-01-04 22:38:31.536678726 +0100
> @@ -18,8 +18,6 @@
>   #include <linux/mtd/cfi.h>
>   #include <linux/mtd/gen_probe.h>
> 
> -//#define DEBUG_CFI
> -
>   #ifdef DEBUG_CFI
>   static void print_cfi_ident(struct cfi_ident *);
>   #endif

I do not think this is is needed. The commented out define shows what
one should do to debug the thing. Without that line it is not so
obvious. So, nack from me.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
