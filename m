Received: from web15105.mail.cnb.yahoo.com ([202.165.103.74])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FR0UM-0006nX-BN
	for linux-mtd@lists.infradead.org; Wed, 05 Apr 2006 01:23:39 -0400
Message-ID: <20060405050257.17756.qmail@web15105.mail.cnb.yahoo.com>
Date: Wed, 5 Apr 2006 13:02:57 +0800 (CST)
From: Peter J Zhu <peterjzhu@yahoo.com.cn>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <44322FF7.80909@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: =?gb2312?b?u9i4tKO6IFJlOiBFQlMgZWZmZWN0?=
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The size of my MTD device is 48M. And I used the small
block NAND with erase block size being 16KB.

--- "Artem B. Bityutskiy" <dedekind@yandex.ru>Ð´µÀ:

> Peter J Zhu wrote:
> > hello,
> >  
> >   Recently I enanbled EBS with 2.6.15 on Samsung
> small
> >   page(oobblock = 512B)NAND chip. The results is
> as
> >   following:
> >   
> >              Without EBS       With EBS
> > 
> >   Imagesize  31378292B         42379624B
> > 
> >   Mouttime   17s ~             14s ~
> > 
> >   The overhead space is too much while providing
> NOT
> >   high mout time improvement But from the thread
> >   http://mhonarc.axis.se/jffs-dev/msg01763.html, 
> >   results seems too bad compared with what's
> claimed. 
> > 
> >   The only diff I can imagine is that he might use
> big
> >   page NAND. Any hints are very much appreciated. 
> > 
> What's the size of your MTD device?
> 
> -- 
> Best Regards,
> Artem B. Bityutskiy,
> St.-Petersburg, Russia.
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 



		
____________________________________________________
