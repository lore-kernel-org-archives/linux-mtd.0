Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EISL9-000065-GB
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:46:32 -0400
Message-ID: <4332C39E.10809@yandex.ru>
Date: Thu, 22 Sep 2005 18:45:50 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>	
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>	
	<4332B24F.2050305@mw-itcon.de> <4332BA7E.3060409@yandex.ru>
	<1127399523.6125.79.camel@fuzzie.sanpeople.com>
In-Reply-To: <1127399523.6125.79.camel@fuzzie.sanpeople.com>
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

Andrew Victor wrote:
> No.  You can't change mtd->erasesize.
> There are other existing applications that access the raw MTD layer and
> want the real erasesize.
Ok guys, I don't actually know the best solution. Just think up 
something. I don't care about MTD as much, sorry :-) You may joint the 
IRC and talk to tglx1 and others.

My objections are:
1. jffs2_dataflash_setup() should set c->wbuf_pagesize = DataFlash page
2. c->sector_size should be set to DataFlash block size
3. The way how you find out DataFlash page and DataFlash block size must 
work on any other DataFlash.
4. When JFFS2 erases an eraseblock, it must erase c->sector_size bytes, 
not c->wbuf_pagesize bytes/

I think that's fair, isn't it?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
