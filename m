Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFohn-0000tk-RS
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 04:03:09 -0400
Message-ID: <43292A8B.4020707@yandex.ru>
Date: Thu, 15 Sep 2005 12:02:19 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de> <432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>
In-Reply-To: <4329251C.7050102@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
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



Peter Menzebach wrote:
> Example nodelist.c:
> len = ofs & (c->wbuf_pagesize - 1)
I suppose if you change this on
len = ofs % c->wbuf_pagesize;

everything should be fine.

There is a high chance that this is the only place like this.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
