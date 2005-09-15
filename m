Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFoKo-0008Oy-6U
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 03:39:15 -0400
Message-ID: <4329251C.7050102@mw-itcon.de>
Date: Thu, 15 Sep 2005 09:39:08 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de> <432817FF.10307@yandex.ru>
In-Reply-To: <432817FF.10307@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your help!

I found (at least partly) out, whats happening: Some parts of code are 
relying still on the assumption, that the erase size/sector size is 
fixed to a power of 2.

Example nodelist.c:
len = ofs & (c->wbuf_pagesize - 1)

So the jffs2 code is broken, if it *should* support erase sizes which 
are not 2^X.

Best regards
Peter



-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
