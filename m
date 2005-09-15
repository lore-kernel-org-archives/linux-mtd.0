Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFoZY-0000dv-Jx
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 03:54:41 -0400
Message-ID: <4329288B.8050909@yandex.ru>
Date: Thu, 15 Sep 2005 11:53:47 +0400
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
> Thanks for your help!
> 
> I found (at least partly) out, whats happening: Some parts of code are 
> relying still on the assumption, that the erase size/sector size is 
> fixed to a power of 2.
What's your c->wbuf_pagesize ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
