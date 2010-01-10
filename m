Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtz2-0000Ps-Uz
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:21:21 +0000
Received: by fxm22 with SMTP id 22so23095050fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 01:21:15 -0800 (PST)
Subject: Re: [PATCH] [MTD] WWW: Spelling correction in UBI FAQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lee Amirev <lee.amirev@gmail.com>
In-Reply-To: <e14c53d91001031611i736c54eev8636321d43f3f831@mail.gmail.com>
References: <e14c53d91001031603h694291c1y5b008e86283d5a2d@mail.gmail.com>
	<e14c53d91001031611i736c54eev8636321d43f3f831@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 11:21:13 +0200
Message-Id: <1263115273.7315.138.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-03 at 19:11 -0500, Lee Amirev wrote:
> diff --git a/faq/ubi.xml b/faq/ubi.xml
> index 3a9c255..76ad9d9 100644
> --- a/faq/ubi.xml
> +++ b/faq/ubi.xml
> @@ -707,7 +707,7 @@ $ modprobe nandsim second_id_byte=0x36
>  <p>See <a href="nand.html#L_nand_nandsim">here</a> for more
> information about
>  the NAND simulator.</p>
>  
> -<p>To ensure that you have fake MTD devices, run
> "<code>cat /prof/mtd</code>".
> +<p>To ensure that you have fake MTD devices, run
> "<code>cat /proc/mtd</code>".
>  It should print something like</p>

Although the patch is not in proper format and is not applicable with
git am, I've pushed it with some manual work.

Thank you! 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
